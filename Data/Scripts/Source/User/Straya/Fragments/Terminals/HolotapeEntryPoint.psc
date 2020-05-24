;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Straya:Fragments:Terminals:HolotapeEntryPoint Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
Straya_Engine_UninstallHelper.refresh()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Straya:Uninstaller Property Straya_Engine_UninstallHelper Auto Const Mandatory
