Scriptname tfgOnLoad extends ObjectReference  

Event OnLoad()
if (!fet)
tfgPhase.SetValueInt(12)
endIf
endEvent
GlobalVariable Property tfgPhase  Auto  

Bool Property fet  Auto  
