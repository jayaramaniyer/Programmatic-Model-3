//5.Trigger for Updating Cases that come in from the Web, Email or Chtt
//Use Case – we would like to use the email address of the incoming case to see if we can associate the
//correct person account to populate the Account and Contact Fields.
//When a new case is created and the Case.Origin field is set to “Chat” or “Email” or “Web” take the
//Case.SuppliedEmail field and look up to find a match in the following account fields –
//Account.PersonEmail, Account.Email_Address__c

trigger caseTrigger on Case (before insert) {
  
  list<Contact> l1=[SELECT Name, Email from Contact]; //list of contact having email in the list
  list<Account> l2=[Select Name, Account_Email_Address__c FROM Account];  // list of account having email in the list
    
  for(case c:Trigger.new)
  {
  	for(contact ct:l1)
    {
    	if(c.Web_Email__c==ct.Email)  
        { //System.debug('inside if');
        	c.Contactid=ct.id;     // assigning contact to case
        }
                       
    }
    
    for(Account act:l2)
    {
    	if(c.Web_Email__c==act.Account_Email_Address__c)
        {
        	c.AccountId=act.Id;   //assigning account to case
        }
    
    }
  
  }

}