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
#include-once

Global $Form1 = 0, $g_ahTxtDownloadLink = 0, $g_ahTxtCSVName = 0, $g_hBtnOK = 0, $g_hBtnCansel = 0

Func CreateCSVDownloader()
	$Form1 = GUICreate(GetTranslatedFileIni("MBR GUI Design - CSV Downloader", "CSVDownloaderTitle", "CSV Downloader"), 385, 112, 192, 124)
	GUISetOnEvent($GUI_EVENT_CLOSE, "SpecialEvents")
	GUISetOnEvent($GUI_EVENT_MINIMIZE, "SpecialEvents")
	GUISetOnEvent($GUI_EVENT_RESTORE, "SpecialEvents")

	Local $x = 8, $y = 16
	GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design - CSV Downloader", "CSVDownloaderLink", "Download Link:"), $x, $y, 74, 17)
	GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design - CSV Downloader", "CSVDownloaderName", "CSV Name:"), $x + 16, $y + 32, 59, 17)

	$x += 80
	$g_ahTxtDownloadLink = GUICtrlCreateInput("", $x, $y, 281, 21)
	$g_ahTxtCSVName = GUICtrlCreateInput("", $x, $y + 29, 281, 21)

	$x += 80
	$g_hBtnOK = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design - CSV Downloader", "CSVDownloaderbtnOK", "OK"), $x + 128, $y + 56, 73, 25)
	GUICtrlSetOnEvent(-1, "btnCSVDownloader")
	$g_hBtnCansel = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design - CSV Downloader", "CSVDownloaderbtnCansel", "Cansel"), $x, $y + 56, 73, 25)
	GUICtrlSetOnEvent(-1, "btnCancel")
	GUISetState(@SW_SHOW, $Form1)

EndFunc
