REM Chapter 11. CREATE. ALTER. and DROP Tables. 

CREATE TABLE toy
(toy_id NUMBER(10),
description VARCHAR2(15) NOT NULL, 
last_purchase_date DATE,
remaining_quantity NUMBER(6));
 

REM CREA TABLA 

CREATE TABLE tab1 
(col1 NUMBER(10), 
col2 NUMBER(4) 
CONSTRAINT tab1_col2_nn NOT NULL, 
col3 VARCHAR2(5), 
col4 DATE DEFAULT SYSDATE, 
col5 VARCHAR2(20),
col6 NUMBER, 
CONSTRAINT tab1_pk PRIMARY KEY(coI1), 
CONSTRAINT tab1_zipcode_fk FOREIGN KEY(col3) REFERENCES zipcode(zip),
CONSTRAINT tab1_col5_col6_uk UNIQUE(col5, coI6), 
CONSTRAINT lab1 col6_ck CHECK(chol6< 100),
CONSTRAINT tab1_col2_col6_ck CHECK(col2 >100 AND col6 >20); 

REM REVISA ESTA SINTAXIS
/*
[CONSTRAINT constraintname]
[NULL|NOT NULL] |
[REFERENCES tablename [(columname)]
[ON DELETE {CASCADE|ON DELETE SET NULL}] |
[[UNIQUE|PRIMARY KEY]
[USING INDEX
[(CREATE INDEX indexname
ON tablename (columnname[,columname...])]
[storage_clause])]] | [CHECK (check_condition)]
[ENABLE|DISABLE]
[VALIDATE|NOVALIDATE]
*/

Rem EJEMPLO DE TRIGGER 
CREATE OR REPLACE TRIGGER student_trg_bur BEFORE UPDATE ON STUDENT
FOR EACH ROW
BEGIN
:new.modified_date:=SYSDATE;
END;

REM Prueba su creacion y ejecucion
REM verifica las tablas del diccionario acerca de los triggers
REM habilita  y deshabilita el trigger probandolo 

Rem Creating Tables Based On Other Tables PAG 547


CREATE TABLE jan_03_enrollment AS
SELECT *
FROM enrollment
WHERE enroll_date >= TO_DATE('01/01/2003','MM/DD/YYYY')
AND enroll_date < TO_DATE('02/01/2003','MM/DD/YYYY')
REM revsa los nombres de los atibitos

SQL> DESC jan_03_enrollment
Name Null? Type
--------------------- -------- --------------
STUDENT_ID NOT NULL NUMBER(8)
SECTION_ID NOT NULL NUMBER(8)
ENROLL_DATE NOT NULL DATE
FINAL_GRADE NUMBER(3)
CREATED_BY NOT NULL VARCHAR2(30)
CREATED_DATE NOT NULL DATE
MODIFIED_BY NOT NULL VARCHAR2(30)
MODIFIED_DATE NOT NULL DATE
--------------------------------------
SELECT student_id, section_id, enroll_date
FROM jan_03_enrollment


DROP TABLE zipcode CASCADE CONSTRAINTS;
REM prueba las sig instrucciones

/*FLASHBACK TABLE table name [, tablename...] TO
{{SCN|TIMESTAMP} expr [ENABLE|DISABLE TRIGGERS]|
BEFORE DROP [RENAME TO newtablename]}
*/
REM revisa la papeleria de reciclaje de oracle

DROP TABLE jan_03;
SELECT object_name, original_name, type
FROM user_recyclebin;

SHOW RECYCLEBIN
PURGE RECYCLEBIN;


CREATE TABLE school_program AS
SELECT last_name||' , '||first_name name
FROM student
UNION
SELECT last_name||' , '||first_name
FROM instructor;

SELECT * from school_program;
