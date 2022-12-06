CREATE TABLE ogretmenler (
kimlik_no char(9),
isim varchar(20),
brans varchar(15),
cinsiyet varchar(10)
);
INSERT INTO ogretmenler VALUES(234431223,'Ayse Guler','Matematik','Kadin');
SELECT * FROM ogretmenler;
INSERT INTO ogretmenler(kimlik_no,isim) VALUES(567597624,'Ali Veli');