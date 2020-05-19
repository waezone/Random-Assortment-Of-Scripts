global FileName := "seg.cfg" ; change to whatever segmenting script you're using.
global ConfigPath := "cfg"

; Script binds
global GamePath := "<GamePath>"

global PrevBind := "PgDn"
global NextBind := "PgUp"
global MenuBind := "Home"

global CurrentSave := 0
global CurrentSegment := 1
global RunFolder := "<FolderName>"
global RunnerName := "waezone"

; Game binds
global StopBind := "mouse4"
global LoadBind := "i"
global RecordBind := "o"
global Sensitivity := "2.3"
global CfgReloadBind := "NUM0"

SaveSettings()
{
	IniWrite, %GamePath%, %A_ScriptDir%\settings.ini, ScriptSettings, GameDirectory
	IniWrite, %PrevBind%, %A_ScriptDir%\settings.ini, ScriptSettings, PreviousSegmentBind
	IniWrite, %NextBind%, %A_ScriptDir%\settings.ini, ScriptSettings, NextSegmentBind
	IniWrite, %MenuBind%, %A_ScriptDir%\settings.ini, ScriptSettings, OpenSettingsBind
	IniWrite, %CurrentSave%, %A_ScriptDir%\settings.ini, ScriptSettings, CurrentSaveCount
	IniWrite, %CurrentSegment%, %A_ScriptDir%\settings.ini, ScriptSettings, CurrentSegmentCount
	IniWrite, %RunFolder%, %A_ScriptDir%\settings.ini, ScriptSettings, FolderNames
	IniWrite, %RunnerName%, %A_ScriptDir%\settings.ini, ScriptSettings, UserName
	IniWrite, %StopBind%, %A_ScriptDir%\settings.ini, ScriptSettings, StopSegmentBind
	IniWrite, %LoadBind%, %A_ScriptDir%\settings.ini, ScriptSettings, LoadSegmentBind
	IniWrite, %RecordBind%, %A_ScriptDir%\settings.ini, ScriptSettings, RecordSegmentBind
	IniWrite, %Sensitivity%, %A_ScriptDir%\settings.ini, ScriptSettings, UserSensitivity
	IniWrite, %CfgReloadBind%, %A_ScriptDir%\settings.ini, ScriptSettings, ReloadCFGBind
}
ReadSettings()
{
	if (FileExist(A_ScriptDir "\settings.ini"))
	{
		IniRead, GamePath, %A_ScriptDir%\settings.ini, ScriptSettings, GameDirectory
		IniRead, PrevBind, %A_ScriptDir%\settings.ini, ScriptSettings, PreviousSegmentBind
		IniRead, NextBind, %A_ScriptDir%\settings.ini, ScriptSettings, NextSegmentBind
		IniRead, MenuBind, %A_ScriptDir%\settings.ini, ScriptSettings, OpenSettingsBind
		IniRead, CurrentSave, %A_ScriptDir%\settings.ini, ScriptSettings, CurrentSaveCount
		IniRead, CurrentSegment, %A_ScriptDir%\settings.ini, ScriptSettings, CurrentSegmentCount
		IniRead, RunFolder, %A_ScriptDir%\settings.ini, ScriptSettings, FolderNames
		IniRead, RunnerName, %A_ScriptDir%\settings.ini, ScriptSettings, UserName
		IniRead, StopBind, %A_ScriptDir%\settings.ini, ScriptSettings, StopSegmentBind
		IniRead, LoadBind, %A_ScriptDir%\settings.ini, ScriptSettings, LoadSegmentBind
		IniRead, RecordBind, %A_ScriptDir%\settings.ini, ScriptSettings, RecordSegmentBind
		IniRead, Sensitivity, %A_ScriptDir%\settings.ini, ScriptSettings, UserSensitivity
		IniRead, CfgReloadBind, %A_ScriptDir%\settings.ini, ScriptSettings, ReloadCFGBind
	}
}