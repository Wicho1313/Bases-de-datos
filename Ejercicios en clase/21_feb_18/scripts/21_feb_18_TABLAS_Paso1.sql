spool D:\ESCOM\bases\21_feb_18\spools\tablas_paso-1.txt
alter table PAIS
drop constraint PAIS_CONTINENTE_fk;

alter table pais
ADD CONSTRAINT PAIS_CONTINENTE_FK
FOREIGN KEY(CONTINENTE)
REFERENCES CONTINENTE
ON DELETE CASCADE;

DELETE CONTINENTE WHERE
Nom_CONTINENTE='AFRICA';

SELECT Nom_CONTINENTE from CONTINENTE;
select Nom_pais, CONTINENTE from PAIS;
spool off