#include Settings.ahk

global TextTemplate := "alias st0p ""save <RunFolderText>\<CurrentSegmentText>-<RunnerNameText>-; echo #SAVE#; sensitivity 0; wait 100; stop"";`nalias l04d ""sensitivity 0; load <RunFolderText>\<CurrentSaveText>-<RunnerNameText>-; y_spt_timer_reset; toggle_duck"";`nalias unp4us3 ""sensitivity <SensitivityText>;unpause"";`nalias r3c0rd ""record <RunFolderText>\<CurrentSegmentText>-<RunnerNameText>-; unp4us3"";`nbind <StopBindText> st0p;`nbind <LoadBindText> l04d;`nbind <RecordBindText> r3c0rd;`necho ""Segment #####SEGMENT <CurrentSegmentText>#####"";`n"

GenerateConfig()
{
	if (FileExist(ConfigPath "\" FileName))
	{
		FileDelete, %ConfigPath%\%FileName%
	}

	configText := TextTemplate

	; replaces the template with the all the correct variables
	configText := StrReplace(configText, "<CurrentSaveText>", CurrentSave)
	configText := StrReplace(configText, "<CurrentSegmentText>", CurrentSegment)
	configText := StrReplace(configText, "<RunFolderText>", RunFolder)
	configText := StrReplace(configText, "<RunnerNameText>", RunnerName)
	configText := StrReplace(configText, "<StopBindText>", StopBind)
	configText := StrReplace(configText, "<LoadBindText>", LoadBind)
	configText := StrReplace(configText, "<RecordBindText>", RecordBind)
	configText := StrReplace(configText, "<SensitivityText>", Sensitivity)

	FileAppend, %configText%, %ConfigPath%\%FileName%

}
