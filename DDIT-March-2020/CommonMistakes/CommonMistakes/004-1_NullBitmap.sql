USE MASTER;
EXECUTE 
(
    'CREATE DATABASE DustBin
        ON 
        ( NAME = DustBin_dat,
            FILENAME = ''C:\SQLDATA\DEMODBS\DustBin_data.mdf'',
            SIZE = 10,
            MAXSIZE = 5000MB,
            FILEGROWTH = 5MB 
        )
        LOG ON
        ( NAME = DustBin_log,
            FILENAME = ''C:\SQLDATA\DEMODBS\DustBin_log.ldf'',
            SIZE = 5MB,
            MAXSIZE = 2500MB,
            FILEGROWTH = 5MB 
        )'
);

use DustBin
go
create table TblEmployee
(
Id	int identity(1,1) not null,
FirstName	char(15),
LastName	char(15),
EmpId		int,
Add1		char(25),
Add2		char(25),
City		char(10),
Country		char(10),
BlodGroup	char(3),
HomeNum		int,
CellNum		int,
email		char(35),
website		char(35)
)
go
insert into TblEmployee
values(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
--values ('Hemantgiri','Goswami',1,'Saiyed Para Tunki','Varis Takero','Surat','India','B',1234,0987,'someone@somedomain.com','http://www.somedomain.com')
go 200000
sp_spaceused 'tblEmployee'
go

drop table TblEmployee
go

create table TestDataType
(
cFname		char(255),
vLname		varchar(255),
ncAddress	nchar(255),
nvCity		nvarchar(255)
)
go
-- Inserting record 
insert into TestDataType values ('Hemantgiri','Goswami','Saiyed Para Tunki','Surat')
go
-- Lenght of the data entered (in Bytes)
select len('Hemantgiri')+len('Goswami')+len('Saiyed Para Tunki')+LEN('Surat')
go
-- Length of the data stored in the table (in Bytes)
select 255+LEN('Goswami')+(255*2)+(LEN('Surat')*2)
go

print 'Space occupy to store 25,00,000 records (in MB)'
print (((255+LEN('Goswami')+(255*2)+(LEN('Surat')*2))*2500000) /1024) /1024




drop table TblEmployee
go
drop table TestDataType
go

DROP DATABASE DustBin