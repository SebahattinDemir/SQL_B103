CREATE TABLE calisanlar1(
	calisan_id char(9), 
	calisan_isim varchar(50),
	calisan_dogdugu_sehir varchar(50) 
);
SELECT * FROM calisanlar1;
INSERT INTO calisanlar1 VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO calisanlar1 VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO calisanlar1 VALUES(345678901, 'Mine Bulut', 'Izmir');

SELECT calisan_id AS id_, calisan_isim AS isim, calisan_dogdugu_sehir AS dogum_yeri  FROM calisanlar1;

SELECT calisan_id AS id_, calisan_isim || calisan_dogdugu_sehir AS	isim_ve_dogum_yeri  FROM calisanlar1;
