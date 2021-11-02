Scriptname tfgQuickshot extends ObjectReference  

Actor Property tfgEnemy  Auto  
Bool Property quickShot  Auto  
Form Property bow Auto


function setQuickshot()
Debug.MessageBox("shot");
tfgEnemy.RemoveItem(bow2, 1)
tfgEnemy.AddItem(bowquick, 1)




endFunction



WEAPON Property bow2  Auto  

WEAPON Property bowquick  Auto  
