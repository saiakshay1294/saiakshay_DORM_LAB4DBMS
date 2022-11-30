
-- create
CREATE TABLE supplier(SUPP_ID	int primary key,SUPP_NAME	varchar(500) NOT NULL,SUPP_CITY	varchar(500)NOT NULL,SUPP_PHONE	varchar(500) NOT NULL);
CREATE TABLE customer(CUS_ID	INT primary key,
CUS_NAME	VARCHAR(20) NOT NULL,
CUS_PHONE	VARCHAR(10) NOT NULL,
CUS_CITY	VARCHAR(30) NOT NULL,
CUS_GENDER	CHAR
);
CREATE TABLE category(CAT_ID	INT primary key,
CAT_NAME	VARCHAR(20) NOT NULL
);
CREATE TABLE product (PRO_ID	INT primary key,PRO_NAME	VARCHAR(200) NOT NULL DEFAULT "Dummy",PRO_DESC	VARCHAR(600),CAT_ID int);
ALTER TABLE product ADD  CONSTRAINT FK_categoryid FOREIGN KEY (CAT_ID)
    REFERENCES category(CAT_ID);
CREATE TABLE supplier_pricing (PRICING_ID	INT primary key,
PRO_ID	INT ,
SUPP_ID	INT ,
SUPP_PRICE	INT DEFAULT 0
);    
ALTER TABLE supplier_pricing ADD  CONSTRAINT FK_proid FOREIGN KEY (PRO_ID)
    REFERENCES product(PRO_ID);
ALTER TABLE supplier_pricing ADD  CONSTRAINT FK_suppid FOREIGN KEY (SUPP_ID)
    REFERENCES supplier(SUPP_ID);  
CREATE TABLE `order`(ORD_ID	INT primary key,
ORD_AMOUNT	INT NOT NULL,
ORD_DATE	DATE NOT NULL,
CUS_ID	INT,
PRICING_ID	INT 
);
 
CREATE TABLE  rating (RAT_ID	INT primary key,
ORD_ID	INT,
RAT_RATSTARS	INT 
NOT NULL);
ALTER TABLE rating ADD  CONSTRAINT FK_orderid FOREIGN KEY (ORD_ID)
    REFERENCES `order`(ORD_ID);    
-- insert2)
INSERT INTO supplier VALUES (1,'Rajesh Retails','Delhi'	,	1234567890);
INSERT INTO supplier VALUES(2,'Appario Ltd.'	,	'Mumbai',	2589631470);
INSERT INTO supplier VALUES(3,'Knome products',	'Banglore',9785462315);
INSERT INTO supplier VALUES(4,'Bansal Retails',	'Kochi',8975463285);
INSERT INTO supplier VALUES(5,'Mittal Ltd.','Lucknow',7898456532);
INSERT into customer values(1,		'AAKASH',	9999999999,'DELHI','M');
INSERT into customer values(2,	'AMAN',		9785463215,	'NOIDA','M');
INSERT into customer values(3,		'NEHA',		9999999999,	'MUMBAI'	,'F');
INSERT into customer values(4,		'MEGHA',	9994562399,	'KOLKATA','F');
INSERT into customer values(5,		'PULKIT',	7895999999,	'LUCKNOW'	,'M');
INSERT into category values(1,	'BOOKS');
INSERT into category values(2,	'GAMES');
INSERT into category values(3,	'GROCERIES');
INSERT into category values(4,	'ELECTRONICS');
INSERT into category values(5,	'CLOTHES');
INSERT into product values(1,	'GTA V','Windows 7 and above with i5 processor and 8GB RAM',2);
INSERT into product values(2,		'TSHIRT'	,	'SIZE-L with Black Blue and White variations',5);
INSERT into product values(3,		'ROG LAPTOP',		'Windows 10 with 15inch screen i7 processor 1TB SSD',		4);
INSERT into product values(4,		'OATS',			'Highly Nutritious from Nestle',3);
INSERT into product values(5,		'HARRY POTTER',	'Best Collection of all time by J.K Rowling',1);
INSERT into product values(6,		'MILK',	'1L Toned MIlk 7 Boat Earphones	1.5Meter long Dolby Atmos',4);
INSERT into product values(7,		'Boat Earphones'	,'1.5Meter long Dolby Atmos',4);
INSERT into product values(8,		'Jeans',	'Stretchable Denim Jeans with various sizes and color',		5);
INSERT into product values(9,		'Project IGI',		'compatible with windows 7 and above',2);
INSERT into product values(10,		'Hoodie'		,	'Black GUCCI for 13 yrs and above',5);
INSERT into product values(11,		'Rich Dad Poor Dad	Written by RObertKiyosaki',	'112 Train Your Brain	ByShireen Stephen',1);
INSERT into product values(12,		'Train Your Brain',	'ByShireen Stephen',1);
INSERT INTO supplier_pricing VALUES(1,1,2,1500);
INSERT INTO supplier_pricing VALUES(2,3,5,30000);
INSERT INTO supplier_pricing VALUES(3,5,1,3000);
INSERT INTO supplier_pricing VALUES(4,2,3,2500);
INSERT INTO supplier_pricing VALUES(5,4,1,1000);
INSERT INTO supplier_pricing VALUES(6,12,2,780);
INSERT INTO supplier_pricing VALUES(7,12,4,789);
INSERT INTO supplier_pricing VALUES(8,3,1,31000);
INSERT INTO supplier_pricing VALUES(9,1,5,1450);
INSERT INTO supplier_pricing VALUES(10,4,2,999);
INSERT INTO supplier_pricing VALUES(11,7,3,549);
INSERT INTO supplier_pricing VALUES(12,7,4,529);
INSERT INTO supplier_pricing VALUES(13,6,2,105);
INSERT INTO supplier_pricing VALUES(14,6,1,99);
INSERT INTO supplier_pricing VALUES(15,2,5,2999);
INSERT INTO supplier_pricing VALUES(16,5,2,2999);

INSERT into `order` values (101,			1500,		DATE("2021-10-06"),	2,		1);
INSERT into `order` values (102,			1000,		DATE("2021-10-12"),	3,		5);
INSERT into `order` values (103,			30000,		DATE("2021-09-16"),	5,		2);
INSERT into `order` values (104,			1500,		DATE("2021-10-05"),	1,		1);
INSERT into `order` values (105,			3000,		DATE("2021-08-16"),	4,		3);
INSERT into `order` values (106,			1450,		DATE("2021-08-18"),	1,		9);
INSERT into `order` values (107,			789,		DATE("2021-09-01"),	3,		7);
INSERT into `order` values (108,			780,		DATE("2021-09-07"),	5,		6);
INSERT into `order` values (109,			3000,		DATE("2021-09-10"),	5,		3);
INSERT into `order` values (110,			2500,		DATE("2021-09-10"),	2,		4);
INSERT into `order` values (111,			1000,		DATE("2021-09-15"),	4,		5);
INSERT into `order` values (112,			789,		DATE("2021-09-16"),	4,		7);
INSERT into `order` values (113,			31000,		DATE("2021-09-16"),	1,		8);
INSERT into `order` values (114,			1000,		DATE("2021-09-16"),	3,		5);
INSERT into `order` values (115,			3000,		DATE("2021-09-16"),	5,		3);
INSERT into `order` values (116,			99,		DATE("2021-09-17"),	2,		14);
ALTER TABLE `order` ADD  CONSTRAINT FK_cusid FOREIGN KEY (CUS_ID)
    REFERENCES customer(CUS_ID);
ALTER TABLE `order` ADD  CONSTRAINT FK_pricingid FOREIGN KEY (PRICING_ID)
    REFERENCES supplier_pricing(PRICING_ID);   
INSERT into rating values( 1,		101,		4);
INSERT into rating values(2,		102,		3);
INSERT into rating values(3,		103,		1);
INSERT into rating values(4,		104,		2);
INSERT into rating values(5,		105,		4);
INSERT into rating values(6,		106,		3);
INSERT into rating values(7,		107,		4);
INSERT into rating values(8,		108,		4);
INSERT into rating values(9,		109,		3);
INSERT into rating values(10,		110,		5);
INSERT into rating values(11,		111,		3);
INSERT into rating values(12,		112,		4);

-- fetch 
SELECT * FROM supplier;
SELECT * from customer;
SELECT * from category;
SELECT * from product;
SELECT * from supplier_pricing;
SELECT * from `order`;
SELECT * from rating;

select CUS_GENDER, count(CUS_GENDER) from customer where CUS_ID in (select CUS_ID from `order` where ORD_AMOUNT>=3000) group by CUS_GENDER;

select PRO_NAME from product where PRO_ID in (select PRO_ID from supplier_pricing where PRICING_ID in (select PRICING_ID from `order` where CUS_ID=2));

select * from supplier where SUPP_ID in ( SELECT SUPP_ID
  FROM supplier_pricing
  GROUP BY SUPP_ID
  HAVING COUNT( PRO_ID ) >1);
