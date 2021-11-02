Scriptname tfgSetObjective extends ObjectReference  

Quest Property TfgQuestNPC  Auto  

Int Property objective  Auto  
Bool Property done Auto

event onRead()
	
	TfgQuestNPC.SetObjectiveDisplayed(1, true)
	TfgQuestNPC.SetObjectiveCompleted(0, true)
	TfgQuestNPC.SetObjectiveDisplayed(2, true)




endEvent


Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

		if (Game.GetPlayer() == akNewContainer &&!done)


	if objective == 0
		TfgQuestNPC.SetObjectiveDisplayed(0, true)
		done = true;
	endIf
	endif
	EndEvent
