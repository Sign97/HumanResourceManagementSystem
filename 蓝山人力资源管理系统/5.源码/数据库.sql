create database LanShanRenLi
go
use LanShanRenLi

/*管理员表*/
create table  Admin
(
AdminId	int  identity(10001,1),
RegisterName	nvarchar(20) not null,
Pwd	nvarchar(20) not null,
TopTime	datetime default getdate(),
VerTime	datetime
)
GO
INSERT INTO [dbo].[Admin]([RegisterName],[Pwd],TopTime,VerTime)
VALUES('Admin','123','','')

GO
select * from Admin

/*部门表*/
create table  ClassList
(
ClassId	Int identity(1,1) primary key,
Class	nvarchar(20) not null ,
ParentClass	nvarchar(20) not null ,
TopTime	datetime default getdate(),
VerTime	datetime
)
GO
INSERT INTO [dbo].[ClassList]
           ([Class]
           ,[ParentClass],[VerTime])
     VALUES
           ('技术部','技术部','')
INSERT INTO [dbo].[ClassList]
           ([Class]
           ,[ParentClass],[VerTime])
     VALUES
           ('销售部','销售部','')
INSERT INTO [dbo].[ClassList]
           ([Class]
           ,[ParentClass],[VerTime])
     VALUES
           ('财务部','财务部','')
INSERT INTO [dbo].[ClassList]
           ([Class]
           ,[ParentClass],[VerTime])
     VALUES
           ('采购部','采购部','')
INSERT INTO [dbo].[ClassList]
           ([Class]
           ,[ParentClass],[VerTime])
     VALUES
           ('生产部','生产部','')
INSERT INTO [dbo].[ClassList]
           ([Class]
           ,[ParentClass],[VerTime])
     VALUES
           ('技术部','技术部','')
INSERT INTO [dbo].[ClassList]
           ([Class]
           ,[ParentClass],[VerTime])
     VALUES
           ('科研部','科研部','')
INSERT INTO [dbo].[ClassList]
           ([Class]
           ,[ParentClass],[VerTime])
     VALUES
           ('科研小组一','科研部','')
INSERT INTO [dbo].[ClassList]
           ([Class]
           ,[ParentClass],[VerTime])
     VALUES
           ('科研小组二','科研部','')
GO
select * from ClassList

/*员工表*/
create table  Staff
(
StaffID	int identity(1001,1) primary key,
StaffName	nvarchar(200) not null ,
Sex	nvarchar(4) not null check(Sex in('男','女')),
IdentityCard	nvarchar(200)   not null,
Education	nvarchar(20) not null,
Email	nvarchar(200) ,
Post	nvarchar(200) not null,
ClassId	int foreign key(ClassId) references ClassList(ClassId),
FixedPhone	nvarchar(200) ,
PositionType	nvarchar(200) not null,
Nation	nvarchar(200) not null,
TechnicalPost	nvarchar(200) not null,
Callphone	nvarchar(200) not null,
Address	nvarchar(200) not null,
Photo	nvarchar(200) ,
Compensation	money,
TopTime	datetime default getdate(),
VerTime	datetime
)

/*培训表*/
create table  Train
(
TrainId	int identity(1,1) primary key,
TrainName	int foreign key(TrainName) references Staff(StaffID),
TrainContent	nvarchar(50),
TrainMark	decimal(4,1),
TrainAddress	nvarchar(50),
StartTime	DateTime,
OverTime	DateTime,
TopTime	datetime default getdate(),
VerTime	datetime
)


/*奖惩表*/
create table  Award
(
AwardId	int identity(1,1) primary key,
AwardName	int foreign key(AwardName) references Staff(StaffID),
AwardPunishment	nvarchar(20) check(AwardPunishment in('奖','惩') ),
AwardPunishmentTime	DateTime default getdate(),
AwardPunishmentMoney 	decimal(6,2),
AwardPunishmentReason	nvarchar(100),
TopTime	datetime default getdate(),
VerTime	datetime
)
GO
INSERT INTO [dbo].[Award]
           ([AwardName]
           ,[AwardPunishment]
           ,[AwardPunishmentMoney]
           ,[AwardPunishmentReason]
           ,[VerTime])
     VALUES(1001,'惩','300','考评不合格','')
INSERT INTO [dbo].[Award]
           ([AwardName]
           ,[AwardPunishment]
           ,[AwardPunishmentMoney]
           ,[AwardPunishmentReason]
           ,[VerTime])
     VALUES(1001,'奖','100','培训合格','')
GO

/*考评表*/
create table Comment
(
CommentId	Int identity(1,1) primary key,
StaffID	int foreign key(StaffID) references Staff(StaffID),
CommentContent	varchar(100) not null,
CommentResult	varchar(100) not null,
CommentPoint	decimal(5,2) not null,
CommentTime	dateTime  not null,
TopTime	dateTime,
VerTime	dateTime
)


/*劳保表*/
create table  Labour
(
LabourId	Int	identity(1,1) primary key,
Reason	varchar(200) not null,	
DistributionTime	datetime	default getdate(), 
DistributionMoney	decimal(5,2)	not null,
StaffId	int	foreign key(StaffId) references Staff(StaffID),
TopTime	Datetime	default getdate(),
VerTime	Datetime	
)

/*人员调动记录表*/
create table  Fraction
(
FractionId	Int identity(1,1) primary key,
StaffID	    Int 	foreign key(StaffID) references Staff(StaffID),
pastclass    varchar(200) not null,
NewClass	int ,
pastpost     varchar(200) not null,
newpost     varchar(200) not null,
RemoveTime	DateTime default getdate(),
)





