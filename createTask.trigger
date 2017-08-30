//4. Task Creation Trigger
//Create a task upon successful creation of a new Account.
//The task subject should be set as –Meeting with <specific Account’s name>
trigger createTask on Account (before insert, before update){
	 List<Task> tasks = new List<Task>(); // list of tasks
	 List<Account> Accs = Trigger.new; //list of account containing new records
	 for (Account Acc : Accs) { 
	 	Task tsk = new Task(whatID = Acc.ID, Ownerid = Acc.OwnerId);  //assigning new task
	 	tsk.Subject = 'Meeting with ' + Acc.Name;//assigning task subject
        tasks.add(tsk); //adding task to the list of tasks
        
	 }
	 insert tasks; 
}