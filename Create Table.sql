--Creating Tables with constraints :- 
--	Nullability Constraint
--	Primary Key
--	Unique Key
--	Default Key 
--	Check Key
--	Foreign Key


Create table Bank
(
	[Account Number] nvarchar(20) not null,
	[Bank Name] nvarchar(100) not null,
	IFSC nvarchar(10) not null,
	constraint pk_accountnumber primary Key ([Account Number])
)

create table Employee
(
--if column name contains space then enclosed that column name inside [ ]	
	[Employee Id] int not null,
	[Employee Name] nvarchar(100) not null,
	[Father Name] nvarchar(100) not null,	

--if column name does not contain space then not neccessary to enclosed column name inside [ ]
--If nullability constraint is not defined then it is null by default.
	Aadhar nvarchar(20),
	[BankAccount] nvarchar(20) null,
	DOB date not null,
	Age int not null 
		constraint df_employee_age Default(18),
	
	constraint pk_employee_id Primary Key ([Employee Id]),

	constraint uq_aadhar Unique (Aadhar),	

	constraint fk_bankAccount_Bank_AccountNumber foreign key ([BankAccount])
		references Bank([Account Number]),

	constraint ck_age_gt18 check (Age>18 And Age <=60),

	--default constraint is not applied in this way in create table statement, we should implement default constraint inline
	--constraint df_employee_age default (18) for [Age]
)

--renaming table
sp_rename 'Bank', 'Bnk'


--Adding column to already existing table
alter table Bnk
	add BranchName nvarchar(100) not null,
		BranchLocation nvarchar(100) not null

--changing name,dataype,nullability of column
alter table Bnk
	alter column IFSC nvarchar(50) not null


--Renaming column name of table
Exec sp_rename 'Bnk.IFSC', 'IFSCCode','COLUMN'
