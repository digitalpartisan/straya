Scriptname Straya:Uninstaller extends Quest Conditional

Chronicle:Engine Property MyEngine Auto Const Mandatory

Bool bCanUninstall = false Conditional

Function refresh()
	bCanUninstall = MyEngine.canUninstall()
EndFunction

Function uninstall()
	MyEngine.uninstall()
EndFunction
