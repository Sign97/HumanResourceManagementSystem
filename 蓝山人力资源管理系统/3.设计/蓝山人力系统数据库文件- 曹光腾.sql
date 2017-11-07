create database LanShanRenLi
go
use LanShanRenLi
/*管理员表*/
create table  Admin
(
AdminId	int  identity(10000,1),
UserName	nvarchar(20) not null,
RegisterName	nvarchar(20) not null,
Pwd	nvarchar(20) not null,
[Power]	Int check([Power] in('0','1','2')),
TopTime	date    de  getdate(),
VerTime	date



)
/*部门表*/
create table  ClassList
(
ClassId	Int identity(1s,1) primary key,
Class	nvarchar(20) not null ,
ParentClass	nvarchar(20) not null 
)
/*员工表*/
create table  Staff
(
StaffID	int identity(1001,1),
StaffName	nvarchar(20) not null primary key,
Sex	nvarchar(4) not null check(Sex in('男','女')),
IdentityCard	nvarchar(20)   not null,
Education	nvarchar(20) not null,
Email	nvarchar(20) ,
Post	nvarchar(20) not null,
ClassId	int foreign key(ClassId) references ClassList(ClassId),
FixedPhone	nvarchar(20) ,
PositionType	nvarchar(20) not null,
Nation	nvarchar(20) not null,
TechnicalPost	nvarchar(20) not null,
Callphone	nvarchar(20) not null,
Address	nvarchar(20) not null,
Photo	nvarchar(20) ,
Compensation	decimal(7,2)
)
/*培训表*/
create table  Train
(
TrainId	int identity(1,1),
TrainName	nvarchar(20) foreign key(TrainName) references Staff(StaffName),
TrainContent	nvarchar(50),
TrainMark	decimal(4,1),
TrainAddress	nvarchar(50),
StartTime	DateTime,
OverTime	DateTime,

)