;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Straya:Fragments:Terminals:uninstall Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
Straya_Engine_Handler.uninstall()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Chronicle:Engine:Handler:Static Property Straya_Engine_Handler Auto Const
