CREATE TABLE workers
(
id smallint,
name varchar(50),
salary smallint,
CONSTRAINT id_pk primary key(id)
);
INSERT INTO workers VALUES(10001,'Ali Can', 12000);
INSERT INTO workers VALUES(10002,'Veli Han', 2000);
INSERT INTO workers VALUES(10003,'Mary Star', 7000);
INSERT INTO workers VALUES(10004,'Angle Ocean', 8500);

--soru1: en dusuk ve en buyuk salary degerlerine sahip record'lari cagiriniz.
-- note: record cagirirken select all yapmaliyiz. cunku record'daki
-- field'lar hepsini kapsiyor. 

--1.yol (kısa olan "IN" var tekrardan kurtaran tavsiye edilen yol)
select * -- tum fieldlari yani recordi cagirma kısmı
FROM workers -- nereden kismi 
WHERE salary IN ((SELECT MAX(salary) FROM workers), --filtreleme
                 (SELECT MIN(salary) FROM workers));-- filtreleme
--2.yol ("OR" ile)                 
                 
select * 
FROM workers
WHERE salary = (SELECT MAX(salary) FROM workers) OR
      salary = (SELECT MIN(salary) FROM workers);
--burada AND kullanmak mantıksız, cunku bir salary degeri ayni anda iki deger alamaz.
-- and yazarsam record'ı çağırdığımda, bir şey göremem.

--soru2: en yuksek salary degerini bulun
--note. "AS" keywordü kullanılarak konsola geçici(temporary) field oluşturulabilir.
SELECT MAX(salary) FROM workers; --cıktıda max diye yazdı direkt kendisi
select max(salary) as maximum_salary from workers; -- daha anlaşılır bir ifade koydum as keyword'ü ile
                                               -- ama geçici bu isim unutma.


--soru3: en dusuk salary degerini bulunuz. 
select min(salary) as minimum_salary from workers;

--soru4: salary ortalamasını bulunuz.
select round(avg(salary),2) as ortalama_salary from workers; --round ile formatladim. 7375.00

--soru4: record sayısını(adetini) bulunuz.(herhangi bir field ismi record adetini verecektir)
select count(name) as number_of_workers from workers;

--soru5: salary değerlerinin toplamını bulunuz.
select sum(salary) as sum_of_salary from workers;

--soru6: INTERVIEW QUESTION:
-- en yuksek ikinci salary degerini çağırınız.
SELECT MAX(salary) as second_highest_salary
FROM workers --12000 olan en yuksek degerimi aldim
WHERE salary < (SELECT Max(salary) from workers); --filtrelemenin devreye girdigi kısım
--bunu cevaplarsak buyuk ihtimalle offer aldik demektir.

--soru7: INTERVIEW QUESTION
--En dusuk ikinci salary degerini cagiriniz.

SELECT MiN(salary) as second_lowest_salary
FROM workers
WHERE salary > (SELECT MIN(salary) from workers);

--soru8: en yuksek ucuncu salary degerini bulunuz. (soru6nın bir adım ötesi olan soru)
select max(salary) as third_max_salary
from workers
where salary < (select max(salary) 
                from workers
                where salary < (SELECT Max(salary) from workers));
--parantezler onemli dikkat et birden fazla subquery'de syntax hatası almamak icin
--soru9: en dusuk ucuncu salary degerini bulunuz. odev 
SELECT MIN(salary) AS en_dusuk_ucuncu_salary FROM workers WHERE salary > (SELECT MIN(salary) FROM workers WHERE salary > (SELECT MIN(salary) FROM workers));

--soru10: salary degeri en yuksek ikinci degere sahip record'ı çağırınız.
--1.yol. bu yolu kullanırsam subquery biliyorum izlenimi veriyorum bu güzel
select * --record dedigim tum fieldlar o nedenle select all
from workers
where salary = (select max(salary) 
                from workers
                where salary < (SELECT Max(salary) from workers));

--2.yol (yapmamız gereken kolay olan yol tavsiye edilen yol burada da sql bilgim iyi izlenimi vermiş olurum )
select*
from workers
ORDER BY salary desc --buraya kadar olan kısımda bana azalan sıralamayla(desc) sırala dedim
OFFSET 1 ROW -- burada da bir satırını atla dedim (buraya kadar olan kısmı çağırırsam 12000 olmaz)
FETCH NEXT 1 ROW ONLY; --sadece sıradaki bir satırı ver dedim. böylece 8500 olan recordı aldım.
--offset, fetch gibi yazdıklarım oracle'da da var.


--soru11: salary degeri en dusuk ikinci degere sahip record'i çağırınız. ODEV (2 yolla da yapın)
--1.yol 

select * from workers where salary = (select min(salary) from workers where salary > (SELECT min(salary) from workers)); 

--2.yol 

SELECT * FROM workers ORDER BY salary ASC OFFSET 1 ROW FETCH NEXT 1 ROW ONLY;

--soru12: salary degeri, en yuksek ucuncu olan record'ı çağırın.
--1.yol
select*
from workers
where salary = (select max(salary) 
from workers
where salary < (select max(salary) 
                from workers
                where salary < (SELECT Max(salary) from workers)));
--2.yol
select *
from workers
ORDER BY salary desc
OFFSET 2 ROW
FETCH NEXT 1 ROW ONLY;