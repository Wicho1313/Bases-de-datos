spool G:\ESCOM\bases\15_feb_18_queries\q6.txt
PROMPT DESPLIEGA LA ESTRUCTURA DE LA TABLA DEPARTAMENTS
DESC DEPARTAMENTS
PROMPT DESPLIEGA LOS ATRIBUTOS ID, NOMBRE DE DEPTO, MANAGER Y UBICACION
COLUMN Num format 9999
column Nombre|depto format a21
column GERENTE FORMAT 9999
COLUMN LUGAR FORMAT 9999
COLUMN DEPARTAMENT_ID "Num", DEPARTAMENT_NAME "Nombre|depto", MANAGER_ID GERENTE, LOCATION_ID LUGAR
FROM DEPARTAMENTS
ORDER BY 2;
spool off