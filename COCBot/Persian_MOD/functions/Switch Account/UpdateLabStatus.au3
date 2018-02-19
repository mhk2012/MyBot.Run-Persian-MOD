; #FUNCTION# ====================================================================================================================
; Name ..........: UpdateLabStatus (#-12)
; Description ...: Laboratory status and researching time
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2018
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......:
; ===============================================================================================================================

Func LabStatusAndTime()

	Local $day = 0, $hour = 0, $min = 0
	Static $bNeedLocateLab[8] = [True, True, True, True, True, True, True, True]
	Local $Account = 0


	; locate lab
	If $g_aiLaboratoryPos[0] <= 0 Or $g_aiLaboratoryPos[1] <= 0 Then
		If ProfileSwitchAccountEnabled() Then $Account = $g_iCurAccount	; SwitchAcc Demen_SA_#9001
		If $bNeedLocateLab[$Account] Then
			SetLog("Laboratory has not been located", $COLOR_ERROR)
			LocateLab()
			If $g_aiLaboratoryPos[0] = 0 Or $g_aiLaboratoryPos[1] = 0 Then
				SetLog("Problem locating Laboratory", $COLOR_ERROR)
			EndIf
			$bNeedLocateLab[$Account] = False ; give only one chance to locate lab. If ignore, then skip it for good.
		Else
			Return
		EndIf
	EndIf
	If _Sleep($DELAYLABORATORY1) Then Return

	BuildingClickP($g_aiLaboratoryPos, "#0197")

	If _Sleep($DELAYLABORATORY3) Then Return ; Wait for window to open
	; Find Research Button
	Local $offColors[4][3] = [[0x708CB0, 37, 34], [0x603818, 50, 43], [0xD5FC58, 61, 8], [0x000000, 82, 0]] ; 2nd pixel Blue blade, 3rd pixel brown handle, 4th pixel Green cross, 5th black button edge
	Local $ButtonPixel = _MultiPixelSearch(433, 565 + $g_iBottomOffsetY, 562, 619 + $g_iBottomOffsetY, 1, 1, Hex(0x000000, 6), $offColors, 30) ; Black pixel of button edge
	If IsArray($ButtonPixel) Then
		If $g_bDebugSetlog Then
			SetDebugLog("ButtonPixel = " & $ButtonPixel[0] & ", " & $ButtonPixel[1], $COLOR_DEBUG) ;Debug
			SetDebugLog("#1: " & _GetPixelColor($ButtonPixel[0], $ButtonPixel[1], True) & ", #2: " & _GetPixelColor($ButtonPixel[0] + 37, $ButtonPixel[1] + 34, True) & ", #3: " & _GetPixelColor($ButtonPixel[0] + 50, $ButtonPixel[1] + 43, True) & ", #4: " & _GetPixelColor($ButtonPixel[0] + 61, $ButtonPixel[1] + 8, True), $COLOR_DEBUG)
		EndIf
		If $g_bDebugImageSave Then DebugImageSave("LabUpgrade") ; Debug Only
		Click($ButtonPixel[0] + 40, $ButtonPixel[1] + 25, 1, 0, "#0198") ; Click Research Button
		If _Sleep($DELAYLABORATORY1) Then Return ; Wait for window to open
	Else
		SetLog("Trouble finding research button, try again...", $COLOR_WARNING)
		ClickP($aAway, 2, $DELAYLABORATORY4, "#0199")
		Return False
	EndIf

	; check for upgrade in process
	If _ColorCheck(_GetPixelColor(730, 170 + $g_iMidOffsetY, True), Hex(0xA2CB6C, 6), 20) Then ; Look for light green in upper right corner of lab window.
		Local $LabTimeOCR = getRemainTLaboratory(270, 257) ; Try to read white text showing actual time left for upgrade
		Local $aArray = StringSplit($LabTimeOCR, ' ', BitOR($STR_CHRSPLIT, $STR_NOCOUNT)) ;separate days, hours, minutes, seconds
		SetLog("Laboratory research time: " & $LabTimeOCR, $COLOR_INFO)
		If IsArray($aArray) Then
			For $i = 0 To UBound($aArray) - 1 ; step through array and compute minutes remaining
				Local $sTime = ""
				Select
					Case StringInStr($aArray[$i], "d", $STR_NOCASESENSEBASIC) > 0
						$sTime = StringTrimRight($aArray[$i], 1) ; removing "d"
						$day = Int($sTime)
					Case StringInStr($aArray[$i], "h", $STR_NOCASESENSEBASIC) > 0
						$sTime = StringTrimRight($aArray[$i], 1) ; removing "h"
						$hour = Int($sTime)
					Case StringInStr($aArray[$i], "m", $STR_NOCASESENSEBASIC) > 0
						$sTime = StringTrimRight($aArray[$i], 1) ; removing "m"
						$min = Int($sTime)
				EndSelect
			Next
			$g_aLabTime[0] = $day
			$g_aLabTime[1] = $hour
			$g_aLabTime[2] = $min
			$g_aLabTime[3] = $day * 24 * 60 + $hour * 60 + $min

			If ProfileSwitchAccountEnabled() Then
				$g_aLabTimeAcc[$g_iCurAccount] = $g_aLabTime[3]	; For SwitchAcc Mode
				$g_aLabTimerStart[$g_iCurAccount] = TimerInit() 	; start counting lab time of current account
			EndIf

		Else
			If $g_bDebugSetlog Then SetDebugLog("Invalid getRemainTLaboratory OCR", $COLOR_DEBUG)
			ClickP($aAway, 2, $DELAYLABORATORY4, "#0199")
			Return False
		EndIf

		If _Sleep($DELAYLABORATORY2) Then Return
		ClickP($aAway, 2, $DELAYLABORATORY4, "#0359")
		$g_bLabReady = False
		Return True

	ElseIf _ColorCheck(_GetPixelColor(730, 170 + $g_iMidOffsetY, True), Hex(0x8088B0, 6), 20) Then ; Look for light purple in upper right corner of lab window.
		SetLog("Laboratory has stopped", $COLOR_INFO)
		ClickP($aAway, 2, $DELAYLABORATORY4, "#0359")
		$g_bLabReady = True
		Return True
	Else
		SetLog("Unable to determine Lab Status", $COLOR_INFO)
		ClickP($aAway, 2, $DELAYLABORATORY4, "#0359")
		Return False
	EndIf
EndFunc   ;==>LabStatusAndTime

Func UpdateLabStatus()

	Local $sLabTime = ""
	Local $hLab = 0, $hLabTime = 0	; SwitchAcc Demen_SA_#9001

	If ProfileSwitchAccountEnabled() Then
		$hLab = $g_ahLblLab[$g_iCurAccount]
		$hLabTime = $g_ahLblLabTime[$g_iCurAccount]
	EndIf

	If LabStatusAndTime() Then
		If $g_bLabReady Then
			$sLabTime = "Ready"
			GUICtrlSetColor($g_hLblLab, $COLOR_GREEN)
			GUICtrlSetColor($g_hLblLabTime, $COLOR_GREEN)
			GUICtrlSetColor($hLab, $COLOR_GREEN) 		; profile stats tab - SwitchAcc Demen_SA_#9001
			GUICtrlSetColor($hLabTime, $COLOR_GREEN) 	; profile stats tab
		ElseIf $g_aLabTime[3] > 0 Then
			GUICtrlSetColor($g_hLblLab, $COLOR_BLACK)
			GUICtrlSetColor($g_hLblLabTime, $COLOR_BLACK)
			GUICtrlSetColor($hLab, $COLOR_BLACK) 		; profile stats tab
			GUICtrlSetColor($hLabTime, $COLOR_BLACK) 	; profile stats tab
			If $g_aLabTime[0] > 0 Then
				$sLabTime = $g_aLabTime[0] & "d " & $g_aLabTime[1] & "h"
			ElseIf $g_aLabTime[1] > 0 Then
				$sLabTime = $g_aLabTime[1] & "h " & $g_aLabTime[2] & "m"
			ElseIf $g_aLabTime[2] > 0 Then
				$sLabTime = $g_aLabTime[2] & "m "
			EndIf
		Else
			GUICtrlSetColor($g_hLblLab, $COLOR_MEDGRAY)
			GUICtrlSetColor($hLab, $COLOR_MEDGRAY) 		; profile stats tab
		EndIf

	Else
		GUICtrlSetColor($g_hLblLab, $COLOR_MEDGRAY)
		GUICtrlSetColor($hLab, $COLOR_MEDGRAY) 			; profile stats tab
	EndIf

	GUICtrlSetData($g_hLblLabTime, $sLabTime)
	GUICtrlSetData($hLabTime, $sLabTime) ; profile stats tab

EndFunc   ;==>UpdateLabStatus
