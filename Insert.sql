use NoblePublicSchool

--way1  - insert into every column of table
Insert into Student values ( '117664823','Chitresh Pratap Singh','01-Jan-1991',null,'Ghaziabad')

--way2 - insert into only specified column of table
Insert into Student(EnrollmentNumber,Name,DOB) values ( '117664824','Abhilash Pratap Singh','01-Jan-1991')


--way3 - transfer entire column of another table into existing table IgnouStudent
Insert into IgnouStudent 
select * from IgnouRCNoidaStudent

--way4 - transfer specific column data of another table into existing table
insert into MCAIgnouStudent(EnrollmentNumber,Name,CourseRegistered)
select Id,Name,CourseRegistered from IgnouRCNoidaStudent where courseRegistered='MCA'


--way5 - insert multiple rows together
insert into Student (EnrollmentNumber,Name,DOB,Email,City) 
values
('117664828','Chitresh Pratap Singh','01-Jan-1991',null,'Ghaziabad'),
('117664829','Chitresh Pratap Singh','01-Jan-1991',null,'Ghaziabad'),
('117664830','Chitresh Pratap Singh','01-Jan-1991',null,'Ghaziabad')

--way6 - insert and show together multiple rows.
insert into Student (EnrollmentNumber,Name,DOB,Email,City) 
output inserted.EnrollmentNumber,inserted.Name,inserted.City
values
('117664828','Chitresh Pratap Singh','01-Jan-1991',null,'Ghaziabad'),
('117664829','Chitresh Pratap Singh','01-Jan-1991',null,'Ghaziabad'),
('117664830','Chitresh Pratap Singh','01-Jan-1991',null,'Ghaziabad')

--way6 - select * into (copy all columns from existing IgnouNoidaStudent table to new table IgnouStudent(non-existing))
Select * into IgnouStudent from IgnouNoidaStudent

Select * into IgnouStudent 
Select * from RCNoidaIgnouStudent union all
select * from RCDelhiIgnouStudent union all
select * from RCMumbaiIgnouStudent 



--way7 - select * into (copy slected columns from existing IgnouNoidaStudent table to new table IgnouStudent(non-existing))
select enrollmentNumber,Name,DOB,CourseRegistered into MCA_IgnouStudent from IgnouNoidaStudent where CourseRegistered='MCA'

--create only table with same schema as given existing table
select * into MCAIgnouStudent from IgnouStudent where 1<>1
Select top 0 * into MCAIgnouStudent from IgnouStudent