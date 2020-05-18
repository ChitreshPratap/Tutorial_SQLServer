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



