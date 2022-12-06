-- Practice 4:
-- “tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”,
-- “iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
-- “urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun	ve 
-- “tedarikci_id” yi Foreign Key yapin.
CREATE TABLE tedarikciler3(
	tedarikci_id char(5),
	tedarikci_ismi varchar(20),
	iletisim_isim varchar(20),
	CONSTRAINT primary_key PRIMARY KEY(tedarikci_id)
);
CREATE TABLE urunler(
	tedarikci_id char(5),
	urun_id varchar(10),
	CONSTRAINT urunler_fk FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)
);
SELECT * FROM tedarikciler;
SELECT * FROM urunler;