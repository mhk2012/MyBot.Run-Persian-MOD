; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file creates the "Scripted Attack" tab under the "Attack" tab under the "DeadBase" tab under the "Search & Attack" tab under the "Attack Plan" tab
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......: CodeSlinger69 (2017)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2018
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
#include-once

Global $g_hGUI_DEADBASE_ATTACK_SCRIPTED = 0
Global $g_hCmbScriptNameDB = 0, $g_hCmbScriptRedlineImplDB = 0, $g_hCmbScriptDroplineDB = 0
Global $g_hLblNotesScriptDB = 0, $g_hBtnAttNowDB = 0

Func CreateAttackSearchDeadBaseScripted()
	$g_hGUI_DEADBASE_ATTACK_SCRIPTED = _GUICreate("", $_GUI_MAIN_WIDTH - 195, $g_iSizeHGrpTab4, 150, 25, BitOR($WS_CHILD, $WS_TABSTOP), -1, $g_hGUI_DEADBASE)
	;GUISetBkColor($COLOR_WHITE, $g_hGUI_DEADBASE_ATTACK_SCRIPTED)

	Local $x = 25, $y = 20
	GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design Child Attack - Attack Scripted", "Group_01", "Deploy"), $x - 20, $y - 20, 270, $g_iSizeHGrpTab4)

	$y += 15
		$g_hCmbScriptNameDB = GUICtrlCreateCombo("", $x, $y, 200, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL, $WS_VSCROLL))
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Attack - Attack Scripted", "CmbScriptName", "Choose the script; You can edit/add new scripts located in folder: 'CSV/Attack'"))
			GUICtrlSetState(-1, $GUI_UNCHECKED)
			GUICtrlSetOnEvent(-1, "cmbScriptNameDB")
		_GUICtrlCreateIcon($g_sLibIconPath, $eIcnReload, $x + 210, $y + 2, 16, 16)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Attack - Attack Scripted", "IconReload_Info_01", "Reload Script Files"))
			GUICtrlSetOnEvent(-1, 'UpdateComboScriptNameDB') ; Run this function when the secondary GUI [X] is clicked

	$y += 25
		$g_hLblNotesScriptDB =  GUICtrlCreateLabel("", $x, $y + 5, 200, 160)

		$g_hBtnAttNowDB = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design Child Attack - Attack Scripted", "BtnAttNow", "Attack Now"), $x , $y + 170, 230, 22)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Attack - Attack Scripted", "BtnAttNow_Info_01", "Button to test the CSV script"))
			GUICtrlSetBkColor(-1, 0xBAD9C8)
			GUICtrlSetOnEvent(-1, "AttackNowDB")

		$g_hCmbScriptRedlineImplDB = GUICtrlCreateCombo("", $x, $y + 195, 230, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetData(-1, GetTranslatedFileIni("MBR GUI Design Child Attack - Attack Scripted", "CmbScriptRedlineImpl", "ImgLoc Raw Redline (default)|ImgLoc Redline Drop Points|Original Redline|External Edges"))
			_GUICtrlComboBox_SetCurSel(-1, $g_aiAttackScrRedlineRoutine[$DB])
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Attack - Attack Scripted", "CmbScriptRedlineImpl_Info_01", "Choose the Redline implementation. ImgLoc Redline is default and best."))
			GUICtrlSetState(-1, $GUI_UNCHECKED)
			GUICtrlSetOnEvent(-1, "cmbScriptRedlineImplDB")
		$g_hCmbScriptDroplineDB = GUICtrlCreateCombo("", $x, $y + 220, 230, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetData(-1, GetTranslatedFileIni("MBR GUI Design Child Attack - Attack Scripted", "CmbScriptDropline", "Drop line fix outer corner|Drop line fist Redline point|Full Drop line fix outer corner|Full Drop line fist Redline point|No Drop line"))
			_GUICtrlComboBox_SetCurSel(-1, $g_aiAttackScrDroplineEdge[$DB])
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Attack - Attack Scripted", "CmbScriptDropline_Info_01", "Choose the drop line edges. Default is outer corner and safer. First Redline point can improve attack."))
			GUICtrlSetState(-1, $GUI_UNCHECKED)
			GUICtrlSetOnEvent(-1, "cmbScriptDroplineDB")
		_GUICtrlCreateIcon($g_sLibIconPath, $eIcnEdit, $x + 210, $y + 2, 16, 16)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Attack - Attack Scripted", "IconShow-Edit_Info_01", "Show/Edit current Attack Script"))
			GUICtrlSetOnEvent(-1, "EditScriptDB")

	$y += 25
		_GUICtrlCreateIcon($g_sLibIconPath, $eIcnAddcvs, $x + 210, $y + 2, 16, 16)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Attack - Attack Scripted", "IconCreate_Info_01", "Create a new Attack Script"))
			GUICtrlSetOnEvent(-1, "NewScriptDB")

	$y += 25
		_GUICtrlCreateIcon($g_sLibIconPath, $eIcnCopy, $x + 210, $y + 2, 16, 16)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Attack - Attack Scripted", "IconCopy_Info_01", "Copy current Attack Script to a new name"))
			GUICtrlSetOnEvent(-1, "DuplicateScriptDB")

	$y += 25
		_GUICtrlCreateIcon($g_sLibIconPath, $eIcnTrain, $x + 210, $y + 2, 16, 16)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Attack - Attack Scripted", "IconApply_Info_01", "Apply Settings of troop, spell, redline, dropline, and request"))
			GUICtrlSetOnEvent(-1, "ApplyScriptDB")

	; CSV Downloder - Persian MOD (-#32)
	$y +=25
		_GUICtrlCreateIcon($g_sLibIconPath, $eIcnCSVDownloader, $x + 210, $y + 2, 16, 16)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Attack - Attack Scripted", "IconCSVDownloader_Info_01", "Download Scripts From url"))
			GUICtrlSetOnEvent(-1, "CSVDownloader")

		; CSV Deploy Speed - Persian MOD (#-09)
		Local $Group = GUICtrlCreateGroup("", $x, $y + 164, 230, 38)
		Local $x = 55, $y = 318
		GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design Child Attack - Attack Scripted", "CSVSpeed", "CSV Deployment Speed"), $x - 5, $y - 4, -1, -1)
			$cmbCSVSpeed[$DB] = GUICtrlCreateCombo("", $x + 122, $y - 8, 53, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			GUICtrlSetData(-1, "0.5x|0.75x|1x|1.25x|1.5x|2x|3x|4x|5x", "1x")

	GUICtrlCreateGroup("", -99, -99, 1, 1)

	;------------------------------------------------------------------------------------------
	;----- populate list of script and assign the default value if no exist profile -----------
	UpdateComboScriptNameDB()
	Local $tempindex = _GUICtrlComboBox_FindStringExact($g_hCmbScriptNameDB, $g_sAttackScrScriptName[$DB])
	If $tempindex = -1 Then $tempindex = 0
	_GUICtrlComboBox_SetCurSel($g_hCmbScriptNameDB, $tempindex)
	;------------------------------------------------------------------------------------------

EndFunc   ;==>CreateAttackSearchDeadBaseScripted
