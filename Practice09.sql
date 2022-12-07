CREATE TABLE insanlar(
	ssn char(9),
	isim varchar(50),  
	adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir'); 
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

SELECT * FROM insanlar WHERE isim IS NULL;

UPDATE insanlar SET isim='isim girilmemis!!!' WHERE isim IS NULL;

SELECT * FROM insanlar;

SELECT * FROM insanlar ORDER BY adres;

SELECT * FROM insanlar ORDER BY ssn DESC;

SELECT * FROM insanlar ORDER BY ssn ASC, adres DESC; -- ??????????????????????

SELECT CONCAT (isim, ' ' , adres) AS isim_adres  FROM insanlar ORDER BY LENGTH(isim)+LENGTH(adres) DESC;

CREATE TABLE manav (
	isim varchar(50),
	Urun_adi varchar(50),
	Urun_miktar int
);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2); 
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2); 
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3); 
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);

--1) Isme gore alinan toplam urunleri bulun
SELECT isim,SUM(Urun_miktar) FROM manav GROUP BY isim;

--2) Urun ismine gore urunu alan toplam kisi sayisi
SELECT Urun_adi,COUNT(isim) FROM manav GROUP BY Urun_adi;

--3) Alinan kilo miktarina gore musteri sayisi
SELECT Urun_miktar,COUNT(isim) FROM manav GROUP BY Urun_miktar;

