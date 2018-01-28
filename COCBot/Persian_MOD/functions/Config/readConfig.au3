; #FUNCTION# ====================================================================================================================
; Name ..........: readConfig.au3
; Description ...: Reads config file and sets variables
; Syntax ........: readConfig()
; Parameters ....: NA
; Return values .: NA
; Author ........: Persian MOD (2018)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2018
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func ReadConfig_MOD()
	; <><><> Persian MOD (2018) <><><>

	; Unit/Wave Factor - Persian MOD (#-05)
	IniReadS($g_iChkGiantSlot, $g_sProfileConfigPath, "SetSleep", "EnableGiantSlot", $g_iChkGiantSlot, "int")
	IniReadS($g_iCmbGiantSlot, $g_sProfileConfigPath, "SetSleep", "CmbGiantSlot", $g_iCmbGiantSlot ,"int")

	IniReadS($g_iChkUnitFactor, $g_sProfileConfigPath, "SetSleep", "EnableUnitFactor", $g_iChkUnitFactor, "int")
	IniReadS($g_iTxtUnitFactor, $g_sProfileConfigPath, "SetSleep", "UnitFactor", $g_iTxtUnitFactor, "int")

	IniReadS($g_iChkWaveFactor, $g_sProfileConfigPath, "SetSleep", "EnableWaveFactor", $g_iChkWaveFactor, "int")
	IniReadS($g_iTxtWaveFactor, $g_sProfileConfigPath, "SetSleep", "WaveFactor", $g_iTxtWaveFactor, "int")

	; Auto Dock, Hide Emulator & Bot - Persian MOD (#-07)
	IniReadS($g_bEnableAuto, $g_sProfileConfigPath, "general", "EnableAuto", $g_bEnableAuto, "Bool")
	IniReadS($g_iChkAutoDock, $g_sProfileConfigPath, "general", "AutoDock", $g_iChkAutoDock, "Bool")
	IniReadS($g_iChkAutoHideEmulator, $g_sProfileConfigPath, "general", "AutoHide", $g_iChkAutoHideEmulator, "Bool")
	IniReadS($g_iChkAutoMinimizeBot, $g_sProfileConfigPath, "general", "AutoMinimize", $g_iChkAutoMinimizeBot, "Bool")

	; Check Collector Outside - Persian MOD (#-08)
	IniReadS($g_bDBMeetCollOutside, $g_sProfileConfigPath, "search", "DBMeetCollOutside", $g_bDBMeetCollOutside, "Bool")
	IniReadS($g_iTxtDBMinCollOutsidePercent, $g_sProfileConfigPath, "search", "TxtDBMinCollOutsidePercent", $g_iTxtDBMinCollOutsidePercent, "int")

	IniReadS($g_bDBCollectorsNearRedline, $g_sProfileConfigPath, "search", "DBCollectorsNearRedline", $g_bDBCollectorsNearRedline, "int")
	IniReadS($g_iCmbRedlineTiles, $g_sProfileConfigPath, "search", "CmbRedlineTiles", $g_iCmbRedlineTiles, "int")

	IniReadS($g_bSkipCollectorCheck, $g_sProfileConfigPath, "search", "SkipCollectorCheck", $g_bSkipCollectorCheck, "int")
	IniReadS($g_iTxtSkipCollectorGold, $g_sProfileConfigPath, "search", "TxtSkipCollectorGold", $g_iTxtSkipCollectorGold, "int")
	IniReadS($g_iTxtSkipCollectorElixir, $g_sProfileConfigPath, "search", "TxtSkipCollectorElixir", $g_iTxtSkipCollectorElixir, "int")
	IniReadS($g_iTxtSkipCollectorDark, $g_sProfileConfigPath, "search", "TxtSkipCollectorDark", $g_iTxtSkipCollectorDark, "int")

	IniReadS($g_bSkipCollectorCheckTH, $g_sProfileConfigPath, "search", "SkipCollectorCheckTH", $g_bSkipCollectorCheckTH, "int")
	IniReadS($g_iCmbSkipCollectorCheckTH, $g_sProfileConfigPath, "search", "CmbSkipCollectorCheckTH", $g_iCmbSkipCollectorCheckTH, "int")

	; CSV Deploy Speed - Persian MOD (#-09)
	IniReadS($icmbCSVSpeed[$LB], $g_sProfileConfigPath, "CSV Speed", "cmbCSVSpeed[LB]", $icmbCSVSpeed[$LB], "int")
	IniReadS($icmbCSVSpeed[$DB], $g_sProfileConfigPath, "CSV Speed", "cmbCSVSpeed[DB]", $icmbCSVSpeed[$DB], "int")
	For $i = $DB To $LB
		If $icmbCSVSpeed[$i] < 5 Then
			$g_CSVSpeedDivider[$i] = 0.5 + $icmbCSVSpeed[$i] * 0.25        ; $g_CSVSpeedDivider = 0.5, 0.75, 1, 1.25, 1.5
		Else
			$g_CSVSpeedDivider[$i] = 2 + $icmbCSVSpeed[$i] - 5            ; $g_CSVSpeedDivider = 2, 3, 4, 5
		EndIf
	Next

	; Smart Train - Persian MOD (#-13)
	IniReadS($ichkSmartTrain, $g_sProfileConfigPath, "SmartTrain", "Enable", 0, "int")
	IniReadS($ichkPreciseTroops, $g_sProfileConfigPath, "SmartTrain", "PreciseTroops", 0, "int")
	IniReadS($ichkFillArcher, $g_sProfileConfigPath, "SmartTrain", "ChkFillArcher", 0, "int")
	IniReadS($iFillArcher, $g_sProfileConfigPath, "SmartTrain", "FillArcher", 5, "int")
	IniReadS($ichkFillEQ, $g_sProfileConfigPath, "SmartTrain", "FillEQ", 0, "int")
	$g_bChkMultiClick = (IniRead($g_sProfileConfigPath, "other", "ChkMultiClick", "0") = "1")

	; Bot Humanization - Persian MOD (#-15)
	IniReadS($g_ichkUseBotHumanization, $g_sProfileConfigPath, "Bot Humanization", "chkUseBotHumanization", $g_ichkUseBotHumanization, "int")
	IniReadS($g_ichkUseAltRClick, $g_sProfileConfigPath, "Bot Humanization", "chkUseAltRClick", $g_ichkUseAltRClick, "int")
	IniReadS($g_ichkCollectAchievements, $g_sProfileConfigPath, "Bot Humanization", "chkCollectAchievements", $g_ichkCollectAchievements, "int")
	IniReadS($g_ichkLookAtRedNotifications, $g_sProfileConfigPath, "Bot Humanization", "chkLookAtRedNotifications", $g_ichkLookAtRedNotifications, "int")
	For $i = 0 To 12
		IniReadS($g_iacmbPriority[$i], $g_sProfileConfigPath, "Bot Humanization", "cmbPriority[" & $i & "]", $g_iacmbPriority[$i], "int")
	Next
	For $i = 0 To 1
		IniReadS($g_iacmbMaxSpeed[$i], $g_sProfileConfigPath, "Bot Humanization", "cmbMaxSpeed[" & $i & "]", $g_iacmbMaxSpeed[$i], "int")
	Next
	For $i = 0 To 1
		IniReadS($g_iacmbPause[$i], $g_sProfileConfigPath, "Bot Humanization", "cmbPause[" & $i & "]", $g_iacmbPause[$i], "int")
	Next
	For $i = 0 To 1
		IniReadS($g_iahumanMessage[$i], $g_sProfileConfigPath, "Bot Humanization", "humanMessage[" & $i & "]", $g_iahumanMessage[$i])
	Next
	IniReadS($g_icmbMaxActionsNumber, $g_sProfileConfigPath, "Bot Humanization", "cmbMaxActionsNumber", $g_icmbMaxActionsNumber, "int")
	IniReadS($g_ichallengeMessage, $g_sProfileConfigPath, "Bot Humanization", "challengeMessage", $g_ichallengeMessage)

	; Forecast - Persian MOD (#-17)
	IniReadS($g_bChkForecastBoost, $g_sProfileConfigPath, "forecast", "ChkForecastBoost", False, "Bool")
	IniReadS($g_iTxtForecastBoost, $g_sProfileConfigPath, "forecast", "TxtForecastBoost", 6, "int")
	IniReadS($g_bChkForecastPause, $g_sProfileConfigPath, "forecast", "ChkForecastPause", False, "Bool")
	IniReadS($g_iTxtForecastPause, $g_sProfileConfigPath, "forecast", "TxtForecastPause", 2, "int")

	IniReadS($g_bChkForecastHopingSwitchMax, $g_sProfileConfigPath, "forecast", "ChkForecastHopingSwitchMax", False, "Bool")
	IniReadS($g_bChkForecastHopingSwitchMin, $g_sProfileConfigPath, "forecast", "ChkForecastHopingSwitchMin", False, "Bool")
	IniReadS($g_iCmbForecastHopingSwitchMax, $g_sProfileConfigPath, "forecast", "CmbForecastHopingSwitchMax", 0, "int")
	IniReadS($g_iCmbForecastHopingSwitchMin, $g_sProfileConfigPath, "forecast", "CmbForecastHopingSwitchMin", 0, "int")
	IniReadS($g_iTxtForecastHopingSwitchMax, $g_sProfileConfigPath, "forecast", "TxtForecastHopingSwitchMax", 2, "int")
	IniReadS($g_iTxtForecastHopingSwitchMin, $g_sProfileConfigPath, "forecast", "TxtForecastHopingSwitchMin", 2, "int")

	IniReadS($g_iCmbSwLang, $g_sProfileConfigPath, "forecast", "CmbSwLang", 0, "int")

	; Request CC Troops at first - Persian MOD (#-18)
	$g_bReqCCFirst = (IniRead($g_sProfileConfigPath, "planned", "ReqCCFirst", 0) = 1)

	; Goblin XP - Persian MOD (#-19)
	IniReadS($ichkEnableSuperXP, $g_sProfileConfigPath, "GoblinXP", "EnableSuperXP", 0, "int")
	IniReadS($ichkSkipZoomOutXP, $g_sProfileConfigPath, "GoblinXP", "SkipZoomOutXP", 0, "int")
	IniReadS($irbSXTraining, $g_sProfileConfigPath, "GoblinXP", "SXTraining", 1, "int")
	IniReadS($itxtMaxXPtoGain, $g_sProfileConfigPath, "GoblinXP", "MaxXptoGain", 500, "int")
	IniReadS($ichkSXBK, $g_sProfileConfigPath, "GoblinXP", "SXBK", $eHeroNone)
	IniReadS($ichkSXAQ, $g_sProfileConfigPath, "GoblinXP", "SXAQ", $eHeroNone)
	IniReadS($ichkSXGW, $g_sProfileConfigPath, "GoblinXP", "SXGW", $eHeroNone)

	; ClanHop - Persian MOD (#-20)
	$g_bChkClanHop = (IniRead($g_sProfileConfigPath, "donate", "chkClanHop", "0") = "1")
	IniReadS($g_iTxtCheckingtraine, $g_sProfileConfigPath, "donate", "txtCheckingtraine", 5, "int")

	; Max logout time - Persian MOD (#-21)
	IniReadS($g_bTrainLogoutMaxTime, $g_sProfileConfigPath, "TrainLogout", "TrainLogoutMaxTime", False, "Bool")
	IniReadS($g_iTrainLogoutMaxTime, $g_sProfileConfigPath, "TrainLogout", "TrainLogoutMaxTimeTXT", 4, "int")

	; ExtendedAttackBar - Persian MOD (#-22)
	IniReadS($g_abChkExtendedAttackBar[$DB], $g_sProfileConfigPath, "attack", "ExtendedAttackBarDB", False, "Bool")
	IniReadS($g_abChkExtendedAttackBar[$LB], $g_sProfileConfigPath, "attack", "ExtendedAttackBarLB", False, "Bool")

	; CheckCC Troops - Persian MOD (#-24)
	IniReadS($g_bChkCC, $g_sProfileConfigPath, "CheckCC", "Enable", False, "Bool")
	IniReadS($g_iCmbCastleCapacityT, $g_sProfileConfigPath, "CheckCC", "Troop Capacity", 5, "int")
	IniReadS($g_iCmbCastleCapacityS, $g_sProfileConfigPath, "CheckCC", "Spell Capacity", 1, "int")

	For $i = 0 To $eTroopCount - 1
		$g_aiCCTroopsExpected[$i] = 0
		If $i >= $eSpellCount Then ContinueLoop
		$g_aiCCSpellsExpected[$i] = 0
	Next
	$g_bChkCCTroops = False

	For $i = 0 To 4
		Local $default = 19
		If $i > 2 Then $default = 9
		IniReadS($g_aiCmbCCSlot[$i], $g_sProfileConfigPath, "CheckCC", "ExpectSlot" & $i, $default, "int")
		IniReadS($g_aiTxtCCSlot[$i], $g_sProfileConfigPath, "CheckCC", "ExpectQty" & $i, 0, "int")
		If $g_aiCmbCCSlot[$i] > -1 And $g_aiCmbCCSlot[$i] < $default Then
			Local $j = $g_aiCmbCCSlot[$i]
			If $i <= 2 Then
				$g_aiCCTroopsExpected[$j] += $g_aiTxtCCSlot[$i]
			Else
				If $j > $eSpellFreeze Then $j += 1 ; exclude Clone Spell
				$g_aiCCSpellsExpected[$j] += $g_aiTxtCCSlot[$i]
			EndIf
			If $g_bChkCC Then $g_bChkCCTroops = True
		EndIf
	Next

	; Switch Profile - Persian MOD (#-25)
	Local $aiDefaultMax[4] = ["6000000", "6000000", "180000", "5000"]
	Local $aiDefaultMin[4] = ["1000000", "1000000", "20000", "3000"]
	For $i = 0 To 3
		IniReadS($g_abChkSwitchMax[$i], $g_sProfileConfigPath, "SwitchProfile", "SwitchProfileMax" & $i, False, "Bool")
		IniReadS($g_abChkSwitchMin[$i], $g_sProfileConfigPath, "SwitchProfile", "SwitchProfileMin" & $i, False, "Bool")
		IniReadS($g_aiCmbSwitchMax[$i], $g_sProfileConfigPath, "SwitchProfile", "TargetProfileMax" & $i, -1, "Int")
		IniReadS($g_aiCmbSwitchMin[$i], $g_sProfileConfigPath, "SwitchProfile", "TargetProfileMin" & $i, -1, "Int")

		IniReadS($g_abChkBotTypeMax[$i], $g_sProfileConfigPath, "SwitchProfile", "ChangeBotTypeMax" & $i, False, "Bool")
		IniReadS($g_abChkBotTypeMin[$i], $g_sProfileConfigPath, "SwitchProfile", "ChangeBotTypeMin" & $i, False, "Bool")
		IniReadS($g_aiCmbBotTypeMax[$i], $g_sProfileConfigPath, "SwitchProfile", "TargetBotTypeMax" & $i, 1, "Int")
		IniReadS($g_aiCmbBotTypeMin[$i], $g_sProfileConfigPath, "SwitchProfile", "TargetBotTypeMin" & $i, 2, "Int")

		IniReadS($g_aiConditionMax[$i], $g_sProfileConfigPath, "SwitchProfile", "ConditionMax" & $i, $aiDefaultMax[$i], "Int")
		IniReadS($g_aiConditionMin[$i], $g_sProfileConfigPath, "SwitchProfile", "ConditionMin" & $i, $aiDefaultMin[$i], "Int")
	Next

	; Check Grand Warden Mode - Persian MOD (#-26)
	IniReadS($g_bCheckWardenMode, $g_sProfileConfigPath, "other", "chkCheckWardenMode", False, "Bool")
	IniReadS($g_iCheckWardenMode, $g_sProfileConfigPath, "other", "cmbCheckWardenMode", 0, "int")

	; Switch Accounts - Persian MOD (#-12)
	ReadConfig_SwitchAcc()

	; Farm Schedule - Persian MOD (#-27)
	For $i = 0 To 7
		IniReadS($g_abChkSetFarm[$i], $g_sProfilePath & "\Profile.ini", "FarmStrategy", "ChkSetFarm" & $i, False, "Bool")

		IniReadS($g_aiCmbAction1[$i], $g_sProfilePath & "\Profile.ini", "FarmStrategy", "CmbAction1" & $i, 0, "Int")
		IniReadS($g_aiCmbCriteria1[$i], $g_sProfilePath & "\Profile.ini", "FarmStrategy", "CmbCriteria1" & $i, 0, "Int")
		IniReadS($g_aiTxtResource1[$i], $g_sProfilePath & "\Profile.ini", "FarmStrategy", "TxtResource1" & $i, "")
		IniReadS($g_aiCmbTime1[$i], $g_sProfilePath & "\Profile.ini", "FarmStrategy", "CmbTime1" & $i, -1, "Int")

		IniReadS($g_aiCmbAction2[$i], $g_sProfilePath & "\Profile.ini", "FarmStrategy", "CmbAction2" & $i, 0, "Int")
		IniReadS($g_aiCmbCriteria2[$i], $g_sProfilePath & "\Profile.ini", "FarmStrategy", "CmbCriteria2" & $i, 0, "Int")
		IniReadS($g_aiTxtResource2[$i], $g_sProfilePath & "\Profile.ini", "FarmStrategy", "TxtResource2" & $i, "")
		IniReadS($g_aiCmbTime2[$i], $g_sProfilePath & "\Profile.ini", "FarmStrategy", "CmbTime2" & $i, -1, "Int")
	Next

	; Restart Search Legend league - Persian MOD (#-29)
	$g_bIsSearchTimeout = (IniRead($g_sProfileConfigPath, "other", "ChkSearchTimeout", "0") = "1")
	$g_iSearchTimeout = Int(IniRead($g_sProfileConfigPath, "other", "SearchTimeout", 10))

	; Stop on Low battery - Persian MOD (#-30)
	$g_bStopOnBatt = (IniRead($g_sProfileConfigPath, "other", "ChkStopOnBatt", "0") = "1")
	$g_iStopOnBatt = Int(IniRead($g_sProfileConfigPath, "other", "StopOnBatt", 10))

	; Robot Transparency - Persian MOD (#-34)
	GUICtrlSetData($SldTransLevel, IniRead($g_sProfileConfigPath, "other", "Decor", 0))
	Slider()

	Global $iMultiFingerStyle = 0

	; Multi Finger - Persian MOD(#-04)
	IniReadS($iMultiFingerStyle, $g_sProfileConfigPath, "MultiFinger", "Select", "1")

EndFunc   ;==>ReadConfig_MOD

; Switch Accounts - Persian MOD (#-12)
Func ReadConfig_SwitchAcc()
	Local $sSwitchAccFile
	$g_iCmbSwitchAcc = 0
	$g_bChkSwitchAcc = False
	For $g = 1 To 8
		; find group this profile belongs to: no switch profile config is saved in config.ini on purpose!
		$sSwitchAccFile = $g_sProfilePath & "\SwitchAccount.0" & $g & ".ini"
		If FileExists($sSwitchAccFile) = 0 Then ContinueLoop
		Local $sProfile
		Local $bEnabled
		For $i = 1 To Int(IniRead($sSwitchAccFile, "SwitchAccount", "TotalCocAccount", 0)) + 1
			$bEnabled = IniRead($sSwitchAccFile, "SwitchAccount", "Enable", "") = "1"
			If $bEnabled Then
				$bEnabled = IniRead($sSwitchAccFile, "SwitchAccount", "AccountNo." & $i, "") = "1"
				If $bEnabled Then
					$sProfile = IniRead($sSwitchAccFile, "SwitchAccount", "ProfileName." & $i, "")
					If $sProfile = $g_sProfileCurrentName Then
						; found current profile
						$g_iCmbSwitchAcc = $g
						ExitLoop
					EndIf
				EndIf
			EndIf
		Next

		If $g_iCmbSwitchAcc Then
			ReadConfig_SwitchAccounts()
			ExitLoop
		EndIf
	Next
EndFunc   ;==>ReadConfig_SwitchAcc

Func ReadConfig_SwitchAccounts()
	If $g_iCmbSwitchAcc Then
		Local $sSwitchAccFile = $g_sProfilePath & "\SwitchAccount.0" & $g_iCmbSwitchAcc & ".ini"
		$g_bChkSwitchAcc = IniRead($sSwitchAccFile, "SwitchAccount", "Enable", "") = "1"
		$g_bChkSmartSwitch = IniRead($sSwitchAccFile, "SwitchAccount", "SmartSwitch", "0") = "1"
		$g_iTotalAcc = Int(IniRead($sSwitchAccFile, "SwitchAccount", "TotalCocAccount", "-1"))
		$g_iTrainTimeToSkip = Int(IniRead($sSwitchAccFile, "SwitchAccount", "TrainTimeToSkip", "1"))
		For $i = 1 To 8
			$g_abAccountNo[$i - 1] = IniRead($sSwitchAccFile, "SwitchAccount", "AccountNo." & $i, "") = "1"
			$g_asProfileName[$i - 1] = IniRead($sSwitchAccFile, "SwitchAccount", "ProfileName." & $i, "")
			$g_abDonateOnly[$i - 1] = IniRead($sSwitchAccFile, "SwitchAccount", "DonateOnly." & $i, "0") = "1"
		Next
	EndIf
EndFunc   ;==>ReadConfig_SwitchAccounts