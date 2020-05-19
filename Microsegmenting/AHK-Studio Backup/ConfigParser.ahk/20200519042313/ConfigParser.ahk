FileName := "seg.cfg" ; change to whatever segmenting script you're using.
fileText =

TextTemplate := "//Stopping your segment when you get it.`nalias st0p ""save folder\1; echo #SAVE#; sensitivity 0; wait 100; stop"";`n//Reloading your segment to try again.`nalias l04d ""sensitivity 0; load folder\0; y_spt_timer_reset; toggle_duck"";`n//To unpause and start recording after you reload.`nalias unp4us3 ""sensitivity 2;unpause"";`nalias r3c0rd ""record folder\1; unp4us3"";`n//Be sure to change [Yourkey] to the key you want to use.`n//Put this key close by because you will prabably be surprised when you get a segment.`nbind mouse5 st0p;`n//Put these keys in a comfortable spot because you will be using these a lot.`nbind i l04d;`nbind o r3c0rd;`necho Segment folder\1;"
msgbox %TextTemplate%

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