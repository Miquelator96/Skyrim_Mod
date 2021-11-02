Scriptname tfgBloodThirsty extends ObjectReference  

Actor Property Enemy  Auto  
Actor Property Player  Auto  
Bool Property trait  Auto  
SPELL Property mySpell  Auto  

Function setTrait ()
trait = true;
EndFunction

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, \
  bool abBashAttack, bool abHitBlocked)

if (trait && (akAggressor as Actor)==Enemy)
mySpell.cast(Enemy,Player)
endIf

EndEvent

