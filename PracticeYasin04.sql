--ORDER BY:
--          recordları artan ya da azalan düzende sıralamak için kullanılır. (ASCII VALUE'ye göre)
--          sadece select statement ile kullanılır. 
--          sütun adı yerine numarası ile de sıralama yapabiliriz. 

create table points
(
name varchar(50),
point smallint
);
INSERT INTO points VALUES('Ali',25);
INSERT INTO points VALUES('Veli',37);
INSERT INTO points VALUES('Kemal',43);
INSERT INTO points VALUES('Ali',36);
INSERT INTO points VALUES('Ali',25);
INSERT INTO points VALUES('Veli',29);
INSERT INTO points VALUES('Ali',45);
INSERT INTO points VALUES('Veli',11);
INSERT INTO points VALUES('Ali',125);
select*from points;

--recordları azalan düzende "name" sütununa göre ve artan düzende
--"point" sütununa göre sırala.

select*
from points
ORDER BY name desc, point;

----------------------------------------------------------------------
CREATE TABLE employeess
(
employee_id char(9),
employee_first_name varchar(20),
employee_last_name varchar(20)
);
 
INSERT INTO EMPLOYEESS VALUES('14','Chris','Tae');
INSERT INTO EMPLOYEESS VALUES('11','John','Walker');
INSERT INTO EMPLOYEESS VALUES('12','Amy','Star');
INSERT INTO EMPLOYEESS VALUES('13','Brad','Pitt');
INSERT INTO EMPLOYEESS VALUES('15','Chris','Way');
select * from employeess;

CREATE TABLE addresses
(
employee_id char(9),
street varchar(20),
city varchar(20),
state char(2),
zipcode char(5)
);

INSERT INTO ADDRESSES VALUES('11','32nd Star 1234','Miami','FL','33018');
INSERT INTO ADDRESSES VALUES('12','23rd Rain 567','Jacksonville','FL','32256');
INSERT INTO ADDRESSES VALUES('13','5th Snow 765','Hialeah','VA','20121');
INSERT INTO ADDRESSES VALUES('14','3rd Man 12','Weston','MI','12345');
INSERT INTO ADDRESSES VALUES('15','11th Chris 12','St. Johns','FL','32259');
select * from addresses;

--          ALIASES
-- table isimleri için alias nasıl kullanılır:

--soru1) employee_first_name ve state değerlerini çağırın.
--employee_first_name sütunu için "firstname", state sütunu için "employee state" isimlerini vererek
select employee_first_name as firstname, state AS "employee state"
from employeess, addresses
where employeess.employee_id = addresses.employee_id;

--2.gösterim burada x ve y de alias
select x.employee_first_name as firstname, y.state AS "employee state"
from employeess x, addresses y
where x.employee_id= y.employee_id;

--tek bir sütuna çoklu sütun nasıl konulur ve alias nasıl kullanılır:

--soru2)employee_id değerlerini "id" adıyla, employee_first_name
--employee_last_name değerlerin tek sütunda "full name" adıyla çağırın.

select employee_id as id, 
employee_first_name ||' '|| employee_last_name as "full name"
from employeess;

-----------------------------------------------------------------------
--GROUP BY
select*from worker; --worker tablom vardı zaten onu çağırdım.

--soru1) herbir name değeri için toplam salary değerlerini bulunuz. 
select name, sum(salary) as "total salary"
from worker
group by name
order by "total salary" desc;

--soru2) herbir state değeri için çalışan sayısını bulup azalan düzende sırala.

select state, count(name)"çalışan sayısı"
from worker
group by state
order by "çalışan sayısı" desc;

--soru3) herbir company için 2000$ üzeri maas alan çalışan sayisini bulun.

select company, count(company) as "çalışan sayısı"
from worker
where salary > 2000
group by company;

--soru4) herbir company için en yuksek ve en dusuk salary değerlerini bulunuz.

select company, max(salary) as "max salary değeri",
min(salary) as "min salary değeri"
from worker
group by company;

--HAVING CLAUSE
/*
GROUP BY ardından filtreleme için kullanılır. HAVING ardından aggregate function kullanmalıyız. sütun
adı (field name) kullanamayız.
*/
--toplam salary değeri 2500 üzeri olan herbir çalışan için salary toplamını bulunuz.

select name, sum(salary) as "toplam maaş"
from worker
group by name
having sum(salary)>2500;--> group by ardından where kullanılamaz.  having clause kullanılır.
--note aggrete function where ile kullanılamaz."aggregate functions" are not allowed in WHERE
--where ardından aggregate function (sum(),max(),min(),count(),avg()) kullanılamaz.

--birden fazla çalışaı olan her bir state için çalışan toplamlarını bulun.
select state, count(state) as "çalışan sayısı"
from worker
group by state
having count(state) > 1; 

--her bir company için değeri 2000'den fazla minimum salary değerini bulunuz.
select company, min(salary) as "minimum salary"
from worker
group by company
having min(salary) > 2000;

-- her bir state değeri için 3000'den az olan max salary değerlerini bulunuz.
select state, max(salary) as "max salary"
from worker
group by state
having max(salary) < 3000;
--                      UNION OPERATOR
-- iki sorgu(qery) sonucunu birleştirmek için kullanılır. 
-- unique tekrarsız recordları verir.
-- tek bir sütuna çok sütun koyabiliriz. ancak data tipleri aynı olmalı ve data boyutları kapasiteyi aşmamalı
--UNION ALL ise tekrarlı recordları vererek yapar

-- salary değeri 3000den yüksek olan state değerlerini ve 2000den küçük olan name değerlerini tekrarsız olarak bulun.
select state as "state or name", salary 
from worker
where salary > 3000
UNION
select name, salary
from worker
where salary < 2000;

--salary değeri 3000den yüksek olan state değerlerini ve 2000den kucuk olan name değerlerini tekrarlı olarak bulun

select state as "state or name", salary
from worker
where salary > 3000
UNION ALL
select name, salary
from worker
where salary < 2000;

--salary değeri 1000den yüksek, 2000den az olan ortak name değerleri bulun.
--          INTERSECT OPERATOR
-- iki sorgu(query) sonucunun ortak(common) değerlerini verir. unique(tekrarsız) recordları verir.
select name
from worker
where salary > 1000
INTERSECT
select name
from worker
where salary < 2000;

--salary değeri 2000den az olan ve company değeri IBM, APPLE ya da MICROSOFT olan ortak name değerlerini bulunuz. 
select name
from worker
where salary < 2000
INTERSECT
select name
from worker
where company IN('IBM', 'APPLE', 'MICROSOFT');

--            EXCEPT OPERATOR
-- except operator bir sorgu sonucundan başka bir sorgu sonucunu çıkarmak için kullanılır. 
-- unique(tekrarsız) recordları verir.

--salary değeri 3000den az ve  GOOGLEda çalışmayan name değerlerini bulunuz. 
select name
from worker
where salary < 3000
EXCEPT
select name
from worker
where company = 'GOOGLE';