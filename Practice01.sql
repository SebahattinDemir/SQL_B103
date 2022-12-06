CREATE TABLE tedarikciler (
tedarkci_id char(5),
tedarikci_ismi varchar(15),
tedarikci_adres varchar(15),
ulasim_tarihi date
);
CREATE TABLE tedarikci_ziyaret
AS SELECT tedarikci_ismi, ulasim_tarihi 
FROM tedarikciler;
SELECT * FROM tedarikciler;
SELECT * FROM tedarikci_ziyaret;