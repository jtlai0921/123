--1.	請提供要求1997年10月10日送貨的客戶聯絡資料

	SELECT C.客戶編號,C.公司名稱,C.連絡人,C.電話,C.傳真電話
	FROM   訂貨主檔 O join 客戶 C ON O.客戶編號=C.客戶編號
	WHERE  o.送貨日期='1997-10-10'

--2.	列出訂單號碼10612的訂貨明細及產品名稱

	SELECT  O.訂單號碼  [訂單編號] ,  OD.產品編號  [產品編號] ,  P.產品  [產品名稱] ,
			OD.單價  [單價] ,  OD.數量   [數量]  ,  OD.折扣  [折扣]
	FROM   訂貨主檔 O  JOIN  訂貨明細  OD ON  O.訂單號碼 = OD.訂單號碼
					   JOIN  產品資料  P  ON  OD.產品編號=P.產品編號
	WHERE  O.訂單號碼=10612

	SELECT  O.訂單號碼  [訂單編號] ,  OD.產品編號  [產品編號] ,  P.產品  [產品名稱] ,
			OD.單價  [單價] ,  OD.數量   [數量]  ,  OD.折扣  [折扣]
	FROM   訂貨主檔 O  JOIN  (訂貨明細  OD JOIN  產品資料  P  ON  OD.產品編號=P.產品編號)
		   ON O.訂單號碼 = OD.訂單號碼					  
	WHERE  O.訂單號碼=10612

--3.	列出尚未送貨的訂單客戶公司名稱、聯絡人、聯絡電話及負責的業務人員

	SELECT   O.訂單號碼 [訂單編號], C.公司名稱 [客戶名稱], C.連絡人 [客戶連絡人], 
              C.電話  [客戶電話], E.姓名 [負責業務]
	FROM    員工  E  JOIN  訂貨主檔 O  ON  E.員工編號=O.員工編號
					 JOIN  客戶 C    ON  O.客戶編號=C.客戶編號
    WHERE  O.送貨日期 IS NULL



--4.	找出購買支出總金額低於3000元的台北市客戶(總金額=單價*數量(1-折扣))。

	SELECT  C.公司名稱  [客戶名稱], Round(Sum(OD.單價*OD.數量*(1-OD.折扣)),0) 總金額
	FROM    客戶  C  JOIN  訂貨主檔  O  ON  C.客戶編號=O.客戶編號
					 JOIN  訂貨明細 OD  ON  O.訂單號碼=OD.訂單號碼     
	WHERE  城市='台北市' 					  
	GROUP  BY   C.公司名稱
	having  Sum(OD.單價*OD.數量*(1-OD.折扣))<3000


	SELECT 客戶名稱,總金額	
	FROM  (SELECT  C.公司名稱  [客戶名稱], ISNULL(round(Sum(OD.單價*OD.數量*(1-OD.折扣)),0),0) 總金額
		   FROM    客戶  C  LEFT JOIN  (訂貨主檔  O  JOIN  訂貨明細 OD  ON  O.訂單號碼=OD.訂單號碼 )  ON  C.客戶編號=O.客戶編號
		   WHERE  城市='台北市' 					  
		   GROUP  BY   C.公司名稱) CP
	WHERE  總金額<3000


--5.	找出從沒下過訂單資料的客戶。

	SELECT  C.客戶編號 , C.公司名稱 , O.訂單號碼,c.城市
	FROM    客戶 C  LEFT  JOIN  訂貨主檔 O  ON C.客戶編號=O.客戶編號
	WHERE  O.客戶編號 IS NULL
	go

	SELECT  客戶編號 , 公司名稱  FROM   客戶
	WHERE  NOT Exists (SELECT  *  FROM  訂貨主檔 WHERE  客戶.客戶編號=客戶編號)
	go

	SELECT  客戶編號 , 公司名稱  FROM   客戶 
	WHERE  客戶編號 NOT IN (SELECT  客戶編號  FROM  訂貨主檔)
	go

--6.	請找出賣出數量最多的前五名產品資料。
 
	SELECT  Top (5)  with  ties  P.產品 ,  SUM(OD.數量)  訂購數量
	FROM    訂貨明細 OD JOIN 產品資料 P  ON  OD.產品編號 =  P.產品編號
	GROUP  BY   P.產品
	ORDER  BY   訂購數量 DESC

