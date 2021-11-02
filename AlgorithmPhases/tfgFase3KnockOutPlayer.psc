Scriptname tfgFase3KnockOutPlayer extends ObjectReference  

Quest Property TfgQuest  Auto  
Form Property f0 Auto
Form Property f1 Auto
Form Property f2 Auto



Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)

	f0 = PlayerRef.GetEquippedObject(0)
	f1 = PlayerRef.GetEquippedObject(1)
	f2 = PlayerRef.GetEquippedObject(2)

endEvent


Event OnEnterBleedout()

tfgEnemy.StopCombat()
PlayerRef.StopCombat();
Utility.Wait(4.0)
Game.GetPlayer().RestoreActorValue("health", 100)



tfgLastTime.SetValueInt(0);


If (f0 as Weapon)
	Game.GetPlayer().EquipItem(f0)
ElseIf (f0 as Spell)

	PlayerRef.EquipSpell((f0 as Spell), 0)
EndIf
If (f1 as Weapon)
	Game.GetPlayer().EquipItem(f1)
ElseIf (f1 as Spell)
PlayerRef.EquipSpell((f1 as Spell), 1)

EndIf

If (f2 as Spell)
	PlayerRef.EquipSpell((f2 as Spell), 2)
EndIf



(objectEnemy as tfgTraits).killMinions()

tfgPhase.SetValueInt(5);
tfgEnemy.EvaluatePackage()
(objectEnemy as tfgTraits).addDescription();
Debug.Notification("Drartis has learned a new ability with the Dragonborn's power")



endEvent


Actor Property PlayerRef  Auto  

Actor Property tfgEnemy  Auto  

GlobalVariable Property tfgPhase  Auto  

GlobalVariable Property tfgLastTime  Auto  

ObjectReference Property objectEnemy  Auto  
