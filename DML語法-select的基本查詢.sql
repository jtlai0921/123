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
where 相片 is not null