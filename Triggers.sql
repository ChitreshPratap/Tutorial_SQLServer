/* Triggers :- Special Stored Procedure that executes automatically in response to trigerring actions

Triggers Types :-
1.	DML Triggers
	These triggers fires automatically in response to valid DML events on table(Insert , Update, Delete).
	DML triggers uses -> logical(conceptual/virtual) tables -> deleted and updated. deleted and updated are structurally similar to the table on which trigger is defined or table on which user action is tried.
	DML triggers can't be applied on local/global temporary tables.

		Updated and deleted table hold the old and new values of rows that may be changed by user.
		DML Event	Inserted table hold				deleted table hold
		Insert		rows to be inserted				empty
		update		new rows modified by update		existing rows modified by update
		Delete		empty							rows to be deleted

	Virtual Tables / Magic Tables for triggers :-
		i.		After/for triggers
					These triggers fires, after the triggering actions (i.e. DML statement executes first succesfully then trigger fires)
					After trigger can't be define on views.
				
		ii.		Instead of triggers
					These triggers launches, instead of triggering action (i.e. DML statements are skipped (or not performed at all) and directly trigger fires)
					Can't use Instead of triggers on DDL and LogOn Triggers
					At most, you can define one INSTEAD OF trigger per INSERT, UPDATE, or DELETE statement on a table or view.
					Instead of Delete trigger can't be use on tables that have refrential relationship specifying cascade option on delete , 
					Instead of Update trigger can't be use on tables that have refrential relationship specifying cascade option on update , 
					INSTEAD OF DELETE/UPDATE triggers can't be defined on a table that has a foreign key with a cascade on DELETE/UPDATE action defined.	

	About DML Triggers:-
		DML triggers are frequently used for enforcing business rules and data integrity.
		If constraints exist on the trigger table, they're checked after the INSTEAD OF trigger runs and before the AFTER trigger runs. If the constraints are violated, the INSTEAD OF trigger actions are rolled back and the AFTER trigger isn't fired.
		The trigger and the statement that fires it are treated as a single transaction, which can be rolled back from within the trigger. If a severe error is detected (for example, insufficient disk space), the entire transaction automatically rolls back.
		They can guard against malicious or incorrect INSERT, UPDATE, and DELETE operations and enforce other restrictions that are more complex than those defined with CHECK constraints.
		Multiple DML triggers of the same type (INSERT, UPDATE, or DELETE) on a table allow multiple, different actions to take place in response to the same modification statement.

2.	DDL Triggers
3.	Logon Triggers

About Triggers:-
	Triggers can include any number and type of Transact-SQL statements, with exceptions.
	A trigger is designed to check or change data based on a data modification or definition statement; it should't return data to the user.
	Although a TRUNCATE TABLE statement is in effect a DELETE statement, it doesn't activate a trigger because the operation doesn't log individual row deletions.
	CREATE TRIGGER must be the first statement in the batch and can apply to only one table. i.e create trigger can be on only one table

--need to covered from :- https://docs.microsoft.com/en-us/sql/t-sql/statements/create-trigger-transact-sql?view=sql-server-ver15
General Trigger Consideration:-
	Return result
	multiple triggers
	recursive triggers
	nested triggers
	permissions



--create/alter DML Triggers
	create|Alter trigger schmSchemaName.tgrTriggerName
	On schmSchemaName.tblTableName
	with <dmlTriggerOptions>[,...n]
	[for |After| Instead of ] [Insert[,Delete,Update]]
	as
	begin
		set nocount on --> to suppress the number of rows affected message from begin returned from trigger.

	end
note:- the table or view on which DML trigger applied is called trigger table or trigger view.
dmlTriggerOptions:-
	Encryption :- Obscures the text of the CREATE TRIGGER statemen
	schemabinding :- Ensures that tables referenced by a trigger can't be dropped or altered.

--view definition of trigger
	select definition from sys.sql_modules where object_id=object_id('schmSchema.tgrTriggerName')
	select object_definition(object_id('schmSchema.tgrTriggerName')) as trigger_definition
	exec sp_helpText 'schmSchemaName.tgrTriggerName'

--Disable Trigger :-
	for troubleshooting or data recovery purpose, triggers can be disabled temporarily (i.e not fired on events). After disable , the trigger definition will still be on table but with red cross mark on disabled trigger.
	Syntex:-
		--disable particular trigger a on particular table/view
			disable trigger schemaName.tgrTriggerName on schemaName.ObjectName (-table or view)
		-- disable all triggers on a particular table/view
			disable trigger all on schema.objectName
		--disable all trigger on database
			disable trigger all on dbDatabaseName

--Enable trigger :-
	to enable the disabled trigger
	--enable particular trigger on particular table/view
		enable trigger schemaName.trgTriggerName on schemaName.ObjectName
	--enable all triggers on a particular table/view
		enable trigger all on schema.objectName
	--enable all triggers of database
		enable trigger all on dbDatabaseName


	
--listing all triggers 
	--to list all triggers in sql server
	select * from sys.triggers where type='TR'

--removing triggers DML triggers
	drop trigger [if exists] schmSchemaName.tgrTriggerName1[,schmSchemaName.tgrTriggerName2,schmSchemaName.tgrTriggerName3,..]

*/


CREATE TRIGGER reminder1  
	ON Sales.Customer  
	AFTER INSERT, UPDATE   
	AS 
	begin
		RAISERROR ('Notify Customer Relations', 16, 10);  
	end
	go

CREATE TRIGGER reminder2  
	ON Sales.Customer  
	AFTER INSERT, UPDATE, DELETE   
	AS  
		EXEC msdb.dbo.sp_send_dbmail  
        @profile_name = 'AdventureWorks2012 Administrator',  
        @recipients = 'danw@Adventure-Works.com',  
        @body = 'Don''t forget to print a report for the sales force.',  
        @subject = 'Reminder';  
	GO



CREATE TRIGGER Purchasing.LowCredit ON Purchasing.PurchaseOrderHeader  
	AFTER INSERT  
	AS  
	IF (ROWCOUNT_BIG() = 0)
		RETURN;
	IF EXISTS (SELECT *  
			   FROM Purchasing.PurchaseOrderHeader AS p   
			   JOIN inserted AS i   
			   ON p.PurchaseOrderID = i.PurchaseOrderID   
			   JOIN Purchasing.Vendor AS v   
			   ON v.BusinessEntityID = p.VendorID  
			   WHERE v.CreditRating = 5  
			)  
	BEGIN  
		RAISERROR ('A vendor''s credit rating is too low to accept new  
		purchase orders.', 16, 1);  
		ROLLBACK TRANSACTION;  
		RETURN   
	END

	
  


--drop trigger
drop trigger Purchasing.PurchaseOrderHeader