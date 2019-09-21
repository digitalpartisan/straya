Scriptname Straya:Logger Hidden Const DebugOnly

String Function getName() Global
	return "Straya"
EndFunction

Bool Function log(String sMessage, String[] tags = None) Global
	return Jiffy:Loggout.log(getName(), sMessage, tags)
EndFunction

Bool Function warn(String sMessage, String[] tags = None) Global
	return Jiffy:Loggout.warn(getName(), sMessage, tags)
EndFunction

Bool Function error(String sMessage, String[] tags = None) Global
	return Jiffy:Loggout.error(getName(), sMessage, tags)
EndFunction

Bool Function logStateChange(ScriptObject objectRef, String sOldState) Global
	return log(objectRef + " changed state to " + objectRef.GetState() + " from " + sOldState)
EndFunction

Bool Function logQuestStarting(Straya:Quest questRef) Global
	return log(questRef + " is starting")
EndFunction

Bool Function logQuestStopping(Straya:Quest questRef) Global
	return log(questRef + " is stopping")
EndFunction

Bool Function logMonitorTiming(Straya:Quest:Monitor monitorRef, GlobalVariable hoursAmount) Global
	return log(monitorRef + " is requesting a timer event in " + hoursAmount.GetValue() + " in-game hours")
EndFunction

Bool Function logMonitorTimerUp(Straya:Quest:Monitor monitorRef) Global
	return log(monitorRef + " has received timer event")
EndFunction

Bool Function logMonitorCancelingTimer(Straya:Quest:Monitor monitorRef) Global
	return log(monitorRef + " is cancelling its timer event")
EndFunction

Bool Function logObservingQuest(Straya:Quest:Monitor monitorRef, Straya:Quest questRef) Global
	return log(monitorRef + " is listening for start/stop events on " + questRef)
EndFunction

Bool Function logNotObservingQuest(Straya:Quest:Monitor monitorRef, Straya:Quest questRef) Global
	return log(monitorRef + " is no longer listening for start/stop events on " + questRef)
EndFunction

Bool Function logQuestStartEvent(Straya:Quest:Monitor monitorRef, Quest questRef) Global
	return log(monitorRef + " receieved start event on quest " + questRef)
EndFunction

Bool Function logQuestStopEvent(Straya:Quest:Monitor monitorRef, Quest questRef) Global
	return log(monitorRef + " received stop event on quest " + questRef)
EndFunction

Bool Function logObservingPlayerLocationChange(Straya:Quest:Monitor monitorRef) Global
	return log(monitorRef + " is observing player location change")
EndFunction

Bool Function logNotObservingPlayerLocationChange(Straya:Quest:Monitor monitorRef) Global
	return log(monitorRef + " is not observing player location change")
EndFunction

Bool Function logActorLocationChange(Straya:Quest:Monitor monitorRef, Actor actorRef) Global
	return log(monitorRef + " observed actor location change on " + actorRef)
EndFunction

Bool Function logRollSuccess(Straya:Quest:Monitor monitorRef) Global
	return log(monitorRef + " rolled to start quest")
EndFunction

Bool Function logRollFailure(Straya:Quest:Monitor monitorRef) Global
	return log(monitorRef + " rolled not to start quest")
EndFunction

Bool Function logSetFrequency(Straya:Quest:Monitor monitorRef, Float fNewValue) Global
	return log(monitorRef + " has set the roll frequency to " + fNewValue)
EndFunction

Bool Function logSetChance(Straya:Quest:Monitor monitorRef, Float fNewValue) Global
	return log(monitorRef + " has set the spawn chance to " + fNewValue)
EndFunction
