
--Creating Stored Procedure

/*Syntex :-
Parameterized/Optional parameterized/ Non-Parameterized Stored Procedure
Stored Procedure with parameter input/output :- parameters are optional
Optional Parameter :- by specify default value for parameter (Eg:- @defParameter in below syntex is optional parameter)

create proc spProcedureName @gender nvarchar(20), @dptId int,@empCount int out/Output,@defParameter int=5
	with Encryption -->It will encrpt the text of the stored procedure so that no body can look into it.
	as
		Begin
			select @empCount=count(*) from Employee where gender =@gender or departmentId=@dptId
			return @defParameter 
		End

Executing Stored Procedure :-
declare @employeeCount int
execute spProcedureName @gender='Male',@dptId='12345',@empCount=@employeeCount out
print @employeeCount
-->Note :- If we don't specify out parameter while calling then it will be null, as it will consider as input parameter

stored procedure always return only single integer value(show execution status)-> zero-successfully executes, non-zero - failed
	return keyword is used to return integer.
Stored Procedure with output parameter can give any number of value of any datatype
*/

create proc spProcedureName @gender nvarchar(20), @dptId int,@empCount int out/Output,@defParameter int=5
	with Encryption
	as
		Begin
			select @empCount=count(*) from Employee where gender =@gender or departmentId=@dptId
			return @defParameter 
		End

declare @employeeCount int
execute spProcedureName @gender='Male',@dptId='12345',@empCount=@employeeCount out
print @employeeCount

--Droping Stored Procedure
--Drop proc/Procedure spProcedureName
drop proc spGetCourseCount


--altering Stored Procedure
/*
to alter procedure ->use only alter keyword in place of create keyword
Alter proc/procedure spProcedureName
	with Encryption -->It will encrpt the text of the stored procedure so that no body can look into it.
	as
	Begin
		//
	End
*/

alter proc spProcedureName @gender nvarchar(20), @dptId int,@empCount int out/Output,@defParameter int=5
	with Encryption
	as
		Begin
			select @empCount=count(*) from Employee where gender =@gender or departmentId=@dptId
			return @defParameter 
		End