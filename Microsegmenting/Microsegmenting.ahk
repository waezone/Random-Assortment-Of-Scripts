SetWorkingDir %A_ScriptDir%
#include ConfigParser.ahk

; Script binds
global GamePath := "<GamePath>"

global PrevBind := "PgDn"
global NextBind := "PgUp"
global MenuBind := "Home"

global CurrentSave := 0
global CurrentSegment := 1
global RunFolder := "Segmented"

; Game binds

global StopBind := "mouse4"
global LoadBind := "i"
global RecordBind := "o"
Global Sensitivity := "2.3"

GuiSubmit := false

Gui, MainWindow:New, ,Settings

; Outerbox + Game Path Select
Gui, MainWindow:Add, Text, x25 y25, Game folder path (ex. hl2, portal):
Gui, MainWindow:Add, Edit, vGamePathControl y23 w350 h20 -wrap, %GamePath%
Gui, MainWindow:Add, Button,gGamePathFolderSelectWindow y21 w100 x565, Select

; Bind list
Gui, MainWindow:Add, Text, x25 y65, Previous Segment Bind:
Gui, MainWindow:Add, Hotkey, w120 x205 y62 -wrap vPrevBind, %PrevBind%

Gui, MainWindow:Add, Text, x25 y90, Next Segment Bind:
Gui, MainWindow:Add, Hotkey, w120 x205 y87 -wrap vNextBind, %NextBind%

Gui, MainWindow:Add, Text, x25 y115, Settings Window Bind:
Gui, MainWindow:Add, Hotkey, w120 x205 y112 -wrap vMenuBind, %MenuBind%

; Segment Settings
Gui, MainWindow:Add, Text, x370 y65, Current Segment: 
Gui, MainWindow:Add, Edit, w120 x550 y62
Gui, MainWindow:Add, UpDown, vCurrentSegment Range0-65565, %CurrentSegment%

Gui, MainWindow:Add, Text, x370 y90, Save to load from: 
Gui, MainWindow:Add, Edit, w120 x550 y87
Gui, MainWindow:Add, UpDown, vCurrentSave Range0-65565, %CurrentSaveName%

Gui, MainWindow:Add, Text, x370 y115, Run Name: 
Gui, MainWindow:Add, Edit, w120 x550 y112 vRunFolder, %RunFolder%

; Ingame Bind Settings
Gui, MainWindow:Add, Text, x25 y170, Stop Segment Bind:
Gui, MainWindow:Add, Edit, w120 x205 y170 -wrap vStopBind, %StopBind%

Gui, MainWindow:Add, Text, x25 y195, Load Save Bind:
Gui, MainWindow:Add, Edit, w120 x205 y195 -wrap vLoadBind, %LoadBind%

Gui, MainWindow:Add, Text, x25 y220, Record Bind:
Gui, MainWindow:Add, Edit, w120 x205 y220 -wrap vRecordBind, %RecordBind%

Gui, MainWindow:Add, Text, x370 y170, Sensitivity: 
Gui, MainWindow:Add, Edit, w120 x550 y170 -wrap vSensitivity, %Sensitivity%

; Boxes
Gui, MainWindow:Add, GroupBox, x10 y50 w335 h100
Gui, MainWindow:Add, GroupBox, x355 y50 w335 h100
Gui, MainWindow:Add, GroupBox, x5 y5 w690 h150

Gui, MainWindow:Add, GroupBox, x5 y155 w690 h110

; Save and close and cancel button
Gui, MainWindow:Add, Button, gSaveAndRun w100 x485 y270, Save and Run
Gui, MainWindow:Add, Button, gExit w100 x595 y270, Exit

Gui, MainWindow:Show, w700 h300


GamePathFolderSelectWindow()
{
    FileSelectFolder, GamePath, , 0, Select Folder(ex Half-Life2\hl2)

    GuiControl, ,GamePathControl, %GamePath%
}

SaveAndRun()
{
	Gui, MainWindow:Submit
	GuiSubmit := true
	
	SetWorkingDir %GamePath%

	HotKey, %PrevBind%, Prev
	HotKey, %NextBind%, Next
	HotKey, %MenuBind%, OpenMenu
}

Exit()
{
    Gui, MainWindow:Destroy
    ExitApp
}

if GuiSubmit == true
{
	Prev:
		msgbox % PrevBind
		return
	
	Next:
		msgbox % NextBind
		
		return
	
	OpenMenu:
		msgbox % MenuBind
		GuiSubmit := false
		Gui, MainWindow:Show
		return
}
