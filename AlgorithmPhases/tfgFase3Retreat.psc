Scriptname tfgFase3Retreat extends ObjectReference  

Actor Property Enemy  Auto  
Actor Property PlayerRef  Auto  
Actor Property MarkerRetreat  Auto  

Quest Property TfgQuest  Auto  



Event OnCombatStateChanged(Actor akTarget, int aeCombatState)

	if (aeCombatState == 1)
	  RegisterForUpdate(1.0) 
	else
	UnregisterForUpdate()
	endIf
endEvent

Event OnEnterBleedout()

if (phase.GetValue()==3)
	Actor player = Game.GetPlayer();
	player.StopCombat();
	Enemy.StopCombat();
	Game.SetCameraTarget(player);
	tfgLastTime.SetValueInt(1);
	phase.SetValueInt(6);
	Utility.Wait(3);
	Enemy.ResetHealthAndLimbs()
	
	Enemy.EvaluatePackage()

endIf

endEvent



Event OnUpdate()
if (phase.GetValue()==3)


if(Enemy.GetDistance(PlayerRef)>3000)

tfgLastTime.SetValueInt(2);

Debug.MessageBox("You have escaped from Drartis. All this running will make him faster next time!")
phase.SetValueInt(9);

PlayerRef.GetActorBase().SetEssential(false)
Enemy.SetAlpha(0.1,true);
Utility.Wait(1);
Enemy.MoveTo(MarkerRetreat)
Enemy.SetAlpha(1);
Enemy.SetRelationshipRank(PlayerRef,0)

	
endIf

endIf

endEvent


GlobalVariable Property phase  Auto  

 

GlobalVariable Property tfgLastTime  Auto  
