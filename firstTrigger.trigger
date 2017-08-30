//Trigger Assignments :
//1.System.debug the following statements for any object
//a)Trigger.New b) Trigger.Old c)Trigger.NewMap d)Trigger.oldMap

//2.System.debug the following statements for all events (Before & After)
//a)Trigger.New b) Trigger.Old c)Trigger.NewMap d)Trigger.oldMap
trigger firstTrigger on Employee__c (after delete, 
								 	 after insert, 
								 	 after update, 
								 	 before delete,
 								 	 before insert, 
 									 before update) {
 								 	 
 	 if(trigger.isBefore && trigger.isInsert){
 	 	System.Debug(trigger.new);
 	 }
 	 
 	 if(trigger.isBefore && trigger.isUpdate){
 	 	System.Debug(trigger.new);
 	 }
  
     if(trigger.isBefore && trigger.isDelete){
 	 	System.Debug(trigger.oldMap);
 	 }
 	 if(trigger.isAfter && trigger.isInsert){
 	 	System.Debug(trigger.newMap);
 	 }
 	 
 	 if(trigger.isAfter && trigger.isUpdate){
 	 	System.Debug(trigger.newMap);
 	 }
  
     if(trigger.isAfter && trigger.isDelete){
 	 	System.Debug(trigger.newMap);
 	 }
 	 
}