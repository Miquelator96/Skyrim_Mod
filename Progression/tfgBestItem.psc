Scriptname tfgBestItem extends ObjectReference  
ObjectReference Property itemReference  Auto  
Form Property baseItem Auto
Float Property maxValue Auto
Bool Property ready Auto
Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

if maxValue < akBaseItem.GetGoldValue()

maxValue = akBaseItem.GetGoldValue();
itemReference = akItemReference;
baseItem = akBaseItem
ready = true;
endif
endEvent

 
Function outWithBestItem()


if ready
 
	RemoveItem(baseItem)
	chest.addItem(baseItem)			;add parameter object to container
	ready = false;

endif
endFunction




ObjectReference Property chest  Auto  
