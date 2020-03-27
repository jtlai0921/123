<<<<<<< HEAD
sp_attach_db Norwindc,'D:\DB\NorthwindC.mdf'
select*from Norwindc.dbo.員工;
select*from 員工;
select 員工編號,姓名,職稱 from 員工;

use Norwindc
select 類別名稱 As 產品類別,說明 as 類別敘述
from dbo.產品類別

use Norwindc
select 類別名稱 產品類別,說明 類別敘述
from dbo.產品類別

select [單價]*[數量] as [價格] from [訂貨明細]

select 姓名+''+職稱 as [公司成員]from[員工]

select LEFT(姓名,1)+職稱+' '+right(姓名,len(姓名)-1) as [公司成員]  from 員工

use Norwindc
select distinct [單價]
from dbo.產品資料

use Norwindc
select [產品],[單價]*[庫存量]'總金額'
from dbo.產品資料
order by 2

select GETDATE()'今天',GETDATE()+1'明天',GETDATE()-1'昨天'

use Norwindc
select 姓名+''+稱呼[尊稱]
from dbo.員工

use Norwindc
select 姓名+''+稱呼
from dbo.員工

use Norwindc
select CONVERT(nvarchar,14)+姓名 尊稱
from dbo.員工

use Norwindc
select '14'+姓名 [尊稱]
from dbo.員工

select *from dbo.員工 where 職稱='業務'

select 員工編號,姓名,職稱 from dbo.員工
where YEAR(雇用日期)<=1993

use Norwindc
select *
from dbo.員工
where 姓名 like '陳%'

use Norwindc
select *
from dbo.員工
where 地址 like '%北平東路%'

--
--使用邏輯運算子
use Norwindc
select *
from dbo.員工
where 職稱='業務主管'and 稱呼= '小姐'

use Norwindc
select *
from 產品資料
where 產品='牛奶' or 產品='汽水'

/*
連接多個條件與括號
優先順序是位在括號中運算是優先
*/
use Norwindc
select *
from dbo.產品資料
where 庫存量<=安全存量 and 類別編號=1 or 類別編號=3

use Norwindc
select *
from dbo.產品資料
where 庫存量<=安全存量 and (類別編號=1 or 類別編號=3)

--in關鍵字
use Norwindc
select *
from dbo.供應商
where 行政區='台北' or  行政區='新竹' or 行政區='高雄'

use Norwindc
select *
from dbo.供應商
where 行政區 in ('台北' ,'新竹','高雄')

use Norwindc
select *
from dbo.供應商
where 行政區 not in ('台北' ,'新竹','高雄')
--null
use Norwindc
select *
from dbo.員工
where 相片 is not null
--聚合函數
use Norwindc
select sum(數量)'訂購總數',
COUNT(訂單號碼)'訂單筆數',
AVG(數量)'平均數量',
min(數量)'單筆訂購最小值',
max(數量)'單筆訂購最大值'
from dbo.[訂貨明細]
where 產品編號=51
--isnull()函數
use Norwindc
select *
from dbo.員工
=======
sp_attach_db Norwindc,'D:\DB\NorthwindC.mdf'
select*from Norwindc.dbo.員工;
select*from 員工;
select 員工編號,姓名,職稱 from 員工;

use Norwindc
select 類別名稱 As 產品類別,說明 as 類別敘述
from dbo.產品類別

use Norwindc
select 類別名稱 產品類別,說明 類別敘述
from dbo.產品類別

select [單價]*[數量] as [價格] from [訂貨明細]

select 姓名+''+職稱 as [公司成員]from[員工]

select LEFT(姓名,1)+職稱+' '+right(姓名,len(姓名)-1) as [公司成員]  from 員工

use Norwindc
select distinct [單價]
from dbo.產品資料

use Norwindc
select [產品],[單價]*[庫存量]'總金額'
from dbo.產品資料
order by 2

select GETDATE()'今天',GETDATE()+1'明天',GETDATE()-1'昨天'

use Norwindc
select 姓名+''+稱呼[尊稱]
from dbo.員工

use Norwindc
select 姓名+''+稱呼
from dbo.員工

use Norwindc
select CONVERT(nvarchar,14)+姓名 尊稱
from dbo.員工

use Norwindc
select '14'+姓名 [尊稱]
from dbo.員工

select *from dbo.員工 where 職稱='業務'

select 員工編號,姓名,職稱 from dbo.員工
where YEAR(雇用日期)<=1993

use Norwindc
select *
from dbo.員工
where 姓名 like '陳%'

use Norwindc
select *
from dbo.員工
where 地址 like '%北平東路%'
--1.找出銀行客戶
use Norwindc
select *
from dbo.客戶
where 公司名稱 like '%銀行'
--2.找出中正路上的供應商
use Norwindc
select *
from dbo.供應商
where 地址 like '%中正路%'
--3.公司名稱第一個字是大或山或東的資料
use Norwindc
select *
from dbo.客戶
where 公司名稱 like'[大山東]%'
--4.找出客戶編號是AM或AN或OM或ON結尾的資料
select *
from dbo.客戶
where 客戶編號 like '%[AO][MN]'
--5找出客戶編號第2個字為MAO及最後一個字為GHIJK的客戶資料
select *
from dbo.客戶
where 客戶編號 like '_[MAO]%[GHIJK]'
--使用邏輯運算子
use Norwindc
select *
from dbo.員工
where 職稱='業務主管'or 稱呼= '小姐'

use Norwindc
select *
from 產品資料
where 產品='牛奶' or 產品='汽水'

/*
連接多個條件與括號
優先順序是位在括號中運算是優先
*/
use Norwindc
select *
from dbo.產品資料
where 庫存量<=安全存量 and 類別編號=1 or 類別編號=3

use Norwindc
select *
from dbo.產品資料
where 庫存量<=安全存量 and (類別編號=1 or 類別編號=3)

--in關鍵字
use Norwindc
select *
from dbo.供應商
where 行政區='台北' or  行政區='新竹' or 行政區='高雄'

use Norwindc
select *
from dbo.供應商
where 行政區 in ('台北' ,'新竹','高雄')

use Norwindc
select *
from dbo.供應商
where 行政區 not in ('台北' ,'新竹','高雄')
--null
use Norwindc
select *
from dbo.員工
where 相片 is not null
--聚合函數
use Norwindc
select sum(數量)'訂購總數',
COUNT(訂單號碼)'訂單筆數',
AVG(數量)'平均數量',
min(數量)'單筆訂購最小值',
max(數量)'單筆訂購最大值'
from dbo.[訂貨明細]
where 產品編號=51
--isnull()函數
use Norwindc
select *
from dbo.員工
where 相片 is not null
--group by子句
use Norwindc
select 職稱,count(*)
from dbo.員工
group by 職稱
--having子句
use Norwindc
select 職稱,count(*)'人數'
from dbo.員工
group by 職稱
having COUNT(*)>4
 
 use Norwindc
select 行政區,count(*)'人數'
from dbo.員工
group by 行政區
having COUNT(*)>0
--請找出訂購產品超過3的訂單
 use Norwindc
select 訂單號碼,count(*)'數量'
from dbo.訂貨明細
group by 訂單號碼
having COUNT(*)>3
--with rolling運算子
use Norwindc
select 產品編號,單價,SUM(數量)[總數量]
from dbo.[訂貨明細]
where 產品編號 IN(50,51)
group by 產品編號,單價
with rollup
--with cube運算子
use Norwindc
select 產品編號,單價,SUM(數量)[總數量]
from dbo.[訂貨明細]
where 產品編號 IN(50,51)
group by 產品編號,單價
with cube
--grouping set子句
use Norwindc
select 產品編號,單價,SUM(數量)[總數量]
from dbo.[訂貨明細]
where 產品編號 IN(50,51)
group by grouping sets((產品編號,單價),產品編號)

use Norwindc
select 產品編號,單價,SUM(數量)[總數量]
from dbo.[訂貨明細]
where 產品編號 IN(50,51)
group by grouping sets((產品編號,單價),產品編號,())

--排序資料(order by)
use Norwindc
select 類別編號[產品編號],產品[產品名稱],單價[產品單價]
from dbo.產品資料
order by 單價 ASC

use Norwindc
select 類別編號[產品編號],產品[產品名稱],單價[產品單價]
from dbo.產品資料
order by [產品單價] ASC

use Norwindc
select 類別編號[產品編號],產品[產品名稱],單價[產品單價]
from dbo.產品資料
order by 3
--列出前5筆訂貨資料
use Norwindc
select Top 5 *
from dbo.[訂貨主檔]

use Norwindc
select Top 10 percent *
from dbo.[訂貨主檔]

select top (5)with ties*
from dbo.[訂貨明細]
order by 數量 desc

--offset和fetch next分業查詢
use Norwindc
select O.訂單號碼 '訂單編號',
E.姓名'負責業務人員'
from dbo.訂貨主檔 O inner join dbo.員工 E
on o.員工編號=E.員工編號
order by 訂單編號 offset 10 row

use Norwindc
select O.訂單號碼 '訂單編號',
E.姓名'負責業務人員'
from dbo.訂貨主檔 O inner join dbo.員工 E
on o.員工編號=E.員工編號
order by 訂單編號 offset 10 row fetch next 5 row only
--inner join
use Norwindc
select dbo.訂貨主檔.訂單號碼'訂單編號',
dbo.員工.姓名 '負責業務人員'
from dbo.訂貨主檔  inner join dbo.員工 
on dbo.訂貨主檔.員工編號=dbo.員工.員工編號

use Norwindc
select dbo.訂貨主檔.訂單號碼'訂單編號',
dbo.員工.姓名 '負責業務人員'
from dbo.訂貨主檔 ,dbo.員工 
where dbo.訂貨主檔.員工編號=dbo.員工.員工編號

use Norwindc
select O.訂單號碼 '訂單編號',
E.姓名 '負責業務人員'
from dbo.訂貨主檔 O inner join dbo.員工 E
on O.員工編號=E.員工編號

use Norwindc
select O.訂單號碼 '訂單編號',
E.姓名 '負責業務人員'
from dbo.訂貨主檔 O , dbo.員工 E
where O.員工編號=E.員工編號
--outer join
--left 
use Norwindc
select E.員工編號,O.員工編號,O.訂單號碼
from dbo.訂貨主檔 O left join dbo.員工 E
on O.員工編號=E.員工編號
order by E.員工編號
--right
use Norwindc
select E.員工編號,O.員工編號,O.訂單號碼
from dbo.訂貨主檔 O right join dbo.員工 E
on O.員工編號=E.員工編號
order by E.員工編號
--full outer join
use Norwindc
select E.員工編號,O.員工編號,O.訂單號碼
from dbo.訂貨主檔 O full join dbo.員工 E
on O.員工編號=E.員工編號
order by E.員工編號
--exec sp_dbcmptlevel 資料庫名稱,80;
--exec sp_dbcmptlevel 資料庫名稱,90;
--where table1.ColumnName*=table2.ColumnName
--outer join
use Norwindc
exec sp_dbcmptlevel Northwindc, 80;
select E.員工編號,O.員工編號,O.訂單號碼
from dbo.訂貨主檔 O , dbo.員工 E
where O.員工編號=E.員工編號 and
            O.訂單號碼<=10255
order by E.員工編號
--cross join
use Norwindc
select*
from dbo.訂貨主檔 cross join dbo.員工
--self join
use Norwindc
select E1.員工編號 [員工編號],
E1.姓名[員工姓名],
E2.員工編號[主管編號],
E1.姓名[主管姓名]
from dbo.員工 E1 left join dbo.員工 E2
on E1.主管=E2.員工編號
--union聯集查詢
use Norwindc
select 城市,行政區
from  dbo.員工
union
select 城市,行政區
from  dbo.客戶
 
 use Norwindc
select 城市,行政區,區域號碼
from  dbo.員工
union
select 城市,行政區,郵遞區號
from  dbo.客戶
union
select'台灣','台北','882'
--intersect
 use Norwindc
select 城市,行政區+'區'行政區
from  dbo.員工
intersect
select 城市,行政區
from  dbo.客戶
--except
 use Norwindc
select 城市,行政區+'區'行政區
from  dbo.員工
except
select 城市,行政區
from  dbo.客戶
--subqery
select 訂單號碼,(select sum(數量) from dbo.訂貨明細 where dbo.訂貨主檔.訂單號碼=訂單號碼)總數量
from  dbo.訂貨主檔

select O.訂單號碼,D.數量
 from  dbo.訂貨主檔 O join
 (select 訂單號碼,sum(數量)數量 from dbo.訂貨明細 group by 訂單號碼)D on o.訂單號碼=d.訂單號碼
 --獨立子
  use Norwindc
select *
from  dbo.客戶
where 城市 in(select distinct 城市 from dbo.員工)
--corelate
use Norwindc
select *
from  dbo.訂貨主檔
where (select sum(數量) from dbo.訂貨明細 where dbo.訂貨主檔.訂單號碼=訂單號碼)>100
--in
use Norwindc
select *
from  dbo.客戶
where 城市 in (select distinct 城市 from dbo.員工)
--all
use Norwindc
select *
from  dbo.訂貨明細
where 單價<=All (select distinct 單價 from dbo.產品資料)
--對比清單
use Norwindc
select *
from  dbo.訂貨明細
where 單價<=Any(select distinct 單價 from dbo.產品資料)

use Norwindc
select *
from  dbo.客戶
where Exists(select*from dbo.訂貨主檔 where dbo.客戶.客戶編號=客戶編號)
