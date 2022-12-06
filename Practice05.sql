-- Practice 5:
-- “calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama”	field’lari
-- olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
-- “adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, “sokak”, “cadde” ve “sehir”  fieldlari olsun.
-- “adres_id” field‘i ile Foreign Key oluşturun.
CREATE TABLE calisanlar (
	calisan_id char(5) PRIMARY KEY,
	isim varchar(20) UNIQUE,
	maas SMALLINT NOT NULL,
	ise_baslama date
);
CREATE TABLE adresler (
	adres_id char(5),
	sokak varchar(20),
	cadde varchar(20),
	sehir varchar(15),
	CONSTRAINT adresler_fk FOREIGN KEY (adres_id) REFERENCES calisanlar(calisan_id)
);
INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');  
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14');  isim unique olmalı bu nedenle ekleyemez
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');  
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');   maas null olamaz 
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');  
--INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');  isim unique olmalı bu nedenle ekleyemez
--INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14'); -- ??????????????????????????? 
--INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');
--INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');
--INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');
SELECT * FROM calisanlar;