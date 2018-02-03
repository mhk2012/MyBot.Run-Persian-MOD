; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Control Donate
; Description ...: This file Includes all functions to current GUI
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: MyBot.run team
; Modified ......: MonkeyHunter (07-2016), CodeSlinger69 (2017)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2018
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
#include-once

#Region

Global $g_aiDonIcons[20] = [$eIcnDonBarbarian, $eIcnDonArcher, $eIcnDonGiant, $eIcnDonGoblin, $eIcnDonWallBreaker, $eIcnDonBalloon, $eIcnDonWizard, $eIcnDonHealer, _
		$eIcnDonDragon, $eIcnDonPekka, $eIcnDonBabyDragon, $eIcnDonMiner, $eIcnDonMinion, $eIcnDonHogRider, $eIcnDonValkyrie, $eIcnDonGolem, _
		$eIcnDonWitch, $eIcnDonLavaHound, $eIcnDonBowler, $eIcnDonBlank]

Func btnDonateTroop()
	For $i = 0 To $eTroopCount - 1 + $g_iCustomDonateConfigs
		If @GUI_CtrlId = $g_ahBtnDonateTroop[$i] Then
			If GUICtrlGetState($g_ahGrpDonateTroop[$i]) = BitOR($GUI_HIDE, $GUI_ENABLE) Then
				_DonateBtn($g_ahGrpDonateTroop[$i], $g_ahTxtBlacklistTroop[$i]) ;Hide/Show controls on Donate tab
			EndIf
			ExitLoop
		EndIf
	Next
EndFunc   ;==>btnDonateTroop

Func btnDonateSpell()
	For $i = 0 To $eSpellCount - 1
		If @GUI_CtrlId = $g_ahBtnDonateSpell[$i] Then
			If GUICtrlGetState($g_ahGrpDonateSpell[$i]) = BitOR($GUI_HIDE, $GUI_ENABLE) Then
				_DonateBtn($g_ahGrpDonateSpell[$i], $g_ahTxtBlacklistSpell[$i])
			EndIf
			ExitLoop
		EndIf
	Next
EndFunc   ;==>btnDonateSpell

Func btnDonateBlacklist()
	If GUICtrlGetState($g_hGrpDonateGeneralBlacklist) = BitOR($GUI_HIDE, $GUI_ENABLE) Then
		_DonateBtn($g_hGrpDonateGeneralBlacklist, $g_hTxtGeneralBlacklist)
	EndIf
EndFunc   ;==>btnDonateBlacklist

; ClanHop - Persian MOD (#-20)
Func btnDonateOptions()
	If GUICtrlGetState($g_hGrpDonateOptions) = BitOR($GUI_HIDE, $GUI_ENABLE) Then
		_DonateBtn($g_hGrpDonateOptions, $g_hChkClanHop)
		_DonateBtn($g_hGrpDonateOptions, $g_ahTxtCheckingtrain)
	EndIf
EndFunc   ;==>btnDonateOptions
; ClanHop - Persian MOD (#-20)
Func ChkClanHop()
	If GUICtrlRead($g_hChkClanHop) = $GUI_CHECKED Then
		GUICtrlSetState($g_ahTxtCheckingtrain, $GUI_ENABLE)
	Else
		GUICtrlSetState($g_ahTxtCheckingtrain, $GUI_DISABLE)
	EndIf
EndFunc   ;==>ChkClanHop

Func chkDonateTroop()
	For $i = 0 To $eTroopCount - 1 + $g_iCustomDonateConfigs
		If @GUI_CtrlId = $g_ahChkDonateTroop[$i] Then
			If GUICtrlRead($g_ahChkDonateTroop[$i]) = $GUI_CHECKED Then
				_DonateControls($i)
			Else
				GUICtrlSetBkColor($g_ahLblDonateTroop[$i], $GUI_BKCOLOR_TRANSPARENT)
			EndIf
		EndIf
	Next
EndFunc   ;==>chkDonateTroop

Func chkDonateAllTroop()
	For $i = 0 To $eTroopCount - 1 + $g_iCustomDonateConfigs
		If @GUI_CtrlId = $g_ahChkDonateAllTroop[$i] Then
			_DonateAllControls($i, GUICtrlRead($g_ahChkDonateAllTroop[$i]) = $GUI_CHECKED ? True : False)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>chkDonateAllTroop

Func chkDonateSpell()
	For $i = 0 To $eSpellCount - 1
		If @GUI_CtrlId = $g_ahChkDonateSpell[$i] Then
			If GUICtrlRead($g_ahChkDonateSpell[$i]) = $GUI_CHECKED Then
				_DonateControlsSpell($i)
			Else
				GUICtrlSetBkColor($g_ahLblDonateSpell[$i], $GUI_BKCOLOR_TRANSPARENT)
			EndIf
		EndIf
	Next
EndFunc   ;==>chkDonateSpell

Func chkDonateAllSpell()
	For $i = 0 To $eSpellCount - 1
		If @GUI_CtrlId = $g_ahChkDonateAllSpell[$i] Then
			_DonateAllControlsSpell($i, GUICtrlRead($g_ahChkDonateAllSpell[$i]) = $GUI_CHECKED ? True : False)
			ExitLoop
		EndIf
	Next
EndFunc   ;==>chkDonateAllSpell

Func cmbDonateCustomA()
	Local $combo1 = _GUICtrlComboBox_GetCurSel($g_ahCmbDonateCustomA[0])
	Local $combo2 = _GUICtrlComboBox_GetCurSel($g_ahCmbDonateCustomA[1])
	Local $combo3 = _GUICtrlComboBox_GetCurSel($g_ahCmbDonateCustomA[2])
	_GUICtrlSetImage($g_ahPicDonateCustomA[0], $g_sLibIconPath, $g_aiDonIcons[$combo1])
	_GUICtrlSetImage($g_ahPicDonateCustomA[1], $g_sLibIconPath, $g_aiDonIcons[$combo2])
	_GUICtrlSetImage($g_ahPicDonateCustomA[2], $g_sLibIconPath, $g_aiDonIcons[$combo3])
EndFunc   ;==>cmbDonateCustomA

Func cmbDonateCustomB()
	Local $combo1 = _GUICtrlComboBox_GetCurSel($g_ahCmbDonateCustomB[0])
	Local $combo2 = _GUICtrlComboBox_GetCurSel($g_ahCmbDonateCustomB[1])
	Local $combo3 = _GUICtrlComboBox_GetCurSel($g_ahCmbDonateCustomB[2])
	_GUICtrlSetImage($g_ahPicDonateCustomB[0], $g_sLibIconPath, $g_aiDonIcons[$combo1])
	_GUICtrlSetImage($g_ahPicDonateCustomB[1], $g_sLibIconPath, $g_aiDonIcons[$combo2])
	_GUICtrlSetImage($g_ahPicDonateCustomB[2], $g_sLibIconPath, $g_aiDonIcons[$combo3])
EndFunc   ;==>cmbDonateCustomB

; Additional Custom Donate - Persian MOD (#-28)
Func cmbDonateCustomC()
	Local $combo1 = _GUICtrlComboBox_GetCurSel($g_ahCmbDonateCustomC[0])
	Local $combo2 = _GUICtrlComboBox_GetCurSel($g_ahCmbDonateCustomC[1])
	Local $combo3 = _GUICtrlComboBox_GetCurSel($g_ahCmbDonateCustomC[2])
	_GUICtrlSetImage($g_ahPicDonateCustomC[0], $g_sLibIconPath, $g_aiDonIcons[$combo1])
	_GUICtrlSetImage($g_ahPicDonateCustomC[1], $g_sLibIconPath, $g_aiDonIcons[$combo2])
	_GUICtrlSetImage($g_ahPicDonateCustomC[2], $g_sLibIconPath, $g_aiDonIcons[$combo3])
EndFunc   ;==>cmbDonateCustomC

Func cmbDonateCustomD()
	Local $combo1 = _GUICtrlComboBox_GetCurSel($g_ahCmbDonateCustomD[0])
	Local $combo2 = _GUICtrlComboBox_GetCurSel($g_ahCmbDonateCustomD[1])
	Local $combo3 = _GUICtrlComboBox_GetCurSel($g_ahCmbDonateCustomD[2])
	_GUICtrlSetImage($g_ahPicDonateCustomD[0], $g_sLibIconPath, $g_aiDonIcons[$combo1])
	_GUICtrlSetImage($g_ahPicDonateCustomD[1], $g_sLibIconPath, $g_aiDonIcons[$combo2])
	_GUICtrlSetImage($g_ahPicDonateCustomD[2], $g_sLibIconPath, $g_aiDonIcons[$combo3])
EndFunc   ;==>cmbDonateCustomD

Func _DonateBtn($hFirstControl, $hLastControl)
	Static $hLastDonateBtn1 = -1, $hLastDonateBtn2 = -1

	; Hide Controls
	If $hLastDonateBtn1 = -1 Then
		For $i = $g_ahGrpDonateTroop[$eTroopBarbarian] To $g_ahTxtBlacklistTroop[$eTroopBarbarian] ; 1st time use: Hide Barbarian controls
			GUICtrlSetState($i, $GUI_HIDE)
		Next
	Else
		For $i = $hLastDonateBtn1 To $hLastDonateBtn2 ; Hide last used controls on Donate Tab
			GUICtrlSetState($i, $GUI_HIDE)
		Next
	EndIf

	$hLastDonateBtn1 = $hFirstControl
	$hLastDonateBtn2 = $hLastControl

	;Show Controls
	For $i = $hFirstControl To $hLastControl ; Show these controls on Donate Tab
		GUICtrlSetState($i, $GUI_SHOW)
	Next
EndFunc   ;==>_DonateBtn

Func _DonateControls($iTroopIndex)
	Local $bWasRedraw = SetRedrawBotWindow(False, Default, Default, Default, "_DonateControls")

	For $i = 0 To $eTroopCount - 1 + $g_iCustomDonateConfigs
		If $i = $iTroopIndex Then
			GUICtrlSetBkColor($g_ahLblDonateTroop[$i], $COLOR_ORANGE)
		Else
			If GUICtrlGetBkColor($g_ahLblDonateTroop[$i]) = $COLOR_NAVY Then GUICtrlSetBkColor($g_ahLblDonateTroop[$i], $GUI_BKCOLOR_TRANSPARENT)
		EndIf

		GUICtrlSetState($g_ahChkDonateAllTroop[$i], $GUI_UNCHECKED)
		If BitAND(GUICtrlGetState($g_ahTxtDonateTroop[$i]), $GUI_DISABLE) = $GUI_DISABLE Then GUICtrlSetState($g_ahTxtDonateTroop[$i], $GUI_ENABLE)
		If BitAND(GUICtrlGetState($g_ahTxtBlacklistTroop[$i]), $GUI_DISABLE) = $GUI_DISABLE Then GUICtrlSetState($g_ahTxtBlacklistTroop[$i], $GUI_ENABLE)
	Next
	SetRedrawBotWindowControls($bWasRedraw, $g_hGUI_DONATE_TAB, "_DonateControls") ; cannot use tab item here
EndFunc   ;==>_DonateControls

Func _DonateAllControls($iTroopIndex, $Set)
	Local $bWasRedraw = SetRedrawBotWindow(False, Default, Default, Default, "_DonateAllControls")

	If $Set = True Then
		For $i = 0 To $eTroopCount - 1 + $g_iCustomDonateConfigs
			GUICtrlSetBkColor($g_ahLblDonateTroop[$i], $i = $iTroopIndex ? $COLOR_NAVY : $GUI_BKCOLOR_TRANSPARENT)

			If $i <> $iTroopIndex Then
				GUICtrlSetState($g_ahChkDonateAllTroop[$i], $GUI_UNCHECKED)
			EndIf

			GUICtrlSetState($g_ahChkDonateTroop[$i], $GUI_UNCHECKED)
			If BitAND(GUICtrlGetState($g_ahTxtDonateTroop[$i]), $GUI_ENABLE) = $GUI_ENABLE Then GUICtrlSetState($g_ahTxtDonateTroop[$i], $GUI_DISABLE)
			If BitAND(GUICtrlGetState($g_ahTxtBlacklistTroop[$i]), $GUI_ENABLE) = $GUI_ENABLE Then GUICtrlSetState($g_ahTxtBlacklistTroop[$i], $GUI_DISABLE)
		Next

		If BitAND(GUICtrlGetState($g_hTxtGeneralBlacklist), $GUI_ENABLE) = $GUI_ENABLE Then GUICtrlSetState($g_hTxtGeneralBlacklist, $GUI_DISABLE)
	Else
		GUICtrlSetBkColor($g_ahLblDonateTroop[$iTroopIndex], $GUI_BKCOLOR_TRANSPARENT)

		For $i = 0 To $eTroopCount - 1
			If BitAND(GUICtrlGetState($g_ahTxtDonateTroop[$i]), $GUI_DISABLE) = $GUI_DISABLE Then GUICtrlSetState($g_ahTxtDonateTroop[$i], $GUI_ENABLE)
			If BitAND(GUICtrlGetState($g_ahTxtBlacklistTroop[$i]), $GUI_DISABLE) = $GUI_DISABLE Then GUICtrlSetState($g_ahTxtBlacklistTroop[$i], $GUI_ENABLE)
		Next

		If BitAND(GUICtrlGetState($g_hTxtGeneralBlacklist), $GUI_DISABLE) = $GUI_DISABLE Then GUICtrlSetState($g_hTxtGeneralBlacklist, $GUI_ENABLE)
	EndIf

	SetRedrawBotWindowControls($bWasRedraw, $g_hGUI_DONATE_TAB, "_DonateAllControls") ; cannot use tab item here
EndFunc   ;==>_DonateAllControls

Func _DonateControlsSpell($iSpellIndex)
	For $i = 0 To $eSpellCount - 1
		If $i = $iSpellIndex Then
			GUICtrlSetBkColor($g_ahLblDonateSpell[$i], $COLOR_ORANGE)
		Else
			If GUICtrlGetBkColor($g_ahLblDonateSpell[$i]) = $COLOR_NAVY Then GUICtrlSetBkColor($g_ahLblDonateSpell[$i], $GUI_BKCOLOR_TRANSPARENT)
		EndIf

		GUICtrlSetState($g_ahChkDonateAllSpell[$i], $GUI_UNCHECKED)
		If BitAND(GUICtrlGetState($g_ahTxtDonateSpell[$i]), $GUI_DISABLE) = $GUI_DISABLE Then GUICtrlSetState($g_ahTxtDonateSpell[$i], $GUI_ENABLE)
		If BitAND(GUICtrlGetState($g_ahTxtBlacklistSpell[$i]), $GUI_DISABLE) = $GUI_DISABLE Then GUICtrlSetState($g_ahTxtBlacklistSpell[$i], $GUI_ENABLE)
	Next
EndFunc   ;==>_DonateControlsSpell

Func _DonateAllControlsSpell($iSpellIndex, $Set)
	Local $bWasRedraw = SetRedrawBotWindow(False, Default, Default, Default, "_DonateAllControlsSpell")

	If $Set = True Then
		For $i = 0 To $eSpellCount - 1
			If $i = $iSpellIndex Then
				GUICtrlSetBkColor($g_ahLblDonateSpell[$i], $COLOR_NAVY)
			Else
				GUICtrlSetBkColor($g_ahLblDonateSpell[$i], $GUI_BKCOLOR_TRANSPARENT)
			EndIf

			If $i <> $iSpellIndex Then GUICtrlSetState($g_ahChkDonateAllSpell[$i], $GUI_UNCHECKED)

			GUICtrlSetState($g_ahChkDonateSpell[$i], $GUI_UNCHECKED)
			If BitAND(GUICtrlGetState($g_ahTxtDonateSpell[$i]), $GUI_ENABLE) = $GUI_ENABLE Then GUICtrlSetState($g_ahTxtDonateSpell[$i], $GUI_DISABLE)
			If BitAND(GUICtrlGetState($g_ahTxtBlacklistSpell[$i]), $GUI_ENABLE) = $GUI_ENABLE Then GUICtrlSetState($g_ahTxtBlacklistSpell[$i], $GUI_DISABLE)
		Next

		If BitAND(GUICtrlGetState($g_hTxtGeneralBlacklist), $GUI_ENABLE) = $GUI_ENABLE Then GUICtrlSetState($g_hTxtGeneralBlacklist, $GUI_DISABLE)
	Else
		GUICtrlSetBkColor($g_ahLblDonateSpell[$iSpellIndex], $GUI_BKCOLOR_TRANSPARENT)

		For $i = 0 To $eSpellCount - 1
			If BitAND(GUICtrlGetState($g_ahTxtDonateSpell[$i]), $GUI_DISABLE) = $GUI_DISABLE Then GUICtrlSetState($g_ahTxtDonateSpell[$i], $GUI_ENABLE)
			If BitAND(GUICtrlGetState($g_ahTxtBlacklistSpell[$i]), $GUI_DISABLE) = $GUI_DISABLE Then GUICtrlSetState($g_ahTxtBlacklistSpell[$i], $GUI_ENABLE)
		Next

		If BitAND(GUICtrlGetState($g_hTxtGeneralBlacklist), $GUI_DISABLE) = $GUI_DISABLE Then GUICtrlSetState($g_hTxtGeneralBlacklist, $GUI_ENABLE)
	EndIf

	SetRedrawBotWindowControls($bWasRedraw, $g_hGUI_DONATE_TAB, "_DonateAllControlsSpell") ; cannot use tab item here
EndFunc   ;==>_DonateAllControlsSpell

Func btnFilterDonationsCC()
	SetLog("open folder " & $g_sProfileDonateCapturePath, $COLOR_AQUA)
	ShellExecute("explorer", $g_sProfileDonateCapturePath)
EndFunc   ;==>btnFilterDonationsCC

Func chkskipDonateNearFulLTroopsEnable()
	If GUICtrlRead($g_hChkSkipDonateNearFullTroopsEnable) = $GUI_CHECKED Then
		GUICtrlSetState($g_hTxtSkipDonateNearFullTroopsPercentage, $GUI_ENABLE)
		GUICtrlSetState($g_hLblSkipDonateNearFullTroopsText, $GUI_ENABLE)
		GUICtrlSetState($g_hLblSkipDonateNearFullTroopsText1, $GUI_ENABLE)
	Else
		GUICtrlSetState($g_hTxtSkipDonateNearFullTroopsPercentage, $GUI_DISABLE)
		GUICtrlSetState($g_hLblSkipDonateNearFullTroopsText, $GUI_DISABLE)
		GUICtrlSetState($g_hLblSkipDonateNearFullTroopsText1, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkskipDonateNearFulLTroopsEnable

Func chkBalanceDR()
	If GUICtrlRead($g_hChkUseCCBalanced) = $GUI_CHECKED Then
		GUICtrlSetState($g_hCmbCCDonated, $GUI_ENABLE)
		GUICtrlSetState($g_hCmbCCReceived, $GUI_ENABLE)
	Else
		GUICtrlSetState($g_hCmbCCDonated, $GUI_DISABLE)
		GUICtrlSetState($g_hCmbCCReceived, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkBalanceDR

Func cmbBalanceDR()
	If _GUICtrlComboBox_GetCurSel($g_hCmbCCDonated) = _GUICtrlComboBox_GetCurSel($g_hCmbCCReceived) Then
		_GUICtrlComboBox_SetCurSel($g_hCmbCCDonated, 0)
		_GUICtrlComboBox_SetCurSel($g_hCmbCCReceived, 0)
	EndIf
EndFunc   ;==>cmbBalanceDR

Func Doncheck()
	tabDONATE() ; just call tabDONATE()
EndFunc   ;==>Doncheck

#EndRegion

; GTFO - Persian MOD (#-31)
Global $GtfoIdleTime = 0, $bSetTrophies = 0, $aUpdateTrophies = 0, $GtfoDonationCap = 0, $GtfoMassKickMode = 0, $GtfoReceiveCap = 0, $GtfoModStatus = 0, $ChatIdleDelay = 0, $GtfoTrainCount = 0, _
		$GtfoTroopTrainCount = 0, $GtfoSpellBrewCount = 0, $GtfoSpellType = 0, $FirstStart = 0, $g_iDonTroopsLimit = 0, $iDonSpellsLimit = 0, $g_iDonTroopsAv = 0, $g_iDonSpellsAv = 0, _
		$g_iDonTroopsQuantityAv = 0, $g_bSkipDonTroops = 0, $g_bSkipDonSpells = 0, $g_aiDonatePixel = 0, $g_iTotalDonateCapacity = 0, $g_iTotalDonateSpellCapacity = 0, $g_iDebugSetlog = 0, _
		$DonateCount = 0, $chatString = 0, $DonationWindowY = 0, $g_iDonTroopsQuantity = 0, $g_iDonSpellsQuantityAv = 0, $currClanTrophies = 0, $x_start = 0, $y_start = 0, $GemResult = 0, $GTFO = False
Global Enum $GtfoIdle, $GtfoStart, $GtfoPause, $GtfoResume, $GtfoStop

; GTFO - Persian MOD (#-31)
Func __WinAPI_GetBkColor($hWnd)
	; Not Prog@ndy
	Local $aResult, $hDC, $Res
	If Not IsHWnd($hWnd) Then $hWnd = ControlGetHandle("", "", $hWnd)
	$hDC = _WinAPI_GetDC($hWnd)
	$aResult = DllCall("GDI32.dll", "int", "GetBkColor", "hwnd", $hDC)
;~         ConsoleWrite("Hex($aResult[0], 6) = " & Hex($aResult[0], 6) & @CRLF)
	$Res = "0x" & StringRegExpReplace(Hex($aResult[0], 6), "(.{2})(.{2})(.{2})", "\3\2\1")
	_WinAPI_ReleaseDC($hWnd, $hDC)
	Return $Res
EndFunc   ;==>__WinAPI_GetBkColor

Func GtfoHelp()
	ShellExecute("https://mybot.run/forums/index.php?/profile/43550-mediahub/")
EndFunc   ;==>GtfoHelp

Func GtfoAutoChat()
	If GUICtrlRead($chkChatStatus) = $GUI_UNCHECKED Then
		If GUICtrlRead($chkGtfoChatAuto) = $GUI_CHECKED Then
			GUICtrlSetState($chkGtfoChatRandom, $GUI_ENABLE)
;~ 			GUICtrlSetState($btnGtfoChatAdd, $GUI_ENABLE)
;~ 			GUICtrlSetState($btnGtfoChatRemove, $GUI_ENABLE)
;~ 			GUICtrlSetState($lstGtfoChatTemplates, $GUI_ENABLE)
			GUICtrlSetState($btnGtfoSendChat, $GUI_ENABLE)
		Else
;~ 			GUICtrlSetState($chkGtfoChatRandom, $GUI_UNCHECKED)
			GUICtrlSetState($chkGtfoChatRandom, $GUI_DISABLE)
;~ 			GUICtrlSetState($btnGtfoChatAdd, $GUI_DISABLE)
;~ 			GUICtrlSetState($btnGtfoChatRemove, $GUI_DISABLE)
;~ 			GUICtrlSetState($lstGtfoChatTemplates, $GUI_DISABLE)
			GUICtrlSetState($btnGtfoSendChat, $GUI_ENABLE)
		EndIf
	Else
		GUICtrlSetState($chkGtfoChatAuto, $GUI_UNCHECKED)
		GUICtrlSetState($chkGtfoChatRandom, $GUI_DISABLE)
		SetLog("Chat: Previous chat message is in queue.")
	EndIf
EndFunc   ;==>GtfoAutoChat

Func GtfoRandomChat()

	If GUICtrlRead($chkGtfoChatRandom) = $GUI_CHECKED Then
;~ 		GUICtrlSetState($btnGtfoChatAdd, $GUI_DISABLE)
;~ 		GUICtrlSetState($btnGtfoChatRemove, $GUI_DISABLE)
		GUICtrlSetState($lstGtfoChatTemplates, $GUI_DISABLE)
		GUICtrlSetState($btnGtfoSendChat, $GUI_DISABLE)
	Else
;~ 		GUICtrlSetState($btnGtfoChatAdd, $GUI_ENABLE)
;~ 		GUICtrlSetState($btnGtfoChatRemove, $GUI_ENABLE)
		GUICtrlSetState($lstGtfoChatTemplates, $GUI_ENABLE)
		GUICtrlSetState($btnGtfoSendChat, $GUI_ENABLE)
	EndIf
EndFunc   ;==>GtfoRandomChat

Func GtfoTemplate_DoubleClick()

	GUICtrlSetData($txtGtfoChat, GUICtrlRead($lstGtfoChatTemplates))
	Local $CurSel = _GUICtrlListBox_GetCurSel($lstGtfoChatTemplates)
	Local $aItems = _GUICtrlListBox_GetSelItems($lstGtfoChatTemplates)
	For $iI = $aItems[0] To 1 Step -1
		_GUICtrlListBox_ClickItem($lstGtfoChatTemplates, $aItems[$iI])
	Next
	_GUICtrlListBox_ClickItem($lstGtfoChatTemplates, $CurSel)

EndFunc   ;==>GtfoTemplate_DoubleClick

Func GtfoAddToTemplate()
	Local $ChatTxt = StringStripWS(GUICtrlRead($txtGtfoChat), 7)
	If $ChatTxt <> "" Then
		GUICtrlSetData($lstGtfoChatTemplates, $ChatTxt & "|")

		_GUICtrlListBox_UpdateHScroll($lstGtfoChatTemplates)
	EndIf
	Local $iCnt = _GUICtrlListBox_GetCount($lstGtfoChatTemplates)
	Local $sMsg = ""
	For $n = 0 To $iCnt - 1
		$sMsg &= _GUICtrlListBox_GetText($lstGtfoChatTemplates, $n)
		If $n <> $iCnt - 1 Then $sMsg &= "|"
	Next
	IniWrite($g_sProfileConfigPath, "GTFO", "ChatTemplates", $sMsg)
	GUICtrlSetData($txtGtfoChat, "")
	GUICtrlSetState($txtGtfoChat, $GUI_FOCUS)

EndFunc   ;==>GtfoAddToTemplate

Func GtfoRemoveFromTemplate()

	Local $SelectionCount = _GUICtrlListBox_GetSelCount($lstGtfoChatTemplates)
	If $SelectionCount > 0 Then
		Local $aItems = _GUICtrlListBox_GetSelItems($lstGtfoChatTemplates)
		For $iI = $aItems[0] To 1 Step -1
			_GUICtrlListBox_DeleteString($lstGtfoChatTemplates, $aItems[$iI])
		Next
	EndIf

	Local $iCnt = _GUICtrlListBox_GetCount($lstGtfoChatTemplates)
	Local $sMsg = ""
	For $n = 0 To $iCnt - 1
		$sMsg &= _GUICtrlListBox_GetText($lstGtfoChatTemplates, $n)
		If $n <> $iCnt - 1 Then $sMsg &= "|"
	Next
	IniWrite($g_sProfileConfigPath, "GTFO", "ChatTemplates", $sMsg)

	GUICtrlSetState($txtGtfoChat, $GUI_FOCUS)

EndFunc   ;==>GtfoRemoveFromTemplate

Func GtfoSetIdleTime()

	GUICtrlSetData($txtGtfoIdleTime, GUICtrlRead($SliderGtfoIdleTime) & " s")
	$GtfoIdleTime = Number(GUICtrlRead($SliderGtfoIdleTime))

EndFunc   ;==>GtfoSetIdleTime

Func GtfoSetKickNote()

	If GUICtrlRead($chkGtfoNote) = $GUI_CHECKED Then
		GUICtrlSetState($txtGtfoNote, $GUI_ENABLE)
	Else
		GUICtrlSetState($txtGtfoNote, $GUI_DISABLE)
	EndIf

EndFunc   ;==>GtfoSetKickNote

Func SetTrophies()

	If GUICtrlRead($chkSetTrophies) = $GUI_CHECKED Then
		GUICtrlSetState($cmbGtfoTrophies, $GUI_ENABLE)
		UpdateTrophies()
		$bSetTrophies = True
	Else
		GUICtrlSetState($cmbGtfoTrophies, $GUI_DISABLE)
		$bSetTrophies = False
	EndIf

EndFunc   ;==>SetTrophies

Func UpdateTrophies()

	$aUpdateTrophies = GUICtrlRead($cmbGtfoTrophies)

EndFunc   ;==>UpdateTrophies

Func GtfoSendChat()

	Local $ChatTxt = StringStripWS(GUICtrlRead($txtGtfoChat), 7)
	GUICtrlSetData($txtGtfoChat, $ChatTxt)
	If $ChatTxt <> "" Then
		GUICtrlSetState($chkChatStatus, $GUI_CHECKED)
		GUICtrlSetState($txtGtfoChat, $GUI_DISABLE)
		GUICtrlSetState($btnGtfoSendChat, $GUI_DISABLE)
	EndIf
	If $g_iBotAction <> $eBotStart Or $g_bRunState <> $eBotSearchMode Or $g_bRunState <> $eBotClose Or $g_bRunState <> True Then
		doChat()
	EndIf

EndFunc   ;==>GtfoSendChat

Func DonationCap()
	$GtfoDonationCap = Number(GUICtrlRead($cmbGtfoDonationCap))
EndFunc   ;==>DonationCap

Func MassKick()
	If GUICtrlRead($chkMassKick) = $GUI_CHECKED Then
		$GtfoMassKickMode = True
	Else
		$GtfoMassKickMode = False
	EndIf
EndFunc   ;==>MassKick

Func KickCap()
	$GtfoReceiveCap = Number(GUICtrlRead($cmbGtfoKickCap))
EndFunc   ;==>KickCap

Func GtfoIdle()
	Local $diTimer = 0, $diDiff = 0, $dsString = ""
	Local $sPauseMsgCount = 1
	While ($GtfoModStatus = $GtfoPause Or $GtfoModStatus = $GtfoResume) And $GtfoModStatus <> $GtfoStop
		If $sPauseMsgCount = 1 Then
			$diTimer = TimerInit()
			SetLog("  >>>>>  GTFO  PAUSED  <<<<<  ", $COLOR_WARNING)
		EndIf
		$sPauseMsgCount += 1
		$diDiff = TimerDiff($diTimer)
		_TicksToTime($diDiff, $GtfoHours, $GtfoMins, $GtfoSecs)
		If $GtfoHours = 0 Then
			$dsString = StringFormat("%02u:%02u", $GtfoMins, $GtfoSecs)
		Else
			$dsString = StringFormat("%02u:%02u:%02u", $GtfoHours, $GtfoMins, $GtfoSecs)
		EndIf

		_GUICtrlStatusBar_SetText($g_hStatusBar, "     GTFO Paused Since : " & $dsString)
		If _Sleep(100) Then Return
	WEnd
	If $sPauseMsgCount <> 1 Then
		SetLog("  >>>>>  GTFO  RESUMED  <<<<<  ", $COLOR_SUCCESS)
	EndIf

EndFunc   ;==>GtfoIdle

Func IsInGame()


	Local $iCount = 0
	While Not _CheckPixel($aIsGoldBar, True) ; Wait for MainScreen
		$iCount += 1
		If _Sleep(50) Then Return
		;If checkObstacles() Then $iCount += 1
		If $iCount > 25 Then
			ClickP($aCloseChat, 1, 0, "#0168")
			If _Sleep(1000) Then Return
			Click(70, 680) ; return home
			If _Sleep(2000) Then Return
			ClickP($aAway, 1, 0, "#0167")
			ReturnAtHome()
			ForceCaptureRegion()
			If Not _CheckPixel($aChatTab, $g_bCapturePixel) Then
				ClickP($aOpenChat, 1, 0, "#0168")
				If _Sleep(500) Then Return
			EndIf
		EndIf
	WEnd

EndFunc   ;==>IsInGame

Func GtfoActions($Action)

	$GtfoModStatus = $Action

	Switch $GtfoModStatus
		Case $GtfoIdle

		Case $GtfoStart
			GUICtrlSetState($g_hBtnStart, $GUI_DISABLE)
			GUICtrlSetState($g_hBtnSearchMode, $GUI_DISABLE)
			GUICtrlSetState($btnGtfoStart, $GUI_DISABLE)
			GUICtrlSetState($cmbGtfoTroop, $GUI_DISABLE)
			GUICtrlSetState($cmbGtfoSpell, $GUI_DISABLE)
			GUICtrlSetState($btnGtfoPause, $GUI_ENABLE)
			GUICtrlSetState($btnGtfoStop, $GUI_ENABLE)
			GtfoEnableDisable($g_hCmbProfile, $g_hBtnRenameProfile, $GUI_DISABLE)

		Case $GtfoPause
;~ 			GUICtrlSetData($btnGtfoPause,"RESUME")
			GUICtrlSetTip($btnGtfoPause, "RESUME")
			_GUICtrlButton_SetImageList($btnGtfoPause, $bIconResume, 4)
			$GtfoModStatus = $GtfoResume

		Case $GtfoResume
;~ 			GUICtrlSetData($btnGtfoPause,"PAUSE")
			GUICtrlSetTip($btnGtfoPause, "PAUSE")
			_GUICtrlButton_SetImageList($btnGtfoPause, $bIconPause, 4)
			$GtfoModStatus = $GtfoStart

		Case $GtfoStop
			GUICtrlSetState($g_hBtnStart, $GUI_ENABLE)
			GUICtrlSetState($g_hBtnSearchMode, $GUI_ENABLE)
			GUICtrlSetState($btnGtfoStart, $GUI_ENABLE)
			GUICtrlSetState($cmbGtfoTroop, $GUI_ENABLE)
			GUICtrlSetState($cmbGtfoSpell, $GUI_ENABLE)
			GUICtrlSetState($btnGtfoPause, $GUI_DISABLE)
;~ 			GUICtrlSetData($btnGtfoPause,"PAUSE")
			GUICtrlSetTip($btnGtfoPause, "PAUSE")
			_GUICtrlButton_SetImageList($btnGtfoPause, $bIconPause, 4)
			GUICtrlSetState($btnGtfoStop, $GUI_DISABLE)
			GtfoEnableDisable($g_hCmbProfile, $g_hBtnRenameProfile, $GUI_ENABLE)

	EndSwitch

EndFunc   ;==>GtfoActions

Func isImageVisible($sName, $sTile, $sPlace)

	Local $result
	Local $RetunrCoords = ""
	$result = FindImageInPlace($sName, $sTile, $sPlace)
	If $result <> "" Then
		$RetunrCoords = $result
		Return $RetunrCoords
	Else
		Return $RetunrCoords
	EndIf

EndFunc   ;==>isImageVisible

Func GtfoEnableDisable($iFrom, $iTo, $iState)
	For $i = $iFrom To $iTo
		GUICtrlSetState($i, $iState)
	Next
EndFunc   ;==>GtfoEnableDisable

Func GtfoSetChatIdleTime()
	$ChatIdleDelay = Number(GUICtrlRead($cmbGtfoChatIdleDelay), 0)
EndFunc   ;==>GtfoSetChatIdleTime

Func GtfoLoadSettings()

	If IniRead($g_sProfileConfigPath, "GTFO", "GTFOcheck", 0) = 0 Then
		GUICtrlSetState($GTFOcheck, $GUI_UNCHECKED)
	Else
		GUICtrlSetState($GTFOcheck, $GUI_CHECKED)
	EndIf
	GTFOcheck()
	GUICtrlSetData($cmbGtfo, IniRead($g_sProfileConfigPath, "GTFO", "Kick", "1"))
	If IniRead($g_sProfileConfigPath, "GTFO", "MassDonate", 0) = 0 Then
		GUICtrlSetState($chkMassDonate, $GUI_UNCHECKED)
	Else
		GUICtrlSetState($chkMassDonate, $GUI_CHECKED)
	EndIf
	If IniRead($g_sProfileConfigPath, "GTFO", "KickMode", 0) = 0 Then
		GUICtrlSetState($chkKickMode, $GUI_UNCHECKED)
	Else
		GUICtrlSetState($chkKickMode, $GUI_CHECKED)
	EndIf
;~ 	if IniRead($g_sProfileConfigPath, "GTFO", "ClanOpen", 0 ) = 0 Then
;~ 		GUICtrlSetState($chkClanOpen,$GUI_UNCHECKED)
;~ 	Else
;~ 		GUICtrlSetState($chkClanOpen,$GUI_CHECKED)
;~ 	EndIf
	If IniRead($g_sProfileConfigPath, "GTFO", "WaitForTroops", 0) = 0 Then
		GUICtrlSetState($chkWaitForTroops, $GUI_UNCHECKED)
	Else
		GUICtrlSetState($chkWaitForTroops, $GUI_CHECKED)
	EndIf
	SetTroopIdle()
	If IniRead($g_sProfileConfigPath, "GTFO", "MassKick", 0) = 0 Then
		GUICtrlSetState($chkMassKick, $GUI_UNCHECKED)
	Else
		GUICtrlSetState($chkMassKick, $GUI_CHECKED)
	EndIf
	MassKick()
	If IniRead($g_sProfileConfigPath, "GTFO", "SetTrophies", 0) = 0 Then
		GUICtrlSetState($chkSetTrophies, $GUI_UNCHECKED)
	Else
		GUICtrlSetState($chkSetTrophies, $GUI_CHECKED)
	EndIf
	SetTrophies()


	GUICtrlSetData($cmbFriendRequest, IniRead($g_sProfileConfigPath, "GTFO", "FriendRequest", "Reject All"))
	GUICtrlSetData($cmbGtfoChatIdleDelay, IniRead($g_sProfileConfigPath, "GTFO", "ChatIdleDelay", "15"))
	GtfoSetChatIdleTime()

	GUICtrlSetData($cmbTroopIdleTime, IniRead($g_sProfileConfigPath, "GTFO", "TroopIdleTime", "5"))
	GUICtrlSetData($cmbGtfoTroop, IniRead($g_sProfileConfigPath, "GTFO", "Troop", "Barbarian"))
	GUICtrlSetData($cmbGtfoTroopBoost, IniRead($g_sProfileConfigPath, "GTFO", "TroopBoost", "0"))
	GUICtrlSetData($cmbGtfoSpell, IniRead($g_sProfileConfigPath, "GTFO", "Spell", "None"))
	GUICtrlSetData($cmbGtfoSpellBoost, IniRead($g_sProfileConfigPath, "GTFO", "SpellBoost", "0"))
	GUICtrlSetData($SliderGtfoIdleTime, IniRead($g_sProfileConfigPath, "GTFO", "IdleTime", "15"))
	GUICtrlSetData($cmbGtfoDonationCap, IniRead($g_sProfileConfigPath, "GTFO", "DonationCap", "5"))
	GUICtrlSetData($cmbGtfoKickCap, IniRead($g_sProfileConfigPath, "GTFO", "KickCap", "20"))
	GUICtrlSetData($cmbGtfoTrophies, IniRead($g_sProfileConfigPath, "GTFO", "Trophies", "1200"))

	GtfoSetIdleTime()

	If IniRead($g_sProfileConfigPath, "GTFO", "Note", 0) = 0 Then
		GUICtrlSetState($chkGtfoNote, $GUI_UNCHECKED)
	Else
		GUICtrlSetState($chkGtfoNote, $GUI_CHECKED)
	EndIf
	GtfoSetKickNote()

	GUICtrlSetData($txtGtfoNote, IniRead($g_sProfileConfigPath, "GTFO", "Notes", "Join back later"))
	GUICtrlSetData($txtGtfoChat, IniRead($g_sProfileConfigPath, "GTFO", "Chat", "Hello Clan"))

	_GUICtrlListBox_ResetContent($lstGtfoChatTemplates)
	Local $sMsg = IniRead($g_sProfileConfigPath, "GTFO", "ChatTemplates", "Hello Clan|Members Don" & Chr(39) & "t Donate|Request and leave")
	If $sMsg = "" Then
		$sMsg = "Hello Clan|Members Don" & Chr(39) & "t Donate|Request and leave"
		IniWrite($g_sProfileConfigPath, "GTFO", "ChatTemplates", $sMsg)
	EndIf
	GUICtrlSetData($lstGtfoChatTemplates, $sMsg & "|")


	If IniRead($g_sProfileConfigPath, "GTFO", "ChatAuto", 0) = 0 Then
		GUICtrlSetState($chkGtfoChatAuto, $GUI_UNCHECKED)
	Else
		GUICtrlSetState($chkGtfoChatAuto, $GUI_CHECKED)
	EndIf
	GtfoAutoChat()
	If IniRead($g_sProfileConfigPath, "GTFO", "ChatRandom", 0) = 0 Then
		GUICtrlSetState($chkGtfoChatRandom, $GUI_UNCHECKED)
	Else
		GUICtrlSetState($chkGtfoChatRandom, $GUI_CHECKED)
	EndIf


EndFunc   ;==>GtfoLoadSettings

Func GtfoSaveSettings()

	If GUICtrlRead($GTFOcheck) = $GUI_CHECKED Then
		IniWrite($g_sProfileConfigPath, "GTFO", "GTFOcheck", 1)
	Else
		IniWrite($g_sProfileConfigPath, "GTFO", "GTFOcheck", 0)
	EndIf
	IniWrite($g_sProfileConfigPath, "GTFO", "Kick", GUICtrlRead($cmbGtfo))
	If GUICtrlRead($chkMassDonate) = $GUI_CHECKED Then
		IniWrite($g_sProfileConfigPath, "GTFO", "MassDonate", 1)
	Else
		IniWrite($g_sProfileConfigPath, "GTFO", "MassDonate", 0)
	EndIf
	If GUICtrlRead($chkKickMode) = $GUI_CHECKED Then
		IniWrite($g_sProfileConfigPath, "GTFO", "KickMode", 1)
	Else
		IniWrite($g_sProfileConfigPath, "GTFO", "KickMode", 0)
	EndIf
	If GUICtrlRead($chkMassKick) = $GUI_CHECKED Then
		IniWrite($g_sProfileConfigPath, "GTFO", "MassKick", 1)
	Else
		IniWrite($g_sProfileConfigPath, "GTFO", "MassKick", 0)
	EndIf

;~ 	If GUICtrlRead($chkClanOpen) = $GUI_CHECKED Then
;~ 		IniWrite($g_sProfileConfigPath, "GTFO", "ClanOpen", 1)
;~ 	Else
;~ 		IniWrite($g_sProfileConfigPath, "GTFO", "ClanOpen", 0)
;~ 	EndIf
	If GUICtrlRead($chkWaitForTroops) = $GUI_CHECKED Then
		IniWrite($g_sProfileConfigPath, "GTFO", "WaitForTroops", 1)
	Else
		IniWrite($g_sProfileConfigPath, "GTFO", "WaitForTroops", 0)
	EndIf

	If GUICtrlRead($chkSetTrophies) = $GUI_CHECKED Then
		IniWrite($g_sProfileConfigPath, "GTFO", "SetTrophies", 1)
	Else
		IniWrite($g_sProfileConfigPath, "GTFO", "SetTrophies", 0)
	EndIf
	IniWrite($g_sProfileConfigPath, "GTFO", "TroopIdleTime", GUICtrlRead($cmbTroopIdleTime))
	SetTroopIdle()

	IniWrite($g_sProfileConfigPath, "GTFO", "FriendRequest", GUICtrlRead($cmbFriendRequest))
	IniWrite($g_sProfileConfigPath, "GTFO", "ChatIdleDelay", GUICtrlRead($cmbGtfoChatIdleDelay))

	IniWrite($g_sProfileConfigPath, "GTFO", "Troop", GUICtrlRead($cmbGtfoTroop))
	IniWrite($g_sProfileConfigPath, "GTFO", "TroopBoost", GUICtrlRead($cmbGtfoTroopBoost))
	IniWrite($g_sProfileConfigPath, "GTFO", "Spell", GUICtrlRead($cmbGtfoSpell))
	IniWrite($g_sProfileConfigPath, "GTFO", "SpellBoost", GUICtrlRead($cmbGtfoSpellBoost))
	IniWrite($g_sProfileConfigPath, "GTFO", "DonationCap", GUICtrlRead($cmbGtfoDonationCap))
	IniWrite($g_sProfileConfigPath, "GTFO", "KickCap", GUICtrlRead($cmbGtfoKickCap))
	IniWrite($g_sProfileConfigPath, "GTFO", "Trophies", GUICtrlRead($cmbGtfoTrophies))

	IniWrite($g_sProfileConfigPath, "GTFO", "IdleTime", GUICtrlRead($SliderGtfoIdleTime))

	If GUICtrlRead($chkGtfoNote) = $GUI_CHECKED Then
		IniWrite($g_sProfileConfigPath, "GTFO", "Note", 1)
	Else
		IniWrite($g_sProfileConfigPath, "GTFO", "Note", 0)
	EndIf
	IniWrite($g_sProfileConfigPath, "GTFO", "Notes", GUICtrlRead($txtGtfoNote))
	IniWrite($g_sProfileConfigPath, "GTFO", "Chat", GUICtrlRead($txtGtfoChat))

	Local $iCnt = _GUICtrlListBox_GetCount($lstGtfoChatTemplates)
	Local $sMsg = ""
	For $n = 0 To $iCnt - 1
		$sMsg &= _GUICtrlListBox_GetText($lstGtfoChatTemplates, $n)
		If $n <> $iCnt - 1 Then $sMsg &= "|"
	Next
	IniWrite($g_sProfileConfigPath, "GTFO", "ChatTemplates", $sMsg)

	If GUICtrlRead($chkGtfoChatAuto) = $GUI_CHECKED Then
		IniWrite($g_sProfileConfigPath, "GTFO", "ChatAuto", 1)
	Else
		IniWrite($g_sProfileConfigPath, "GTFO", "ChatAuto", 0)
	EndIf
	If GUICtrlRead($chkGtfoChatRandom) = $GUI_CHECKED Then
		IniWrite($g_sProfileConfigPath, "GTFO", "ChatRandom", 1)
	Else
		IniWrite($g_sProfileConfigPath, "GTFO", "ChatRandom", 0)
	EndIf

EndFunc   ;==>GtfoSaveSettings

Func GTFOPause()

	If $GtfoModStatus = $GtfoStart Then
		GtfoActions($GtfoPause)
	Else
		GtfoActions($GtfoResume)
	EndIf

EndFunc   ;==>GTFOPause

Func GTFOStop()
	FileDelete($g_sProfilePath & "\" & $g_sProfileCurrentName & "\gtfo.log")
	GUICtrlSetState($GTFOcheck, $GUI_ENABLE)
	$GtfoTrainCount = 0
	$GtfoTroopTrainCount = 0
	$GtfoSpellBrewCount = 0
	GtfoActions($GtfoStop)
	$g_iBotAction = $eBotNoAction
	$g_bRunState = False
	_GUICtrlComboBox_SetCurSel($g_hCmbLogDividerOption, 0)
	cmbLog()
	SetLog("  >>>>>  GTFO  STOPPED  <<<<<  ", $COLOR_WARNING)
	$GTFO = False
	GtfoSaveSettings()
EndFunc   ;==>GTFOStop

Func doChat()

	$FirstStart = False
	$g_bRunState = True

	Local $chatString

	If GUICtrlRead($chkChatStatus) = $GUI_CHECKED Then
		AndroidBotStartEvent()
		$chatString = GUICtrlRead($txtGtfoChat)
		If $chatString = "" Then
			GUICtrlSetData($txtGtfoChat, "")
			GUICtrlSetState($chkChatStatus, $GUI_UNCHECKED)
			GUICtrlSetState($btnGtfoSendChat, $GUI_ENABLE)
			GUICtrlSetState($txtGtfoChat, $GUI_ENABLE)
			Return
		EndIf

		ForceCaptureRegion()
		If Not _CheckPixel($aChatTab, $g_bCapturePixel) Then ClickP($aOpenChat, 1, 0, "#0168")
		If _Sleep(1000) Then Return
		Local $iCount = 0
		While 1
			If _ColorCheck(_GetPixelColor(189, 24, True), Hex(0x706C50, 6), 20) Then
				ExitLoop
			EndIf
			If _ColorCheck(_GetPixelColor(189, 24, True), Hex(0x383828, 6), 20) Then
				If _Sleep(150) Then Return
				ClickP($aClanTab, 1, 0, "#0169")
				ExitLoop
			EndIf
			$iCount += 1
			If $iCount >= 25 Then
				ExitLoop
			EndIf
			If _Sleep(150) Then Return
		WEnd

		_Sleep(150)
		Click(275, 700, 1, 0, "#0173")
		_Sleep(150)
		Local $iCount = 0
		While Not ( _ColorCheck(_GetPixelColor(840, 720, True), Hex(0xFFFFFF, 6), 20))
			If _Sleep(150) Then ExitLoop
			$iCount += 1
			If $iCount > 25 Then
				SetLog("  Failed to send Chat Skipping chat Event. Will send Soon.", $COLOR_DEBUG)
				Return
			EndIf
		WEnd

		_Sleep(150)
		Click(275, 700, 1, 0, "0336")

		Local $tClip = ClipGet()
		ClipPut($chatString)
		_Sleep(150)
;~ 		ControlSend($g_hAndroidWindow, "", "", "{CTRLDOWN}a{CTRLUP}{CTRLDOWN}v{CTRLUP}",0)
		ControlSend($g_hAndroidWindow, "", "", $chatString, 0)
		_Sleep(150)
		ClipPut($tClip)

		ForceCaptureRegion()
		If _ColorCheck(_GetPixelColor(840, 720, True), Hex(0xFFFFFF, 6), 20) Then
			Click(840, 720, 1, 0, "#0173")
		EndIf

		GUICtrlSetData($txtGtfoChat, "")
		GUICtrlSetState($chkChatStatus, $GUI_UNCHECKED)
		GUICtrlSetState($btnGtfoSendChat, $GUI_ENABLE)
		GUICtrlSetState($txtGtfoChat, $GUI_ENABLE)
		Return
	Else
		AndroidBotStartEvent()
		If $GtfoModStatus = $GtfoPause Or $GtfoModStatus = $GtfoResume Then
			Return
		EndIf
		Local $iI
		$iI = Random(1, $ChatIdleDelay, 1)
;~ 		$iI = 1
;~ 		Setlog("Random Chat number : " & $iI)
		If $iI = 1 Then
			If GUICtrlRead($chkGtfoChatAuto) = $GUI_CHECKED Then
				Local $iCount = _GUICtrlListBox_GetCount($lstGtfoChatTemplates)
				If $GtfoChatCount >= $iCount Then
					$GtfoChatCount = 0
				EndIf
				If GUICtrlRead($chkGtfoChatRandom) = $GUI_CHECKED Then
					$iI = Random(1, $iCount, 1) - 1
				Else
					$iI = $GtfoChatCount
					$GtfoChatCount += 1
				EndIf
				$chatString = _GUICtrlListBox_GetText($lstGtfoChatTemplates, $iI)

				ForceCaptureRegion()
				If Not _CheckPixel($aChatTab, $g_bCapturePixel) Then ClickP($aOpenChat, 1, 0, "#0168")
				If _Sleep(1000) Then Return
				Local $iCount = 0
				While 1
					If _ColorCheck(_GetPixelColor(189, 24, True), Hex(0x706C50, 6), 20) Then
						ExitLoop
					EndIf
					If _ColorCheck(_GetPixelColor(189, 24, True), Hex(0x383828, 6), 20) Then
						If _Sleep(200) Then Return
						ClickP($aClanTab, 1, 0, "#0169")
						ExitLoop
					EndIf
					$iCount += 1
					If $iCount >= 15 Then
						ExitLoop
					EndIf
					If _Sleep(150) Then Return
				WEnd

				_Sleep(150)
				Click(275, 700, 1, 0, "#0173")
				_Sleep(150)
				Local $iCount = 0
				While Not ( _ColorCheck(_GetPixelColor(840, 720, True), Hex(0xFFFFFF, 6), 20))
					If _Sleep(150) Then ExitLoop
					$iCount += 1
					If $iCount > 15 Then
						SetLog("  Failed to send Chat Skipping chat Event.", $COLOR_DEBUG)
						Return
					EndIf
				WEnd

				_Sleep(150)
				Click(275, 700, 1, 0, "0336")

				Local $tClip = ClipGet()
				ClipPut($chatString)
				_Sleep(150)
;~ 				ControlSend($g_hAndroidWindow, "", "", "{CTRLDOWN}a{CTRLUP}{CTRLDOWN}v{CTRLUP}",0)
				ControlSend($g_hAndroidWindow, "", "", $chatString, 0)
				_Sleep(150)
				ClipPut($tClip)

				ForceCaptureRegion()
				If _ColorCheck(_GetPixelColor(840, 720, True), Hex(0xFFFFFF, 6), 20) Then
					Click(840, 720, 1, 0, "#0173")
				EndIf

				GUICtrlSetData($txtGtfoChat, "")
				GUICtrlSetState($chkChatStatus, $GUI_UNCHECKED)
				GUICtrlSetState($btnGtfoSendChat, $GUI_ENABLE)
				GUICtrlSetState($txtGtfoChat, $GUI_ENABLE)
				Return

			EndIf
		EndIf
	EndIf

EndFunc   ;==>doChat

Func GTFOStart()

	WinGetAndroidHandle()
	_FileCreate($g_sProfilePath & "\" & $g_sProfileCurrentName & "\gtfo.log")
	GtfoSaveSettings()
	SetLog("  >>>>>  GTFO  STARTED  <<<<<  ", $COLOR_WARNING)
	$GTFO = True
	_GUICtrlComboBox_SetCurSel($g_hCmbLogDividerOption, 4)
	cmbLog()
;~ 	$sTimer = TimerInit()
	saveConfig()
	readConfig()
	applyConfig(False)
	ResetVariables("donated")

	$g_iTimePassed = 0
	$g_hTimerSinceStarted = __TimerInit()
	GUICtrlSetData($g_hLblResultRuntime, "00:00:00")
	GUICtrlSetData($g_hLblResultRuntimeNow, "00:00:00")

	GtfoActions($GtfoStart)
	If $g_iBotAction = $eBotStart Or $g_bRunState = $eBotSearchMode Or $g_bRunState = $eBotClose Or $g_bRunState Then
		SetLog("To Start GTFO - Free Man Style Stop / Restart the MyBot and try again")
		GTFOStop()
		Return
	EndIf

	Local $GtfoReceiveCap = Number(GUICtrlRead($cmbGtfoKickCap))
	Local $GtfoDonationCap = Number(GUICtrlRead($cmbGtfoDonationCap))

	Local $GtfoTempSpell = GUICtrlRead($cmbGtfoSpell)
	$GtfoSpellType = -1
	Switch $GtfoTempSpell
		Case "Poison"
			$GtfoSpellType = 29
		Case "Earthquake"
			$GtfoSpellType = 30
		Case "Haste"
			$GtfoSpellType = 31
		Case "Skeleton"
			$GtfoSpellType = 32
	EndSwitch
	Local $GtfoTempTroop = GUICtrlRead($cmbGtfoTroop)
	Local $GtfoTroopType = -1
	Switch $GtfoTempTroop
		Case "Barbarian"
			$GtfoTroopType = 0
		Case "Archer"
			$GtfoTroopType = 1
		Case "Giant"
			$GtfoTroopType = 2
		Case "Ballon"
			$GtfoTroopType = 5
		Case "Wizard"
			$GtfoTroopType = 6
		Case "Minion"
			$GtfoTroopType = 12
	EndSwitch

	$FirstStart = True
	$g_bRunState = True

	_GUICtrlTab_ClickTab($g_hTabMain, 0)
	setredrawbotwindow(True)
	AndroidBotStartEvent()

;~ 	GtfoKICK() ; Test

;~ 525, 292, 40, 16
;~ 	Local $x_start = 525
;~ 	Local $y_start = 292
;~ 	SetLog("coc-v-t" &getOcrAndCapture("coc-v-t", $x_start, $y_start, 75, 20, True))
;~ 	SetLog("coc-bonus"&getOcrAndCapture("coc-bonus", $x_start, $y_start, 75, 20, True))
;~ 	SetLog("coc-t-p"&getOcrAndCapture("coc-t-p", $x_start, $y_start, 75, 20, True))
;~ 	SetLog("coc-u-r"&getOcrAndCapture("coc-u-r", $x_start, $y_start, 75, 20, True))
;~ 	SetLog("coc-loot"&getOcrAndCapture("coc-loot", $x_start, $y_start, 75, 20, True))
;~ 	SetLog("coc-build"&getOcrAndCapture("coc-build", $x_start, $y_start, 75, 20, True))
;~ 	$x_start = 520
;~ 	$y_start = 245
;~ 	SetLog("coc-pbttime"&getOcrAndCapture("coc-pbttime", $x_start, $y_start, 40, 15, True))
;~ 	SetLog("coc-RemainTrain"&getOcrAndCapture("coc-RemainTrain", $x_start, $y_start, 40, 15, True))
;~ 	SetLog("coc-profile"&getOcrAndCapture("coc-profile", $x_start, $y_start, 40, 15, True))
;~ 	SetLog("CurXpOCR-bundle"&getOcrAndCapture("CurXpOCR-bundle", $x_start, $y_start, 40, 15, True))
;~ 	GTFOStop()
;~ 	Return

	checkMainScreen()
	chkShieldStatus(True, True)
	If Not $g_bSearchMode Then
		BotDetectFirstTime()
	EndIf
	Collect()
	VillageReport(True, True)

	_CaptureRegion2()
;~ 	$hClone = _GDIPlus_BitmapCloneArea(_GDIPlus_BitmapCreateFromHBITMAP($g_hHBitmap2), 600, 100, 10, 10, $GDIP_PXF24RGB)
;~ 	_GDIPlus_ImageSaveToFile($hClone, $g_sProfileDonateCapturePath & $sLastkickedFile)
;~ 	_GDIPlus_ImageDispose($hClone)

	Local $tempCounter = 0
	While ($g_aiCurrentLoot[$eLootElixir] = "" Or ($g_aiCurrentLoot[$eLootDarkElixir] = "" And $g_iStatsStartedWith[$eLootElixir] <> "")) And $tempCounter < 5
		$tempCounter += 1
		If _Sleep(100) Then Return
		VillageReport(True, True)
	WEnd
	RequestCC()
	ReArm()
	VillageReport(True, True)
	If Not GtfoTrain() Then Return
	Sleep(250)

	Local $cycleCount, $dTimer, $dDiff, $GtfoTopEnd = 0
	$cycleCount = 0
	$DonateCount = 0

	Local $yPos = 90

	While 1

		IsInGame()
		doChat()
		GtfoIdle()
		If $GtfoModStatus = $GtfoStop Then Return

		Local $bOpen = True, $bClose = False
		$g_iActiveDonate = True
		$g_iDonTroopsLimit = $GtfoDonationCap
		$iDonSpellsLimit = 1
		$g_iDonTroopsAv = 0
		$g_iDonSpellsAv = 0
		$g_iDonTroopsQuantityAv = 0
		$g_iDonTroopsQuantity = 0
		$g_iDonSpellsQuantityAv = 0
		$g_iDonSpellsQuantityAv = 0
		$g_bSkipDonTroops = False
		$g_bSkipDonSpells = False


		If $DonateCount >= 25 Then
			$DonateCount = 0
			ClickP($aCloseChat, 1, 0, "#0168")
			If _Sleep(500) Then Return
			ClickP($aAway, 1, 0, "#0167")
			checkMainScreen()
			checkAttackDisable($g_iTaBChkIdle)
			If Not GtfoTrain() Then Return
			chkShieldStatus(True, True)
			ClickP($aOpenChat, 1, 0, "#0168")
			If _Sleep(1000) Then Return
			GTFOKICK()
			$dTimer = TimerInit()
		EndIf
		If Mod($cycleCount, 500) = 0 Then
			ClickP($aCloseChat, 1, 0, "#0168")
			ClickP($aAway, 1, 0, "#0167")
			If _Sleep(1000) Then Return
			checkMainScreen()
			ZoomOut()
			Collect()
			VillageReport(True, True)
			$tempCounter = 0
			While ($g_aiCurrentLoot[$eLootElixir] = "" Or ($g_aiCurrentLoot[$eLootDarkElixir] = "" And $g_iStatsStartedWith[$eLootElixir] <> "")) And $tempCounter < 5
				$tempCounter += 1
				If _Sleep(100) Then Return
				VillageReport(True, True)
			WEnd
			ReArm()
			VillageReport(True, True)
			RequestCC()
			ClickP($aOpenChat, 1, 0, "#0168")
			If _Sleep(200) Then Return
		EndIf
		If $cycleCount = 0 Then
			$dTimer = TimerInit()
		EndIf
		$cycleCount = $cycleCount + 1

		;Opens clan tab and verbose in log
		ClickP($aAway, 1, 0, "#0167")

		If $GtfoTopEnd = 0 Then
			$yPos = 90
			$GtfoTopEnd = -1
		EndIf

		ForceCaptureRegion()
		If Not _CheckPixel($aChatTab, $g_bCapturePixel) Then
			ClickP($aOpenChat, 1, 0, "#0168")
			If _Sleep(500) Then Return
		EndIf

		Local $iCount = 0
		While 1
			If _ColorCheck(_GetPixelColor(189, 24, True), Hex(0x706C50, 6), 20) Then
				ExitLoop
			EndIf
			If _ColorCheck(_GetPixelColor(189, 24, True), Hex(0x383828, 6), 20) Then
				If _Sleep(100) Then Return
				ClickP($aClanTab, 1, 0, "#0169")
				ExitLoop
			EndIf
			$iCount += 1
			If $iCount >= 10 Then
				ContinueLoop 2
			EndIf
			If _Sleep(150) Then Return
		WEnd
;~ 		ClickP($aClanTab, 1, 0, "#0169")
		Local $Scroll

		checkAttackDisable($g_iTaBChkIdle)

		While ($g_iActiveDonate And $DonateCount < 25) And (Not $GtfoMassKickMode)
			If $GtfoModStatus = $GtfoStop Then Return
			IsInGame()
			GtfoIdle()
			If _Sleep(100) Then ExitLoop
			ForceCaptureRegion()

			$g_aiDonatePixel = _MultiPixelSearch(200, $yPos, 230, 660 + $g_iBottomOffsetY, -2, 1, Hex(0x6da725, 6), $aChatDonateBtnColors, 20)
			If IsArray($g_aiDonatePixel) Then
;~ 				If $g_bDebugSetlog Then SetLog("$g_aiDonatePixel : (" & $g_aiDonatePixel [0] & "," & $g_aiDonatePixel [1] & ") $yPos: " & $yPos, $COLOR_DEBUG)
				$g_iActiveDonate = False
				$g_bSkipDonTroops = False
				$g_bSkipDonSpells = False
				RemainingCCcapacity()

				If $g_iTotalDonateCapacity <= 0 Then
					SetLog("Clan Castle troops are full, skip troop donation...", $COLOR_ORANGE)
					$g_bSkipDonTroops = True
				EndIf
				If $g_iTotalDonateSpellCapacity = 0 Then
					SetLog("Clan Castle spells are full, skip spell donation...", $COLOR_ORANGE)
					$g_bSkipDonSpells = True
				ElseIf $g_iTotalDonateSpellCapacity = -1 Then
					If $g_bDebugSetlog Then SetLog("This CC cannot accept spells, skip spell donation...", $COLOR_DEBUG)
					$g_bSkipDonSpells = True
				EndIf

				If $g_bSkipDonTroops And $g_bSkipDonSpells Then
					$g_iActiveDonate = True
					$yPos = $g_aiDonatePixel[1] + 50
					$GtfoTopEnd = -1
					ContinueLoop
				EndIf
				If Not iDonateWindow($bOpen) Then
					$g_iActiveDonate = True
					$yPos = $g_aiDonatePixel[1] + 50
					$GtfoTopEnd = -1
					ContinueLoop
				EndIf

				$DonateCount = $DonateCount + 1
				If $GtfoSpellType <> -1 And Not $g_bSkipDonSpells Then
					GtfoDonateTroopType($GtfoSpellType, 1, False, True, False)
				EndIf
				If $GtfoTroopType <> -1 And Not $g_bSkipDonTroops Then
					GtfoDonateTroopType($GtfoTroopType, $g_iDonTroopsLimit, False, True, True)
				EndIf
				$dTimer = TimerInit()
				Click(700, 5, 1, 50)
				$g_iActiveDonate = True
				$yPos = $g_aiDonatePixel[1] + 50
				$GtfoTopEnd = -1
;~ 				ClickP($aAway, 1, 0, "#0171")
;~ 				If _Sleep($iDelayDonateCC2) Then ExitLoop
			Else
				$GtfoTopEnd = 0
			EndIf
			GtfoIdle()

			ForceCaptureRegion()
			$g_aiDonatePixel = _MultiPixelSearch(200, $yPos, 230, 660 + $g_iBottomOffsetY, -2, 1, Hex(0x6da725, 6), $aChatDonateBtnColors, 20)
			If IsArray($g_aiDonatePixel) Then
;~ 				If $g_bDebugSetlog Then SetLog("More Donate buttons found, new $g_aiDonatePixel : (" & $g_aiDonatePixel [0] & "," & $g_aiDonatePixel [1] & ")", $COLOR_DEBUG)
				ContinueLoop
			EndIf

			If $GtfoModStatus = $GtfoPause Or $GtfoModStatus = $GtfoResume Then
				$dTimer = TimerInit()
			Else
				$dDiff = TimerDiff($dTimer)

;~ 				$GtfoMins = Int($dDiff / (60 * 1000))
;~ 				$GtfoSecs = Int(($dDiff - ($GtfoMins * 60 * 1000)) / 1000)

;~ 				_TicksToTime($dDiff,$GtfoHours,$GtfoMins,$GtfoSecs)
;~ 				$sString =  StringFormat("%02u" & ":" & "%02u", $GtfoMins, $GtfoSecs)
;~ 				_GUICtrlStatusBar_SetText($statlog, "     GTFO Idle Since : " & $sString)
				$dDiff = Number($dDiff, 2)
				If $dDiff >= ($GtfoIdleTime * 1000) Then
;~ 					$DonateCount = 25
;~ 					ContinueLoop 2
					ClickP($aClanTab, 1, 0, "#0169")
					GTFOKICK()
					$dTimer = TimerInit()
					$yPos = 90
				EndIf
			EndIf

			ForceCaptureRegion()
			$Scroll = _PixelSearch(293, 98, 295, 113, Hex(0xFFFFFF, 6), 20)
			If IsArray($Scroll) Then
				$g_iActiveDonate = True
				Click($Scroll[0], $Scroll[1], 1, 0, "#0172")
				$yPos = 90
;~ 				If _Sleep(200) Then ExitLoop
				ContinueLoop
			Else
				ClickP($aClanTab, 1, 0, "#0169")
			EndIf
			$g_iActiveDonate = False
		WEnd

		If $GtfoMassKickMode Then
			GTFOKICK()
			$DonateCount += 1
		EndIf

		ClickP($aAway, 1, 0, "#0176")
		Click(700, 5, 1, 50)
		If _Sleep(150) Then Return

	WEnd
	Click(1, 40, 1, 50)
	If _Sleep(50) Then Return
	GTFOStop()

EndFunc   ;==>GTFOStart

Func SetTroopIdle()

	If GUICtrlRead($chkWaitForTroops) = $GUI_CHECKED Then
		GUICtrlSetState($cmbTroopIdleTime, $GUI_ENABLE)
	Else
		GUICtrlSetState($cmbTroopIdleTime, $GUI_DISABLE)
	EndIf

EndFunc   ;==>SetTroopIdle

Func GtfoCheckTrainingTab($sText = "troop")
	Local $Tab

	If $sText = "troop" Then
		If Not OpenTroopsTab(True) Then Return
		$Tab = $TrainTroopsTAB
	Else
		If Not OpenSpellsTab(True) Then Return
		$Tab = $BrewSpellsTAB
	EndIf

	If _Sleep(1000) Then Return
	If Not ISArmyWindow(False, $Tab) Then Return

	Return GetOCRCurrent(43, 160)

EndFunc   ;==>GtfoCheckTrainingTab

Func GtfoTrain($ClanMode = False)

	If $GtfoMassKickMode Then Return True
	GUICtrlSetState($GTFOcheck, $GUI_DISABLE)
	Local $aGetArmySize[3] = ["", "", ""]

	Local $timer, $aRemainTrainTroopTimer = 0
	Local $tempElixir = ""
	Local $tempDElixir = ""
	Local $tempElixirSpent = 0
	Local $tempDElixirSpent = 0

	ClickP($aCloseChat, 1, 0, "#0168")
	_Sleep($iDelayTrain1)
	ClickP($aAway, 1, 0, "#0167") ;Click Away
	_Sleep($iDelayTrain1)

	VillageReport(True, True)
	Local $tempCounter = 0
	While ($g_aiCurrentLoot[$eLootElixir] = "" Or ($g_aiCurrentLoot[$eLootDarkElixir] = "" And $g_iStatsStartedWith[$eLootElixir] <> "")) And $tempCounter < 10
		$tempCounter += 1
		If _Sleep(100) Then Return
		VillageReport(True, True)
	WEnd
	$tempElixir = $g_aiCurrentLoot[$eLootElixir]
	$tempDElixir = $g_aiCurrentLoot[$eLootDarkElixir]

	Local $GtfoTempTroop = GUICtrlRead($cmbGtfoTroop)
	Local $GtfoTempSpell = GUICtrlRead($cmbGtfoSpell)
	Local $GtfoTempTroopBoost = GUICtrlRead($cmbGtfoTroopBoost)
	Local $GtfoTempSpellBoost = GUICtrlRead($cmbGtfoSpellBoost)

	If (Int($g_iTxtRestartElixir) >= Int($g_aiCurrentLoot[$eLootElixir])) Or (Int($g_aiCurrentLoot[$eLootElixir]) < 1000) Then
		SetLog("Running Out of Elixir. GTFO Stopped. Elixir Halt Limit Reached.", $COLOR_RED)
		GTFOStop()
		Return False
	EndIf

	If (Int($g_iTxtRestartDark) >= Int($g_aiCurrentLoot[$eLootDarkElixir]) Or (Int($g_aiCurrentLoot[$eLootDarkElixir]) < 200)) And $GtfoTempSpell <> "None" Then
		SetLog("Disabled Spell Donations. Dark Elixir Halt Limit Reached.", $COLOR_RED)
		_GUICtrlComboBox_SetCurSel($cmbGtfoSpell, 0)
		$GtfoTempSpell = GUICtrlRead($cmbGtfoSpell)
	EndIf

	If $GtfoTempSpell = "None" Then
		SetLog("Training Troops", $COLOR_BLUE)
	Else
		SetLog("Training Troops & Brew Spells", $COLOR_BLUE)
	EndIf

;~ 0xE4A438
	If WaitforPixel(28, 505 + $g_iBottomOffsetY, 30, 507 + $g_iBottomOffsetY, Hex(0xF0B549, 6), 5, 10) Then
		If $g_bDebugSetlogTrain Then SetLog("Click $aArmyTrainButton", $COLOR_DEBUG)
		Click($aArmyTrainButton[0], $aArmyTrainButton[1], 1, 0, "#0293") ; Button Army Overview
	EndIf
	_Sleep(500)

	Local $getArmyCampCap = 0, $aGetArmySize = 0, $CurCamp = 0, $TotalCamp = 0, $CurCampPer = 0, $ArmyCapacity = 0
	If WaitforPixel(815, 120, 820, 125, Hex(0xFD797D, 6), 10, 10) Then
		If $g_bDebugSetlogTrain Then SetLog("Wait for ArmyOverView Window", $COLOR_DEBUG)
		_Sleep(500)
		$getArmyCampCap = getOcrAndCapture("coc-ms", 110, 166, 82, 16, True)
		If $g_bDebugSetlogTrain Then SetLog("OCR $getArmyCampCap = " & $getArmyCampCap, $COLOR_DEBUG)
		$aGetArmySize = StringSplit($getArmyCampCap, "#")
		If IsArray($aGetArmySize) Then
			If $aGetArmySize[0] > 1 Then ; check if the OCR was valid and returned both values
				$CurCamp = Number($aGetArmySize[1])
				$TotalCamp = Number($aGetArmySize[2])
				$CurCampPer = Int($CurCamp / $TotalCamp * 100)
				SetLog("Total Army Camp capacity: " & $CurCamp & "/" & $TotalCamp & " (" & $CurCampPer & "%)", $COLOR_GREEN)
				$ArmyCapacity = Int($CurCamp / $TotalCamp * 100)
			EndIf
		Else
			SetLog("OCR Error while reading Army Overview Window", $COLOR_DEBUG)
		EndIf

		Local $getSpellCap = getOcrAndCapture("coc-ms", 100, 313, 50, 16, True)
		;SetLog("OCR $getSpellCap = " & $getSpellCap, $COLOR_DEBUG)
		If $g_bDebugSetlogTrain Then SetLog("OCR $getSpellCap = " & $getSpellCap, $COLOR_DEBUG)
		Local $aGetSpellSize = StringSplit($getSpellCap, "#")
		If IsArray($aGetSpellSize) Then
			If $aGetSpellSize[0] > 1 Then ; check if the OCR was valid and returned both values
				Local $CurSpell = Number($aGetSpellSize[1])
				Local $TotalSpell = Number($aGetSpellSize[2])
				SetLog("Total Spell capacity: " & $CurSpell & "/" & $TotalSpell, $COLOR_GREEN)
				Local $SpellCapacity = Int($CurSpell / $TotalSpell * 100)
			EndIf
		Else
			SetLog("OCR Error while reading Army Overview Window", $COLOR_DEBUG)
		EndIf

		Click(230, 140, 1, 0, "#0293")
	EndIf
	_Sleep(250)

	If WaitforPixel(230, 140, 240, 145, Hex(0xE8ECE0, 6), 10, 10) Then

		If $g_bDebugSetlogTrain Then SetLog("Wait for Troops Window", $COLOR_GREEN)
		_Sleep(500)
		Local $getArmyCampCap = getOcrAndCapture("coc-train-quant1", 45, 160, 70, 18, True)
		Local $ArmyCampTroop = GtfoCheckTrainingTab("troop") ; MHK2012  Perisan MOD
		If $g_bDebugSetlogTrain Then SetLog("OCR $sArmyInfo = " & StringLeft($getArmyCampCap, StringLen($getArmyCampCap) - 3), $COLOR_DEBUG)
		Local $iTroopTrain = ($TotalCamp * 2) - Number($ArmyCampTroop[0])
		Local $iTroopHousing = 1
		If $iTroopTrain <= 0 Then
			$iTroopTrain = 0
		Else
			Local $eGtfoTempTroop = -1
			Switch $GtfoTempTroop
				Case "Barbarian"
					$eGtfoTempTroop = 0
					$iTroopHousing = 1
				Case "Archer"
					$eGtfoTempTroop = 1
					$iTroopHousing = 1
				Case "Giant"
					$eGtfoTempTroop = 2
					$iTroopHousing = 5
				Case "Ballon"
					$eGtfoTempTroop = 5
					$iTroopHousing = 5
				Case "Wizard"
					$eGtfoTempTroop = 6
					$iTroopHousing = 4
				Case "Minion"
					$eGtfoTempTroop = 12
					$iTroopHousing = 2
			EndSwitch
			$GtfoTroopType = $eGtfoTempTroop
			$iTroopTrain = Round($iTroopTrain / $iTroopHousing, 0)
			SetLog("Troops to Train (" & $GtfoTempTroop & "): " & $iTroopTrain, $COLOR_GREEN)
			TrainIt($eGtfoTempTroop, $iTroopTrain, 10)
		EndIf
		If $GtfoTroopTrainCount > 0 Then
;~ 			DonatedTroop($GtfoTroopType, $iTroopTrain)
			$g_aiDonateStatsTroops[$GtfoTroopType][0] += $iTroopTrain
		Else
			$g_aiDonateStatsTroops[$GtfoTroopType][0] = 0
			$g_aiDonateStatsTroops[$GtfoTroopType][1] = 0
		EndIf
		$GtfoTroopTrainCount += 1

		If $GtfoTempTroopBoost > 0 Then
			$ClickResult = findButton("BoostBarrack")
			If IsArray($ClickResult) Then
				ClickP($ClickResult)
				_Sleep($DELAYBOOSTBARRACKS1)
				$GemResult = findButton("GEM")
				If IsArray($GemResult) Then
					ClickP($GemResult)
					_Sleep($DELAYBOOSTBARRACKS2)
					If Not IsArray(findButton("EnterShop")) Then
						If $GtfoTempTroopBoost >= 1 Then $GtfoTempTroopBoost -= 1
						SetLog(" Total remain cycles to boost Barracks:" & $GtfoTempTroopBoost, $COLOR_GREEN)
						GUICtrlSetData($cmbGtfoTroopBoost, $GtfoTempTroopBoost)
					EndIf
				EndIf
			EndIf
		EndIf

		Click(430, 140, 1, 0, "#0293")
	EndIf
	_Sleep(500)

	If WaitforPixel(430, 140, 440, 145, Hex(0xE8ECE0, 6), 10, 10) Then
		If $g_bDebugSetlogTrain Then SetLog("Wait for Spells Window", $COLOR_DEBUG)
		_Sleep(500)
		Local $iSplAdj = 1
		If $TotalSpell >= 10 Then $iSplAdj = 2
		$getSpellCap = getOcrAndCapture("coc-train-quant1", 48, 160, 40, 18, True)
		Local $ArmyCampSpell = GtfoCheckTrainingTab("spell") ; GTFO - Persian MOD (#-31)
		If $g_bDebugSetlogTrain Then SetLog("OCR $sArmyInfo = " & StringLeft($getSpellCap, StringLen($getSpellCap) - $iSplAdj), $COLOR_DEBUG)

		Local $iSpellBrew = ($TotalSpell * 2) - Number($ArmyCampSpell[0])
		Local $eGtfoTempSpell = -1

		If $iSpellBrew <= 0 Or $GtfoTempSpell = "None" Then
			$iSpellBrew = 0
		Else
			Switch $GtfoTempSpell
				Case "Poison"
					$eGtfoTempSpell = 29
				Case "Earthquake"
					$eGtfoTempSpell = 30
				Case "Haste"
					$eGtfoTempSpell = 31
				Case "Skeleton"
					$eGtfoTempSpell = 32
			EndSwitch
			$GtfoSpellType = $eGtfoTempSpell
			;CheckForSantaSpell()
			SetLog("Spell to Brew (" & $GtfoTempSpell & "): " & $iSpellBrew, $COLOR_GREEN)
			TrainIt($eGtfoTempSpell, $iSpellBrew, 10)
		EndIf
		If $GtfoSpellBrewCount = 0 Then ResetVariables("donated")
		If $eGtfoTempSpell <> -1 Then
			If $GtfoSpellBrewCount > 0 Then
;~ 			DonatedSpell($GtfoSpellType, $iSpellBrew)
				$g_aiDonateStatsSpells[$eGtfoTempSpell - 24][0] += $iSpellBrew
			Else
				$g_aiDonateStatsSpells[$eGtfoTempSpell - 24][0] = 0
				$g_aiDonateStatsSpells[$eGtfoTempSpell - 24][1] = 0
			EndIf
		EndIf
		$GtfoSpellBrewCount += 1

		If $GtfoTempSpell <> "None" Then
			If $GtfoTempSpellBoost > 0 Then
				$ClickResult = findButton("BoostBarrack")
				If IsArray($ClickResult) Then
					ClickP($ClickResult)
					_Sleep($DELAYBOOSTBARRACKS1)
					$GemResult = findButton("GEM")
					If IsArray($GemResult) Then
						ClickP($GemResult)
						_Sleep($DELAYBOOSTBARRACKS2)
						If Not IsArray(findButton("EnterShop")) Then
							If $GtfoTempSpellBoost >= 1 Then $GtfoTempSpellBoost -= 1
							SetLog(" Total remain cycles to boost Barracks:" & $GtfoTempSpellBoost, $COLOR_GREEN)
							GUICtrlSetData($cmbGtfoSpellBoost, $GtfoTempSpellBoost)
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf

		If $CurCampPer < 5 Then
			Click(30, 140, 1, 0, "#0293")
			If WaitforPixel(30, 140, 240, 145, Hex(0xE8ECE0, 6), 10, 10) Then
				Local $TimeRemainTroops = getRemainTrainTimer(756, 169)
				Local $ResultTroopsHour, $ResultTroopsMinutes, $ResultTroopsSeconds

;~ 				$aTimeTrain[0] = 0

				If $TimeRemainTroops <> "" Then
					If StringInStr($TimeRemainTroops, "h") > 1 Then
						$ResultTroopsHour = StringSplit($TimeRemainTroops, "h", $STR_NOCOUNT)
						$ResultTroopsMinutes = StringTrimRight($ResultTroopsHour[1], 1)
						$aRemainTrainTroopTimer = (Number($ResultTroopsHour[0]) * 60) + Number($ResultTroopsMinutes)
					ElseIf StringInStr($TimeRemainTroops, "m") > 1 Then
						$ResultTroopsMinutes = StringSplit($TimeRemainTroops, "m", $STR_NOCOUNT)
						$aRemainTrainTroopTimer = $ResultTroopsMinutes[0] + Ceiling($ResultTroopsMinutes[1] / 60)
					Else
						$ResultTroopsSeconds = StringTrimRight($TimeRemainTroops, 1)
						$aRemainTrainTroopTimer = Ceiling($ResultTroopsSeconds / 60)
					EndIf
;~ 					$aTimeTrain[0] = $aRemainTrainTroopTimer
				EndIf
			EndIf
			;;$aRemainTrainTroopTimer
		Else
			Click(815, 245, 1, 0, "#0293")
		EndIf

	EndIf
	Click(1, 40, 1, 500)
	_Sleep(500)

	VillageReport(True, True)

	$tempCounter = 0
	While ($g_aiCurrentLoot[$eLootElixir] = "" Or ($g_aiCurrentLoot[$eLootDarkElixir] = "" And $g_iStatsStartedWith[$eLootElixir] <> "")) And $tempCounter < 30
		$tempCounter += 1
		If _Sleep($iDelayTrain1) Then Return
		VillageReport(True, True)
	WEnd

	If $tempElixir <> "" And $g_aiCurrentLoot[$eLootElixir] <> "" Then
		$tempElixirSpent = ($tempElixir - $g_aiCurrentLoot[$eLootElixir])
		$g_iTrainCostElixir += $tempElixirSpent
;~ 		$iElixirTotal -= $tempElixirSpent
		$g_aiCurrentLoot[$eLootElixir] -= $tempElixirSpent
	EndIf

	If $tempDElixir <> "" And $g_aiCurrentLoot[$eLootDarkElixir] <> "" Then
		$tempDElixirSpent = ($tempDElixir - $g_aiCurrentLoot[$eLootDarkElixir])
		$g_aiCurrentLoot[$eLootDarkElixir] += $tempDElixirSpent
;~ 		$iDarkTotal -= $tempDElixirSpent
		$g_aiCurrentLoot[$eLootDarkElixir] -= $tempDElixirSpent
	EndIf

	If Not $g_bRunState Then Return
	UpdateStats()

	checkAttackDisable($g_iTaBChkIdle)

	If $ClanMode Then Return True

;~ 	If GUICtrlRead($chkWaitForTroops) = $GUI_CHECKED and $GtfoTempTroopBoost = 0 Then
	If GUICtrlRead($chkWaitForTroops) = $GUI_CHECKED Then
		If $CurCampPer < 5 Then
			GTFOKICK(5)
			If GUICtrlRead($cmbTroopIdleTime) <> "Auto" Then
				$aRemainTrainTroopTimer = Number(GUICtrlRead($cmbTroopIdleTime))
			EndIf
			SetLog("GTFO: Smart wait train time = " & $aRemainTrainTroopTimer & " Minutes", $color_info)
			WinGetAndroidHandle()
			AndroidHomeButton()
			If _SleepStatus($aRemainTrainTroopTimer * 1000 * 60) Then Return

			_GUICtrlEdit_SetText($g_hTxtLog, _PadStringCenter(" GTFO LOG ", 71, "="))
			_GUICtrlRichEdit_SetFont($g_hTxtLog, 6, "Lucida Console")
			_GUICtrlRichEdit_AppendTextColor($g_hTxtLog, "" & @CRLF, _ColorConvert($Color_Black))
			SendAdbCommand("shell am start -n " & $g_sAndroidGamePackage & "/" & $g_sAndroidGameClass)
			_GUICtrlStatusBar_SetText($g_hStatusBar, "")
			AndroidBotStartEvent()
			CheckMainScreen()
			CheckAttackDisable($g_iTaBChkIdle)
			ChkShieldStatus(True, True)
			RequestCC()
			ReArm()
		EndIf
	EndIf

	Return True
EndFunc   ;==>GtfoTrain

Func GTFOKICK($limit = 0)

	If GUICtrlRead($chkMassDonate) = $GUI_CHECKED Then Return

;~     Click(1, 40, 1, 500)
	Local $Scroll, $len, $kick_y, $kicked = 0, $kicklimit, $mDonated, $mReceived, $Count = 1, $loopcount, $new, $p1, $p2, $lastNum, $lastNumCheck, $cp, $sNum, $sresultTrophies
	$len = 0
	$kicked = 0

	If GUICtrlRead($GTFOcheck) = 1 Then
		;Set Global Kick loop Couter Here
	Else
		Return
	EndIf

	If $limit = 0 Then
		$kicklimit = GUICtrlRead($cmbGtfo)
		If $kicklimit = 0 Then
			$kicklimit = 1
;~ 			Return
		EndIf
	Else
		$kicklimit = $limit
	EndIf


	Click(1, 40, 1, 250)
	If _Sleep(250) Then Return
	If Not _CheckPixel($aChatTab, $g_bCapturePixel) Then ClickP($aOpenChat, 1, 0, "#0168") ; Clicks chat tab
	If _Sleep(1000) Then Return

	Local $iCount = 0
	While 1
		If _ColorCheck(_GetPixelColor(189, 24, True), Hex(0x706C50, 6), 20) Then
			ExitLoop
		EndIf
		If _ColorCheck(_GetPixelColor(189, 24, True), Hex(0x383828, 6), 20) Then
			If _Sleep(200) Then Return
			ClickP($aClanTab, 1, 0, "#0169")
			ExitLoop
		EndIf
		$iCount += 1
		If $iCount >= 15 Then
			$DonateCount = 100
			ExitLoop
		EndIf
		If _Sleep(200) Then Return
	WEnd

	While $kicked < $kicklimit
		IsInGame()
		GtfoIdle()
		If $GtfoModStatus = $GtfoStop Then Return
		If _Sleep(250) Then ExitLoop
		Click(150, 60)
		If _Sleep(250) Then ExitLoop
		$loopcount = 0

		While _ColorCheck( _GetPixelColor(60, 390, True), Hex(0xAADE52, 6), 20) == False ;- Check Green pixel on warlog Button
			If _Sleep(150) Then ExitLoop
			$loopcount += 1
			If $loopcount >= 20 Then
				$loopcount = 0
				Click(1, 40, 1, 250)
				SetLog("    Unable to Load Clan Page Skipping Member Kick", $COLOR_RED)
				Return
			EndIf
		WEnd

		Local $sresultTrophies = ""
		If $bSetTrophies Then
			_captureregion()
			$sresultTrophies = getOcrAndCapture("coc-pbttime", 525, 292, 40, 16, True)
			$currClanTrophies = Number($sresultTrophies)
;~ 			Setlog("Trophies: " & $currClanTrophies)
		EndIf

		Local $Res = "", $res1 = "", $ClanMode = "", $bsUpdateTrophies = False, $posPoint, $posPoint1
;~ 		If GUICtrlRead($chkClanOpen) = $GUI_CHECKED Then
		_captureregion()
		$Res = isImageVisible("ClanClosed", @ScriptDir & "\images\closed_0_0_85.bmp", "500,270,560,295")
		$res1 = isImageVisible("AnyOneCanJoin", @ScriptDir & "\images\AnyOneCanJoin_0_0_85.bmp", "520,270,560,295")
		If $res1 <> "" Then
			$posPoint = StringSplit($res1, ",")
			If $posPoint[0] = "0" Or $posPoint[0] = "" Then
				$ClanMode = ""
			Else
				$ClanMode = "Open"
			EndIf
		ElseIf $Res <> "" Then
			$posPoint1 = StringSplit($Res, ",")
			If $posPoint1[0] = "0" Or $posPoint1[0] = "" Then
				$ClanMode = ""
			Else
				$ClanMode = "Closed"
			EndIf
		Else
			$ClanMode = "Invite"
		EndIf
;~ 		EndIf
;~ 		Setlog("Clan Mode : " & $ClanMode,$COLOR_DEBUG)
		If $bSetTrophies Then
			If $aUpdateTrophies <> $currClanTrophies Then
				Local $CurrentTrophiesIndex = _ArrayFindAll($aGtfoCanTrophies, $currClanTrophies)
				Local $SetTrophieIndex = _ArrayFindAll($aGtfoCanTrophies, $aUpdateTrophies)
				Local $diffIndexLevel = $SetTrophieIndex[0] - $CurrentTrophiesIndex[0]
				$bsUpdateTrophies = True
			EndIf
		EndIf

		If (($ClanMode <> "") And ($ClanMode <> "Open")) Or $bsUpdateTrophies Then
			Click(540, 385, 1, 500)
			_Sleep(500)
			Switch $ClanMode
				Case "Invite"
					ClanInviteIdleMode()
					Return
;~ 					Click(434, 393, 2, 500)
				Case "Closed"
					Click(434, 393, 1, 500)
				Case "Open"
					SetLog("Clan Is alrady in Open State", $COLOR_GREEN)
				Case Else
					SetLog("       Unknown error ", $COLOR_RED)
			EndSwitch
			_Sleep(500)

			If $bsUpdateTrophies Then
				If $diffIndexLevel < 0 Then
					$diffIndexLevel = (-1 * $diffIndexLevel)
					Click(545, 395, $diffIndexLevel, 500)
;~ 					SetLog("Reduce trophies")
				Else
					Click(680, 395, $diffIndexLevel, 500)
;~ 					SetLog("Increase trophies")
				EndIf
				_Sleep(500)
			EndIf

			Click(425, 610, 1, 500)
			_Sleep(1000)
			Click(150, 60)
			_Sleep(500)

			$loopcount = 0
			While _ColorCheck( _GetPixelColor(60, 390, True), Hex(0xAADE52, 6), 20) == False ;- Check Green pixel on warlog Button
				If _Sleep(150) Then ExitLoop
				$loopcount += 1
				If $loopcount >= 20 Then
					$loopcount = 0
					Click(700, 5, 1, 500)
					SetLog("    Unable to Load Clan Page After Clan Settings", $COLOR_RED)
					Return
				EndIf
			WEnd
		EndIf

		Local $KickPosX = -1, $KickPosY = 0
		$Scroll = 0
		$cp = 117
		$len = 0
		While 1
			If $GtfoModStatus = $GtfoStop Then Return
			If $g_bDebugSetlog Then SetLog("Capture. cp: " & $cp, $COLOR_ORANGE)
			_CaptureRegion(199, $cp, 211, 671)
			$new = _PixelSearch(200, $cp, 210, 671, Hex(0xE73838, 6), 20)
			If IsArray($new) Then
				$KickPosX = $new[0]
				$KickPosY = $new[1]

				$mDonated = Int(Number(getOcrAndCapture("coc-army", $new[0] + 280, $new[1] - 10, 70, 14, True)))

				If $mDonated > 0 Then
					$mReceived = 999999
				Else
					If (GUICtrlRead($chkKickMode) <> 1) Then
						$mReceived = getOcrAndCapture("coc-army", $new[0] + 400, $new[1] - 10, 70, 14, True)
					Else
						$mReceived = 0
					EndIf
				EndIf

;~ 				_CaptureRegion2()
;~ 				$hClone = _GDIPlus_BitmapCloneArea(_GDIPlus_BitmapCreateFromHBITMAP($hHBitmap2), 190, $new[1] - 30, 65, 30, $GDIP_PXF24RGB)
;~ 				_GDIPlus_ImageSaveToFile($hClone, $g_sProfileDonateCapturePath & "KickCapture.png")
;~ 				_GDIPlus_ImageDispose($hClone)


;~ 				_captureregion()
;~ 				$res  = isImageVisible("LastKicked",$g_sProfileDonateCapturePath & $sLastkickedFile, String(190) & ","& String($new[1] - 30) & "," & String(255) & "," & String($new[1]))
;~ 				If $res <> "" then
;~ 					$posPoint = StringSplit($res,",")
;~ 					If $posPoint[0] = "0" or $posPoint[0] = "" Then
;~ 						;
;~ 					Else
;~ 						SetLog("Found Last Kicked, Skipping and continue finding other members", $COLOR_SUCCESS)
;~ 	 					$cp = $new[1]  + 20
;~ 	 					ContinueLoop
;~ 						$mReceived = 0
;~ 						$mDonated = 0
;~ 					EndIf
;~ 				EndIf

				If $g_bDebugSetlog Then SetLog("Check For To Kick Members", $COLOR_RED)
				If $g_bDebugSetlog Then SetLog($sNum & " # x:" & $new[0] & " y:" & $new[1], $COLOR_RED)

				If $mDonated > 0 Or $mReceived >= $GtfoReceiveCap Then
					$sNum = getTrophyVillageSearch($new[0] - 180, $new[1] - 18)
					Click($new[0], $new[1])
					If _Sleep(250) Then ExitLoop
					If $new[1] > 620 Then
						$kick_y = 700
					Else
						$kick_y = $new[1] + 70
					EndIf

;~ 					_CaptureRegion2()
;~ 					$hClone = _GDIPlus_BitmapCloneArea(_GDIPlus_BitmapCreateFromHBITMAP($hHBitmap2), 195, $new[1] - 15, 35, 10, $GDIP_PXF24RGB)
;~ 					_GDIPlus_ImageSaveToFile($hClone, $g_sProfileDonateCapturePath & $sLastkickedFile)
;~ 					_GDIPlus_ImageDispose($hClone)

					Click($new[0] + 300, $kick_y) ; kick
					If _Sleep(250) Then ExitLoop

					If GUICtrlRead($chkGtfoNote) = $GUI_CHECKED Then
						Click(430, 150)
						If _Sleep(150) Then ExitLoop
						Local $tClip = ClipGet()
						$chatString = GUICtrlRead($txtGtfoNote)
						ClipPut($chatString)
						_Sleep(350)
						ControlSend($g_hAndroidWindow, "", "", "{CTRLDOWN}a{CTRLUP}{CTRLDOWN}v{CTRLUP}", 0)
						_Sleep(200)
						ClipPut($tClip)
					EndIf

					Click(520, 240)
;~ 					If _Sleep(250) Then ExitLoop
					$kicked += 1
					If $mReceived = 999999 Then
						SetLog("Player #" & $sNum & "  Donated : " & $mDonated & " has been kicked out", $COLOR_RED)
					Else
						SetLog("Player #" & $sNum & "  Donated : " & $mDonated & " - Received : " & $mReceived & " has been kicked out", $COLOR_RED)
					EndIf

					ExitLoop
				Else
					$cp = $new[1] + 20
;~ 					ExitLoop
				EndIf

			Else
				If $Scroll > 3 Then
					If $g_bDebugSetlog Then SetLog("Kicking bottom members", $COLOR_RED)
					If $KickPosX > 0 Then
						If $g_bDebugSetlog Then SetLog($sNum & " # x:" & $KickPosX & " y:" & $KickPosY, $COLOR_RED)
						Click($KickPosX, $KickPosY)
						If _Sleep(250) Then ExitLoop
						If $KickPosY > 615 Then
							$kick_y = 700
						Else
							$kick_y = $KickPosY + 70
						EndIf
						Click($KickPosX + 300, $kick_y) ; kick
						If _Sleep(250) Then ExitLoop
						Click(520, 240)
						$kicked += 1
						SetLog("Player #" & $sNum & "  Donated : " & $mDonated & " - Received : " & $mReceived & " has been kicked out", $COLOR_RED)
					Else
						If $g_bDebugSetlog Then SetLog("no members to kick", $COLOR_RED)
					EndIf
					ExitLoop 2
				Else
					ClickDrag(430, 665, 430, 115)
					$cp = 110
					If $g_bDebugSetlog Then SetLog("Page Scroll : " & $Scroll, $COLOR_RED)
					$Scroll = $Scroll + 1
				EndIf
			EndIf
		WEnd

		Click(1, 40, 1, 250)
	WEnd

;~    SetLog("Finished Kicking", $COLOR_RED)
;~    Click(1, 40, 1, 500)

EndFunc   ;==>GTFOKICK

Func iDonateWindow($Open = True)

	If Not $Open Then ; close window and exit
		ClickP($aAway, 1, 0, "#0176")
		If _Sleep($DelayDonateWindow1) Then Return
		Return
	EndIf

	; Click on Donate Button and wait for the window
	Local $iLeft = 0, $iTop = 0, $iRight = 0, $iBottom = 0, $i
	For $i = 0 To UBound($aChatDonateBtnColors) - 1
		If $aChatDonateBtnColors[$i][1] < $iLeft Then $iLeft = $aChatDonateBtnColors[$i][1]
		If $aChatDonateBtnColors[$i][1] > $iRight Then $iRight = $aChatDonateBtnColors[$i][1]
		If $aChatDonateBtnColors[$i][2] < $iTop Then $iTop = $aChatDonateBtnColors[$i][2]
		If $aChatDonateBtnColors[$i][2] > $iBottom Then $iBottom = $aChatDonateBtnColors[$i][2]
	Next
	$iLeft += $g_aiDonatePixel[0]
	$iTop += $g_aiDonatePixel[1]
	$iRight += $g_aiDonatePixel[0] + 1
	$iBottom += $g_aiDonatePixel[1] + 1
	ForceCaptureRegion()
	Local $DonatePixelCheck = _MultiPixelSearch($iLeft, $iTop, $iRight, $iBottom, -2, 1, Hex(0x6da725, 6), $aChatDonateBtnColors, 15)
	If IsArray($DonatePixelCheck) Then
		Click($g_aiDonatePixel[0] + 50, $g_aiDonatePixel[1] + 10, 1, 0, "#0174")
	Else
		Return False
	EndIf
	If _Sleep($DELAYDONATEWINDOW1) Then Return

	;_CaptureRegion(0, 0, 320 + $midOffsetY, $g_aiDonatePixel[1] + 30 + $YComp)
	Local $iCount = 0
	While Not (_ColorCheck(_GetPixelColor(331, $g_aiDonatePixel[1], True, "DonateWindow"), Hex(0xffffff, 6), 0))
		If _Sleep($DELAYDONATEWINDOW2) Then Return
		;_CaptureRegion(0, 0, 320 + $midOffsetY, $g_aiDonatePixel[1] + 30 + $YComp)
		$iCount += 1
		If $iCount = 20 Then ExitLoop
	WEnd

	$DonationWindowY = 0

;~ 	Local $aDonWinOffColors[2][3] = [[0xFFFFFF, 0, 2], [0xc7c5bc, 0, 209]]
	Local $aDonWinOffColors[3][3] = [[0xFFFFFF, 0, 1], [0xFFFFFF, 0, 31], [0xABABA8, 0, 32]]
	Local $aDonationWindow = _MultiPixelSearch(409, 0, 410, $g_iDEFAULT_HEIGHT, 1, 1, Hex(0xFFFFFF, 6), $aDonWinOffColors, 10)

	If IsArray($aDonationWindow) Then
		$DonationWindowY = $aDonationWindow[1]
		If _Sleep(50) Then Return
		If $g_bDebugSetlog Then Setlog("$DonationWindowY: " & $DonationWindowY, $COLOR_DEBUG)
	Else
		SetLog("Could not find the Donate Window!", $COLOR_ERROR)
		Click(700, 5, 2, 50)
		Return False
	EndIf

	Return True
EndFunc   ;==>iDonateWindow

Func GtfoDonateTroopType($Type, $Quant = 0, $Custom = False, $g_iActiveDonateAll = False, $isTrool = True)
	If $g_bDebugSetlog Then SetLog("$DonateTroopType Start: " & NameOfTroop($Type), $COLOR_DEBUG) ;Debug

	Local $Slot = -1, $YComp = 0, $sTextToAll = ""
	Local $detectedSlot = -1
	Local $donaterow = -1 ;( =3 for spells)
	Local $donateposinrow = -1

	If $g_iTotalDonateCapacity = 0 And $g_iTotalDonateSpellCapacity = 0 Then Return

	If $Type >= 0 And $Type <= 18 Then
		$g_iDonTroopsQuantityAv = $g_iTotalDonateCapacity
		If $g_iDonTroopsQuantityAv < 1 Then
			SetLog("Sorry Chief! " & NameOfTroop($Type, 1) & " don't fit in the remaining space!")
			Return
		EndIf
		If $g_iDonTroopsQuantityAv >= $g_iDonTroopsLimit Then
			$g_iDonTroopsQuantity = $g_iDonTroopsLimit
		Else
			$g_iDonTroopsQuantity = $g_iDonTroopsQuantityAv
		EndIf
	EndIf

	If $Type >= 29 And $Type <= 32 Then
		$g_iDonSpellsQuantityAv = $g_iTotalDonateSpellCapacity
		If $g_iDonSpellsQuantityAv < 1 Then
			SetLog("Sorry Chief! " & NameOfTroop($Type, 1) & " don't fit in the remaining space!")
			Return
		EndIf
		If $g_iDonSpellsQuantityAv >= $iDonSpellsLimit Then
			$g_iDonSpellsQuantityAv = $iDonSpellsLimit
		Else
			$g_iDonSpellsQuantityAv = $g_iDonSpellsQuantityAv
		EndIf
	EndIf

	If $g_bDebugOCRdonate = 1 Then
		Local $oldDebugOcr = $debugOcr
		$debugOcr = 1
	EndIf
	$Slot = GtfoDetectSlotTroop($Type)
	$detectedSlot = $Slot
	If $g_bDebugSetlog Then SetLog("Slot Found = " & $Slot, $COLOR_DEBUG)
	If $g_bDebugOCRdonate = 1 Then $debugOcr = $oldDebugOcr

	If $Slot = -1 Then Return

	$donaterow = 1
	$donateposinrow = $Slot
	If $Slot >= 6 And $Slot <= 11 Then
		$donaterow = 2
		$Slot = $Slot - 6
		$donateposinrow = $Slot
		$YComp = 88
	EndIf

	If $Slot >= 12 And $Slot <= 14 Then
		$donaterow = 3
		$Slot = $Slot - 12
		$donateposinrow = $Slot
		$YComp = 203
	EndIf

	If $YComp <> 203 Then ; Troops

		If _ColorCheck(_GetPixelColor(350 + ($Slot * 68), $DonationWindowY + 105 + $YComp, True), Hex(0x306ca8, 6), 20) Or _
				_ColorCheck(_GetPixelColor(355 + ($Slot * 68), $DonationWindowY + 106 + $YComp, True), Hex(0x306ca8, 6), 20) Or _
				_ColorCheck(_GetPixelColor(360 + ($Slot * 68), $DonationWindowY + 107 + $YComp, True), Hex(0x306ca8, 6), 20) Then
			Local $plural = 0

			If $g_iDonTroopsQuantity > 1 Then $plural = 1

			If _ColorCheck(_GetPixelColor(350 + ($Slot * 68), $DonationWindowY + 105 + $YComp, True), Hex(0x306ca8, 6), 20) Or _
					_ColorCheck(_GetPixelColor(355 + ($Slot * 68), $DonationWindowY + 106 + $YComp, True), Hex(0x306ca8, 6), 20) Or _
					_ColorCheck(_GetPixelColor(360 + ($Slot * 68), $DonationWindowY + 107 + $YComp, True), Hex(0x306ca8, 6), 20) Then
				Click(365 + ($Slot * 68), $DonationWindowY + 100 + $YComp, $g_iDonTroopsQuantity, 25, "#0175")
			EndIf

			;SetLog("Donating " & $g_iDonTroopsQuantity  & " " & NameOfTroop($Type, $plural) , $COLOR_GREEN)
			$g_iActiveDonate = True

		ElseIf $g_aiDonatePixel[1] - 5 + $YComp > 675 Then
			SetLog("Unable to donate " & NameOfTroop($Type) & ". Donate screen not visible, will retry next run.", $COLOR_RED)
			;Else
			;SetLog("No " & NameOfTroop($Type) & " available to donate..", $COLOR_RED)
		EndIf


	Else ; spells

		If _ColorCheck(_GetPixelColor(350 + ($Slot * 68), $DonationWindowY + 105 + $YComp, True), Hex(0x6038B0, 6), 20) Or _
				_ColorCheck(_GetPixelColor(355 + ($Slot * 68), $DonationWindowY + 106 + $YComp, True), Hex(0x6038B0, 6), 20) Or _
				_ColorCheck(_GetPixelColor(360 + ($Slot * 68), $DonationWindowY + 107 + $YComp, True), Hex(0x6038B0, 6), 20) Then

			Click(365 + ($Slot * 68), $DonationWindowY + 100 + $YComp, $g_iDonSpellsQuantityAv, 25, "#0600")
;~ 			$bFullArmySpells = False
;~ 			$fullArmy = False
			;SetLog("Donating " &  $g_iDonSpellsQuantityAv  & " " & NameOfTroop($Type) , $COLOR_GREEN)
			$g_iActiveDonate = True

		ElseIf $g_aiDonatePixel[1] - 5 + $YComp > 675 Then
			SetLog("Unable to donate " & NameOfTroop($Type) & ". Donate screen not visible, will retry next run.", $COLOR_RED)
			;Else
			;SetLog("No " & NameOfTroop($Type) & " available to donate..", $COLOR_RED)
		EndIf
	EndIf
	$g_bDebugSetlog = 0
EndFunc   ;==>GtfoDonateTroopType

Func ClanInviteIdleMode()

	Click(700, 5, 1, 50)
	If _Sleep(150) Then Return
	Setlog("       Clan is in Invite Mode.")

	ClickP($aCloseChat, 1, 0, "#0168")
	If _Sleep(500) Then Return
	ClickP($aAway, 1, 0, "#0167")
	checkMainScreen()
	checkAttackDisable($g_iTaBChkIdle)
	If Not GtfoTrain() Then Return
	chkShieldStatus(True, True)

	WinGetAndroidHandle()
	AndroidHomeButton()
	If _SleepStatus(3 * 1000 * 60) Then Return

	SendAdbCommand("shell am start -n " & $g_sAndroidGamePackage & "/" & $g_sAndroidGameClass)
	_GUICtrlStatusBar_SetText($g_hTxtLog, "")
	AndroidBotStartEvent()
	CheckMainScreen()
	CheckAttackDisable($g_iTaBChkIdle)
	ChkShieldStatus(True, True)
	RequestCC()
	ReArm()

	ClickP($aOpenChat, 1, 0, "#0168")
	If _Sleep(1000) Then Return

	CheckClanSettings()

EndFunc   ;==>ClanInviteIdleMode

Func CheckClanSettings()

	Click(1, 40, 1, 250)
	If _Sleep(500) Then Return
	If Not _CheckPixel($aChatTab, $g_bCapturePixel) Then ClickP($aOpenChat, 1, 0, "#0168") ; Clicks chat tab
	If _Sleep(1000) Then Return

	Click(150, 60)
	If _Sleep(250) Then Return
	Local $loopcount = 0

	While _ColorCheck( _GetPixelColor(60, 390, True), Hex(0xAADE52, 6), 20) == False ;- Check Green pixel on warlog Button
		If _Sleep(250) Then ExitLoop
		$loopcount += 1
		If $loopcount >= 20 Then
			$loopcount = 0
			Click(1, 40, 1, 250)
			SetLog("    Unable to Load Clan Page failed to restore clan Settings", $COLOR_RED)
			Return
		EndIf
	WEnd


	Local $sresultTrophies = ""
	If $bSetTrophies Then
		_captureregion()
		$sresultTrophies = getOcrAndCapture("coc-pbttime", 525, 292, 40, 16, True)
		$currClanTrophies = Number($sresultTrophies)
	EndIf

	Local $Res = "", $res1 = "", $ClanMode = "", $bsUpdateTrophies = False, $posPoint, $posPoint1
;~ 		If GUICtrlRead($chkClanOpen) = $GUI_CHECKED Then
	_captureregion()
	$Res = isImageVisible("ClanClosed", @ScriptDir & "\images\closed_0_0_85.bmp", "500,270,560,295")
	$res1 = isImageVisible("AnyOneCanJoin", @ScriptDir & "\images\AnyOneCanJoin_0_0_85.bmp", "520,270,560,295")
	If $res1 <> "" Then
		$posPoint = StringSplit($res1, ",")
		If $posPoint[0] = "0" Or $posPoint[0] = "" Then
			$ClanMode = ""
		Else
			$ClanMode = "Open"
		EndIf
	ElseIf $Res <> "" Then
		$posPoint1 = StringSplit($Res, ",")
		If $posPoint1[0] = "0" Or $posPoint1[0] = "" Then
			$ClanMode = ""
		Else
			$ClanMode = "Closed"
		EndIf
	Else
		$ClanMode = "Invite"
	EndIf
;~ 		EndIf

	If $bSetTrophies Then
		If $aUpdateTrophies <> $currClanTrophies Then
			Local $CurrentTrophiesIndex = _ArrayFindAll($aGtfoCanTrophies, $currClanTrophies)
			Local $SetTrophieIndex = _ArrayFindAll($aGtfoCanTrophies, $aUpdateTrophies)
			Local $diffIndexLevel = $SetTrophieIndex[0] - $CurrentTrophiesIndex[0]
			$bsUpdateTrophies = True
		EndIf
	EndIf

	If (($ClanMode <> "") And ($ClanMode <> "Open")) Or $bsUpdateTrophies Then
		Click(540, 385, 1, 500)
		_Sleep(500)
		Switch $ClanMode
			Case "Invite"
				Click(434, 393, 2, 500)
			Case "Closed"
				Click(434, 393, 1, 500)
			Case "Open"
				SetLog("Clan Is alrady in Open State", $COLOR_GREEN)
			Case Else
				SetLog("       Unknown error ", $COLOR_RED)
		EndSwitch
		_Sleep(500)

		If $bsUpdateTrophies Then
			If $diffIndexLevel < 0 Then
				$diffIndexLevel = (-1 * $diffIndexLevel)
				Click(545, 395, $diffIndexLevel, 500)
			Else
				Click(680, 395, $diffIndexLevel, 500)
			EndIf
			_Sleep(500)
		EndIf

		Click(425, 610, 1, 500)
		_Sleep(1000)
		Click(150, 60)
		_Sleep(500)

		ProcessFriendRequests()

	EndIf
EndFunc   ;==>CheckClanSettings

Func ProcessFriendRequests()

	Click(1, 40, 1, 250)
	If _Sleep(500) Then Return
	If Not _CheckPixel($aChatTab, $g_bCapturePixel) Then ClickP($aOpenChat, 1, 0, "#0168") ; Clicks chat tab
	If _Sleep(1000) Then Return

	Click(150, 60)
	If _Sleep(1000) Then Return
	Local $loopcount = 0

	While _ColorCheck( _GetPixelColor(60, 390, True), Hex(0xAADE52, 6), 20) == False ;- Check Green pixel on warlog Button
		If _Sleep(250) Then ExitLoop
		$loopcount += 1
		If $loopcount >= 20 Then
			$loopcount = 0
			Click(1, 40, 1, 250)
			SetLog("    Unable to Load Clan Page failed skipped friend request process", $COLOR_RED)
			Return
		EndIf
	WEnd

	If _ColorCheck( _GetPixelColor(775, 73, True), Hex(0xFFFFFF, 6), 20) == False Then
		Setlog("No Friend Request Found", $color_info)
		Click(700, 5, 1, 50)
		If _Sleep(250) Then Return
		Return
	EndIf

	Click(680, 85, 1, 250)
	If _Sleep(2000) Then Return
	Click(430, 140, 1, 250)
	If _Sleep(5000) Then Return
	Local $RequiredLevel = -1


	Switch GUICtrlRead($cmbFriendRequest)
		Case "Reject All"
			$RequiredLevel = -1
		Case "Accept All"
			$RequiredLevel = 0
		Case "Accept lvl 25+"
			$RequiredLevel = 25
		Case "Accept lvl 50+"
			$RequiredLevel = 50
		Case "Accept lvl 75+"
			$RequiredLevel = 75
		Case "Accept lvl 100+"
			$RequiredLevel = 100
		Case "Accept lvl 125+"
			$RequiredLevel = 125
		Case "Accept lvl 150+"
			$RequiredLevel = 150
		Case "Accept lvl 175+"
			$RequiredLevel = 175
		Case "Accept lvl 200+"
			$RequiredLevel = 200
		Case "Accept lvl 225+"
			$RequiredLevel = 225
		Case "Accept lvl 250+"
			$RequiredLevel = 250
	EndSwitch

;~ 	Setlog("Required Level " & $RequiredLevel )

	_captureregion()
	Local $Res = "", $res1 = "", $posPoint, $posPoint1
	$Res = isImageVisible("FriendAdd", @ScriptDir & "\images\friendNo_0_0_85.bmp", "450,480,630,510")
	If $Res <> "" Then
		Setlog("No Friend Request Found", $color_info)
		Click(700, 5, 1, 50)
		If _Sleep(250) Then Return
		Return
	EndIf

	_captureregion()
	Local $sCount = 0
	$Res = isImageVisible("FriendAdd", @ScriptDir & "\images\friendAdd_0_0_85.bmp", "730,170,770,600")
	While $Res <> "" Or $sCount < 10
		$sCount += 1
		$posPoint1 = StringSplit($Res, ",")
		If $posPoint1[0] = "0" Or $posPoint1[0] = "" Then
			Click(700, 5, 1, 50)
			If _Sleep(250) Then Return
			Return
		Else
			If $RequiredLevel = -1 Then
				Click($posPoint1[1] + 60, $posPoint1[2], 1, 50)
				If _Sleep(3000) Then Return
				Click(510, 420, 1, 50)
				If _Sleep(3000) Then Return
				Setlog("Friend Request Rejected", $COLOR_RED)
			Else
				$x_start = 176
				$y_start = $posPoint1[2] - 15
				Local $CurrentReqPlayerLvl = Number(getOcrAndCapture("coc-ms", $x_start, $y_start, 30, 20, True))
;~ 				SetLog("Player Level: " & getOcrAndCapture("coc-ms", $x_start, $y_start, 30, 20, True))
;~ 				SetLog("Player Level: " & getOcrAndCapture("coc-t-t", $x_start, $y_start, 30, 20, True))
;~ 				SetLog("Player Level: " & getOcrAndCapture("coc-qqtroop", $x_start, $y_start, 30, 20, True))
				If $CurrentReqPlayerLvl >= $RequiredLevel Then
					Click($posPoint1[1], $posPoint1[2], 1, 50)
					If _Sleep(3000) Then Return
					Click(510, 420, 1, 50)
					If _Sleep(3000) Then Return
					Setlog("Friend Request Accepted", $COLOR_GREEN)
				Else
					Click($posPoint1[1] + 60, $posPoint1[2], 1, 50)
					If _Sleep(3000) Then Return
					Click(510, 420, 1, 50)
					If _Sleep(3000) Then Return
					Setlog("Level: " & $CurrentReqPlayerLvl & " - Friend Request Rejected", $COLOR_RED)
				EndIf

			EndIf

		EndIf

		_captureregion()
		$Res = isImageVisible("FriendAdd", @ScriptDir & "\images\friendNo_0_0_85.bmp", "450,480,630,510")
		If $Res <> "" Then
			Setlog("No Friend Request Found", $color_info)
			Click(700, 5, 1, 50)
			If _Sleep(250) Then Return
			Return
		EndIf

		_captureregion()
		$Res = isImageVisible("FriendAdd", @ScriptDir & "\images\friendAdd_0_0_85.bmp", "730,170,770,600")
		If _Sleep(5000) Then Return
	WEnd



	Click(700, 5, 1, 50)
	If _Sleep(250) Then Return


EndFunc   ;==>ProcessFriendRequests

Func GtfoDetectSlotTroop($Type)

	Local $FullTemp, $sTmp

	Local $directory = @ScriptDir & "\imgxml\DonateCC\Troops"
	Local $directorySpells = @ScriptDir & "\imgxml\DonateCC\Spells"


	If $Type >= $eBarb And $Type <= $eBowl Then
		For $Slot = 0 To 5
			Local $x = 343 + (68 * $Slot)
			Local $y = $DonationWindowY + 37
			Local $x1 = $x + 75
			Local $y1 = $y + 43

			$FullTemp = SearchImgloc($directory, $x, $y, $x1, $y1)
			;$FullTemp = getOcrDonationTroopsDetection(343 + (68 * $Slot), $DonationWindowY + 37)

			If $g_bDebugSetlog Then Setlog("Slot: " & $Slot & " SearchImgloc returned >>" & $FullTemp[0] & "<<", $COLOR_DEBUG)
			If StringInStr($FullTemp[0] & " ", "empty") > 0 Then ExitLoop
			If $FullTemp[0] <> "" Then
				For $i = $eBarb To $eBowl
					$sTmp = StringStripWS(StringLeft(NameOfTroop($i), 4), $STR_STRIPTRAILING)
					;If $g_bDebugSetlog Then Setlog(NameOfTroop($i) & " = " & $sTmp, $COLOR_DEBUG)
					If StringInStr($FullTemp[0] & " ", $sTmp) > 0 Then
						If $g_bDebugSetlog Then Setlog("Detected " & NameOfTroop($i), $COLOR_DEBUG)
						If $Type = $i Then Return $Slot
						ExitLoop
					EndIf
					If $i = $eBowl Then ; detection failed
						If $g_bDebugSetlog Then Setlog("Slot: " & $Slot & "Troop Detection Failed", $COLOR_DEBUG)
					EndIf
				Next
			EndIf
		Next
		For $Slot = 6 To 11
			Local $x = 343 + (68 * ($Slot - 6))
			Local $y = $DonationWindowY + 124
			Local $x1 = $x + 75
			Local $y1 = $y + 43

			$FullTemp = SearchImgloc($directory, $x, $y, $x1, $y1)
			;$FullTemp = getOcrDonationTroopsDetection(343 + (68 * ($Slot - 6)), $DonationWindowY + 124)

			If $g_bDebugSetlog Then Setlog("Slot: " & $Slot & " SearchImgloc returned >>" & $FullTemp[0] & "<<", $COLOR_DEBUG)
			If StringInStr($FullTemp[0] & " ", "empty") > 0 Then ExitLoop
			If $FullTemp[0] <> "" Then
				For $i = $eBall To $eBowl
					$sTmp = StringStripWS(StringLeft(NameOfTroop($i), 4), $STR_STRIPTRAILING)
					;If $g_bDebugSetlog Then Setlog(NameOfTroop($i) & " = " & $sTmp, $COLOR_DEBUG)
					If StringInStr($FullTemp[0] & " ", $sTmp) > 0 Then
						If $g_bDebugSetlog Then Setlog("Detected " & NameOfTroop($i), $COLOR_DEBUG)
						If $Type = $i Then Return $Slot
						ExitLoop
					EndIf
					If $i = $eBowl Then ; detection failed
						If $g_bDebugSetlog Then Setlog("Slot: " & $Slot & "Troop Detection Failed", $COLOR_DEBUG)
					EndIf
				Next
			EndIf
		Next
	EndIf
	If $Type >= $eLSpell And $Type <= $eSkSpell Then
		For $Slot = 12 To 17
			Local $x = 343 + (68 * ($Slot - 12))
			Local $y = $DonationWindowY + 241
			Local $x1 = $x + 75
			Local $y1 = $y + 43

			$FullTemp = SearchImgloc($directorySpells, $x, $y, $x1, $y1)
			;$FullTemp = getOcrDonationTroopsDetection(343 + (68 * ($Slot - 12)), $DonationWindowY + 241)

			If $g_bDebugSetlog Then Setlog("Slot: " & $Slot & " SearchImgloc returned >>" & $FullTemp[0] & "<<", $COLOR_DEBUG)
			If StringInStr($FullTemp[0] & " ", "empty") > 0 Then ExitLoop
			If $FullTemp[0] <> "" Then
				For $i = $eLSpell To $eSkSpell
					$sTmp = StringLeft(NameOfTroop($i), 4)
					;If $g_bDebugSetlog Then Setlog(NameOfTroop($i) & " = " & $sTmp, $COLOR_DEBUG)
					If StringInStr($FullTemp[0] & " ", $sTmp) > 0 Then
						If $g_bDebugSetlog Then Setlog("Detected " & NameOfTroop($i), $COLOR_DEBUG)
						If $Type = $i Then Return $Slot
						ExitLoop
					EndIf
					If $i = $eSkSpell Then ; detection failed
						If $g_bDebugSetlog Then Setlog("Slot: " & $Slot & "Spell Detection Failed", $COLOR_DEBUG)
					EndIf
				Next
			EndIf
		Next
	EndIf

	Return -1

EndFunc   ;==>GtfoDetectSlotTroop

