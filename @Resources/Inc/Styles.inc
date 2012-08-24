; ===============================================
; Menu Style and General Layout
; ===============================================
[styleMenuUpArrow]
ImageName = #@#Img/down.png
MouseActionCursor = 1
X = 0
Y = 0
W = 14
H = 14

[styleMenuDownArrow]
ImageName = #@#Img/up.png
MouseActionCursor = 1
X = 0
Y = (#Height# - 14)
W = 14
H = 14
[styleTitle]
StringAlign = Center
SolidColor = #SolidColorTransparent#
StringCase = Upper
StringStyle = Bold
FontColor = #FontColorTitle#
FontFace = #FontFamilyTitle#
FontSize = #FontSizeBig#
MouseActionCursor = 1
Angle = 1.57
AntiAlias = 1
ClipString = 1
X = 20
Y = 122
W = 100
H = 18

[styleSeperator]
SolidColor = #SolidColorSeperator#
X=30
W = #Width#
H=2


; ===============================================
; Events Style
; ===============================================
[styleDate]
StringAlign = Left
StringCase = None
FontColor= #FontColorLow#
FontFace = #FontFamilyText#
FontSize = #FontSizeSmall#
AntiAlias=1
ClipString=1
H=14
X=30
Y=5
W = #Width#

[styleDateOpt]
StringAlign = Right
StringCase = None
FontColor= #FontColorLow#
FontFace = #FontFamilyText#
FontSize = #FontSizeSmall#
AntiAlias=1
ClipString=1
H=14
X=320
Y=5
W=150

[styleDesc]
StringAlign = Left
StringCase = None
SolidColor = #SolidColorTransparent#
StringEffect = Shadow
FontEffectColor = #FontEffectColorNormal#
FontColor=#FontColorHighlight#
FontFace = #FontFamilyText#
FontSize = #FontSizeMedium#
AntiAlias=1
ClipString=1
H=16
X=45
Y=12r
W=270

[styleCalBar]
X=40
Y=18
W=3
H=12


; ===============================================
; Feed Style
; ===============================================
[styleFeedTitle]
StringAlign = Left
StringCase = None
SolidColor = #SolidColorTransparent#
FontColor= #FontColorLow#
FontFace = #FontFamilyText#
FontSize = #FontSizeBig#
AntiAlias=1
ClipString=1
H=22
X=71
Y=5
W = (#Width# - 41)

[styleFeedPages]
Text = "n"
FontColor = #FontColorLow#
FontFace = Webdings
FontSize = 7
AntiAlias = 1
Y = 226
Hidden = 1

[styleFeedContent]
SolidColor = #SolidColorTransparent#
StringEffect = Shadow
FontEffectColor = #FontEffectColorNormal#
FontColor = #FontColorHighlight#
FontFace = #FontFamilyText#
FontSize = #FontSizeMedium#
AntiAlias = 1
ClipString = 1
X = 30
Y = 35
W = #Width#
H = (#Height# - 55)

Hidden = 1

[styleFeedEntryTitle]
StringAlign = Left
StringCase = None
FontColor= #FontColorHighlight#
FontFace = #FontFamilyText#
FontSize = (#FontSizeSmall# + 1)
AntiAlias=1
ClipString=1
H=14
X=30
Y=5
W= #Width#

[styleFeedEntryDesc]
StringAlign = Left
StringCase=NONE
SolidColor = #SolidColorTransparent#
StringEffect = Shadow
FontEffectColor = #FontEffectColorNormal#
FontColor = #FontColorLow#
FontFace = #FontFamilyText#
FontSize = #FontSizeMedium#
AntiAlias=1
ClipString=1
H=16
X=45
Y=12r
W=270

[styleFeedIcon]
MouseActionCursor = 1
Greyscale = 1
W = 14
H = 14
Y = 9


; ===============================================
; Paper Style
; ===============================================
; Style Color Layout 
[styleSolidColorLow]
;SolidColor = #FontColorLow#
SolidColor = DDDDDD

[styleLineColorLow]
;LineColor = #FontColorLow#
LineColor = DDDDDD

[styleSolidColorHighlight]
SolidColor = #FontColorHighlight#

[styleLineColorHighlight]
LineColor = #FontColorHighlight#


; Style General Layout
[stylePaperTopLeft]
StartAngle=3.142
RotationAngle=1.571
LineLength = #PaperRoundRadius#
Solid=1
AntiAlias=1

[stylePaperTopRight]
StartAngle=4.712
RotationAngle=1.571
LineLength = #PaperRoundRadius#
Solid=1
AntiAlias=1

[stylePaperBottomLeft]
StartAngle=1.571
RotationAngle=1.571
LineLength= #PaperRoundRadius#
Solid=1
AntiAlias=1

[stylePaperBottomRight]
StartAngle=0
RotationAngle=1.571
LineLength= #PaperRoundRadius#
Solid=1
AntiAlias=1

; ===============================================
; Style Background Layout
[stylePaperBackgroundTopLeft]
X = 0
Y = 0
W = #PaperRoundDiameter#
H = #PaperRoundDiameter#

[stylePaperBackgroundTop]
X = #PaperRoundRadius#
Y = 0
W = (#BackgroundX2# - #PaperRoundDiameter#)
H = #PaperRoundRadius#

[stylePaperBackgroundTopRight]
X = (#BackgroundX2# - #PaperRoundDiameter#)
Y = 0
W = #PaperRoundDiameter#
H = #PaperRoundDiameter#

[stylePaperBackgroundCenter]
X = 0
Y = #PaperRoundRadius#
W = #BackgroundX2#
H = (#BackgroundY2# - #PaperRoundDiameter#)

[stylePaperBackgroundBottomLeft]
X = 0
Y = (#BackgroundY2# - #PaperRoundDiameter#)
W = #PaperRoundDiameter#
H = #PaperRoundDiameter#

[stylePaperBackgroundBottom]
X = #PaperRoundRadius#
Y = (#BackgroundY2# - #PaperRoundRadius#)
W = (#BackgroundX2# - #PaperRoundDiameter#)
H = #PaperRoundRadius#

[stylePaperBackgroundBottomRight]
X = (#BackgroundX2# - #PaperRoundDiameter#)
Y = (#BackgroundY2# - #PaperRoundDiameter#)
W = #PaperRoundDiameter#
H = #PaperRoundDiameter#


; ===============================================
; Style Frontground Layout
; Corners
[stylePaperFrontgroundTopLeft]
X = #FrontgroundX1#
Y = #FrontBackPadding#
W = #PaperRoundDiameter#
H = #PaperRoundDiameter#

[stylePaperFrontgroundTop]
X = (#FrontgroundX1# + #PaperRoundRadius#)
Y = #FrontBackPadding#
W = (#BackgroundX2# - #FrontgroundX1# - #FrontBackPadding# - #PaperRoundDiameter#)
H = #PaperRoundRadius#

[stylePaperFrontgroundTopRight]
X = (#BackgroundX2# - #FrontBackPadding# - #PaperRoundDiameter#)
Y = #FrontBackPadding#
W = #PaperRoundDiameter#
H = #PaperRoundDiameter#

[stylePaperFrontgroundCenter]
X = #FrontgroundX1#
Y = (#FrontBackPadding# + #PaperRoundRadius#)
W = (#BackgroundX2# - #FrontgroundX1# - #FrontBackPadding#)
H = (#BackgroundY2# - 2*#FrontBackPadding# - #PaperRoundDiameter#)

[stylePaperFrontgroundBottomLeft]
X = #FrontgroundX1#
Y = (#BackgroundY2# - #FrontBackPadding# - #PaperRoundDiameter#)
W = #PaperRoundDiameter#
H = #PaperRoundDiameter#

[stylePaperFrontgroundBottom]
X = (#FrontgroundX1# + #PaperRoundRadius#)
Y = (#BackgroundY2# - #FrontBackPadding# - #PaperRoundRadius#)
W = (#BackgroundX2# - #FrontgroundX1# - #FrontBackPadding# - #PaperRoundDiameter#)
H = #PaperRoundRadius#

[stylePaperFrontgroundBottomRight]
X = (#BackgroundX2# - #PaperRoundDiameter# - #FrontBackPadding#)
Y = (#BackgroundY2# - #FrontBackPadding# - #PaperRoundDiameter#)
W = #PaperRoundDiameter#
H = #PaperRoundDiameter#

; ===============================================
; Style Paper Feed
[stylePaperFeedLink]
SolidColor = 00000001
FontColor = 444444
FontSize = #FontSizeMedium#
FontFace = #FontFamilyText#
AntiAlias = 1
StringAlign = LeftCenter
Prefix = "  "
X = 25
Y = 35
W = 125
H = 25

[stylePaperFeedImage]
W = #PaperEntryWidth#
H = #PaperEntryHeight#
PreserveAspectRatio = 2

[stylePaperFeedTitle]
SolidColor = 000000AA

FontColor = FFFFFF
FontSize = (#FontSizeMedium# + 2)
FontFace = #FontFamilyText#
StringStyle = Bold

X = 0r
Y = (0.618 * #PaperEntryHeight#)r
W = #PaperEntryWidth#
H = (0.382 * #PaperEntryHeight#)

;Text = "So radikal ist Paul Ryan"

AntiAlias=1
ClipString=1

Hidden = 1

[stylePaperFeedCont]
SolidColor = FFFFFF

StringEffect = Shadow
FontEffectColor = #FontEffectColorNormal#

FontFace = #FontFamilyText#
FontSize = (#FontSizeMedium#)
FontColor = 000000
FontSize = #FontSizeSmall#

X = 0r
Y = 15r
W = #PaperEntryWidth#
H = #PaperEntryHeight#

AntiAlias=1
ClipString=1

;Text = "Steuersenkungen fuer Reiche, Sozialkuerzungen, Kampf gegen die Schwulenehe, mehr Geld fuers Militaer: Vizepraesidentschafts-Kandidat Paul Ryan ist ein konservativer Hardliner. Eine Steilvorlage fuer das Obama-Team. Koennte Mitt Romney seine Entscheidung schon bald bereuen?"

Hidden = 1

[stylePapaerFeedRadioButton]
Text = "n"
FontColor = #FontColorLow#
FontFace = Webdings
FontSize = 7
AntiAlias = 1
Y = 780
Hidden = 1

[stylePaperFeedColumn1]
X = (#FrontgroundX1# + #PaperRoundRadius#)

[stylePaperFeedColumn2]
X = (#FrontgroundX1# + 2*#FrontBackPadding# + #PaperEntryWidth#)

[stylePaperFeedColumn3]
X = (#FrontgroundX1# + 3*#FrontBackPadding# + 2*#PaperEntryWidth#)

[stylePaperFeedColumn4]
X = (#FrontgroundX1# + 4*#FrontBackPadding# + 3*#PaperEntryWidth#)

[stylePaperFeedColumn5]
X = (#FrontgroundX1# + 5*#FrontBackPadding# + 4*#PaperEntryWidth#)

[stylePaperFeedRow1]
Y = (#FrontBackPadding# + #PaperRoundRadius#)

[stylePaperFeedRow2]
Y = (#FrontBackPadding# + 2*#PaperRoundRadius# + #PaperEntryHeight#)

[stylePaperFeedRow3]
Y = (#FrontBackPadding# + 3*#PaperRoundRadius# + 2*#PaperEntryHeight#)

[stylePaperFeedRow4]
Y = (#FrontBackPadding# + 4*#PaperRoundRadius# + 3*#PaperEntryHeight#)

[stylePaperFeedRow5]
Y = (#FrontBackPadding# + 5*#PaperRoundRadius# + 4*#PaperEntryHeight#)
