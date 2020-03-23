create database TestDB
on
(
name=TestDB1,
filename='D:\DataBase\TestDB1.mdf',
size=5mb,
maxsize=2gb,
filegrowth=30%
)
go

use TestDB
go

--建立資料表「訂單」、「訂單明細」、「客戶」、「產品」，規格詳如正規化練習，並建立其關聯性

create table 訂單
(
訂單序號  int,
訂貨日期  date,
送貨日期  date,	
客戶代號  nvarchar(5),
constraint [PK_訂單序號] primary key (訂單序號)
)
create table 訂單明細
(
訂單序號  int,
產品代號  nvarchar(5),
訂購數量  int,
constraint [PK_訂單序號_產品代號] primary key (訂單序號,產品代號)
)
create table 客戶
(
客戶代號  nvarchar(5),
客戶名稱  nvarchar(20),
客戶地址  nvarchar(50),
constraint [PK_客戶代號] primary key (客戶代號)
)
create table 產品
(
產品代號  nvarchar(5),
產品名稱  nvarchar(50),
單價      int,	
庫存量    int,
constraint [PK_產品代號] primary key (產品代號)
)
alter table 訂單 add constraint [FK_客戶代號] foreign key (客戶代號) references 客戶(客戶代號)
alter table 訂單明細 add constraint [FK_產品代號] foreign key (產品代號) references 產品(產品代號)
alter table 訂單明細 add constraint [FK_訂單序號] foreign key (訂單序號) references 訂單(訂單序號) on delete cascade on update cascade
go

--依正規化練習(EXCEL檔)輸入資料

insert into 訂單
values
(1,'2002-12-01','2002-12-10','C01'),
(2,'2002-12-01','2002-12-10','C02'),
(3,'2002-12-03','2002-12-13','C03'),
(4,'2002-12-06','2002-12-16','C01'),
(5,'2002-12-07','2002-12-17','C03');
go

insert into 訂單明細
values
(1,'P01',20),
(1,'P02',5),
(2,'P01',30),
(2,'P03',100),
(3,'P03',200),
(3,'P01',200),
(3,'P02',10),
(4,'P04',10),
(4,'P05',15),
(5,'P05',20);
go

insert into 客戶
values
('C01','燦坤','台北市'),
('C02','家樂福','台中市'),
('C03','大潤發','高雄市');
go

insert into 產品
values
('P01','DVD',6000,2000),
('P02','數位電視',36000,1000),
('P03','無線電話',2000,1000),
('P04','DV',50000,200),
('P05','電漿電視',200000,100);
go

--請將客戶地址的長度增加到100

alter table 客戶 alter column 客戶地址 nvarchar(100)
go

--在資料表-訂單明細中新增單價(int)與小計(單價*數量)欄位，單價為必填欄位，且預設值為0

alter table 訂單明細 add
單價 int not null default 0,
小計 as 單價*訂購數量;
go

--請將訂單資料表中訂貨日期欄位設計為必填欄位且自動取系統日期

alter table 訂單 alter column 訂貨日期 date not null
alter table 訂單 add constraint [訂貨日期_def] default convert(date,sysdatetime()) for 訂貨日期
go

--請將訂單資料表中送貨日期欄位設計為不可填入過去的日期

alter table 訂單 with nocheck add constraint [CK_送貨日期] check (convert(float,convert(datetime,送貨日期))>=convert(float,convert(datetime,convert(date,sysdatetime()))))
go

/*
加入一筆訂單資料
訂單序號:6
訂貨日期:2020/1/1
送貨日期:2020/2/2
客戶代號:C03
訂購產品代號為: P01，P03
訂購數量為: 3,5
訂購單價為:1500,5500
*/

insert into 訂單
values
(6,'2020-01-01','2020-04-02','C03');
go

insert into 訂單明細
values
(6,'P01',3,1500),
(6,'P03',5,5500);
go

--將訂單序號1的送貨日期變更為2020-5-1

update 訂單 set 送貨日期='2020-5-1' where 訂單序號=1

--刪除訂單序號6的資料

delete 訂單 where 訂單序號=6
