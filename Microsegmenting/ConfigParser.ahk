FileName := "seg.cfg" ; change to whatever segmenting script you're using.
fileText =

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
global Sensitivity := "2.3"

global TextTemplate := "alias st0p ""save <RunFolderText>\<CurrentSegmentText>; echo #SAVE#; sensitivity 0; wait 100; stop"";`nalias l04d ""sensitivity 0; load <RunFolderText>\<CurrentSaveText>; y_spt_timer_reset; toggle_duck"";`nalias unp4us3 ""sensitivity <SensitivityText>;unpause"";`nalias r3c0rd ""record <RunFolderText>\<CurrentSegmentText>; unp4us3"";`nbind <StopBindText> st0p;`nbind <LoadBindText> l04d;`nbind <RecordBindText> r3c0rd;`necho Segment <RunFolderText>\<CurrentSegmentText>;`n"

GenerateConfig()
{
	configText := TextTemplate

	configText := StrReplace(configText, "<CurrentSaveText>", CurrentSave)
	configText := StrReplace(configText, "<CurrentSegmentText>", CurrentSegment)
	configText := StrReplace(configText, "<RunFolderText>", RunFolder)
	configText := StrReplace(configText, "<StopBindText>", StopBind)
	configText := StrReplace(configText, "<LoadBindText>", LoadBind)
	configText := StrReplace(configText, "<RecordBindText>", RecordBind)
	configText := StrReplace(configText, "<SensitivityText>", Sensitivity)

	msgbox % configText
}

ChangeNum(fileName, next, demoPath) 
{	
	newText =
	Loop, read, %fileName%, `n, `r
	{
		LineNumber = %A_Index%
		Loop, parse, A_LoopReadLine, `n, `r
		{
			pos = 
			segNum =
			
			line := A_LoopField
			StringGetPos, pos, A_LoopField, %demoPath%
			; msgbox %line%
			; msgbox %pos%
			if (pos > 0)
			{
				currentChar = 
			
				numberPos := pos + StrLen(demoPath)
				numberPos += 1
			
				Loop
				{
					currentChar := SubStr(A_LoopField, numberPos, 1)
					if (currentChar != ";"){
						segNum = %segNum%%currentChar%
						numberPos += 1
					}
					else {
						break
					}
				}
				; msgbox %segNum0%
				
				newNum := (next) ? segNum + 1 : segNum - 1
				
				segPath = %demoPath%%segNum%
				newPath = %demoPath%%newNum%
				
				line := StrReplace(line, segPath, newPath)
				; msgbox %line%
			}
		
			line := line Chr(13)
		
			; msgbox  %line%
			newText = %newText%%line%
		}
	}
	; msgbox %newText%
	
	FileDelete, %fileName%
	FileAppend, %newText%, %fileName%
	
	Sleep, 100
	
	Send, {Numpad0} ; This is the key that should be bound to re exec your segmenting script
}