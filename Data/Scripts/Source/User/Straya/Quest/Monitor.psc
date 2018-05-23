Scriptname Straya:Quest:Monitor extends Quest

Straya:Quest Property Straya_Quest Auto Const Mandatory
Int Property TimerID = 1 Auto Const
GlobalVariable Property Straya_Quest_Monitor_InGameHours Auto Const Mandatory
GlobalVariable Property Straya_Quest_Monitor_SpawnChance Auto Const Mandatory
Message Property Straya_Quest_Monitor_UpdatedRollFrequency Auto Const Mandatory
Message Property Straya_Quest_Monitor_UpdatedSpawnChance Auto Const Mandatory

String sStateStarting = "Starting" Const
String sStateShutdown = "Shutdown" Const
String sStateTiming = "Timing" Const
String sStateTimerResponse = "TimerResponse" Const
String sStateQuestRunning = "QuestRunning" Const

Bool Function rollToStartQuest()
	return false
EndFunction

Bool Function canStartQuest()
	return false
EndFunction

Function observeQuest(Bool bListen = true)
	if (bListen)
		Straya:Logger.logObservingQuest(self, Straya_Quest)
		RegisterForRemoteEvent(Straya_Quest, "OnQuestInit")
		RegisterForRemoteEvent(Straya_Quest, "OnQuestShutdown")
	else
		Straya:Logger.logNotObservingQuest(self, Straya_Quest)
		UnregisterForRemoteEvent(Straya_Quest, "OnQuestInit")
		UnregisterForRemoteEvent(Straya_Quest, "OnQuestShutdown")
	endif
EndFunction

Function observePlayerLocationChange(Bool bListen = true)
	if (bListen)
		Straya:Logger.logObservingPlayerLocationChange(self)
		RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	else
		Straya:Logger.logNotObservingPlayerLocationChange(self)
		UnregisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	endif
EndFunction

Function startTiming()

EndFunction

Function cancelTiming()
	Straya:Logger.logMonitorCancelingTimer(self)
	CancelTimerGameTime(TimerID)
EndFunction

Function restartTimer()
	cancelTiming()
	startTiming()
EndFunction

Event Quest.OnQuestInit(Quest sender)
	Straya:Logger.logQuestStartEvent(self, sender)

	if (Straya_Quest != sender)
		return
	endif

	GoToState(sStateQuestRunning)
EndEvent

Event Quest.OnQuestShutdown(Quest sender)
	
EndEvent

Event Actor.OnLocationChange(Actor sender, Location alOldLocation, Location alNewLocation)
	
EndEvent

Event OnQuestShutdown()
	GoToState(sStateShutdown)
EndEvent

Function setTimerDelay(Float fInGameHours = 24.0)
	Straya:Logger.logSetFrequency(self, fInGameHours)
	Straya_Quest_Monitor_InGameHours.SetValue(fInGameHours)
	Straya_Quest_Monitor_UpdatedRollFrequency.Show()
	restartTimer()
EndFunction

Function setSpawnChance(Float fPercentChance = 10.0)
	Straya:Logger.logSetChance(self, fPercentChance)
	Straya_Quest_Monitor_SpawnChance.SetValue(fPercentChance)
	Straya_Quest_Monitor_UpdatedSpawnChance.Show()
EndFunction

Auto State Starting
	Event OnBeginState(String asOldState)
		Straya:Logger.logStateChange(self, asOldState)
	EndEvent
	
	Event OnQuestInit()
		observeQuest()
		GoToState(sStateTiming)
	EndEvent
EndState

State Shutdown
	Event OnBeginState(String asOldState)
		Straya:Logger.logStateChange(self, asOldState)
		observeQuest(false)
		observePlayerLocationChange(false)
		Straya_Quest.forceShutdown()
	EndEvent
EndState

State Timing
	Event OnBeginState(String asOldState)
		Straya:Logger.logStateChange(self, asOldState)
		startTiming()
	EndEvent
	
	Event OnEndState(String asNewState)
		cancelTiming()
	EndEvent
	
	Function startTiming()
		Straya:Logger.logMonitorTiming(self, Straya_Quest_Monitor_InGameHours)
		StartTimerGameTime(Straya_Quest_Monitor_InGameHours.GetValue(), TimerID)
	EndFunction
	
	Event OnTimerGameTime(Int aiTimerID)
		Straya:Logger.logMonitorTimerUp(self)
	
		if (TimerID != aiTimerID)
			return
		endif
		
		GoToState(sStateTimerResponse)
	EndEvent
EndState

State TimerResponse
	Event OnBeginState(String asOldState)
		Straya:Logger.logStateChange(self, asOldState)
		if (rollToStartQuest())
			Straya:Logger.logRollSuccess(self)
			if (canStartQuest())
				GoToState(sStateQuestRunning)
			else
				observePlayerLocationChange()
			endif
		else
			Straya:Logger.logRollFailure(self)
			GoToState(sStateTiming)
		endif
	EndEvent
	
	Event Actor.OnLocationChange(Actor sender, Location alOldLocation, Location alNewLocation)
		Straya:Logger.logActorLocationChange(self, sender)
		
		if (Game.GetPlayer() != sender)
			return
		endif
		
		if (canStartQuest())
			observePlayerLocationChange(false)
			GoToState(sStateQuestRunning)
		endif
	EndEvent
	
	Bool Function rollToStartQuest()
		return Utility.RandomFloat(0.0, 100.0) < Straya_Quest_Monitor_SpawnChance.GetValue()
	EndFunction
	
	Bool Function canStartQuest()
		return !Game.GetPlayer().IsInInterior()
	EndFunction
EndState

State QuestRunning
	Event OnBeginState(String asOldState)
		Straya:Logger.logStateChange(self, asOldState)
		Straya_Quest.Start()
	EndEvent
	
	Event Quest.OnQuestShutdown(Quest sender)
		Straya:Logger.logQuestStopEvent(self, sender)
	
		if (Straya_Quest != sender)
			return
		endif
		
		GoToState(sStateTiming)
	EndEvent
EndState
