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
W = (#PaperBackgroundX2# - #PaperRoundDiameter#)
H = #PaperRoundRadius#

[stylePaperBackgroundTopRight]
X = (#PaperBackgroundX2# - #PaperRoundDiameter#)
Y = 0
W = #PaperRoundDiameter#
H = #PaperRoundDiameter#

[stylePaperBackgroundCenter]
X = 0
Y = #PaperRoundRadius#
W = #PaperBackgroundX2#
H = (#PaperBackgroundY2# - #PaperRoundDiameter#)

[stylePaperBackgroundBottomLeft]
X = 0
Y = (#PaperBackgroundY2# - #PaperRoundDiameter#)
W = #PaperRoundDiameter#
H = #PaperRoundDiameter#

[stylePaperBackgroundBottom]
X = #PaperRoundRadius#
Y = (#PaperBackgroundY2# - #PaperRoundRadius#)
W = (#PaperBackgroundX2# - #PaperRoundDiameter#)
H = #PaperRoundRadius#

[stylePaperBackgroundBottomRight]
X = (#PaperBackgroundX2# - #PaperRoundDiameter#)
Y = (#PaperBackgroundY2# - #PaperRoundDiameter#)
W = #PaperRoundDiameter#
H = #PaperRoundDiameter#


; ===============================================
; Style Frontground Layout
; Corners
[stylePaperFrontgroundTopLeft]
X = #PaperFrontgroundX1#
Y = #PaperFrontBackPadding#
W = #PaperRoundDiameter#
H = #PaperRoundDiameter#

[stylePaperFrontgroundTop]
X = (#PaperFrontgroundX1# + #PaperRoundRadius#)
Y = #PaperFrontBackPadding#
W = (#PaperBackgroundX2# - #PaperFrontgroundX1# - #PaperFrontBackPadding# - #PaperRoundDiameter#)
H = #PaperRoundRadius#

[stylePaperFrontgroundTopRight]
X = (#PaperBackgroundX2# - #PaperFrontBackPadding# - #PaperRoundDiameter#)
Y = #PaperFrontBackPadding#
W = #PaperRoundDiameter#
H = #PaperRoundDiameter#

[stylePaperFrontgroundCenter]
X = #PaperFrontgroundX1#
Y = (#PaperFrontBackPadding# + #PaperRoundRadius#)
W = (#PaperBackgroundX2# - #PaperFrontgroundX1# - #PaperFrontBackPadding#)
H = (#PaperBackgroundY2# - 2*#PaperFrontBackPadding# - #PaperRoundDiameter#)

[stylePaperFrontgroundBottomLeft]
X = #PaperFrontgroundX1#
Y = (#PaperBackgroundY2# - #PaperFrontBackPadding# - #PaperRoundDiameter#)
W = #PaperRoundDiameter#
H = #PaperRoundDiameter#

[stylePaperFrontgroundBottom]
X = (#PaperFrontgroundX1# + #PaperRoundRadius#)
Y = (#PaperBackgroundY2# - #PaperFrontBackPadding# - #PaperRoundRadius#)
W = (#PaperBackgroundX2# - #PaperFrontgroundX1# - #PaperFrontBackPadding# - #PaperRoundDiameter#)
H = #PaperRoundRadius#

[stylePaperFrontgroundBottomRight]
X = (#PaperBackgroundX2# - #PaperRoundDiameter# - #PaperFrontBackPadding#)
Y = (#PaperBackgroundY2# - #PaperFrontBackPadding# - #PaperRoundDiameter#)
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
X = (#PaperFrontgroundX1# + #PaperRoundRadius#)

[stylePaperFeedColumn2]
X = (#PaperFrontgroundX1# + 2*#PaperFrontBackPadding# + #PaperEntryWidth#)

[stylePaperFeedColumn3]
X = (#PaperFrontgroundX1# + 3*#PaperFrontBackPadding# + 2*#PaperEntryWidth#)

[stylePaperFeedColumn4]
X = (#PaperFrontgroundX1# + 4*#PaperFrontBackPadding# + 3*#PaperEntryWidth#)

[stylePaperFeedColumn5]
X = (#PaperFrontgroundX1# + 5*#PaperFrontBackPadding# + 4*#PaperEntryWidth#)

[stylePaperFeedRow1]
Y = (#PaperFrontBackPadding# + #PaperRoundRadius#)

[stylePaperFeedRow2]
Y = (#PaperFrontBackPadding# + 2*#PaperRoundRadius# + #PaperEntryHeight#)

[stylePaperFeedRow3]
Y = (#PaperFrontBackPadding# + 3*#PaperRoundRadius# + 2*#PaperEntryHeight#)

[stylePaperFeedRow4]
Y = (#PaperFrontBackPadding# + 4*#PaperRoundRadius# + 3*#PaperEntryHeight#)

[stylePaperFeedRow5]
Y = (#PaperFrontBackPadding# + 5*#PaperRoundRadius# + 4*#PaperEntryHeight#)
