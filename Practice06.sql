CREATE TABLE musteriler(
	urun_id int,
	musteri_isim varchar(50), 
	urun_isim varchar(50)
);  
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (20, 'John', 'Apple');  
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple'); 
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange'); 
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');
SELECT musteri_isim,urun_isim FROM musteriler WHERE urun_isim ='Orange' OR urun_isim ='Apple' OR urun_isim	='Apricot';
SELECT * FROM musteriler WHERE urun_isim IN ('Orange', 'Apple', 'Apricot');
SELECT * FROM musteriler WHERE urun_id>=20	AND urun_id<=40;
SELECT * FROM musteriler WHERE urun_id BETWEEN 20 AND 40 ;
SELECT * FROM musteriler WHERE urun_id<20 OR urun_id>40;
SELECT * FROM musteriler WHERE urun_id NOT BETWEEN 20 AND 40 ;

-- Practice 6
-- id'si 1003 ile 1005 arasında olan personel bilgilerini listeleyiniz
-- D ile Y arasındaki personel bilgilerini listeleyiniz
-- D ile Y arasında olmayan personel bilgilerini listeleyiniz
-- Maaşı 70000 ve ismi Sena olan personeli listeleyiniz

CREATE table personel(
	id_ char(4),
	isim varchar(50),
	maas int
);
insert into personel values('1001', 'Ali Can', 70000);  
insert into personel values('1002', 'Veli Mert', 85000); 
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);  
insert into personel values('1006', 'Sena Beyaz', 100000);

SELECT * FROM personel WHERE id_ BETWEEN '1003' AND '1005' ;
SELECT * FROM personel WHERE maas=70000	OR isim='Sena Beyaz';
SELECT * FROM personel WHERE isim BETWEEN LIKE 'D%';

