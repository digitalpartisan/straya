Scriptname Straya:PlayerAliasRepair extends Quest

Chronicle:Engine Property Straya_Engine Auto Const Mandatory
ReferenceAlias Property PlayerAlias Auto Const Mandatory

Event OnInit()
	if (Straya_Engine.IsRunning() && !PlayerAlias.GetReference())
		PlayerAlias.ForceRefTo(Game.GetPlayer())
		Straya_Engine.gameLoaded()
	endif
	
	Stop()
EndEvent

