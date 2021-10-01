--Creating Database
create database PracticeDB1

--Dropping Database
drop database PracticeDB1

--Renaming Database
--way1
alter database PracticeDB1
	modify name=PracticeDB2

--way2
execute sp_renamedb 'PracticeDB2','PracticeDB1'
