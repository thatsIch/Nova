--	INIT PATTERNS, MEASURES, URLS
function Initialize()
	
--	pattern
	patEntry = '<entry.-</entry>'
	patTitle = '.-<title.->(.-)</title>.-'
	patDate='.-Wann: (.-)&lt'
	patDateTimeExtract = '(%a%a) (%d+)%. (.-)%.? (%d%d%d%d)'
	patTimeExtract = '(%d%d)%:(%d%d)'
	tMonthNum={Jan=1;Feb=2;Mar=3;Apr=4;Mai=5;Jun=6;Jul=7;Aug=8;Sep=9;Okt=10;Nov=11;Dez=12;}
	yShiftDate = 19
	yShiftItem = 13
	yShiftDateItemSeperator = -2

--	access to the measures	
	Measures={}
	for a in string.gmatch(SELF:GetOption('FeedMeasureName',''),'[^%|]+') do 
		table.insert(Measures,SKIN:GetMeasure(a)) end

--	if WebParser are all active		
	URLs = {
		false,
		false,
		false,
		false
	}
end

--	UPDATES ALL FEEDS
function Update()
--	LOCAL VARIABLE TABLES
	tTitles,tDates,tItems,ItemsByDate ={},{},{},{}
	tNow = os.date('*t')
	intToday = os.time({year=tNow.year, month=tNow.month, day=tNow.day, hour=0, min=0})
	intTomorrow = os.time({year=tNow.year, month=tNow.month, day=tNow.day + 1, hour=0, min=0})

 -- INPUT FEED	
	iCount=0
	
	for i=1,4,1 do 
		sRaw=Measures[i]:GetStringValue()
				
		for sItem in string.gmatch(sRaw,patEntry) do
			iCount = iCount + 1
			table.insert(tTitles,string.match(sItem,patTitle))			
			table.insert(tDates,string.match(sItem,patDate))			
			
			tDates[iCount] = string.gsub(tDates[iCount], "&amp;", "&")
			tDates[iCount] = string.gsub(tDates[iCount], "&auml;", "a")
			intDate = PubDate(tDates[iCount])
			intTime = PubTime(tDates[iCount])
			
			strDate = os.date("%A, %d. %b",intDate)
			
			-- if a time difference is identified there is a time to present
			if intDate ~= intTime then
				strTime = os.date("%H:%M: ",intTime)
				tTitles[iCount] = strTime .. tTitles[iCount]
			end
			
			table.insert(
				tItems, 
				{
					Title = tTitles[iCount],	-- String Title
					Date = strDate, 			-- String Date
					PubDate = intDate, 			-- Int Date
					PubTime = intTime, 			-- Int DateTime
					BarColor = "#BarColor" .. i .. "#"
				} 
			)
		end
	end

	Var1 = 1
	Var2 = 2
	
--	TABLE SORT BY PUBTIME
	for k,v in pairs( tItems ) do 
		table.insert( ItemsByDate, {key=k, record=v} ) 
	end
	table.sort(ItemsByDate, function(a,b) return a.record.PubTime < b.record.PubTime end)
	
--	PRINT TABLES
	curDate = 0
	y = -15
	for i, v in ipairs(ItemsByDate) do
		
		-- prevent the loop making errors
		if i > 8 then break end
		
		SetSkinText('strDesc'..i, v.record.Title)
		SetSkinSolidColor('imgBar'..i, v.record.BarColor)
		
		if (curDate ~= v.record.PubDate) then
			-- Set Date Text
			y = y + yShiftDate
			if intToday == v.record.PubDate then
				SetSkinText('strDate'..i, 'Today')
				SetSkinFontColor('strDate'..i, '#FontColorToday#')
				SetSkinFontEffectColor('strDate'..i, '#BarColor1#')
				SetStringEffect('strDate'..i, 'BORDER')
				SetSkinText('strDateOpt1', v.record.Date)
			elseif intTomorrow == v.record.PubDate then
				SetSkinText('strDate'..i, 'Tomorrow')
				SetSkinFontColor('strDate'..i, '#FontColorTomorrow#')
				SetSkinFontEffectColor('strDate'..i, '#BarColor2#')
				SetStringEffect('strDate'..i, 'BORDER')
				SetSkinText('strDateOpt2', v.record.Date)
				SKIN:GetMeter('strDateOpt2'):SetY(y)
			else
				SetSkinText('strDate'..i, v.record.Date)
			end
			SKIN:GetMeter('strDate'..i):SetY(y)
			
			-- Update Current Date
			curDate = v.record.PubDate
			y = y + yShiftDateItemSeperator
		end
		
		-- Set Item Pos
		y = y + yShiftItem
		SKIN:GetMeter('strDesc'..i):SetY(y)
		-- Set Bar Pos
		SKIN:GetMeter('imgBar'..i):SetY(y + 2)
	end
end

function Updater(i)
	URLs[i] = true
--	FUTURE: check via the URL Variable if set or not set
	if (URLs[1] and URLs[2] and URLs[3] and URLs[4]) then
		Update()
	end
end

-- Zeit konvertieren in absolute Zahl um sortieren zu können
-- Wann: Mi 25. Jul. 2012 10:15 bis 11:45
function PubTime(itemDate)
	local weekday, day, monthText, year = string.match(itemDate, patDateTimeExtract)
	local hour, min = string.match(itemDate, patTimeExtract) or 0
	
	local PubTime = os.time({year=year, month=tMonthNum[monthText], day=day, hour=hour, min=min})

	return PubTime
end 

function PubDate(itemDate)
	local weekday, day, monthText, year = string.match(itemDate, patDateTimeExtract)
	
	local PubTime = os.time({year=year, month=tMonthNum[monthText], day=day, hour=0, min=0})

	return PubTime
end 

function SetSkinText(measure, text)
	SKIN:Bang('!SetOption', measure, 'Text', text)
end

function SetSkinFontColor(measure, color)
	SKIN:Bang('!SetOption', measure, 'FontColor', color)
end

function SetSkinSolidColor(measure, color)
	SKIN:Bang('!SetOption', measure, 'SolidColor', color)
end

function SetSkinFontEffectColor(measure, color)
	SKIN:Bang('!SetOption', measure, 'FontEffectColor', color)
end

function SetStringEffect(measure, effect)
	SKIN:Bang('!SetOption', measure, 'StringEffect', effect)
end