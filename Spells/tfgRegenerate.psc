Scriptname tfgRegenerate extends ObjectReference  
Event OnCombatStateChanged(Actor akTarget, int aeCombatState)

	if (aeCombatState == 1)
	  RegisterForUpdate(5) 
	else
	UnregisterForUpdate()
	endIf

endEvent

Event OnUpdate()

if trait

tfgRegenerateHealth.cast(tfgEnemy)
endIf
endEvent

function setTrait()
trait = True;
endFunction

SPELL Property tfgRegenerateHealth  Auto  

Bool Property trait  Auto  

Actor Property tfgEnemy  Auto  
