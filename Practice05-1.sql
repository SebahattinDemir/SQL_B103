CREATE TABLE talebeler(
	id_ char(3) PRIMARY KEY,
	isim varchar(50),
	veli_isim varchar(50),
	yazili_notu int
);
CREATE TABLE notlar(
	talebe_id char(3),
	ders_adi varchar(50),
	yazili_notu int,
	CONSTRAINT notlar_fk FOREIGN KEY(talebe_id) REFERENCES talebeler(id_)
	ON DELETE CASCADE
);
INSERT INTO talebeler VALUES(123, 'Ali  Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124,  'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125,  'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126,  'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127,  'Mustafa Bak', 'Can',99);
SELECT * FROM talebeler;
INSERT INTO notlar VALUES ('123','kimya',75); 
INSERT INTO notlar VALUES ('124', 'fizik',65);  
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);
SELECT * FROM notlar;
DELETE FROM notlar WHERE talebe_id='123'; 
DELETE FROM talebeler WHERE id_='126'; 
DROP TABLE talebeler CASCADE;
