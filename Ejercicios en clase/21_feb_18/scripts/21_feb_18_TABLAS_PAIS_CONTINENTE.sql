spool D:\ESCOM\bases\21_feb_18\spools\tablas_pais_continente.txt
DROP TABLE PAIS;
DROP TABLE CONTINENTE;

CREATE TABLE CONTINENTE(
Nom_CONTINENTE varchar2(11),
constraint continente_pk primary key(Nom_CONTINENTE)
);

CREATE TABLE PAIS(
Nom_pais varchar2(10),
continente varchar2(11),
constraint pais_pk
primary key(Nom_pais),
constraint pais_continente_fk
foreign key(continente)references continente
);

INSERT INTO CONTINENTE VALUES('AFRICA');
INSERT INTO PAIS VALUES('BENIN','AFRICA');
INSERT INTO PAIS VALUES('KENIA','AFRICA');
INSERT INTO PAIS VALUES('LIBIA','AFRICA');
SELECT Nom_CONTINENTE FROM CONTINENTE;
SELECT Nom_pais, continente from PAIS;

DELETE CONTINENTE WHERE Nom_CONTINENTE='AFRICA';
spool off;