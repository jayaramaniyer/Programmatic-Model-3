//3.Write a Trigger on Lead which will create the clone record.
trigger clone on Lead (before insert, after insert, before update, after update) {

	if(CustomSetting__c.getInstance().Account_Trigger__c==FALSE){
   		System.debug('Trigger disabled due to custom setting');
   		return;
	}
	else{
		 if(Trigger.isUpdate && Trigger.isAfter){
     	 if(Trigger.isAfter)
           {   
            	if(Trigger.IsInsert)
                {   
                       
                   list<lead> listOflead = new list<Lead>();
                    
                    for(lead objlead : listOflead){
                        lead newlead = objlead.clone();//cloned the record
                        listOflead.add(newlead);//added the cloned record in the list
                    }
                    
                    
                    
                    insert listOflead;//insert the list of records 
                    
                    System.debug('==== Data inserted ===');
    			}
                  
           }
         }  
        
     }
}