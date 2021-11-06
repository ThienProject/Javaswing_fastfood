create database FASTFOOD
go 
use FASTFOOD
go
CREATE FUNCTION  AUTO_IDFOOD()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(idfood) FROM tblmenuFood) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(idfood, 3)) FROM tblmenuFood
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'FD00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'FD0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

go
CREATE FUNCTION  AUTO_IDCUS()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(idCus) FROM tblCustomer) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(idCUS, 3)) FROM tblCustomer
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'CU00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'CU0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
go
CREATE FUNCTION AUTO_IDEM()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(IDEM) FROM tblEmployee) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(idEm, 3)) FROM tblEmployee
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'EM00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'EM0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

go
CREATE FUNCTION AUTO_IDord()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(idOrd) FROM tblorder) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(idOrd, 3)) FROM tblorder
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'OD00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'OD0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

go
go
CREATE FUNCTION AUTO_IDordDe()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(idordDe) FROM tblorderDetail) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(idordDe, 3)) FROM tblorderDetail
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'CT00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'CT0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

go
create table tblKind
(
	idKind INT IDENTITY(1,1) primary key, 
	kindName nvarchar(50) not null
)
create table tblmenuFood
(	
	idfood  varchar(5) primary key DEFAULT DBO.AUTO_IDFOOD(),
	idKind	int not null  foreign key references tblKind(idKind),
	foodName nvarchar(50) not null,
	price float null,
	
)

create table tblCustomer
(
	idCus varchar(5) primary key DEFAULT DBO.AUTO_IDCUS(),
	cusName nvarchar(50) not null,
	numPhone nvarchar(10) null,
	gender nvarchar(5) null,
	pointMember int null
)

create table tblEmployee 
(
	idEm varchar(5) primary key CONSTRAINT IDem DEFAULT DBO.AUTO_IDEM(),
	EmName nvarchar(50) not null,
	numPhone varchar(11) null,
	gender nvarchar(5) null,
	
)
create table tblaccount
(
	idAcc varchar(5) foreign key references tblEmployee(idEm),
	primary key (idAcc),
	passWord varchar(40) not null,
	acName nvarchar(30) not null,
	AccLevel int not null
)
create table tblorder
(
	idOrd varchar(5) not null  DEFAULT DBO.AUTO_IDord(),
	idCus varchar(5) not null  foreign key references tblCustomer(idCus),
	idEm varchar(5) not null  foreign key references tblEmployee(idEm),
	primary key(idOrd),
	date  date null,
	sumMoney float null 
)
create table tblorderDetail
(
	idordDe varchar(5) not null DEFAULT DBO.AUTO_IDordDe() ,
	idOrd varchar(5)not null foreign key references tblorder(idOrd),
	idFood varchar(5) not null foreign key references tblmenuFood(idfood),
	primary key(idOrd,idFood,idordDe),
	saleprice float null,
	quantity int null,
)
insert into tblKind values 
(N'Điểm Tâm'),
(N'Bánh ngọt'),
(N'Món Chay'),
(N'Cháo'),
(N'Bữa Chính'),
(N'Ăn vẹt')

insert into tblmenuFood(idkind,foodname,price)  values 
('1',N'Bánh kem mini','50000')
insert into tblmenuFood(idkind,foodname,price)  values 
('2',N'Kẹo đậu','50000')
insert into tblmenuFood(idkind,foodname,price)  values 
('3',N'Bánh xoài','50000')
insert into tblmenuFood(idkind,foodname,price)  values 
('4',N'Đông Sương','50000')
insert into tblmenuFood(idkind,foodname,price)  values 
('5',N'ô mai','50000')


insert into tblEmployee (emName,numPhone,gender)values 
(N'Sỷ Bùi ','0999999999',N'Nữ')
insert into tblEmployee (emName,numPhone,gender)values 
(N'Nhân ','0999999999',N'Nữ')
insert into tblEmployee (emName,numPhone,gender)values 
(N'Năm','0999999999',N'Nam')


insert into tblCustomer(cusName,numPhone,gender,pointMember) values 
(N'Văn Tây',0999,N'Nam',1)
insert into tblCustomer(cusName,numPhone,gender,pointMember)values 
(N'Linh Ka',0999,N'Nam',2)
insert into tblCustomer(cusName,numPhone,gender,pointMember)values 
(N'Thắng Bùi',0999,N'Nam',2)


set dateformat DMY insert into tblorder(idCus,idEm,date,sumMoney) values 
('CU001','EM001','27/10/2021',100000)
set dateformat DMY insert into tblorder(idCus,idEm,date,sumMoney) values 
('CU002','EM001','28/10/2021',100000)
set dateformat DMY insert into tblorder(idCus,idEm,date,sumMoney) values 
('CU003','EM001','27/10/2001',100000)

insert into tblorderDetail(idOrd,idFOOD,saleprice,quantity)  values 
('OD001','FD001',8000000,'2')
insert into tblorderDetail(idOrd,idFOOD,saleprice,quantity)  values 
('OD001','FD002',7000000,'2')
insert into tblorderDetail(idOrd,idFOOD,saleprice,quantity)  values 
('OD002','FD003',9000000,'2 ')


insert into tblaccount values 
('EM001','12345','SyBui','2'),
('EM002','12345','Thien','1'),
('EM003','12345','Nhan','2')
go
----------- Cập nhật tông tiền 1 hóa đơn
Create TRIGGER tg_Iser_ChitietDonHang
on tblorderDetail
after insert 
as 
begin 
update  tblorder 
set sumMoney = sumMoney + (inserted.saleprice) 
from inserted 
where  inserted.idOrd=tblorder.idOrd 
						
end 

go 
create TRIGGER tg_delete_ChitietDonHang
on tblorderDetail
after delete
as 
begin 
update  tblorder 
set sumMoney = sumMoney - (d.saleprice) 
from deleted as d 
where  d.idOrd=tblorder.idOrd 				
end 
go 

Create TRIGGER tg_upd_tblChiTietDonHang
on tblorderDetail
after update 
as
begin

update  tblorder 
set sumMoney = sumMoney - (d.saleprice) + i.saleprice
from deleted as d , inserted as i
where  d.idOrd=tblorder.idOrd 	and d.idOrd = i.idOrd		
end 
------------------
go
CREATE PROC prSanPhamBanChay
@Top int 
as 
Select ct.idfood ,foodName, SUM(quantity) as numSale
from tblorderDetail as ct, tblmenuFood as sp
where ct.idFood = sp. idfood 
group by ct.idFood, foodName

Having SUM(quantity) in (
				SELECT DISTinct top (@top) SUM(quantity) as BanChay
				From tblorderDetail
				group by idFood
				order by SUM(quantity) desc
				)
order by SUM(quantity) desc
go
-- gọi thủ tuc:
exec  prSanPhamBanChay 1
Select price from tblmenufood where Idfood= 'FD001'


select sum(quantity) 
from tblorderDetail

set dateformat DMY
SELECT DISTINCT t.idfood,t.foodName, kindname, t.price, date  FROM  tblorder as ord ,tblorderDetail as od , tblmenuFood as t ,tblKind
WHERE od.idFood = t.idfood and od.idOrd = od.idOrd and date BETWEEN CAST('27/5/2021' AS DATE) AND CAST('01/6/2021' AS DATE) and tblkind.idKind = t.idKind


set dateformat DMY
             SELECT DISTINCT t.idfood,t.foodName, kindname, t.price, date  
              FROM  tblorder as ord ,tblorderDetail as od , tblmenuFood as t ,tblKind
               WHERE od.idFood = t.idfood 
               and od.idOrd = od.idOrd 
                and date BETWEEN CAST('27/5/2021' AS DATE) 
                AND CAST('27/5/2021'AS DATE) and tblkind.idKind = t.idKind
set dateformat DMY
go
SELECT DISTINCT (tblmenuFood.idfood),tblmenuFood.foodName, kindname, tblmenuFood.price, date  
                FROM  tblorder  ,tblorderDetail , tblmenuFood  ,tblKind
              WHERE tblorderDetail.idFood = tblmenuFood .idfood 
           and tblorder.idOrd = tblorderDetail.idOrd 
            and date BETWEEN CAST('27/5/2021' AS DATE) 
              AND CAST('27/5/2021' AS DATE) 
             and tblkind.idKind = tblmenuFood .idKind