spool D:\ESCOM\bases\22_feb_18\spool\nombre_hobbies.txt
SET PAGESIZE 99
SET LINESIZE 150
DROP TABLE EMP;
CREATE TABLE EMP (
nif integer
primary key,
nombre varchar2(12),
apellidos varchar2(20),
nivel integer,
ocupacion varchar2(20),
matricula integer
);

drop table EMP_DATOS;
CREATE TABLE EMP_DATOS(
matricula integer
primary key,
nacimiento varchar2(12),
direccion varchar2(16),
hobbies varcHar2(20),
nif integer
);

INSERT INTO EMP VALUES (10,'NANCY','DEVOLIO',6,'GERENTE',1010);
INSERT INTO EMP VALUES (20,'ANDRREW','FULLER',1,'VENDEDOR',1020);
INSERT INTO EMP VALUES (30,'JANET','LEVERLING',1,'VENDEDOR',1030);
INSERT INTO EMP VALUES (40,'MARGARET','PEACOCK',2,'CONTADOR',1040);
INSERT INTO EMP VALUES (50,'STEVEN','RODRIGUEZ',2,'PROGRAMADOR',1050);
INSERT INTO EMP VALUES (60,'ROSY','BUCHANAN',3,'ANALISTA',1060);
INSERT INTO EMP VALUES (70,'MARY','SUMAYA',3,'CONTADOR',1070);

COMMIT;

INSERT INTO EMP_DATOS VALUES (1010,TO_DATE('1968-01-19','YYYY-MM-DD'),'ALTILLO 50','LECTURA',10);
INSERT INTO EMP_DATOS VALUES (1020,TO_DATE('1978-01-19','YYYY-MM-DD'),'REGINA 22','EL CHAT',20);
INSERT INTO EMP_DATOS VALUES (1030,TO_DATE('1988-01-19','YYYY-MM-DD'),'ARGENTINA 20','MUSICA',30);
INSERT INTO EMP_DATOS VALUES (1040,TO_DATE('1998-01-19','YYYY-MM-DD'),'DONCELES 16','FUTBOL',40);
INSERT INTO EMP_DATOS VALUES (1050,TO_DATE('1999-01-19','YYYY-MM-DD'),'MONTEVIDEO 45','CINE',50);
INSERT INTO EMP_DATOS VALUES (1060,TO_DATE('2000-01-19','YYYY-MM-DD'),'TICOMAN 19','TEATRO',60);
INSERT INTO EMP_DATOS VALUES (1070,TO_DATE('2001-01-19','YYYY-MM-DD'),'LIMA 38','GRAFITTI',70);

CLEAR COLUMNS;
SET SPACE 6;
column nif format 9999;
column nombre format a12;
column apellidos format a13;
column nivel format 9999;
column ocupacion format a12;
column nif_emp_dat format 9999;
select * FROM EMP;

CLEAR COLUMNS;
SET SPACE 6;
SET UNDERLINE '=';
COLUMN NACIMIENTO FORMAT A15;
COLUMN DIRECCION FORMAT A16;
COLUMN HOBBIES FORMAT A12;
SELECT * FROM EMP_DATOS;

set space 6;
set underline '=';
column nombre format a15;
column apellidos format a12;
column hobbies format a20;
select NOMBRE, APELLIDOS, HOBBIES
FROM EMP, EMP_DATOS
WHERE EMP.NIF=EMP_DATOS.NIF;

set space 6;
set underline'=';
column nombre format a15;
column apellidos format a12;
column hobbies format a20;
select NOMBRE, APELLIDOS, HOBBIES,E.NIF,ED.NIF
FROM EMP E, EMP_DATOS ED WHERE E.matricula=ED.matricula;

set space 6;
set underline'=';
column nombre format a15;
column apellidos format a12;
column hobbies format a20;
select nombre, apellidos, hobbies, E.matricula,ED.matricula
from EMP E, EMP_DATOS ED
WHERE E.matricula=ED.matricula;

set space 2;
set underline'=';
column nombre format a10;
column apellidos format a12;
column hobbies format a13;
column matricula format 9999;
select nombre, apellidos, hobbies, E.matricula, ED.matricula, E.NIF, ED.NIF
FROM EMP E, EMP_DATOS ED WHERE E.matricula=ED.matricula;
spool off