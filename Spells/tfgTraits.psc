Scriptname tfgTraits extends ObjectReference  

Int Property total  Auto;
Int Property pos  Auto;  
Bool Property a  Auto;  
Bool Property b  Auto;  
Bool Property c Auto;
ObjectReference  Property bandit  Auto;  
ObjectReference  Property archer1  Auto;  
ObjectReference  Property archer2  Auto;  
Actor Property tfgEnemy  Auto  
Faction Property CreatureFaction  Auto  
ObjectReference Property Player  Auto  

WEAPON Property Bow  Auto  
WEAPON Property bow2  Auto  
FormList Property csFormlist  Auto  
Armor Property SHIELD  Auto  
Armor Property Cautious  Auto  
SPELL Property resistMagic  Auto  
Int Property totalRanged  Auto  
Int Property totalClose  Auto  

String[] Property arrayNamePoolClose  Auto  
String[] Property ArrayNamePoolRanged  Auto  
String[] Property ArrayDescriptionPoolClose  Auto  
String[] Property ArrayDescriptionPoolRanged  Auto  
String[] Property arrayDescription  Auto  
String[] Property arrayName  Auto  



Event OnCombatStateChanged(Actor akTarget, int aeCombatState)

	if (aeCombatState == 1)
	
	 RegisterForUpdate(2.0) 
	else


	UnregisterForUpdate()
	endIf

endEvent

Event OnUpdate()
if (tfgEnemy.IsEssential()&&c && Player.GetDistance(tfgEnemy)<400&& tfgEnemy.GetAV("Health")<30)
c = false;
tfgEnemy.MoveTo(Player, -700.0*Math.Sin(Player.GetAngleZ()), -700.0*Math.Cos(Player.GetAngleZ()),0)
tfgEnemy.SetRelationshipRank(Game.GetPlayer(),-3)
tfgEnemy.StartCombat(Game.GetPlayer());
UnregisterForUpdate()

endIf

if (tfgEnemy.IsEssential()&&d && Player.GetDistance(tfgEnemy)>600)

tfgEnemy.MoveTo(Player, 200.0*Math.Sin(Player.GetAngleZ()), 200.0*Math.Cos(Player.GetAngleZ()),0)
tfgEnemy.SetRelationshipRank(Game.GetPlayer(),-3)
tfgEnemy.StartCombat(Game.GetPlayer());
UnregisterForUpdate()

endIf

endEvent

function resetArray()
level = 1;

arrayDescription = new String[5]
arrayName = new String[5]

arrayDescriptionPoolClose = new String[6]
arrayNamePoolClose = new String[6]

arrayDescriptionPoolRanged = new String[5]
arrayNamePoolRanged = new String[5]

total = 9;
pos = 0
totalClose = 5;
totalRanged = 4;

arrayNamePoolClose[0] = "Warrior Summon";
arrayNamePoolClose[1] = "Quick Shot";
arrayNamePoolClose[2] = "Regenerator";
arrayNamePoolClose[3] = "Bow lover";
arrayNamePoolClose[4] = "Frost Magician";
arrayNamePoolClose[5] = "Emergency heal";

arrayDescriptionPoolClose[0] = "Summons a melee skeleton";
arrayDescriptionPoolClose[1] = "Shoots very fast";
arrayDescriptionPoolClose[2] = "Gains health over time";
arrayDescriptionPoolClose[3] = "He prefers ranged combat over close quarters";
arrayDescriptionPoolClose[4] = "Ability with frost attacks to reduce stamina";
arrayDescriptionPoolClose[5] = "Once per combat, he will heal himself and get to safety";


arrayNamePoolRanged[0] = "Speedster";
arrayNamePoolRanged[1] = "Bloodthirsty";
arrayNamePoolRanged[2] = "Aggressive";
arrayNamePoolRanged[3] = "Shadow Move";
arrayNamePoolRanged[4] = "Archer Summon";

arrayDescriptionPoolRanged[0] = "Faster movement";
arrayDescriptionPoolRanged[1] = "Heals with hits";
arrayDescriptionPoolRanged[2] = "He will run towards you for close combat";
arrayDescriptionPoolRanged[3] = "Has the ability to teleport closer to you to get faster in distance";
arrayDescriptionPoolRanged[4] = "Has a gang of archers";


endFunction

String  function getRandom()

int onehanded = Math.Floor((Player as Actor).GetAV("OneHanded"));
int destruction = Math.Floor((Player as Actor).GetAV("Destruction"));
int twohanded = Math.Floor((Player as Actor).GetAV("TwoHanded"));
int stealth = Math.Floor((Player as Actor).GetAV("Sneak"));
int marksman = Math.Floor((Player as Actor).GetAV("Marksman"));
int block = Math.Floor((Player as Actor).GetAV("Block"));
int suma = onehanded-destruction+twohanded-stealth-marksman+block;

if suma>0

	int random = Utility.RandomInt(0, totalClose);
	arrayDescription[pos] = arrayDescriptionPoolClose[random];
	arrayName[pos] = arrayNamePoolClose[random]


	arrayNamePoolClose[random] = arrayNamePoolClose[totalClose];
	arrayDescriptionPoolClose[random] = arrayDescriptionPoolClose[totalClose];

	totalClose -=1;
	return arrayName[pos];

else
	int random = Utility.RandomInt(0, totalRanged);
	arrayDescription[pos] = arrayDescriptionPoolRanged[random];
	arrayName[pos] = arrayNamePoolRanged[random]
	Debug.MessageBox("name: "+arrayName[pos]);

	arrayNamePoolRanged[random] = arrayNamePoolRanged[totalRanged];
	arrayDescriptionPoolRanged[random] = arrayDescriptionPoolRanged[totalRanged];

	totalRanged -=1;

	return arrayName[pos];

endIf

endFunction


function addDescription() 	

if pos <5

String s = getRandom();

if s=="Speedster"
tfgEnemy.SetAV("SpeedMult",250);
(yo as tfgConditional).setInt(0);
endIf

if s=="Regenerator"
((tfgEnemy as ObjectReference) as tfgRegenerate).setTrait()
(yo as tfgConditional).setInt(7);
endIf


if s=="Bloodthirsty"
(Player as tfgBloodThirsty).setTrait();
(yo as tfgConditional).setInt(1);
endIf


if s=="Frost Magician"
(yo as tfgConditional).setInt(9);
	if frostnbow
			

		Combatstyle csStyle;
		csStyle = (csFormlist.Getat(4) as Combatstyle)
		ActorBase enemyBase = tfgEnemy.GetActorBase()
		enemyBase.SetCombatStyle(csStyle);

	else
	
		Combatstyle csStyle;
		csStyle = (csFormlist.Getat(3) as Combatstyle)
		ActorBase enemyBase = tfgEnemy.GetActorBase()
		enemyBase.SetCombatStyle(csStyle);
		frostnbow = true
	endIf
endIf



if s=="Quick Shot"
(yo as tfgConditional).setInt(6);
tfgEnemy.RemoveItem(bow2, 1)
tfgEnemy.AddItem(bow2, 1)
endIf

if s=="Emergency Heal"
(yo as tfgConditional).setInt(10);
c = true;
endIf

if s=="Shadow Move"
(yo as tfgConditional).setInt(3);
d = true;
endIf

if s=="Bow lover"
(yo as tfgConditional).setInt(8);
	if frostnbow
				

		Combatstyle csStyle;
		csStyle = (csFormlist.Getat(4) as Combatstyle)
		ActorBase enemyBase = tfgEnemy.GetActorBase()
		enemyBase.SetCombatStyle(csStyle);

	else
					

		Combatstyle csStyle;
		csStyle = (csFormlist.Getat(1) as Combatstyle)
		ActorBase enemyBase = tfgEnemy.GetActorBase()
		enemyBase.SetCombatStyle(csStyle);
		frostnbow = true
	endIf

tfgEnemy.EquipItem(cautious, true)
endIf

if (s== "Warrior Summon")
(yo as tfgConditional).setInt(5);
endIf

if (s== "Archer Summon")
(yo as tfgConditional).setInt(4);
endIf

if s=="Aggressive"
(yo as tfgConditional).setInt(2);
Combatstyle csStyle;
csStyle = (csFormlist.Getat(0) as Combatstyle)
ActorBase enemyBase = tfgEnemy.GetActorBase()
enemyBase.SetCombatStyle(csStyle);

endIf

pos += 1;

endIf
endFunction

function levelUp()

level = level+1;
endFunction

function showTraits()
String statement ="DRARTIS' TRAITS: \n Level: "+level+"\n";
int aux = 0;
while aux<pos

statement=statement+arrayName[aux]+": "+arrayDescription[aux]+"\n"
aux+=1;

endwhile

Debug.MessageBox(statement);
endFunction

function setConstants()


int aux = 0;
a = false;
b = false;

while aux<pos



if (arrayName[aux] == "Warrior Summon")
a = true;
endIf

if (arrayName[aux] == "Emergency Heal")
c = true;
endIf

if (arrayName[aux] == "Archer Summon")
b = true;
endIf

aux+=1;
endwhile


if a
bandit = tfgEnemy.PlaceAtMe(Game.GetForm(0x05093709))
endIf

if b
archer1 = tfgEnemy.PlaceAtMe(Game.GetForm(0x050C6127))
archer2 = tfgEnemy.PlaceAtMe(Game.GetForm(0x050C6127))
endIf

endFunction


function killMinions()

int aux = 0;
while aux<pos

if (arrayName[aux] == "Warrior Summon")
(bandit as actor).kill()
endIf

if (arrayName[aux] == "Archer Summon")
(archer1 as actor).kill()
(archer2 as actor).kill()
endIf

aux+=1;
endwhile

endFunction


Bool Property d  Auto  
  

Bool Property e  Auto  

Int Property level  Auto 

Bool Property frostnbow  Auto  

SPELL Property spellRegenerate  Auto  

Bool Property Speedster  Auto  Conditional

ObjectReference Property yo  Auto  
