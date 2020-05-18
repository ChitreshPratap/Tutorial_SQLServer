
--creating database
create database Noble_Public_School

--drop database
drop database Noble_Public_School


--renaming database
--way1 
alter database Noble_Public_School
modify name=NPS

--way2
execute sp_renameDB 'NPS','NoblePublicSchool'
sp_renameDB 'NPS','NoblePublicSchool'