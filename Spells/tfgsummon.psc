Scriptname tfgsummon extends Actor  

Event OnUpdate()
if tfgPhase.GetValueInt()!=3

Self.Kill()

endIf


endEvent

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)

	if (aeCombatState == 1)
	RegisterForUpdate(10)
	
	endIf
endEvent
Bool Property Start  Auto  

GlobalVariable Property tfgPhase  Auto  
