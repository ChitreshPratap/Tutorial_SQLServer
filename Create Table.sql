
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
	Aadhar nvarchar(20),
	[BankAccount] nvarchar(20),

	constraint pk_employee_id Primary Key ([Employee Id]),
	constraint uq_aadhar Unique (Aadhar),	
	constraint fk_bankAccount_Bank_AccountNumber foreign key ([BankAccount])
		references Bank([Account Number])
)
