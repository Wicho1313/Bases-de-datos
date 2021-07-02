REM Libro ORACLE by EXAMPLE, Thirt Edition By Alice Rischert CAP.11

REM Chapter 11. CREATE,ALTER, and DROP Tables
--
CREATE TABLE toy 
(toy_id NUMBER(10),
description VARCHAR2(15)NOT NULL,
last_purchase_date DATE,
remaining_quantity NUMBER(6)
);
--
REM CREA TABLA
CREATE TABLE tab1
	(col1 NUMBER(10),
	col2 NUMBER(4)
		CONSTRAINT tab1_col2_nn NOT NULL,
	col3 VARCHAR2(5),
	col4 DATE DEFAULT SYSDATE,
	col5 VARCHAR(20),
	col6 NUMBER,
	CONSTRAINT tab1_pk PRIMARY KEY(col1),
	CONSTRAINT tab1_zipcode_fk FOREIGN KEY(col3)
		REFERENCES zipcode(zip),
	CONSTRAINT tab1_col5_col6_uk
				UNIQUE(col5,col6),
	CONSTRAINT tab1_col6_ck
			CHECK(col6<100),
	CONSTRAINT tab1_col2_col6_ck
			CHECK(col2>100 AND col6>20)
	);
--
REM REVISA ESTA SINTAXIS
/*
[CONSTRAINT constraintname]
[REFERENCES tablename [(columname)]]
[ON DELATE{CASCADE|ON DELETE SET NULL}]|
[[UNIQUE|PRIMARY KEY]
[USING INDEX
[(CREATE INDEX indexname
ON tablename (columname[,columname...])]
[storage_clause])]]|
[CHECK(check_condition)]
[ENABLE|DISABLE]
[VALIDATE|NOVALIDES]
*/
REM REVISA LA PAGINA 545
/*
All constraints cam be either disabled or enabled (the
default).
The VALIDATE and NOVALIDATE options indicate if the 
constraint is enforced for existing and new data or only for
subsequently created data.
*/
--
REM EJEMPLO DE TIRGGER(CONJUNTO DE SENTENCIAS EN UNA TABLA)(BEFORE UPDATE ROW)
CREATE OR REPLACE TRIGGER
		student_trg_bur
		BEFORE UPDATE ON STUDENT
		FOR EACH ROW
BEGIN
	:new.modified_date:=SYSDATE;
END;
/
REM PRUEBA SU CREACION Y EJECUCIÓN
REM verifica las tablas del diccionario acerca de los triggers
REM habilita y deshabilita el trigger probándolo
/
REM Creating Tables Based On Other Tablas PAG 547
CREATE TABLE jan_03_enrollment AS
SELECT*
		FROM enrollment 
		WHERE enroll_date>=TO_DATE('01/01/2003','MM/DD/YYYY')
		AND enroll_date<TO_DATE('02/01/2003','MM/DD/YYYY');
--
REM REVISA LOS NOMBRES DE LOS ATRIBUTOS 
SQL>DESC jan_03_enrollment
Name Null? Type
-----------------------------------
STUDENT_ID NOT NULL NUMBER(8)
SECTION_ID NOT NULL NUMBER(8)
ENROLL_DATE NOT NULL DATE
FINAL_GRADE NUMBER(3)
CREATED_BY NOT NULL VARCHAR2(30)
CREATED_DATE NOT NULL DATE
MODIFIED_BY NOT NULL VARCHAR2(30)
MODIFIED_DATE NOT NULL DATE
--
SELECT student_id,section_id,enroll_date
			FROM jan_03_enrollment;
			
--
STUDENT_ID SECTION_ID ENROLL_DA
---------------------------
102 89 30-JAN-03
102 86 30-JAN-03
...
109 101 30-JAN-03
109 99 30-JAN-03

11 ROWS SELECTED.
--
DROP TABLE zipcode CASCADE CONSTRAINTS;
/*
revisa este comentario del libro
view ALL_DEPENDENCIES or USER_DEPENDENCIES.ifany rights
on the table were granted to other users,such as the
privileges to SELECT,INSERT,UPDATE,or
DELETE from the table, they are removed.
*/
/*
REM Prueba las siguinetes instrucciones
FLASHBACK TABLE table name[,tablename...]TO{{SCN|TIMESTAMP}expr[ENABLE|DISABLE TRIGGERS]|BEFORE DROP [RENAME TO newtablename]}
*/

RENAME jan_03_enrollment TO jan_03;

REM REVISA LA PAPELERA DE RECICLAGE DE ORACLE

DROP TABLE jan_03;

SELECT object_name,original_name,type
FROM user_recyclebin;

SHOW RECYCLEBIN

PURGE RECYCLEBIN;
CREATE TABLE school_program AS
SELECT last_name||','||first_name name
FROM student
UNION
SELECT last_name||','first_name
FROM instructor;
Select * from school_program;




















































