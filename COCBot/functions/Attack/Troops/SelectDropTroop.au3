
; #FUNCTION# ====================================================================================================================
; Name ..........: SelectDropTroop
; Description ...:
; Syntax ........: SelectDropTroop($Troop)
; Parameters ....: $Troop               - an unknown value.
; Return values .: None
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2018
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
Func SelectDropTroop($Troop)
	; SWIPE - Persian MOD (#-33)
	If IsAttackPage() Then
		If Not $SWIPE = "" Then
			Click($g_avAttackTroops[$Troop][2], 595 + $g_iBottomOffsetY, 1, 0, "#0111") ;860x780
		Else
			Click(GetXPosOfArmySlot($Troop, 68), 595 + $g_iBottomOffsetY, 1, 0, "#0111") ;860x780
		EndIf
	EndIf
EndFunc   ;==>SelectDropTroop
