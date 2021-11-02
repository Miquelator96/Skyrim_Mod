Scriptname tfgHandleInvulnerable extends ObjectReference  

FormList Property tfgNPCHabilitats  Auto  

Event OnHit(ObjectReference attacker, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

Bool boHitByMagic = FALSE  ; True if likely hit by Magic attack.
Bool boHitByMelee = FALSE  ; True if likely hit by Melee attack.
Bool boHitByRanged = FALSE ; True if likely his by Ranged attack.
 
Actor akAggressor = attacker as Actor
 
	IF ((akAggressor.GetEquippedItemType(0) == 8) || (akAggressor.GetEquippedItemType(1) == 8) \
		|| (akAggressor.GetEquippedItemType(0) == 9) || (akAggressor.GetEquippedItemType(1) == 9))  && akProjectile != None
		boHitByMagic = TRUE
		
	
	ELSEIF (akAggressor.GetEquippedItemType(0) != 7) && akProjectile == None
		boHitByMelee = TRUE
					
	ELSEIF (akAggressor.GetEquippedItemType(0) == 7)
		boHitByRanged = TRUE

	ENDIF
EndEvent