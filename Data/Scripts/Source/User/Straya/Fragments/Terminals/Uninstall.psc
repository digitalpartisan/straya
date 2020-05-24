;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Straya:Fragments:Terminals:Uninstall Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
Straya_Engine_UninstallHelper.uninstall()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Straya:Uninstaller Property Straya_Engine_UninstallHelper Auto Const Mandatory
