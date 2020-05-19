/*
Functions :-
1. System Defined / in-built Functions - all system defined functions are scalar function.
2. UDF( User Defined Functions)

	i.		Scalar function	
				always returns ->	scalar value of any datatype except -> text, ntext, image, cursor, timestamp
				with return keyword, we specify the value to be returned
				
	ii.		Inline table functions	
				It returns ->Table only i.e datatype=Table(always)
				Inside its body there is only single select statement.As there is only single select statement so, 'begin'-'end' keyword are not used. the select statement is just after 'As' keyword.
				In inline table , returns Table statement -> we can't specify table structure here (but in multi line table valued function we can)
				Better performance than multi-line table valued function
				Internally SQL server treats inline table valued function much like a View
				By using it we can update underlying table i.e we can update the table returned by inline table value function
						eg:- update dbo.fnInlineTableValuedFunction() set name='Samuel' where id = '1234'
				with return ,we specify the select query in bracket.

	iii.	Multi-Statement/Multi-Line table valued functions	
				It returns ->Table only i.e. datatype ->Table (always)
				Inside its body, there can be multiple statement so mendatory used -> 'begin'-'end' keywords
				In it, returns Table statement -> we specify table variable and table structure which is to return.
				Internally SQL-server treates multi-line table valued function much like a Stored Procedure.
				By using it we cannot update underlying table i.e we can not update the table returned by multi statement table valued function
				with return keyword, we don't specify value. return keyword is written alone in the last.
				

Syntex :-
create function fnFunctionName (@parameter datatype, @parameter2 datatype2)
	returns datatype
	with schemabinding ->it specify that functions is bound to db object that it references. when it is specified, then objects can'nt be modified in any way that would affect the function definition. The function definition itself must first be modified or droped to remove dependencies on objects that is to be modified.
	with encryption -->to encrypt function
		as
		begin
			//return value
		end

Syntex :- Inline Table valued function
-->
create function fnFunctionName(@parameter datatype)
returns Table
with schemabinding ->it specify that functions is bound to db object that it references. when it is specified, then objects can'nt be modified in any way that would affect the function definition. The function definition itself must first be modified or droped to remove dependencies on objects that is to be modified.
with encryption -->to encrypt function
	as
		return (Select * from tblEmp where gender=@parameter)


Syntex :- MultiLine Table Valued Function
create function fnFunctionName
returns @table Table(ID int, name navarchar(20), dob date)
with schemabinding ->it specify that functions is bound to db object that it references. when it is specified, then objects can'nt be modified in any way that would affect the function definition. The function definition itself must first be modified or droped to remove dependencies on objects that is to be modified.
with encryption -->to encrypt function
as 
Begin
	Insert into @table
	select Id, name , cast(DOB as date) from Employee
	return
End



Calling scalar valued function:-
select dbo.fnFunctionName('paramValue1','paramValue2')

calling inline/multiline table valued function
select * from dbo.fnFunctionName('Male')

note :- always specify schema name when calling user defined function.
Imp :- stored procedure can not be used in select statement or where clause but we can use function in select query.

*/

--scalar inline function
create function getAadharCardNumberLength (@aadharId int)
	returns int
	as
	begin
		return (select len(convert(nvarchar,aadharNo)) from tbl_AadharNo where aadharId=@aadharId)
	end
select dbo.getAAdharCardNumberLength(3)

--inline table valued function
create function getTableByAadharId(@aadharId int)
	returns table
	as 
		return (select * from tbl_AadharNo where AadharId=@aadharId)
select * from dbo.getTableByAadharId(3) where aadharId=3

--multiLine table valued function
create function getAllAadhar()
	returns @table table(aadharNo int)
	as
	begin
		insert into @table
		select AadharNo from tbl_AadharNo
		return
	end
select * from dbo.getAllAadhar()

--alter function/ Change function
--user 'Alter' keyword in place of 'create' in creation table.
alter function getTableByAadharId(@aadharId int)
	returns table
	as 
		return (select * from tbl_AadharNo where AadharId=@aadharId)
select * from dbo.getTableByAadharId(3) where aadharId=3

--drop function
--drop function fnFunctionName
drop function getTableByAadharId

