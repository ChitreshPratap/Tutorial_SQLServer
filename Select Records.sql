use NoblePublicSchool

--Way1 --Select all rows
Select * from Student

--Way2 --Select all rows and specified columns
Select EnrollmentNumber, Name, DOB, City from Student

Select * from Student

--select only unique records considering all columns value
select distinct * from Student

--selecting only unique records considering only specified columns
select distinct EnrollmentNumber,Name from Student
Select distinct EnrollmentNumber from Student


--filtering records
select * from Student where EnrollmentNumber='12345678'
select * from Student where EnrollmentNumber!='12345678'
select * from Student where EnrollmentNumber<>'12345678'
select * from Student where EnrollmentNumber in ('12345678','12345677','12345679')
select * from Student where EnrollmentNumber not in ('12345678','12345677','12345679')
select * from Student where EnrollmentNumber ='12345634' or EnrollmentNumber ='12345677' or EnrollmentNumber ='12345688'
Select * from Student where Age between 20 and 25
select * from Student where Age>=20 and Age<=25

select * from Student where EnrollmentNumber like '%3'
select * from Student where EnrollmentNumber not like '%3'
select * from Student where EnrollmentNumber not like '[^MTFS]%'

--wild card Characters are 
-- % - 0 or more character
-- - - exactly one character
-- [] any character within the bracket
-- [^] not any character within the bracket

--order by 
select * from Student order by EnrollmentNumber desc
select * from Student order by EnrollmentNumber asc

--multiple order by
select * from Student order by Name asc, EnrollmentNumber desc

--select top n rows
select top 5 * from Student
select top 5 name,city from student


--Group by and having
select Name,City ,count(*) as Counts from Student group by Name,City
select Name,City ,count(*) as Counts from Student group by Name,City having Count(*)<5
select month(enterDate) as enterMonth from work group by enterMonth
	X - Error - because Group by clause processed before select list so, enterMonth column will not available to group by.
	Solution - Derived Table











/*--Set Operators--
	Union All
	Union 
	Intersect
	Except
*/

select * from DUStudent
Union all
select * from IgnouStudent

select * from DUStudent where city='Ghaziabad'
Union
select * from IgnouStudent where city='Ghaziabad'


select * from DUStudent
Intersect
select * from IgnouStudent


select * from DUStudent
except
select * from IgnouStudent




/* Joins 
	Join
	Inner Join
	Outer Join		
		Left Outer Join or left join
		Right Outer Join or right join
		Full Outer Join or full join
*/

select * from DuStudent join Course
on DuStudent.Course = Course.CourseId

--or

select * from DuStudent as A inner join Course as C
on A.Course = C.CourseId


select * from DuStudent as A left join Course as C
on A.Course = C.CourseId

select * from DuStudent as A right join Course as C
on A.Course = C.CourseId


select * from DuStudent as A full join Course as C
on A.Course = C.CourseId


--left table non matching data
select * from DuStudent as A left join Course as C
on A.Course = C.CourseId
where A.Course is null

--right table non matching data
select * from DuStudent as A right join Course as C
on A.Course = C.CourseId
where A.Course is null

--both table non matching data
select * from DuStudent as A full join Course as C
on A.Course = C.CourseId
where A.Course is null


--special join ->self join (join on the same table)
select E.Name as Employee , M.Name as Manager from Employee as E left join Employee as M
on e.ManagerId=M.EmpId

select E.Name as Employee , M.Name as Manager from Employee as E inner join Employee as M
on e.ManagerId=M.EmpId

select E.Name as Employee ,isnull( M.Name,'No Manager') as Manager from Employee as E left join Employee as M
on e.ManagerId=M.EmpId



/*-- Derived Tables
Derived table is example of sub-query which always in From clause of Outer query and function as table for outer query. Derived tables are the result of inner query which work as a table for outer query.
Derived tables are the table expression (or temporary table) which are created on the fly (or in memory) with the help of SELECT statement and appears (or used or available) in FROM clause of outer query.

Scope :-
	Derived tables are limited (or available) to the outer select query only which created it. It cann't be used outside the scope of outside of the outer select query and drop automatically outside of it. so, derived tables are not part of db schema and not a real table.
	Derived tables are the result of inner query which work as a table for outer query.

uses :-
	Derived tables can be used to shorten long queries and to break complex process into logical steps
	Derived tables are good alternative of temporary tables
	Derived tables are used when use of column aliases are not possible because another clause is processed by sql translator before the alias name is processed.
		Eg :- Select month(enterDate) as EnterMonth from work group by enterMonth
		X - > here group by clause is processed before select statement so, alias name is not available to the group by clause hence error
		solution -> use drived table
		
Syntex of of creating and using Derived Tables:-

Select * from (derived table select statement) where <>

*/
--drived table as inner sub query and it' is using in outer select query.
Select * from (
				Select FilmName, FilmRuntimeMinutes from Tbl Film
			) where FilmRuntimeMinutes < 100

select EnterMonth from 
	(select month(enterDate) as enterMonth from work) as dt
	group by enterMonth
