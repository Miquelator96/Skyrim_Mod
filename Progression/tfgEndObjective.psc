Scriptname tfgEndObjective extends ObjectReference  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
TfgQuestNPC.SetObjectiveCompleted(1, true);


EndEvent
Quest Property TfgQuestNPC  Auto  

Int Property objective  Auto  
