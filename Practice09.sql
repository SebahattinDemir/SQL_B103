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

CREATE TABLE personel1(
	id int,
	isim varchar(50),
	sehir varchar(50),  
	maas int,
	sirket varchar(20)
);
INSERT INTO personel1 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda'); 
INSERT INTO personel1 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel1 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personel1 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel1 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel1 VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel1 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

--1) Her sirketin MIN maaslarini eger 4000’den buyukse goster
SELECT sirket,MIN(maas) FROM personel1 GROUP BY sirket HAVING MIN(maas)>4000;

--Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi  ve toplam maasi gosteren sorgu yaziniz
SELECT isim,SUM(maas) FROM personel1 GROUP BY isim HAVING SUM(maas)>10000;