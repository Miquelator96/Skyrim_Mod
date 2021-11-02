Scriptname tfgCastSpell extends ObjectReference  

Actor Property Enemy  Auto  
Actor Property Player  Auto  
SPELL Property mySpell  Auto
FormList Property Habilitats  Auto  

Event OnLoad()
	Habilitats.AddForm(mySpell);
endEvent  
