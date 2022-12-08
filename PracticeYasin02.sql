--        EXISTS CONDITION
-- exists condition, subquery ile kullanılır.
-- eğer subquery herhangi bir data çağırırsa "outer query" çalıştırılır.
-- eğer subquery herhangi bir data çağırmazsa "outer query" çalıştırılmaz.
-- exists condition Select, Insert, Update, Delete komutlarında kullanılabilir.

CREATE TABLE customers_likes
(
product_id int,
customer_name varchar(50),
liked_product varchar(50)
);

INSERT INTO customers_likes VALUES(10, 'Mark', 'Orange');
INSERT INTO customers_likes VALUES(50, 'Mark', 'Pineapple');
INSERT INTO customers_likes VALUES(60, 'John', 'Avocado');
INSERT INTO customers_likes VALUES(30, 'Lary', 'Cherries');
INSERT INTO customers_likes VALUES(20, 'Mark', 'Apple');
INSERT INTO customers_likes VALUES(10, 'Adem', 'Orange');
INSERT INTO customers_likes VALUES(40, 'John', 'Apricot');
INSERT INTO customers_likes VALUES(20, 'Eddie', 'Apple');

select * from customers_likes;
--soru1: customer_name degerleri arasinda Lary varsa customer_name degerlerini
-- no name olarak guncelleyiniz.
UPDATE customers_likes
SET customer_name = 'No name'
where exists (select liked_product from customers_likes
              where customer_name = 'Lary');
--bu soru özelinde customer_name Lary bir değeri varsa (ki var cherries) tüm customer_name
-- değerlerini no name olarak günceller. eğer liked_product'ta(product_id de customer_name de diyebilirdik bu kısımda) 
--bir değeri olmasaydı güncelleme olmayacaktı. 

--soru2:liked_product değerleri arasinda 'Orange','Pineapple' YA DA 'Avocado' varsa name değerlerini no name olarak güncelle.
UPDATE customers_likes SET customer_name='no name' 
WHERE EXISTS (SELECT liked_product FROM customers_likes WHERE liked_product IN('Orange','Pineapple','Avocado'));

--soru3: product_name değerleri arasında Orange değeri varsa recordları siliniz.
DELETE FROM customers_likes WHERE EXISTS (SELECT liked_product FROM customers_likes WHERE liked_product='Orange');
------------------------------------------------------------------------------------------------
--       SUBQUERY

CREATE TABLE employees
(
id char(9),
name varchar(50),
state varchar(50),
salary SMALLINT,
company varchar(20)
);

INSERT INTO EMPLOYEES VALUES(123456789, 'John Walker','Florida',2500,'IBM');
INSERT INTO EMPLOYEES VALUES(234567890, 'Brad Pitt','Florida',1500,'APPLE');
INSERT INTO EMPLOYEES VALUES(345678901, 'Eddie Murphy','Texas',3000,'IBM');
INSERT INTO EMPLOYEES VALUES(456789012, 'Eddie Murphy','Virginia',1000,'GOOGLE');
INSERT INTO EMPLOYEES VALUES(567890123, 'Eddie Murphy','Texas',7000,'MICROSOFT');
INSERT INTO EMPLOYEES VALUES(456789012, 'Brad Pitt','Texas',1500,'GOOGLE');
INSERT INTO EMPLOYEES VALUES(123456710, 'Mark Stone','Pennsylvania',2500,'IBM');

select * from employees;

CREATE TABLE companies
(
company_id CHAR(9),
company varchar(20),
number_of_employees smallint
);

INSERT INTO companies VALUES(100,'IBM',12000);
INSERT INTO companies VALUES(101,'GOOGLE',18000);
INSERT INTO companies VALUES(102,'MICROSOFT',10000);
INSERT INTO companies VALUES(103,'APPLE',21000);
select * from companies;

--soru1: number_of_employees değeri 15000'den buyuk olan name ve company değerlerini çağırın.

SELECT name,company FROM employees WHERE company IN
(SELECT company FROM companies WHERE number_of_employees>15000);
                  
--soru2: florida'da bulunan company_id ve company değerlerini çağırın.

SELECT company_id,company FROM companies WHERE company IN (SELECT company FROM employees WHERE state='Florida' );

--soru3: company_id değeri 100'den buyuk olan name ve state değerlerini çağırın

SELECT name,state FROM employees WHERE company IN (SELECT company FROM companies WHERE company_id>'100' );

--soru4: herbir company icin company, number_of_employees ortalama salary değerlerini bulunuz.

SELECT company,number_of_employees,(SELECT ROUND(AVG(salary),2) FROM employees
WHERE companies.company=employees.company) FROM companies;  -- çıktıda virgülden sonra çok basamak oldu round() ile formatlayabilirsin.

--soru5: herbir company icin company_id, company, en yuksek ve en dusuk salary değerlerini bulun

SELECT company_id,company,(SELECT MAX(salary) FROM employees WHERE companies.company=employees.company),
(SELECT MIN(salary) FROM employees WHERE companies.company=employees.company) FROM companies;
