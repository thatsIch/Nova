--	INIT PATTERNS, MEASURES, URLS
function Initialize()
--	pattern
	patTitle = '.-<title.->(.-)</title>.-'

end

--	UPDATES ALL FEEDS
function Update()
		
	MeasureOption = SELF:GetOption('FeedMeasureName','')
	rawMeasure = SKIN:GetMeasure(MeasureOption)
	rawMeasureData = rawMeasure:GetStringValue()
	
	-- check which Feedstyle it is
	-- RSS
	if string.match(rawMeasureData, '<rss.-version=".-".->') then
		patEntry = '<item.-</item>'
		patEntryTitle = '.-<title.->(.-)</title>.-'
		patEntryLink = '.-<link.->(.-)</link>'
		patEntryDesc = '.-<description.->(.-)</description>'
		
	-- Atom
	else
		patEntry = '<entry.-</entry>'
		patEntryTitle = '.-<title.->(.-)</title>.-'
		patEntryLink = '.-<link.-href="(.-)"'
		patEntryDesc = '.-<summary.->(.-)</summary>'
	end

--	FEED NAME
	feedTitle = string.match(rawMeasureData,patTitle)
	SetSkinText('strFeedTitle', feedTitle)
	
--	FEED COUNT
	_, feedCount = string.gsub(rawMeasureData,patEntry, "")
	pageCount = math.ceil(feedCount/6)
	pageCount = math.min(pageCount,10)

	for i = 1,pageCount,1 do
		SetSkinFontColor('btnFeedSwitch'..i, '#FontColorLow#')
		feedContent = SKIN:GetMeter("btnFeedSwitch"..i)
		feedContent:Show()
	end

	for i = pageCount+1,10,1 do
		feedContent = SKIN:GetMeter("btnFeedSwitch"..i)
		feedContent:Hide()
	end

--	REQUESTED PAGE
	curPage = SKIN:GetVariable('CurrentFeedPage') or 1
	SetSkinFontColor('btnFeedSwitch'..curPage, '#FontColorHighlight#')
	
	
 -- INPUT FEED	
	i = 0
	for sItem in string.gmatch(rawMeasureData,patEntry) do
		i = i + 1
		
		if i > (curPage - 1) * 6 then
			entryTitle = string.match(sItem,patEntryTitle)
			entryLink = string.match(sItem,patEntryLink)
			entryDesc = string.match(sItem,patEntryDesc)
			
			n = i - (curPage - 1) * 6
			SetSkinText('strFeedTitle'..n, entryTitle)
			SetSkinText('strFeedDesc'..n, entryDesc)
			SetSkinText('strFeedContent'..n, entryDesc)
			SetSkinLink('strFeedContent'..n, entryLink)
		end
	end
end

function SetSkinText(measure, text)
	SKIN:Bang('!SetOption', measure, 'Text', text)
end

function SetSkinLink(measure, link)
	SKIN:Bang('!SetOption', measure, 'RightMouseUpAction', link)
end

function SetSkinFontColor(measure, color)
	SKIN:Bang('!SetOption', measure, 'FontColor', color)
end