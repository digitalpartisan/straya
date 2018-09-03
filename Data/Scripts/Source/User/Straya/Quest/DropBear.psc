Scriptname Straya:Quest:DropBear extends ReferenceAlias

Event OnAliasInit()
	GetActorReference().StartCombat(Game.GetPlayer(), true)
EndEvent

Event OnDying(Actor akKiller)
	Quest owningQuest = GetOwningQuest()
	owningQuest.CompleteAllObjectives()
	owningQuest.Stop()
EndEvent
