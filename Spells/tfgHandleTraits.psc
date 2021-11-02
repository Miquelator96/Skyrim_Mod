Scriptname tfgHandleTraits extends ObjectReference  

Actor Property tfgEnemy  Auto  

SPELL Property bloodThirsty  Auto  

EVENT OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack,  bool abBashAttack, bool abHitBlocked)



       bloodThirsty.Cast(tfgEnemy,Game.GetPlayer())


ENDEVENT
