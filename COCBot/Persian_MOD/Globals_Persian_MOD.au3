; #FUNCTION# ====================================================================================================================
; Name ..........: Globals Persian MOD
; Description ...: This file Includes several files in the current script and all Declared variables, constant, or create an array.
; Syntax ........: #include , Global
; Parameters ....: None
; Return values .: None
; Author ........: Persian MOD (2018)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2018
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

; Check Version - Persian MOD (#-03)
Global $g_sLastModversion = "" ;latest version from GIT
Global $g_sLastModmessage = "" ;message for last version
Global $g_sOldModversmessage = "" ;warning message for old bot

; Attack Settings [Dec 2016] used on Classic Attack
Global Const $g_aaiTopLeftDropPoints[5][2] = [[62, 306], [156, 238], [221, 188], [288, 142], [383, 76]]
Global Const $g_aaiTopRightDropPoints[5][2] = [[486, 59], [586, 134], [652, 184], [720, 231], [817, 308]]
Global Const $g_aaiBottomLeftDropPoints[5][2] = [[20, 373], [101, 430], [171, 481], [244, 535], [346, 615]]
Global Const $g_aaiBottomRightDropPoints[5][2] = [[530, 615], [632, 535], [704, 481], [781, 430], [848, 373]]
Global Const $g_aaiEdgeDropPoints[4] = [$g_aaiBottomRightDropPoints, $g_aaiTopLeftDropPoints, $g_aaiBottomLeftDropPoints, $g_aaiTopRightDropPoints]

; Unit/Wave Factor - Persian MOD (#-04)
Global $g_iChkGiantSlot = 0, $g_iChkUnitFactor = 0, $g_iChkWaveFactor = 0
Global $g_iCmbGiantSlot = 0, $g_iTxtUnitFactor = 10, $g_iTxtWaveFactor = 100
Global $g_iSlotsGiants = 1, $g_aiSlotsGiants = 1

; Auto Dock, Hide Emulator & Bot - Persian MOD (#-07)
Global $g_bEnableAuto = False, $g_iChkAutoDock = False, $g_iChkAutoHideEmulator = True, $g_iChkAutoMinimizeBot = False

; Check Collector Outside - Persian MOD (#-08)
Global $g_bScanMineAndElixir = False
#region Check Collectors Outside
; Collectors Outside Filter
Global $g_bDBMeetCollOutside = False, $g_iTxtDBMinCollOutsidePercent = 80
; constants
Global Const $THEllipseWidth = 200, $THEllipseHeigth = 150, $CollectorsEllipseWidth = 130, $CollectorsEllipseHeigth = 97.5
Global Const $centerX = 430, $centerY = 335
Global $hBitmapFirst
Global $g_bDBCollectorsNearRedline = 1, $g_bSkipCollectorCheck = 1, $g_bSkipCollectorCheckTH = 1
Global $g_iCmbRedlineTiles = 1, $g_iCmbSkipCollectorCheckTH = 1
Global $g_iTxtSkipCollectorGold = 400000, $g_iTxtSkipCollectorElixir = 400000, $g_iTxtSkipCollectorDark = 0
#endregion

; CSV Deploy Speed - Persian MOD (#-09)
Global $cmbCSVSpeed[2] = [$LB, $DB]
Global $icmbCSVSpeed[2] = [2, 2]
Global $g_CSVSpeedDivider[2] = [1, 1] ; default CSVSpeed for DB & LB

; Switch Accounts - Persian MOD (#-12)
Global $g_oTxtSALogInitText = ObjCreate("Scripting.Dictionary")

; Smart Train - Persian MOD (#-13)
Global $ichkSmartTrain, $ichkPreciseTroops, $ichkFillArcher, $iFillArcher, $ichkFillEQ
Global Enum $g_eFull, $g_eRemained, $g_eNoTrain
Global $g_abRCheckWrongTroops[2] = [False, False] ; Result of checking wrong troops & spells
Global $g_bChkMultiClick, $g_iMultiClick = 1
Global $g_aiQueueTroops[$eTroopCount] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $g_aiQueueSpells[$eSpellCount] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

; Hero and Lab Status - Persian MOD (#-14)
Global $g_bNeedLocateLab = True, $g_bLabReady[9]
Global $g_aLabTimeAcc[8], $g_aLabTime[4] = [0, 0, 0, 0] ; day | hour | minute | time in minutes
Global $g_aLabTimerStart[8], $g_aLabTimerEnd[8]

; Bot Humanization - Persian MOD (#-15)
Global $g_iacmbPriority[13] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $g_iacmbMaxSpeed[2] = [1, 1]
Global $g_iacmbPause[2] = [0, 0]
Global $g_iahumanMessage[2] = ["Hello !", "Hello !"]
Global $g_ichallengeMessage = "Can you beat my village?"

Global $g_iMinimumPriority, $g_iMaxActionsNumber, $g_iActionToDo
Global $g_aSetActionPriority[13] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

Global $g_sFrequenceChain = "Never|Sometimes|Frequently|Often|Very Often"
Global $g_sReplayChain = "1|2|4"
Global $g_ichkUseBotHumanization = 0, $g_ichkUseAltRClick = 0, $g_icmbMaxActionsNumber = 1, $g_ichkCollectAchievements = 0, $g_ichkLookAtRedNotifications = 0

Global $g_aReplayDuration[2] = [0, 0] ; An array, [0] = Minute | [1] = Seconds
Global $g_bOnReplayWindow, $g_iReplayToPause

Global $g_iLastLayout = 0

; Forecast - Persian MOD (#-17)
Global Const $COLOR_DEEPPINK = 0xFF1493
Global Const $COLOR_DARKGREEN = 0x006400
Global $oIE = ObjCreate("Shell.Explorer.2")
Global $dtStamps[0], $lootMinutes[0]
Global $timeOffset = 0, $TimerForecast = 0
Global $lootIndexScaleMarkers, $currentForecast

Global $g_bChkForecastBoost = False, $g_iTxtForecastBoost = 6
Global $g_bChkForecastPause = False, $g_iTxtForecastPause = 2

Global $g_bChkForecastHopingSwitchMax = False, $g_iCmbForecastHopingSwitchMax = 0, $g_iTxtForecastHopingSwitchMax = 2
Global $g_bChkForecastHopingSwitchMin = False, $g_iCmbForecastHopingSwitchMin = 0, $g_iTxtForecastHopingSwitchMin = 2

Global $g_iCmbSwLang = 0

; Request CC Troops at first - Persian MOD (#-18)
Global $g_bReqCCFirst = False
Global $chkReqCCFirst = 0

; Goblin XP - Persian MOD (#-19)
Global $ichkEnableSuperXP = 0, $ichkSkipZoomOutXP = 0, $irbSXTraining = 1, $ichkSXBK = 0, $ichkSXAQ = 0, $ichkSXGW = 0, $iStartXP = 0, $iCurrentXP = 0, $iGainedXP = 0, $iGainedXPHour = 0, $itxtMaxXPtoGain = 500
Global $g_bDebugSX = False

Global $g_DpGoblinPicnic[3][4] = [[300, 205, 5, 5], [340, 140, 5, 5], [290, 220, 5, 5]]
Global $g_BdGoblinPicnic[3] = [0, "5000-7000", "6000-8000"] ; [0] = Queen, [1] = Warden, [2] = Barbarian King
Global $g_ActivatedHeroes[3] = [False, False, False] ; [0] = Queen, [1] = Warden, [2] = Barbarian King , Prevent to click on them to Activate Again And Again
Global Const $g_minStarsToEnd = 1
Global $g_canGainXP = False

; ClanHop - Persian MOD (#-20)
Global $g_bChkClanHop = False
Global $g_iTxtCheckingtraine = 5

; Max logout time - Persian MOD (#-21)
Global $g_bTrainLogoutMaxTime = False, $g_iTrainLogoutMaxTime = 4

; ExtendedAttackBar - Persian MOD (#-22)
Global $g_hChkExtendedAttackBarLB, $g_hChkExtendedAttackBarDB, $g_abChkExtendedAttackBar[2]
Global $g_iTotalAttackSlot = 10, $g_bDraggedAttackBar = False ; flag if AttackBar is dragged or not

; Chatbot - Persian MOD (#-23)
Global $chatIni = ""
Global $GlobalMessages1 = "", $GlobalMessages2 = "", $GlobalMessages3 = "", $GlobalMessages4 = ""
Global $ClanMessages = "", $ClanResponses = ""
Global $g_iGlobalChat = False, $g_iGlobalScramble = False, $g_iSwitchLang = False, $g_iCmbLang = 1
Global $g_iClanChat = False, $g_iRusLang = 0, $g_iUseResponses = False, $g_iUseGeneric = False, $g_iChatPushbullet = False, $g_iPbSendNewChats = False
Global $ChatbotStartTime
Global $ChatbotQueuedChats[0], $ChatbotReadQueued = False, $ChatbotReadInterval = 0, $ChatbotIsOnInterval = False

; CheckCC Troops - Persian MOD (#-24)
Global $g_aiCCTroops[$eTroopCount] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $g_aiCCSpells[$eSpellCount] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $g_aiCCTroopsExpected[$eTroopCount] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $g_aiCCSpellsExpected[$eSpellCount] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
Global $g_bChkCC, $g_bChkCCTroops
Global $g_aiCmbCCSlot[5], $g_aiTxtCCSlot[5]
Global $g_iCmbCastleCapacityT, $g_iCmbCastleCapacityS

; Attack Log New Style - Added By Eloy
Global $eLootPerc = "---"
Global $starsearned = 0
Global $eTHLevel = "-"

; Additional Notifactions - Added By Eloy
Global $eWinlose = "-"

; Switch Profile - Persian MOD (#-25)
Global $g_abChkSwitchMax[4], $g_abChkSwitchMin[4], $g_aiCmbSwitchMax[4], $g_aiCmbSwitchMin[4]
Global $g_abChkBotTypeMax[4], $g_abChkBotTypeMin[4], $g_aiCmbBotTypeMax[4], $g_aiCmbBotTypeMin[4]
Global $g_aiConditionMax[4], $g_aiConditionMin[4]

; Check Grand Warden Mode - Persian MOD (#-26)
Global $g_bCheckWardenMode = False, $g_iCheckWardenMode = 0

; Farm Schedule - Persian MOD (#-27)
Global $g_abChkSetFarm[8]
Global $g_aiCmbAction1[8], $g_aiCmbCriteria1[8], $g_aiTxtResource1[8], $g_aiCmbTime1[8]
Global $g_aiCmbAction2[8], $g_aiCmbCriteria2[8], $g_aiTxtResource2[8], $g_aiCmbTime2[8]

; Restart Search Legend league - Persian MOD (#-29)
Global $g_bIsSearchTimeout = False, $g_iSearchTimeout = 10, $g_iTotalSearchTime = 0

; Stop on Low battery - Persian MOD (#-30)
Global $g_bStopOnBatt = False, $g_iStopOnBatt = 10

; Robot Transparency - Persian MOD (#-34)
Global $SldTransLevel = 0

; SWIPE - Persian MOD (#-33)
Global $SWIPE = ""

;xbenk ~ legend league
Global $g_iTotalSearchTime = 0

; Multi Finger - Persian MOD (#-04)
Global Enum $directionLeft, $directionRight
Global Enum $sideBottomRight, $sideTopLeft, $sideBottomLeft, $sideTopRight
Global Enum $mfRandom, $mfFFStandard, $mfFFSpiralLeft, $mfFFSpiralRight, $mf8FBlossom, $mf8FImplosion, $mf8FPinWheelLeft, $mf8FPinWheelRight

Global $iMultiFingerStyle = 0

Global Enum  $eCCSpell = $eSkSpell + 1
Global $lblDBMultiFinger, $cmbDBMultiFinger

; Use Event Troop - Persian MOD (#-35)
Global $ichkEnableUseEventTroop = False

; ================= Persian MOD (2018) ================= ;
; Enable/Disable GUI while botting (#-01)
; Support MOD Button (#-02)
; Check Version (#-03)
; Multi Finger (#-04)
; Unit/Wave Factor (#-05)
; Drop Order Troops (#-06)
; Auto Dock, Hide Emulator & Bot (#-07)
; Check Collector Outside (#-08)
; CSV Deploy Speed (#-09)
; Attack Now (#-10)
; QuickTrain Combo (#-11)
; Switch Accounts (#-12)
; Smart Train (#-13)
; Hero and Lab Status (#-14)
; Bot Humanization (#-15)
; Forecast (#-17)
; Request CC Troops at first (#-18)
; Goblin XP (#-19)
; ClanHop (#-20)
; Max logout time (#-21)
; ExtendedAttackBar (#-22)
; Chatbot (#-23)
; CheckCC Troops (#-24)
; Switch Profile (#-25)
; Check Grand Warden Mode (#-26)
; Farm Schedule (#-27)
; Additional Custom Donate (#-28)
; Restart Search Legend league (#-29)
; Stop on Low battery (#-30)
; GTFO (#-31)
; CSV Downloader (#-32)
; SWIPE (#-33)
; Robot Transparency (#-34)
; Use Event Troop (#-35)
; ================= Persian MOD (2018) ================= ;
