Scriptname Straya:Quest extends Quest

Int Property DropBearObjectiveID = 10 Auto Const
ReferenceAlias Property DropBear Auto Const Mandatory

Event OnQuestInit()
	Straya:Logger.logQuestStarting(self)
	SetActive()
	SetObjectiveDisplayed(DropBearObjectiveID)
EndEvent

Event OnQuestShutdown()
	Straya:Logger.logQuestStopping(self)
	SetActive(false)
	Reset()
EndEvent

Function forceShutdown()
	Actor aDropBear = DropBear.GetActorReference()
	if (aDropBear)
		aDropBear.Kill(Game.GetPlayer())
	endif
	
	Stop()
	CompleteQuest()
EndFunction
