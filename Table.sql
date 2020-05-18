--to use the context of specified database
use NoblePublicSchool

--droping table
drop table Student

--creating table with columns and constraints
create table Student
(
	--adding nullability and domain constriant
	[EnrollmentNumber] nvarchar(30) not null,

	[Name] nvarchar(100) not null,
	[FatherName] nvarchar(100) not null,
	[AadharCardNo] nvarchar(20) not null,
	[ContactNumber] nvarchar(10) null,
	[Email] nvarchar(100) not null,
	[DOB] Date not null default '01-Jan-1991' ,

	--computed column
	[Age] as year(GetDate()) - year(DOB),

	[Address] nvarchar(500) not null,
	[City] nvarchar(100) not null,
	[ZipCode] nvarchar(10) not null,
	[CourseRegistered] nvarchar(10) not null,

	--adding unique constraint
	constraint ck_Student_AadharCardNo Unique (AadharCardNo),

	--adding primary key constraint
	constraint pk_Student_EnrollmentNumber Primary Key (EnrollmentNumber),

	--adding check constraint
	constraint ck_Student_ZipCode check (len(zipCode)>=10),

	--adding foreign key constraint
	constraint fk_Student_CourseRegistered_Course_CourseId foreign key(CourseRegistered) references Course(CourseId)

	--Adding refrential integrity constraints for foreign key constraint
	on delete cascade
	on update cascade
		--on delete cascade
		--on update cascade
			--or
		--on delete no action
		--on update no action
			--or
		--on delete set default
		--on update set default

)

--create table with column level constraint
create table Student
(
	--named primary key
	[EnrollmentNumber] nvarchar(30) constraint pk_Student_EnrollmentNumber Primary Key,

	--not null constraint
	[Name] nvarchar(100) constraint nn_Student_Name not null,

	--not null constraint
	[FatherName] nvarchar(100) not null,

	--unique constraint
	[AadharCardNo] nvarchar(20) null constraint uq_Student_AdharCardNo Unique,

	[ContactNumber] nvarchar(10) null,
	[Email] nvarchar(100) not null,

	--default constraint
	[DOB] Date not null constraint df_Student_DOB default '01-Jan-1991',

	--computed column
	[Age] as year(getDate())- year(DOB)  ,

	[Address] nvarchar(500) not null,
	[City] nvarchar(100) not null,

	--check constraint
	[ZipCode] nvarchar(10) not null constraint ck_Student_Age check(len(ZipCode) >=10),

	--foreign key constraint
	[RegisteredCourse] nvarchar(10) not null constraint fk_Student_RegisteredCourse_Course_CourseId references Course(CourseId)

)


create table Course
(
	--adding nullability constraint
	[CourseId] nvarchar(10) not null,
	[CourseName] nvarchar(100) not null,

	--adding primary key constriant
	constraint pk_Course_CourseId Primary Key (CourseId), --primary key (col1,[col2,col3])

	--adding unique key constraint
	constraint uq_Course_CourseName unique (CourseName) --unique (col1,col2,col3)
)

--create table with same schema as existing table
select * into MCAIgnouStudent from IgnouStudent where 1<>1
Select top 0 * into MCAIgnouStudent from IgnouStudent


--Renaming Table
sp_rename 'dbo.Coarse','Course'