-- Practice 3:
-- “sehirler” isimli bir Table olusturun.  Tabloda “alan_kodu”, “isim”, “nufus”  field’lari olsun. Isim field’i bos  birakilamasin.
-- 1.Yontemi kullanarak “alan_kodu”  field’ini	“Primary Key” yapin

CREATE TABLE sehirler(
alan_kodu char(5) PRIMARY KEY,
isim varchar(20) NOT NULL,
nufus int
);