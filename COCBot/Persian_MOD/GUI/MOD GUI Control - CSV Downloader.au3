; #FUNCTION# ====================================================================================================================
; Name ..........: MOD GUI Design - CSV Downloader
; Description ...:
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: MHK2012
; Modified ......: Persian MOD
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2018
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func btnCancel()
	GUIDelete($Form1)
EndFunc

Func SpecialEvents()
	Select
		Case @GUI_CtrlId = $GUI_EVENT_CLOSE
			GUIDelete($Form1)
		Case @GUI_CtrlId = $GUI_EVENT_MINIMIZE
			GUISetState(@SW_MINIMIZE, $Form1)
		Case @GUI_CtrlId = $GUI_EVENT_RESTORE
			GUISetState(@SW_RESTORE, $Form1)
	EndSelect
EndFunc

Func btnCSVDownloader()
	if GUICtrlRead($g_ahTxtDownloadLink) = "" Or GUICtrlRead($g_ahTxtCSVName) = "" Then
		MsgBox($MB_ICONWARNING, "Error", GetTranslatedFileIni("MBR GUI Design - CSV Downloader", "ErrorFillFields", "Fill in all fields!"))
		Return
	EndIf

	Local $FileURL = GUICtrlRead($g_ahTxtDownloadLink)
	Local $FileName = GUICtrlRead($g_ahTxtCSVName)
	Local $FileSaveLocation = @ScriptDir & "\CSV\Attack\" & $FileName & ".csv"

	InetGet($FileURL, $FileSaveLocation)

	if FileExists($FileSaveLocation) Then
		MsgBox($MB_ICONINFORMATION, "", GetTranslatedFileIni("MBR GUI Design - CSV Downloader", "downloadSeccessful", "The download was successful, Reload scripts!"))
		UpdateComboScriptNameDB()
	Else
		MsgBox($MB_ICONERROR, "", GetTranslatedFileIni("MBR GUI Design - CSV Downloader", "NotdownloadSeccessful", "The download wasn't successful"))
	EndIf

	btnCancel()
EndFunc