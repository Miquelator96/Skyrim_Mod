Scriptname tfgFase12 extends ObjectReference  

GlobalVariable Property tfgPhase  Auto  

Location Property Lair  Auto  

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  if (Game.GetPlayer().GetCurrentLocation() == Lair)
   tfgPhase.SetValueInt(12);
tfgEnemy.EvaluatePackage()

  endIf
endEvent
Actor Property tfgEnemy  Auto  
