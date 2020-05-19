FileName := "seg.cfg" ; change to whatever segmenting script you're using.
fileText =

TextTemplate := "alias st0p ""save %RunFolder%\1; echo #SAVE#; sensitivity 0; wait 100; stop"";`nalias l04d ""sensitivity 0; load %RunFolder%\%CurrentSave%; y_spt_timer_reset; toggle_duck"";`nalias unp4us3 ""sensitivity %Sensitivity%;unpause"";`nalias r3c0rd ""record %RunFolder%\%CurrentSegment%; unp4us3"";`nbind %StopBind% st0p;`nbind %LoadBind% l04d;`nbind %RecordBind% r3c0rd;`necho Segment %RunFolder%\%CurrentSegment%;`n"

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