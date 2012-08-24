--	INIT PATTERNS, MEASURES, URLS
function Initialize()

	rows = SKIN:GetVariable('PaperRows')
	cols = SKIN:GetVariable('PaperCols')
	countEntries = (rows * cols)

	-- init
	local intCount = 1
	local varKey = SKIN:GetVariable('Key'.. intCount)
	local varFeed = SKIN:GetVariable('Feed'.. intCount)
	local currFeedNum = SKIN:GetVariable('currFeedNum') or 1

	-- loop through all variables #KeyX# and #FeedX" found
	while varKey and varFeed do
		SetSkinText('PaperFeedLink'..intCount, varKey)

		SKIN:Bang('!SetOption', 'PaperFeedLink'..intCount, 'LeftMouseUpAction', '[!WriteKeyValue "Variables" "currFeedNum" '..intCount..' "#@#IncMulti\\Variables.inc"] [!WriteKeyValue "Variables" "currFeed" '..varFeed..' "#@#IncMulti\\Variables.inc"] [!Refresh]')

		intCount = intCount + 1
		varKey = SKIN:GetVariable('Key'.. intCount)
		varFeed = SKIN:GetVariable('Feed'.. intCount)
	end

	-- intCount saves how feeds you got - 1
	-- local pageCount = math.ceil((intCount - 1)/30)
	-- for i = 1,pageCount,1 do
	-- 	SetSkinFontColor('PaperFeedRadioButton'..i, '#FontColorLow#')
	-- 	feedContent = SKIN:GetMeter("PaperFeedRadioButton"..i)
	-- 	feedContent:Show()
	-- end

	-- for i = pageCount+1,10,1 do
	-- 	feedContent = SKIN:GetMeter("PaperFeedRadioButton"..i)
	-- 	feedContent:Hide()
	-- end

	-- REQUESTED PAGE
	-- curPage = SKIN:GetVariable('CurrentPaperFeedPage') or 1
	-- SetSkinFontColor('PaperFeedRadioButton'..curPage, '#FontColorHighlight#')
	
	-- CURRENT SELECTED FEED
	SKIN:Bang('!SetOption', 'PaperFeedLink'..currFeedNum, 'SolidColor', 'FFFFFF')
	SKIN:Bang('!SetOption', 'PaperFeedLink'..currFeedNum, 'StringStyle', 'Bold')
	SKIN:Bang('!SetOption', 'PaperFeedLink'..currFeedNum, 'FontColor', '000000')
end

--	UPDATES ALL FEEDS
function Update()
	-- GET PARSER AND FILEPATH
	local webParser = SKIN:GetMeasure('measureRSS')
	local downloadedFilePath = webParser:GetStringValue()

	-- FILE ACCESS AND FILE DATA
	local file = assert(io.open(downloadedFilePath, "r"))
    local data = file:read("*all")
    file:close()

   	 -- LOCAL FUNCTIONS SPEED UP
	local find = string.find
	local gmatch = string.gmatch
	local match = string.match
	local gsub = string.gsub
	local sub = string.sub
	
	local patEntry = { '','<item.-</item>', '<entry.-</entry>' }
	local patEntryTitle = { '','<title.->(.-)</title>', '<title.->(.-)</title>' }
	local patEntryLink = { '','<link.->(.-)</link>','<link.-href="(.-)"' }
	local patEntryAltLink = { '','<link.->(.-)</link>','<link.-href=(.-)"' }
	local patEntryCont = { '','<description.->(.-)</description>','<content.->(.-)</content>' }
	local patEntryImg = { '','<img.-src="(.-)"','<img.-src="(.-)"' }
	local patEntryAltImg = { '', '<.-image.-url="(.-)"', ''}

	-- FEED TYPE
	if find(data, '<item') then 
		RSSChannel(data)
	elseif find(data, '<entry') then 
		AtomChannel(data)
	end
end


-------------------------------------------------------
--					HELPER
-------------------------------------------------------
function SetSkinText(measure, text)
	SKIN:Bang('!SetOption', measure, 'Text', text)
end

function SetSkinLink(measure, link)
	SKIN:Bang('!SetOption', measure, 'RightMouseUpAction', link)
end

function SetSkinImage(measure, imagepath)
	SKIN:Bang('!SetOption', measure, 'Url', imagepath)
end

function SetSkinShow(measure)
	SKIN:Bang('!SetOption', measure, 'Hidden', 0)
end	

function EnableSkin(measure)
	SKIN:Bang('!SetOption', measure, 'Disabled', 0)
end


function getRSSTitle(entry) 
	local title = 
	string.match( entry, '<title.->(.-)</title>' ) or
	"(no title)"

	return title
end

function getRSSLink(entry)
	local link = 
	string.match( entry, '<link.->(.-)</link>' ) or
	"(no link)"

	return link
end

function getRSSContent(entry)
	local content = 
	string.match( entry, '<description.-><%!%[CDATA%[(.-)%]%]></description>' ) or
	string.match( entry, '<description.->(.-)</description>' ) or
	"(no content)"

	-- REMOVE HTML TAGS OUT OF CONTENT AND SHORTEN IT
	content = string.gsub(content, '<.->', '')
	content = string.sub(content, 0, 425)

	return content
end

function getRSSImage(entry)
	local image = 
	string.match( entry, "<media:thumbnail.-url=[\"'](.-)[\"']" ) or
	string.match( entry, '<media:thumbnail.->(.-)</media.->' ) or
	string.match( entry, '<enclosure.->(.-)</enclosure>' ) or
	string.match( entry, "<img.-src=[\"'](.-)[\"']" ) or
	string.match( entry, "<.-image.-url=[\"'](.-)[\"']" )	
	
	return image
end

function RSSChannel(rawData)
	local entryTitle, entryLink, entryCont, entryImg

	-- INPUT DATA
	local i = 0
	for entry in string.gmatch(rawData, '<item.->(.-)</item>') do
		i = i + 1

		if i > countEntries then
			break
		end

		entry = StringReplaceByTable(entry)

		--SEARCH DATA
		entryTitle = getRSSTitle(entry)
		entryLink = getRSSLink(entry)
		entryCont = getRSSContent(entry)
		entryImg = getRSSImage(entry)

		--SET LINK; TITLE, CONTENT
		SetSkinText('PaperFeedTitle'..i, entryTitle)
		SetSkinShow('PaperFeedTitle'..i)
		SetSkinText('PaperFeedDesc'..i, entryCont)
		SetSkinLink('PaperFeedDesc'..i, entryLink)

		-- if image is there display only the image + header
		if entryImg then
			SetSkinImage('PaperFeedImageWebparser'..i, entryImg)
			EnableSkin('PaperFeedImageWebparser'..i)
		else
			SKIN:Bang('!SetOption', 'PaperFeedImage'..i, 'SolidColor', '000000AA')
			SKIN:Bang('!SetOption', 'PaperFeedImage'..i, 'ImageName', '')
		end
	end
end


-------------------------------------------------------
-- 						ATOMS
-------------------------------------------------------
function getAtomTitle(entry)
	local title = 
	string.match( entry, '<title.->(.-)</title>' ) or
	"(no title)"

	return title
end

function getAtomContent(entry)
	local content = 
	string.match( entry, '<summary.->(.-)</summary>' ) or
	string.match( entry, '<content.->(.-)</content>' ) or
	"(no content)"

	-- REMOVE HTML TAGS OUT OF CONTENT AND SHORTEN IT
	content = string.gsub(content, '<.->', '')
	content = string.sub(content, 0, 425)

	return content
end

function getAtomLink(entry)
	local link = 
	string.match(entry, "<link.-rel=[\"']alternate[\"'].-href=[\"'](.-)[\"']") or 
	string.match(entry, "<link.-href=[\"'](.-)[\"'].-rel=[\"']alternate[\"']") or
	string.match(entry, "<link.-href=[\"'](.-)[\"']") or
	"(no link)"

	return link
end

function getAtomImage(entry)
	local image =
	string.match(entry, "<img.-src=[\"'](.-)[\"']")

	return image
end

function AtomChannel(rawData)
	local entryTitle, entryLink, entryCont, entryImg

	-- INPUT DATA
	local i = 0
	for entry in string.gmatch(rawData, '<entry.->(.-)</entry>') do
		i = i + 1

		if i > countEntries then
			break
		end

		entry = StringReplaceByTable(entry)

		--SEARCH DATA
		entryTitle = getAtomTitle(entry)
		entryLink = getAtomLink(entry)
		entryCont = getAtomContent(entry)
		entryImg = getAtomImage(entry)

		--SET LINK; TITLE, CONTENT
		SetSkinText('PaperFeedTitle'..i, entryTitle)
		SetSkinShow('PaperFeedTitle'..i)
		SetSkinText('PaperFeedDesc'..i, entryCont)
		SetSkinLink('PaperFeedDesc'..i, entryLink)

		-- if image is there display only the image + header
		if entryImg then
			SetSkinImage('PaperFeedImageWebparser'..i, entryImg)
			EnableSkin('PaperFeedImageWebparser'..i)
		else
			SKIN:Bang('!SetOption', 'PaperFeedImage'..i, 'SolidColor', '000000AA')
			SKIN:Bang('!SetOption', 'PaperFeedImage'..i, 'ImageName', '')
		end
	end
end









-- APPLIES A GIVEN CONVERTTABLE ONTO INPUTSTRING
-- @input: String string
-- @output: String string
function StringReplaceByTable(string)
	-- USED GLOBAL FUNCTIONS
	local char = string.char
	local gsub = string.gsub
	
	-- CONVERT TABLE
	local generalConvertTable = {
		[char(226,128,153)] = char(39), -- '
		[char(195,164)] = char(228), -- auml
		[char(195,182)] = char(246), -- ouml
		[char(195,188)] = char(252), -- uuml
		[char(195,132)] = char(196), -- Auml
		[char(195,150)] = char(214), -- Ouml
		[char(195,156)] = char(220), -- Uuml
		[char(195,159)] = char(223), -- sz
		[char(195,32)] = char(32), -- space
		[char(195,169)] = char(233), -- e tegue
		[char(194)] = '', -- space
		[char(226,128,147)] = char(150), -- thinkline
		[char(226,128,156)] = char(134), -- bottom "
		[char(226,128)] = char(147), -- top "
		[char(226,128,142)] = '',
		[char(195,168)] = char(232), -- e grave
		['&auml;'] = char(228), 
		['&ouml;'] = char(246), 
		['&uuml;'] = char(252), 
		['&Auml;'] = char(196), 
		['&Ouml;'] = char(228), 
		['&Uuml;'] = char(214), 
		['&szlig;'] = char(220), 
		['&amp;'] = char(38), 
		['&lt;'] = char(60), 
		['&gt;'] = char(62), 
		['&nbsp;'] = char(32), 
		['&(%w-);'] = '',
	}
	
	-- ITERATE THROUGH ALL ENTRIES AND REPLACE
	for k,v in pairs(generalConvertTable) do
		string = gsub(string, k, v)
	end

	-- SOLE FUNCTION TO REPLACE LUA REPRESENTATION
	string = gsub(string,"&#(%d+);", function(c) local num = tonumber(c) if 0 <= num and num <= 255 then return char(num) else return "" end end)

	-- RESULT
	return string
end -- StringReplaceByTable