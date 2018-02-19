; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Control MOD
; Description ...: This file controls the "MOD" tab
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: Team AiO MOD++ (2017)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2018
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
#include-once

; CSV Downloder - Persian MOD (-#32)
#include "MOD GUI Control - CSV Downloader.au3"

; GTFO - Persian MOD (-#31)
#include <ListboxConstants.au3>

Func Bridge()
    If _GUICtrlComboBox_GetCurSel($g_hCmbStandardDropSidesDB) = 4 Then
            GUICtrlSetState($g_hChkSmartAttackRedAreaDB, $GUI_UNCHECKED)
		    GUICtrlSetState($g_hChkRandomSpeedAtkDB, $GUI_UNCHECKED)
		    chkRandomSpeedAtkDB()
		For $i = $g_hChkRandomSpeedAtkDB To $g_hPicAttackNearDarkElixirDrillDB
			GUICtrlSetState($i, $GUI_DISABLE + $GUI_HIDE)
		Next
		For $i = $g_hGrpSettings To $g_hTxtWaveFactor
			GUICtrlSetState($i, $GUI_SHOW)
	    Next
	Else
		For $i = $g_hChkRandomSpeedAtkDB To $g_hPicAttackNearDarkElixirDrillDB
			GUICtrlSetState($i, $GUI_ENABLE + $GUI_SHOW)
		Next

	    For $i = $g_hGrpSettings To $g_hTxtWaveFactor
			GUICtrlSetState($i, $GUI_HIDE)
	    Next
        chkSmartAttackRedAreaDB()
	EndIf
	cmbDBMultiFinger() ; Multi Finger - Persian MOD (#-04)

EndFunc   ;==>Bridge

; Unit/Wave Factor - Persian MOD (#-05)
Func cmbGiantSlot()
	If $g_iChkGiantSlot = 1 Then
		Switch _GUICtrlComboBox_GetCurSel($g_hCmbGiantSlot)
			Case 0
				$g_aiSlotsGiants = 0
			Case 1
				$g_aiSlotsGiants = 2
		EndSwitch
	Else
	LocaL $GiantComp = $g_ahTxtTrainArmyTroopCount[$eTroopGiant]
		If Number($GiantComp) >= 1 And Number($GiantComp) <= 7 Then $g_aiSlotsGiants = 1
		If Number($GiantComp) >= 8 Then $g_aiSlotsGiants = 2 ; will be split in 2 slots, when >16 or >=8 with FF
		If Number($GiantComp) >= 12 Then $g_aiSlotsGiants = 0 ; spread on vector, when >20 or >=12 with FF
	EndIf
EndFunc   ;==>cmbGiantSlot

Func chkGiantSlot()
	GUICtrlSetState($g_hCmbGiantSlot, GUICtrlRead($g_hChkGiantSlot) = $GUI_CHECKED ? $GUI_ENABLE : $GUI_DISABLE)
EndFunc   ;==>chkGiantSlot

Func chkUnitFactor()
	GUICtrlSetState($g_hTxtUnitFactor, GUICtrlRead($g_hChkUnitFactor) = $GUI_CHECKED ? $GUI_ENABLE : $GUI_DISABLE)
EndFunc   ;==>chkUnitFactor

Func chkWaveFactor()
	GUICtrlSetState($g_hTxtWaveFactor, GUICtrlRead($g_hChkWaveFactor) = $GUI_CHECKED ? $GUI_ENABLE : $GUI_DISABLE)
EndFunc   ;==>chkWaveFactor

; Auto Dock, Hide Emulator & Bot - Persian MOD (#-07)
Func chkEnableAuto()
	If GUICtrlRead($g_hChkEnableAuto) = $GUI_CHECKED Then
		$g_bEnableAuto = True
		_GUI_Value_STATE("ENABLE", $g_hChkAutoDock & "#" & $g_hChkAutoHideEmulator)
	Else
		$g_bEnableAuto = False
		_GUI_Value_STATE("DISABLE", $g_hChkAutoDock & "#" & $g_hChkAutoHideEmulator)
	EndIf
EndFunc   ;==>chkEnableAuto

Func btnEnableAuto()
	If $g_bEnableAuto = True Then
		If GUICtrlRead($g_hChkAutoDock) = $GUI_CHECKED Then
			$g_iChkAutoDock = True
			$g_iChkAutoHideEmulator = False
		ElseIf GUICtrlRead($g_hChkAutoHideEmulator) = $GUI_CHECKED Then
			$g_iChkAutoDock = False
			$g_iChkAutoHideEmulator = True
		EndIf
	Else
		$g_iChkAutoDock = False
		$g_iChkAutoHideEmulator = False
	EndIf
EndFunc   ;==>btnEnableAuto

; Switch Accounts - Persian MOD (#-12)
Func UpdateMultiStats()
	Local $bEnableSwitchAcc = $g_iCmbSwitchAcc > 0
	Local $iCmbTotalAcc = _GUICtrlComboBox_GetCurSel($g_hCmbTotalAccount) + 1 ; combobox data starts with 2
	For $i = 0 To 7
		If $bEnableSwitchAcc And $i <= $iCmbTotalAcc Then
			For $j = $g_ahGrpVillageAcc[$i] To $g_ahLblHourlyStatsTrophyAcc[$i]
				GUICtrlSetState($j, $GUI_SHOW)
			Next
			If GUICtrlRead($g_ahChkAccount[$i]) = $GUI_CHECKED Then
				If GUICtrlRead($g_ahChkDonate[$i]) = $GUI_UNCHECKED Then
					GUICtrlSetData($g_ahGrpVillageAcc[$i], GUICtrlRead($g_ahCmbProfile[$i]) & " (Active)")
				Else
					GUICtrlSetData($g_ahGrpVillageAcc[$i], GUICtrlRead($g_ahCmbProfile[$i]) & " (Donate)")
				EndIf

			Else
				GUICtrlSetData($g_ahGrpVillageAcc[$i], GUICtrlRead($g_ahCmbProfile[$i]) & " (Idle)")
			EndIf
		Else
			For $j = $g_ahGrpVillageAcc[$i] To $g_ahLblHourlyStatsTrophyAcc[$i]
				GUICtrlSetState($j, $GUI_HIDE)
			Next
		EndIf
	Next
EndFunc   ;==>UpdateMultiStats

Func chkSwitchAcc()
	If GUICtrlRead($g_hChkSwitchAcc) = $GUI_CHECKED And aquireSwitchAccountMutex($g_iCmbSwitchAcc, False, True) Then
		For $i = $g_hCmbTotalAccount To $g_ahChkDonate[7]
			GUICtrlSetState($i, $GUI_ENABLE)
		Next
		_GUI_Value_STATE("ENABLE", $g_ahChk_BotTypeMax[0] & "#" & $g_ahChk_BotTypeMax[1] & "#" & $g_ahChk_BotTypeMax[2] & "#" & $g_ahChk_BotTypeMax[3] & "#" & $g_ahChk_BotTypeMin[0] & "#" & $g_ahChk_BotTypeMin[1] & "#" & $g_ahChk_BotTypeMin[2] & "#" & $g_ahChk_BotTypeMin[3])
		For $i = 0 To 7
			GUICtrlSetState($g_ahChkSetFarm[$i], $GUI_ENABLE)
		Next
		chkSwitchBotType()
		chkSmartSwitch()
	Else
		releaseSwitchAccountMutex()
		For $i = $g_hCmbTotalAccount To $g_ahChkDonate[7]
			GUICtrlSetState($i, $GUI_DISABLE)
		Next
		_GUI_Value_STATE("UNCHECKED", $g_ahChk_BotTypeMax[0] & "#" & $g_ahChk_BotTypeMax[1] & "#" & $g_ahChk_BotTypeMax[2] & "#" & $g_ahChk_BotTypeMax[3] & "#" & $g_ahChk_BotTypeMin[0] & "#" & $g_ahChk_BotTypeMin[1] & "#" & $g_ahChk_BotTypeMin[2] & "#" & $g_ahChk_BotTypeMin[3])
		_GUI_Value_STATE("DISABLE", $g_ahChk_BotTypeMax[0] & "#" & $g_ahChk_BotTypeMax[1] & "#" & $g_ahChk_BotTypeMax[2] & "#" & $g_ahChk_BotTypeMax[3] & "#" & $g_ahChk_BotTypeMin[0] & "#" & $g_ahChk_BotTypeMin[1] & "#" & $g_ahChk_BotTypeMin[2] & "#" & $g_ahChk_BotTypeMin[3])
		For $i = 0 To 7
			For $j = $g_ahChkSetFarm[$i] To $g_ahCmbTime2[$i]
				GUICtrlSetState($j, $GUI_UNCHECKED + $GUI_DISABLE)
			Next
		Next
	EndIf
EndFunc   ;==>chkSwitchAcc

Func cmbSwitchAcc()
	Return _cmbSwitchAcc()
EndFunc   ;==>cmbSwitchAcc

Func _cmbSwitchAcc($bReadSaveConfig = True)
	Static $s_bActive = False
	If $s_bActive Then Return
	$s_bActive = True
	Local $iCmbSwitchAcc = _GUICtrlComboBox_GetCurSel($g_hCmbSwitchAcc)
	Local $bAcquired = aquireSwitchAccountMutex($iCmbSwitchAcc, False, True)
	Local $bEnable = False
	If $iCmbSwitchAcc And $bAcquired Then
		$bEnable = True
	Else
		If $g_iCmbSwitchAcc And $iCmbSwitchAcc = 0 Then
			; No Switch Accounts selected, check if current profile was enabled and disable if so
			For $i = 0 To UBound($g_ahChkDonate) - 7
				If GUICtrlRead($g_ahChkAccount[$i]) = $GUI_CHECKED And GUICtrlRead($g_ahCmbProfile[$i]) = $g_sProfileCurrentName Then
					SetLog("Disabled Profile " & $g_sProfileCurrentName & " in Group " & $g_iCmbSwitchAcc)
					SetSwitchAccLog("Disabled Profile " & $g_sProfileCurrentName & " in Group " & $g_iCmbSwitchAcc)
					GUICtrlSetState($g_ahChkAccount[$i], $GUI_UNCHECKED)
					ExitLoop
				EndIf
			Next
		EndIf
		If $iCmbSwitchAcc And Not $bAcquired Then
			$iCmbSwitchAcc = $g_iCmbSwitchAcc
			_GUICtrlComboBox_SetCurSel($g_hCmbSwitchAcc, $iCmbSwitchAcc)
			$bAcquired = aquireSwitchAccountMutex($iCmbSwitchAcc, False, True)
			$bEnable = $bAcquired
		EndIf
	EndIf

	; load selected config
	If $bReadSaveConfig Then
		If $g_iCmbSwitchAcc Then
			; temp restore old selection for saving
			SetLog("Save Switch Accounts Group " & $g_iCmbSwitchAcc)
			SetSwitchAccLog("Save Group " & $g_iCmbSwitchAcc)
			_GUICtrlComboBox_SetCurSel($g_hCmbSwitchAcc, $g_iCmbSwitchAcc)
			SaveConfig_SwitchAcc()
			_GUICtrlComboBox_SetCurSel($g_hCmbSwitchAcc, $iCmbSwitchAcc)
		EndIf
		$g_iCmbSwitchAcc = $iCmbSwitchAcc
		If $g_iCmbSwitchAcc Then
			SetLog("Read Switch Accounts Group " & $g_iCmbSwitchAcc)
			SetSwitchAccLog("Read Group " & $g_iCmbSwitchAcc)
		EndIf
		ReadConfig_SwitchAccounts()
		ApplyConfig_SwitchAcc("Read")
	Else
		$g_iCmbSwitchAcc = $iCmbSwitchAcc
	EndIf

	If $bEnable And GUICtrlRead($g_hChkSwitchAcc) = $GUI_UNCHECKED Then
		$bEnable = False
	EndIf

	GUICtrlSetState($g_hChkSwitchAcc, (($bEnable Or ($iCmbSwitchAcc And $bAcquired)) ? $GUI_ENABLE : $GUI_DISABLE))
	For $i = $g_hCmbTotalAccount To $g_ahChkDonate[7]
		GUICtrlSetState($i, (($bEnable) ? $GUI_ENABLE : $GUI_DISABLE))
	Next
	cmbTotalAcc()
	chkSmartSwitch()
	$s_bActive = False
EndFunc   ;==>_cmbSwitchAcc

Func cmbTotalAcc()
	Local $iCmbTotalAcc = _GUICtrlComboBox_GetCurSel($g_hCmbTotalAccount) + 1 ; combobox data starts with 2
	For $i = 0 To 7
		If $iCmbTotalAcc >= 0 And $i <= $iCmbTotalAcc Then
			_GUI_Value_STATE("SHOW", $g_ahChkAccount[$i] & "#" & $g_ahCmbProfile[$i] & "#" & $g_ahChkDonate[$i])
			For $j = $g_ahChkSetFarm[$i] To $g_ahCmbTime2[$i]
				GUICtrlSetState($j, $GUI_SHOW)
			Next
		ElseIf $i > $iCmbTotalAcc Then
			GUICtrlSetState($g_ahChkAccount[$i], $GUI_UNCHECKED)
			_GUI_Value_STATE("HIDE", $g_ahChkAccount[$i] & "#" & $g_ahCmbProfile[$i] & "#" & $g_ahChkDonate[$i])
			For $j = $g_ahChkSetFarm[$i] To $g_ahCmbTime2[$i]
				GUICtrlSetState($j, $GUI_HIDE)
			Next
		EndIf
		chkAccount($i)
	Next
	cmbChkSetFarm()
EndFunc   ;==>cmbTotalAcc

Func chkSmartSwitch()
	If GUICtrlRead($g_hChkSmartSwitch) = $GUI_CHECKED Then
		GUICtrlSetState($g_hChkDonateLikeCrazy, $GUI_ENABLE)
	Else
		GUICtrlSetState($g_hChkDonateLikeCrazy, $GUI_UNCHECKED)
		GUICtrlSetState($g_hChkDonateLikeCrazy, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkSmartSwitch

Func chkAccount($i)
	If GUICtrlRead($g_ahChkAccount[$i]) = $GUI_CHECKED Then
		_GUI_Value_STATE("ENABLE", $g_ahCmbProfile[$i] & "#" & $g_ahChkDonate[$i])
		SwitchAccountCheckProfileInUse($g_asProfileName[$i])
	Else
;~ 		GUICtrlSetState($g_ahChkDonate[$i], $GUI_UNCHECKED)
		_GUI_Value_STATE("DISABLE", $g_ahCmbProfile[$i] & "#" & $g_ahChkDonate[$i])
	EndIf
EndFunc   ;==>chkAccount

Func chkAccountX()
	For $i = 0 To UBound($g_ahChkAccount) - 1
		If @GUI_CtrlId = $g_ahChkAccount[$i] Then
			Return chkAccount($i)
		EndIf
	Next
EndFunc   ;==>chkAccountX

Func cmbSwitchAccProfile($i)
	; check if switch with other
	Local $sOldProfile = $g_asProfileName[$i]
	Local $sNewProfile = GUICtrlRead($g_ahCmbProfile[$i])

	SwitchAccountCheckProfileInUse($sNewProfile)

	Local $sOthProfile
	If $sNewProfile Then
		For $j = 0 To UBound($g_ahCmbProfile) - 1
			If $j <> $i Then
				$sOthProfile = GUICtrlRead($g_ahCmbProfile[$j]) ; $g_asProfileName[$j]
				If $sOthProfile = $sNewProfile Then
					; switch
					;_GUICtrlComboBox_SetCurSel($g_ahCmbProfile[$i], _GUICtrlComboBox_FindStringExact($g_ahCmbProfile[$i], $g_asProfileName[$i]))
					;$g_asProfileName[$j] = ""
					; clear other
					;_GUICtrlComboBox_SetCurSel($g_ahCmbProfile[$j], 0)
					; set other
					$g_asProfileName[$j] = $sOldProfile
					_GUICtrlComboBox_SetCurSel($g_ahCmbProfile[$j], _GUICtrlComboBox_FindStringExact($g_ahCmbProfile[$j], $sOldProfile))
					ExitLoop
				EndIf
			EndIf
		Next
	EndIf
	$g_asProfileName[$i] = $sNewProfile
EndFunc   ;==>cmbSwitchAccProfile

Func cmbSwitchAccProfileX()
	For $i = 0 To UBound($g_ahCmbProfile) - 1
		If @GUI_CtrlId = $g_ahCmbProfile[$i] Then
			Return cmbSwitchAccProfile($i)
		EndIf
	Next
EndFunc   ;==>cmbSwitchAccProfileX

Func chkSharedPrefs()
	$g_bChkSharedPrefs = GUICtrlRead($g_hChkSharedPrefs) = $GUI_CHECKED
EndFunc   ;==>chkSharedPrefs

; Smart Train - Persian MOD (#-13)
Func chkSmartTrain()
	If GUICtrlRead($g_hchkSmartTrain) = $GUI_CHECKED Then
		If GUICtrlRead($g_hChkUseQuickTrain) = $GUI_UNCHECKED Then _GUI_Value_STATE("ENABLE", $g_hchkPreciseTroops)
		_GUI_Value_STATE("ENABLE", $g_hchkFillArcher & "#" & $g_hchkFillEQ)
		chkPreciseTroops()
		chkFillArcher()
	Else
		_GUI_Value_STATE("DISABLE", $g_hchkPreciseTroops & "#" & $g_hchkFillArcher & "#" & $g_htxtFillArcher & "#" & $g_hchkFillEQ)
		_GUI_Value_STATE("UNCHECKED", $g_hchkPreciseTroops & "#" & $g_hchkFillArcher & "#" & $g_hchkFillEQ)
	EndIf
EndFunc   ;==>chkSmartTrain

Func chkPreciseTroops()
	If GUICtrlRead($g_hchkPreciseTroops) = $GUI_CHECKED Then
		_GUI_Value_STATE("DISABLE", $g_hchkFillArcher & "#" & $g_hchkFillEQ)
		_GUI_Value_STATE("UNCHECKED", $g_hchkFillArcher & "#" & $g_hchkFillEQ)
		chkFillArcher()
	Else
		_GUI_Value_STATE("ENABLE", $g_hchkFillArcher & "#" & $g_hchkFillEQ)
	EndIf
EndFunc   ;==>chkPreciseTroops

Func chkFillArcher()
	If GUICtrlRead($g_hchkFillArcher) = $GUI_CHECKED Then
		_GUI_Value_STATE("ENABLE", $g_htxtFillArcher)
	Else
		_GUI_Value_STATE("DISABLE", $g_htxtFillArcher)
	EndIf
EndFunc   ;==>chkFillArcher

; Forecast - Persian MOD (#-17)
Func chkForecastBoost()
	_GUICtrlEdit_SetReadOnly($g_hTxtForecastBoost, GUICtrlRead($g_hChkForecastBoost) = $GUI_CHECKED ? False : True)
EndFunc   ;==>chkForecastBoost

Func chkForecastPause()
	_GUICtrlEdit_SetReadOnly($g_hTxtForecastPause, GUICtrlRead($g_hChkForecastPause) = $GUI_CHECKED ? False : True)
EndFunc   ;==>chkForecastPause

Func chkForecastHopingSwitch()
	_GUICtrlEdit_SetReadOnly($g_hTxtForecastHopingSwitchMax, GUICtrlRead($g_hChkForecastHopingSwitchMax) = $GUI_CHECKED ? False : True)
	_GUICtrlEdit_SetReadOnly($g_hTxtForecastHopingSwitchMin, GUICtrlRead($g_hChkForecastHopingSwitchMin) = $GUI_CHECKED ? False : True)
EndFunc   ;==>chkForecastHopingSwitch

Func cmbSwLang()
	Switch GUICtrlRead($g_hCmbSwLang)
		Case "EN"
			setForecast2()
		Case "RU"
			setForecast3()
		Case "FR"
			setForecast4()
		Case "DE"
			setForecast5()
		Case "ES"
			setForecast6()
		Case "FA"
			setForecast7()
		Case "PT"
			setForecast8()
		Case "IN"
			setForecast9()
	EndSwitch
EndFunc   ;==>cmbSwLang

; Switch Profile - Persian MOD (#-25)
Func btnRecycle()
	FileDelete($g_sProfileConfigPath)
	saveConfig()
	SetLog("Profile " & $g_sProfileCurrentName & " was recycled with success", $COLOR_GREEN)
	SetLog("All unused settings were removed", $COLOR_GREEN)
EndFunc   ;==>btnRecycle

Func chkSwitchProfile()
	For $i = 0 To 3
		If GUICtrlRead($g_ahChk_SwitchMax[$i]) = $GUI_CHECKED Then
			GUICtrlSetState($g_ahCmb_SwitchMax[$i], $GUI_ENABLE)
		Else
			GUICtrlSetState($g_ahCmb_SwitchMax[$i], $GUI_DISABLE)
		EndIf
		If GUICtrlRead($g_ahChk_SwitchMin[$i]) = $GUI_CHECKED Then
			GUICtrlSetState($g_ahCmb_SwitchMin[$i], $GUI_ENABLE)
		Else
			GUICtrlSetState($g_ahCmb_SwitchMin[$i], $GUI_DISABLE)
		EndIf
	Next
EndFunc   ;==>chkSwitchProfile

Func chkSwitchBotType()
	For $i = 0 To 3
		If GUICtrlRead($g_ahChk_BotTypeMax[$i]) = $GUI_CHECKED Then
			GUICtrlSetState($g_ahCmb_BotTypeMax[$i], $GUI_ENABLE)
		Else
			GUICtrlSetState($g_ahCmb_BotTypeMax[$i], $GUI_DISABLE)
		EndIf
		If GUICtrlRead($g_ahChk_BotTypeMin[$i]) = $GUI_CHECKED Then
			GUICtrlSetState($g_ahCmb_BotTypeMin[$i], $GUI_ENABLE)
		Else
			GUICtrlSetState($g_ahCmb_BotTypeMin[$i], $GUI_DISABLE)
		EndIf
	Next
EndFunc   ;==>chkSwitchBotType

; Check Grand Warden Mode - Persian MOD (#-26)
Func chkCheckWardenMode()
	$g_bCheckWardenMode = (GUICtrlRead($g_hChkCheckWardenMode) = $GUI_CHECKED)
	GUICtrlSetState($g_hCmbCheckWardenMode, $g_bCheckWardenMode ? $GUI_ENABLE : $GUI_DISABLE)
EndFunc   ;==>chkCheckWardenMode

; Restart Search Legend league - Persian MOD (#-29)
Func chkSearchTimeout()
	If GUICtrlRead($g_hChkSearchTimeout) = $GUI_CHECKED Then
		_GUI_Value_STATE("ENABLE", $g_hLblSearchTimeout & "#" & $g_hTxtSearchTimeout & "#" & $g_hLblSearchTimeoutminutes)
	Else
		_GUI_Value_STATE("DISABLE", $g_hLblSearchTimeout & "#" & $g_hTxtSearchTimeout & "#" & $g_hLblSearchTimeoutminutes)
	EndIf
EndFunc   ;==>chkSearchTimeout

; Stop on Low battery - Persian MOD (#-30)
Func _BatteryStatus()
	Local $aData = _WinAPI_GetSystemPowerStatus()
	If @error Then Return

	If BitAND($aData[1], 128) Then
		$aData[0] = '!!'
	Else
		Switch $aData[0]; ac or battery
			Case 0
				$aData[0] = 'BATT'
			Case 1
				$aData[0] = 'AC'
			Case Else
				$aData[0] = '--'
		EndSwitch

		If $aData[0] = 'BATT' Then
			SetLog("Battery/Charging: " & $aData[0] & " Battery status: " & $aData[2] & "%")
			GUICtrlSetData($g_hLblBatteryAC, $aData[0])
			GUICtrlSetData($g_hLblBatteryStatus, $aData[2] & "%")

			If $aData[2] < $g_iStopOnBatt Then
				SetLog("Battery status: " & $aData[2] & "% and is below than " & $g_iStopOnBatt & "%", $COLOR_WARNING)
				SetLog("Stopping bot", $COLOR_ACTION1)
				PoliteCloseCoC()
				CloseAndroid(_BatteryStatus)
				BotStop()
			EndIf
		EndIf
	EndIf
EndFunc   ;==>_BatteryStatus

Func chkStopOnBatt()
	If GUICtrlRead($g_hChkStopOnBatt) = $GUI_CHECKED Then
		_GUI_Value_STATE("ENABLE", $g_hTxtStopOnBatt & "#" & $g_hLblStopOnBatt)
	Else
		_GUI_Value_STATE("DISABLE", $g_hTxtStopOnBatt & "#" & $g_hLblStopOnBatt)
	EndIf
EndFunc   ;==>chkStopOnBatt
