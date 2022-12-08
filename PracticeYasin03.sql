---         LIKE CONDITION
-- Wildcard ile kullanılır.
--1) %(percentage sign) wildcard: Sıfır ya da daha fazla karakteri temsil eder.

CREATE TABLE employee_s
(
id char(9),
name varchar(50),
state varchar(50),
salary SMALLINT,
company varchar(20)
);

INSERT INTO EMPLOYEE_S VALUES(123456789, 'John Walker','Florida',2500,'IBM');
INSERT INTO EMPLOYEE_S VALUES(234567890, 'Brad Pitt','Florida',1500,'APPLE');
INSERT INTO EMPLOYEE_S VALUES(345678901, 'Eddie Murphy','Texas',3000,'IBM');
INSERT INTO EMPLOYEE_S VALUES(456789012, 'Eddie Murphy','Virginia',1000,'GOOGLE');
INSERT INTO EMPLOYEE_S VALUES(567890123, 'Eddie Murphy','Texas',7000,'MICROSOFT');
INSERT INTO EMPLOYEE_S VALUES(456789012, 'Brad Pitt','Texas',1500,'GOOGLE');
INSERT INTO EMPLOYEE_S VALUES(123456710, 'Mark Stone','Pennsylvania',2500,'IBM');
select*from employee_s;

--soru1)'E' ile başlayan employee 'name' değerlerini çağırın.

SELECT name
FROM employee_s
WHERE name LIKE 'E%';

--soru2)'e' ile biten employee 'name' değerlerini çağırın.
SELECT name
FROM employee_s
WHERE name LIKE '%e';

--soru3) 'B' ile başlayıp 't' ile biten employee 'name' değerlerini çağırın.
SELECT name
FROM employee_s
WHERE name LIKE 'B%t';

--soru4) Herhangi bir yerinde 'a' bulunan employee 'name' değerlerini çağırın.
SELECT name
FROM employee_s
WHERE name LIKE '%a%';

--soru5) Herhangi bir yerinde 'e' veya 'r' bulunan employee 'name' değerlerini çağırın.

SELECT name
FROM employee_s
WHERE name LIKE '%r%' OR name LIKE '%e%';
-------------------------------------------------------------------------
--2) _ (underscore) Wildcard: Tek karakteri temsil eder.

--soru1) İkinci karakteri 'e' ve dördüncü karakteri 'n' olan "state" değerlerini çağırın.

SELECT state
FROM employee_s
WHERE state LIKE '_e_n%';

--soru2) sondan ikinci karakteri 'i' harfi olan "state" değerlerini çağırın.

SELECT state
FROM employee_s
WHERE state LIKE '%i_';

--soru3)ikinci karakteri 'e' olan ve en az 6 karakteri bulunan "state" değerlerini çağırın.
SELECT state
FROM employee_s
WHERE state LIKE '_e____%';

--soru4) ikinci karakterinden sonra herhangi bir yerinde 'i' olan "state" değerlerini çağırın.
SELECT state
FROM employee_s
WHERE state LIKE '__%i%';
--        NOT LIKE CONDITION


CREATE TABLE words
(
word_id char(10) UNIQUE,
word varchar(50) NOT NULL,
number_of_letters SMALLINT
);

INSERT INTO words VALUES(1001, 'hot', 3);
INSERT INTO words VALUES(1002, 'hat', 3);
INSERT INTO words VALUES(1003, 'hit', 3);
INSERT INTO words VALUES(1004, 'hbt', 3);
INSERT INTO words VALUES(1008, 'hct', 3);
INSERT INTO words VALUES(1005, 'adem', 4);
INSERT INTO words VALUES(1006, 'selena', 6);
INSERT INTO words VALUES(1007, 'yusuf', 5);

--soru1) herhangi bir yerinde 'h' bulunmayan "word" değerlerini çağırın.
select word
from words
where word NOT LIKE '%h%';

--soru2) 't' veya 'f' ile bitmeyen "word" değerlerini çağırın.

select word
from words
where word NOT LIKE '%t' AND word NOT LIKE '%f';
--note: OR'u da 'not' ifadesi çeviriyor. o nedenle AND  

--soru3) herhangi bir karakterle başlayıp, 'a' veya 'e' ile devam etmeyen "word" değerlerini çağırınız.
select word
from words
--where word NOT LIKE '%a%' AND word NOT LIKE '%e%';
where word NOT LIKE '_a%' AND word NOT LIKE '_e%';--hocanın çözümü ama adem geldi bunda!

--          REGULAR EXPRESSION CONDITION

-- "~" yaklaşık, buna benzer
-- "(.*)" sıfır veya herhangi bir karakter
-- "^" ilk karakter için çoklu ifadelerde
-- "$" çoklu ifadelerde karakterin sonda olmasını istediğimde
-- "." herhangi bir karakter anlamı var 

-- soru1) ilk karakteri 'h', son karakteri 't' ve ikinci karakteri 'o', 'a' veya 'i' olan "word" değerlerini çağırınız.

-- 1. yol LIKE kullanarak ==>> tekrar nedeniyle tavsiye edilmez
select word 
from words
where word LIKE 'ho%t' OR word LIKE 'ha%t' OR word LIKE 'hi%t';

--2.yol Regex kullanarak
select word
from words
WHERE word ~ 'h[oai](.*)t';

--soru2) ilk karakteri 'h' son karakteri 't' ve ikinci karakteri
-- a'dan e'ye kadar herhangi bir karakter olan "word" değerlerini çağırınız.

select word
from words
where word ~'h[a-e](.*)t'; -- [a-e]==> a,b,c,d,e

--soru3) ilk karakteri s, a veya y olan word değerlerini çağırınız.
select word
from words
where word ~ '^[say](.*)';
--note: regex önemli çünkü string manipulation yaparken kullanılacak.

--soru4) son karakteri m, a veya f olan word değerlerini çağırınız.

select word
from words
where word ~ '(.*)[maf]$'; --> (.*) burada isteğe bağlı

--soru5) ilk karakteri s ve son karakteri a olan word değerlerini çağırın.
select word
from words
where word ~ '^[s](.*)[a]$'; -- s(.*)a da olur çoklu değil çünkü

--soru6) heerhangi bir yerinde "a" olan
select word
from words
where word ~ '(.*)a(.*)';-- ~ 'a' da olur.

--soru7) ilk karakteri d'den t'ye olan herhangi bir karakter ile devam edip,
-- üçüncü karakteri l olan word değerlerini çağırınız.
select word
from words
where word ~ '^[d-t].[l]';

--soru8) ilk karakterinde d'den t'ye olan, herhangi bir iki karakter ile devam edip,
-- dördüncü karakteri e olan word değerlerini çağırınız.
select word
from words
where word ~ '^[d-t]..e';

------------------------------------------------------
CREATE TABLE worker
(
id char(9),
name varchar(50),
state varchar(50),
salary SMALLINT,
company varchar(20)
);

INSERT INTO worker VALUES(123456789, 'John Walker','Florida',2500,'IBM');
INSERT INTO worker VALUES(234567890, 'Brad Pitt','Florida',1500,'APPLE');
INSERT INTO worker VALUES(345678901, 'Eddie Murphy','Texas',3000,'IBM');
INSERT INTO worker VALUES(456789012, 'Eddie Murphy','Virginia',1000,'GOOGLE');
INSERT INTO worker VALUES(567890123, 'Eddie Murphy','Texas',7000,'MICROSOFT');
INSERT INTO worker VALUES(456789012, 'Brad Pitt','Texas',1500,'GOOGLE');
INSERT INTO worker VALUES(123456710, 'Mark Stone','Pennsylvania',2500,'IBM');

--soru1) E ile başlayıp y ile biten name değerleri dışındaki name değerlerini çağırınız.
select name
from worker
where name ~ '^[^E](.*)[^y]$';
-- köşeli parantez içinde ^ kullanırsak -den farklı anlamına gelir.

--soru2) J, B veya E ile başlayan VE r ya da t ile biten 
select name
from worker
where name ~ '^[JBE](.*)[rt]$';


--soru3) J, B veya E ile başlayan VEYA r ya da t ile biten
select name
from worker
where name ~ '^[JBE]' OR name ~ '[rt]$';

--soru4) üçüncü karakteri o ya da x olmayan state değerlerini çağırınız.
select state
from worker
where state ~ '^..[^ox]';

select * from customer
WHERE first_name like 'Ma%'

select * from customer
WHERE first_name ~~ 'Ma%' -- ==> Bu da like yerine kullanilabilir

select * from customer
WHERE first_name ilike 'ma%' -- ====> Case sensitivity i kaldiriyor ilike yazinca(equalsIgnoreCaseMuso()) ****

select * from customer
WHERE first_name ~~* 'ma%' -- ==> Bu da ILIKE demek

select * from customer
WHERE first_name like 'J_an' -- ==> _ tek bir karakter icin yer tutucu saglar

select * from customer
WHERE first_name not ilike 'b%'

select * from customer
WHERE first_name !~~* 'ma%' -- ==> Bu da not ILIKE yerine kullanilabilir