

create database Car
on primary(
Name = 'Car1',
FileName = 'E:\ITI_Summer\Labs\Day02\Car1.mdf',
Size = 10MB,
Filegrowth = 10MB,
MaxSize = unlimited
),
(
Name = 'Car2',
FileName = 'E:\ITI_Summer\Labs\Day02\Car2.ldf',
Size = 10MB,
Filegrowth = 10MB,
MaxSize = unlimited
)

use Car
go

create table Office(
ID int primary key,
[Address] varchar(10),
ContactNo varchar(11) check(len(ContactNo) = 11)
)
go

create table [Owner](
SSN int primary key,
[Name] varchar(15) not null,
AccountNo char(15) not null check(len(AccountNo) = 15),
OfficeID int foreign key references Office(ID)
)
go

create table Car(
ID int primary key,
LicenseImg varbinary(max),
Price money not null,
[Status] varchar(20) check(Status in ('booked', 'maintenance', 'available')),
Brand varchar(10),
ModelName varchar(10),
ModelYear date,
Owner_SSN int foreign key references [Owner](SSN)
)
go

create table Tenant(
SSN int primary key,
Driving_License varbinary,
Phone varchar(11)
)
go

create table Car_Tenant(
Car_ID int foreign key references Car(ID),
Tenant_SSN int foreign key references Tenant(SSN)
constraint Car_Tenant_PK primary key (Car_ID, Tenant_SSN)
)



-- insert data

insert into Office (ID, [Address], ContactNo) values 
(1, 'Cairo', '01012345678'),
(2, 'Giza', '01123456789'),
(3, 'Alex', '01234567890')
go

insert into [Owner] (SSN, [Name], AccountNo, OfficeID) values 
(11122333, 'Ahmed Ali', '123456789012345', 1),
(22233444, 'Mona Hani', '234567890123456', 2),
(33344555, 'Youssef Said', '345678901234567', 3);
go

insert into Car (ID, LicenseImg, Price, [Status], Brand, ModelName, ModelYear, Owner_SSN) values 
(1, null, 250000, 'available', 'Toyota', 'Corolla', '2020-01-01', 11122333),
(2, null, 300000, 'maintenance', 'Honda', 'Civic', '2019-01-01', 22233444),
(3, null, 150000, 'booked', 'Hyundai', 'Accent', '2018-01-01', 33344555);
go

insert into Tenant (SSN, Driving_License, Phone) values 
(44455666, null, '01098765432'),
(55566777, null, '01187654321'),
(66677888, null, '01276543210');
go

insert into Car_Tenant (Car_ID, Tenant_SSN) values 
(1, 44455666),
(2, 55566777),
(3, 66677888);

go
