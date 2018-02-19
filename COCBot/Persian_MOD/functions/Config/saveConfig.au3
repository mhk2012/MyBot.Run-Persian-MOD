; #FUNCTION# ====================================================================================================================
; Name ..........: saveConfig.au3
; Description ...: Saves all of the GUI values to the config.ini and building.ini files
; Syntax ........: saveConfig()
; Parameters ....: NA
; Return values .: NA
; Author ........: Team AiO MOD++ (2017)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2018
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func SaveConfig_MOD()
	; <><><> Persian MOD (2018) <><><>
	ApplyConfig_MOD(GetApplyConfigSaveAction())

	; Unit/Wave Factor - Persian MOD (#-05)
	_Ini_Add("SetSleep", "EnableGiantSlot", $g_iChkGiantSlot)
	_Ini_Add("SetSleep", "CmbGiantSlot", _GUICtrlComboBox_GetCurSel($g_hCmbGiantSlot))

	_Ini_Add("SetSleep", "EnableUnitFactor", $g_iChkUnitFactor)
	_Ini_Add("SetSleep", "UnitFactor", GUICtrlRead($g_hTxtUnitFactor))

	_Ini_Add("SetSleep", "EnableWaveFactor", $g_iChkWaveFactor)
	_Ini_Add("SetSleep", "WaveFactor", GUICtrlRead($g_hTxtWaveFactor))

	; Auto Dock, Hide Emulator & Bot - Persian MOD (#-07)
	_Ini_Add("general", "EnableAuto", $g_bEnableAuto ? 1 : 0)
	_Ini_Add("general", "AutoDock", $g_iChkAutoDock ? 1 : 0)
	_Ini_Add("general", "AutoHide", $g_iChkAutoHideEmulator ? 1 : 0)
	_Ini_Add("general", "AutoMinimize", $g_iChkAutoMinimizeBot ? 1 : 0)

	; Check Collector Outside - Persian MOD (#-08)
	_Ini_Add("search", "DBMeetCollOutside", $g_bDBMeetCollOutside)
	_Ini_Add("search", "TxtDBMinCollOutsidePercent", GUICtrlRead($g_hTxtDBMinCollOutsidePercent))

	_Ini_Add("search", "DBCollectorsNearRedline", $g_bDBCollectorsNearRedline ? 1 : 0)
	_Ini_Add("search", "CmbRedlineTiles", _GUICtrlComboBox_GetCurSel($g_hCmbRedlineTiles))

	_Ini_Add("search", "SkipCollectorCheck", $g_bSkipCollectorCheck ? 1 : 0)
	_Ini_Add("search", "TxtSkipCollectorGold", GUICtrlRead($g_hTxtSkipCollectorGold))
	_Ini_Add("search", "TxtSkipCollectorElixir", GUICtrlRead($g_hTxtSkipCollectorElixir))
	_Ini_Add("search", "TxtSkipCollectorDark", GUICtrlRead($g_hTxtSkipCollectorDark))

	_Ini_Add("search", "SkipCollectorCheckTH", $g_bSkipCollectorCheckTH ? 1 : 0)
	_Ini_Add("search", "CmbSkipCollectorCheckTH", _GUICtrlComboBox_GetCurSel($g_hCmbSkipCollectorCheckTH))

	; CSV Deploy Speed - Persian MOD (#-09)
	_Ini_Add("CSV Speed", "cmbCSVSpeed[LB]", _GUICtrlComboBox_GetCurSel($cmbCSVSpeed[$LB]))
	_Ini_Add("CSV Speed", "cmbCSVSpeed[DB]", _GUICtrlComboBox_GetCurSel($cmbCSVSpeed[$DB]))

	; Smart Train - Persian MOD (#-13)
	_Ini_Add("SmartTrain", "Enable", $ichkSmartTrain)
	_Ini_Add("SmartTrain", "PreciseTroops", $ichkPreciseTroops)
	_Ini_Add("SmartTrain", "ChkFillArcher", $ichkFillArcher)
	_Ini_Add("SmartTrain", "FillArcher", $iFillArcher)
	_Ini_Add("SmartTrain", "FillEQ", $ichkFillEQ)
	_Ini_Add("other", "ChkMultiClick", $g_bChkMultiClick ? 1 : 0)

	; Bot Humanization - Persian MOD (#-15)
	_Ini_Add("Bot Humanization", "chkUseBotHumanization", $g_ichkUseBotHumanization)
	_Ini_Add("Bot Humanization", "chkUseAltRClick", $g_ichkUseAltRClick)
	_Ini_Add("Bot Humanization", "chkCollectAchievements", $g_ichkCollectAchievements)
	_Ini_Add("Bot Humanization", "chkLookAtRedNotifications", $g_ichkLookAtRedNotifications)
	For $i = 0 To 12
		_Ini_Add("Bot Humanization", "cmbPriority[" & $i & "]", _GUICtrlComboBox_GetCurSel($g_acmbPriority[$i]))
	Next
	For $i = 0 To 1
		_Ini_Add("Bot Humanization", "cmbMaxSpeed[" & $i & "]", _GUICtrlComboBox_GetCurSel($g_acmbMaxSpeed[$i]))
	Next
	For $i = 0 To 1
		_Ini_Add("Bot Humanization", "cmbPause[" & $i & "]", _GUICtrlComboBox_GetCurSel($g_acmbPause[$i]))
	Next
	For $i = 0 To 1
		_Ini_Add("Bot Humanization", "humanMessage[" & $i & "]", GUICtrlRead($g_ahumanMessage[$i]))
	Next
	_Ini_Add("Bot Humanization", "cmbMaxActionsNumber", _GUICtrlComboBox_GetCurSel($g_cmbMaxActionsNumber))
	_Ini_Add("Bot Humanization", "challengeMessage", GUICtrlRead($g_challengeMessage))

	; Forecast - Persian MOD (#-17)
	_Ini_Add("forecast", "ChkForecastBoost", $g_bChkForecastBoost ? 1 : 0)
	_Ini_Add("forecast", "TxtForecastBoost", $g_iTxtForecastBoost)
	_Ini_Add("forecast", "ChkForecastPause", $g_bChkForecastPause ? 1 : 0)
	_Ini_Add("forecast", "TxtForecastPause", $g_iTxtForecastPause)

	_Ini_Add("forecast", "ChkForecastHopingSwitchMax", $g_bChkForecastHopingSwitchMax ? 1 : 0)
	_Ini_Add("forecast", "ChkForecastHopingSwitchMin", $g_bChkForecastHopingSwitchMin ? 1 : 0)
	_Ini_Add("forecast", "CmbForecastHopingSwitchMax", _GUICtrlComboBox_GetCurSel($g_hCmbForecastHopingSwitchMax))
	_Ini_Add("forecast", "CmbForecastHopingSwitchMin", _GUICtrlComboBox_GetCurSel($g_hCmbForecastHopingSwitchMin))
	_Ini_Add("forecast", "TxtForecastHopingSwitchMax", $g_iTxtForecastHopingSwitchMax)
	_Ini_Add("forecast", "TxtForecastHopingSwitchMin", $g_iTxtForecastHopingSwitchMin)

	_Ini_Add("forecast", "CmbSwLang", _GUICtrlComboBox_GetCurSel($g_hCmbSwLang))

	; Request CC Troops at first - Persian MOD (#-18)
	_Ini_Add("planned", "ReqCCFirst", $g_bReqCCFirst ? 1 : 0)

	; Goblin XP - Persian MOD (#-19)
	_Ini_Add("GoblinXP", "EnableSuperXP", $ichkEnableSuperXP)
	_Ini_Add("GoblinXP", "SkipZoomOutXP", $ichkSkipZoomOutXP)
	_Ini_Add("GoblinXP", "SXTraining",  $irbSXTraining)
	_Ini_Add("GoblinXP", "SXBK", $ichkSXBK)
	_Ini_Add("GoblinXP", "SXAQ", $ichkSXAQ)
	_Ini_Add("GoblinXP", "SXGW", $ichkSXGW)
	_Ini_Add("GoblinXP", "MaxXptoGain", GUICtrlRead($txtMaxXPtoGain))

	; ClanHop - Persian MOD (#-20)
	_Ini_Add("donate", "chkClanHop", $g_bChkClanHop ? 1 : 0)
	_Ini_Add("donate", "txtCheckingtraine", GUICtrlRead($g_ahTxtCheckingtrain))

	; Max logout time - Persian MOD (#-21)
	_Ini_Add("TrainLogout", "TrainLogoutMaxTime", $g_bTrainLogoutMaxTime)
	_Ini_Add("TrainLogout", "TrainLogoutMaxTimeTXT", $g_iTrainLogoutMaxTime)

	; ExtendedAttackBar - Persian MOD (#-22)
	_Ini_Add("attack", "ExtendedAttackBarDB", $g_abChkExtendedAttackBar[$DB] ? 1 : 0)
	_Ini_Add("attack", "ExtendedAttackBarLB", $g_abChkExtendedAttackBar[$LB] ? 1 : 0)

	; CheckCC Troops - Persian MOD (#-24)
	_Ini_Add("CheckCC", "Enable", $g_bChkCC ? 1 : 0)
	_Ini_Add("CheckCC", "Troop Capacity", $g_iCmbCastleCapacityT)
	_Ini_Add("CheckCC", "Spell Capacity", $g_iCmbCastleCapacityS)
	For $i = 0 To 4
		_Ini_Add("CheckCC", "ExpectSlot" & $i, $g_aiCmbCCSlot[$i])
		_Ini_Add("CheckCC", "ExpectQty" & $i, $g_aiTxtCCSlot[$i])
	Next

	; Switch Profile - Persian MOD (#-25)
	For $i = 0 To 3
		_Ini_Add("SwitchProfile", "SwitchProfileMax" & $i, $g_abChkSwitchMax[$i] ? 1 : 0)
		_Ini_Add("SwitchProfile", "SwitchProfileMin" & $i, $g_abChkSwitchMin[$i] ? 1 : 0)
		_Ini_Add("SwitchProfile", "TargetProfileMax" & $i, $g_aiCmbSwitchMax[$i])
		_Ini_Add("SwitchProfile", "TargetProfileMin" & $i, $g_aiCmbSwitchMin[$i])

		_Ini_Add("SwitchProfile", "ChangeBotTypeMax" & $i, $g_abChkBotTypeMax[$i] ? 1 : 0)
		_Ini_Add("SwitchProfile", "ChangeBotTypeMin" & $i, $g_abChkBotTypeMin[$i] ? 1 : 0)
		_Ini_Add("SwitchProfile", "TargetBotTypeMax" & $i, $g_aiCmbBotTypeMax[$i])
		_Ini_Add("SwitchProfile", "TargetBotTypeMin" & $i, $g_aiCmbBotTypeMin[$i])

		_Ini_Add("SwitchProfile", "ConditionMax" & $i, $g_aiConditionMax[$i])
		_Ini_Add("SwitchProfile", "ConditionMin" & $i, $g_aiConditionMin[$i])
	Next

	; Check Grand Warden Mode - Persian MOD (#-26)
	_Ini_Add("other", "chkCheckWardenMode", $g_bCheckWardenMode ? 1 : 0)
	_Ini_Add("other", "cmbCheckWardenMode", $g_iCheckWardenMode)

	; Switch Accounts - Persian MOD (#-12)
	SaveConfig_SwitchAcc()

	; Farm Schedule - Persian MOD (#-27)
	For $i = 0 To 7
		IniWriteS($g_sProfilePath & "\Profile.ini", "FarmStrategy", "ChkSetFarm" & $i, $g_abChkSetFarm[$i])

		IniWriteS($g_sProfilePath & "\Profile.ini", "FarmStrategy", "CmbAction1" & $i, $g_aiCmbAction1[$i])
		IniWriteS($g_sProfilePath & "\Profile.ini", "FarmStrategy", "CmbCriteria1" & $i, $g_aiCmbCriteria1[$i])
		IniWriteS($g_sProfilePath & "\Profile.ini", "FarmStrategy", "TxtResource1" & $i, $g_aiTxtResource1[$i])
		IniWriteS($g_sProfilePath & "\Profile.ini", "FarmStrategy", "CmbTime1" & $i, $g_aiCmbTime1[$i])

		IniWriteS($g_sProfilePath & "\Profile.ini", "FarmStrategy", "CmbAction2" & $i, $g_aiCmbAction2[$i])
		IniWriteS($g_sProfilePath & "\Profile.ini", "FarmStrategy", "CmbCriteria2" & $i, $g_aiCmbCriteria2[$i])
		IniWriteS($g_sProfilePath & "\Profile.ini", "FarmStrategy", "TxtResource2" & $i, $g_aiTxtResource2[$i])
		IniWriteS($g_sProfilePath & "\Profile.ini", "FarmStrategy", "CmbTime2" & $i, $g_aiCmbTime2[$i])
	Next

	; Restart Search Legend league - Persian MOD (#-29)
	_Ini_Add("other", "ChkSearchTimeout", $g_bIsSearchTimeout ? 1 : 0)
	_Ini_Add("other", "SearchTimeout", $g_iSearchTimeout)

	; Stop on Low battery - Persian MOD (#-30)
	_Ini_Add("other", "ChkStopOnBatt", $g_bStopOnBatt ? 1 : 0)
	_Ini_Add("other", "StopOnBatt", $g_iStopOnBatt)

	; Robot Transparency - Persian MOD (#-34)
	_Ini_Add("other", "Decor", $iSldTransLevel)

	; Multi Finger - Persian MOD (#-04)
	_Ini_Add("MultiFinger", "Select", $iMultiFingerStyle)

EndFunc   ;==>SaveConfig_MOD

; Switch Accounts - Persian MOD (#-12)
Func SaveConfig_SwitchAcc()
	ApplyConfig_SwitchAcc(GetApplyConfigSaveAction())

	Local $sSwitchAccFile
	Local $iCmbSwitchAcc = $g_iCmbSwitchAcc
	If $iCmbSwitchAcc = 0 Then
		; find group this profile belongs to: no switch profile config is saved in config.ini on purpose!
		For $g = 1 To 8
			$sSwitchAccFile = $g_sProfilePath & "\SwitchAccount.0" & $g & ".ini"
			If FileExists($sSwitchAccFile) = 0 Then ContinueLoop
			Local $sProfile
			Local $bEnabled
			For $i = 1 To 8
				$bEnabled = IniRead($sSwitchAccFile, "SwitchAccount", "Enable" & $i, "") = "1"
				If $bEnabled Then
					$bEnabled = IniRead($sSwitchAccFile, "SwitchAccount", "AccountNo." & $i, "") = "1"
					If $bEnabled Then
						$sProfile = IniRead($sSwitchAccFile, "SwitchAccount", "ProfileName." & $i, "")
						If $sProfile = $g_sProfileCurrentName Then
							; found current profile
							$iCmbSwitchAcc = $g
							ExitLoop 2
						EndIf
					EndIf
				EndIf
			Next
		Next
	EndIf
	If $iCmbSwitchAcc Then
		$sSwitchAccFile = $g_sProfilePath & "\SwitchAccount.0" & $iCmbSwitchAcc & ".ini"
		IniWrite($sSwitchAccFile, "SwitchAccount", "Enable", $g_bChkSwitchAcc ? 1 : 0)
		IniWrite($sSwitchAccFile, "SwitchAccount", "SharedPrefs", $g_bChkSharedPrefs ? 1 : 0)
		IniWrite($sSwitchAccFile, "SwitchAccount", "SmartSwitch", $g_bChkSmartSwitch ? 1 : 0)
		IniWrite($sSwitchAccFile, "SwitchAccount", "DonateLikeCrazy", $g_bDonateLikeCrazy ? 1 : 0)
		IniWrite($sSwitchAccFile, "SwitchAccount", "TotalCocAccount", $g_iTotalAcc)
		IniWrite($sSwitchAccFile, "SwitchAccount", "TrainTimeToSkip", $g_iTrainTimeToSkip)
		For $i = 1 To 8
			IniWrite($sSwitchAccFile, "SwitchAccount", "AccountNo." & $i, $g_abAccountNo[$i - 1] ? 1 : 0)
			IniWrite($sSwitchAccFile, "SwitchAccount", "ProfileName." & $i, $g_asProfileName[$i - 1])
			IniWrite($sSwitchAccFile, "SwitchAccount", "DonateOnly." & $i, $g_abDonateOnly[$i - 1] ? 1 : 0)
		Next
	EndIf

EndFunc   ;==>SaveConfig_SwitchAcc
