; #FUNCTION# ====================================================================================================================
; Name ..........: MOD GUI Design - Download CSV
; Description ...:
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: MHK2012
; Modified ......: Persian MOD
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2017
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
#include-once

Global $Form1 = 0, $g_ahTxtDownloadLink = 0, $g_ahTxtCSVName = 0, $g_hBtnOK = 0, $g_hBtnCansel = 0

Func CreateDownloadCSV()
	$Form1 = GUICreate(GetTranslatedFileIni("MBR GUI Design - Download CSV", "DownloadCSVTitle", "Download CSV"), 385, 112, 192, 124)
	GUISetOnEvent($GUI_EVENT_CLOSE, "SpecialEvents")
	GUISetOnEvent($GUI_EVENT_MINIMIZE, "SpecialEvents")
	GUISetOnEvent($GUI_EVENT_RESTORE, "SpecialEvents")

	Local $x = 8, $y = 16
	GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design - Download CSV", "DownloadCSVLink", "Download Link:"), $x, $y, 74, 17)
	GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design - Download CSV", "DownloadCSVName", "CSV Name:"), $x + 16, $y + 32, 59, 17)

	$x += 80
	$g_ahTxtDownloadLink = GUICtrlCreateInput("", $x, $y, 281, 21)
	$g_ahTxtCSVName = GUICtrlCreateInput("", $x, $y + 29, 281, 21)

	$x += 80
	$g_hBtnOK = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design - Download CSV", "DownloadCSVbtnOK", "OK"), $x + 128, $y + 56, 73, 25)
	GUICtrlSetOnEvent(-1, "btnDownloadCSV")
	$g_hBtnCansel = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design - Download CSV", "DownloadCSVbtnCansel", "Cansel"), $x, $y + 56, 73, 25)
	GUICtrlSetOnEvent(-1, "btnCancel")
	GUISetState(@SW_SHOW, $Form1)

EndFunc
