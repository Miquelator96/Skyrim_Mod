Scriptname tfgFase9   

Quest Property TfgQuestNPC  Auto 
Actor Property Enemy  Auto  
 
Bool Property waiting  Auto  



Event OnLoad()
    Debug.MessageBox("hello");
 Debug.MessageBox(waiting);

  if (TfgQuestNPC.GetStage()==9&&waiting==false)
    waiting = true;

    Debug.MessageBox("Començo a esperar");
    Utility.WaitGameTime(5)
    Debug.MessageBox("Acabo d'esperar");

    TfgQuestNPC.setStage(8)
   Enemy.EvaluatePackage()
    waiting = false;
  endIf
endEvent



