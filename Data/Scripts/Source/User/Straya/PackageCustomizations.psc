Scriptname Straya:PackageCustomizations extends Chronicle:Package:CustomBehavior

Straya:Quest:Monitor Property Straya_Quest_Monitor Auto Const Mandatory

Bool Function uninstallBehavior()
	Straya_Quest_Monitor.Stop()
	return parent.uninstallBehavior()
EndFunction
