spool D:\ESCOM\bases\21_feb_18\spools\tablas_paso-2.txt
PROMPT PASO 2

rollback;

ALTER TABLE PAIS
DROP CONSTRAINT PAIS_CONTINENTE_FK;

ALTER TABLE PAIS
ADD CONSTRAINT PAIS_CONTINENTE_FK
FOREIGN KEY (CONTINENTE)
REFERENCES CONTINENTE ON DELETE SET NULL;

DELETE CONTINENTE WHERE Nom_CONTINENTE='AFRICA';

SELECT Nom_CONTINENTE FROM CONTINENTE;
SELECT Nom_pais, CONTINENTE FROM PAIS;
spool off