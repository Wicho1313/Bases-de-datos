spool D:\ESCOM\bases\21_feb_18\spools\tablas_paso-4.txt
PROMPT PASO 4

ALTER TABLE PAIS
DROP CONSTRAINT PAIS_CONTINENTE_FK;
ALTER TABLE PAIS 
ADD CONSTRAINT PAIS_CONTINENTE_KF
FOREIGN KEY (CONTINENTE)
REFERENCES CONTINENTE
DEFERRABLE INITIALLY DEFERRED;

UPDATE CONTINENTE
SET Nom_CONTINENTE='ifriqiyaahi'
where Nom_CONTINENTE='AFRICA';

UPDATE PAIS 
SET CONTINENTE='ifriqiyaahi'
WHERE CONTINENTE='AFRICA';

SELECT Nom_CONTINENTE FROM CONTINENTE;
SELECT Nom_pais, CONTINENTE FROM PAIS;
spool off