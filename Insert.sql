use NoblePublicSchool

--way1  - insert into every column of table
Insert into Student values ( '117664823','Chitresh Pratap Singh','01-Jan-1991',null,'Ghaziabad')

--way2 - insert into only specified column of table
Insert into Student(EnrollmentNumber,Name,DOB) values ( '117664824','Abhilash Pratap Singh','01-Jan-1991')

--way3 - insert multiple rows together
insert into Student (EnrollmentNumber,Name,DOB,Email,City) 
values
('117664828','Chitresh Pratap Singh','01-Jan-1991',null,'Ghaziabad'),
('117664829','Chitresh Pratap Singh','01-Jan-1991',null,'Ghaziabad'),
('117664830','Chitresh Pratap Singh','01-Jan-1991',null,'Ghaziabad')

--way4 - insert and show together multiple rows.
insert into Student (EnrollmentNumber,Name,DOB,Email,City) 
output inserted.EnrollmentNumber,inserted.Name,inserted.City
values
('117664828','Chitresh Pratap Singh','01-Jan-1991',null,'Ghaziabad'),
('117664829','Chitresh Pratap Singh','01-Jan-1991',null,'Ghaziabad'),
('117664830','Chitresh Pratap Singh','01-Jan-1991',null,'Ghaziabad')

