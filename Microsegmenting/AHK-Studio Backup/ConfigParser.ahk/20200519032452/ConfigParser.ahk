SetWorkingDir %A_ScriptDir%

FileName = seg.cfg ; change to whatever segmenting script you're using.
fileText =

DemoPath = folder\ 
; Filepath of saves and demos. 
; Change this to wherever you put your demos/saves, the .dem and .save can only be a number
; This is what one of your three alias should look like to work.
; alias l04d "sensitivity 0; load inbounds\45; y_spt_timer_reset";

[:: ; The character on the far left here is to go to previous save, change to whatever key you wish
	Next := false
	ChangeNum(FileName, Next, DemoPath)
	return
]:: ; The character on the far left here is to go to the next save, change to whatever key you wish
	Next := true
	ChangeNum(FileName, Next, DemoPath)
	return

ChangeNum(fileName, next, demoPath) {	

	
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