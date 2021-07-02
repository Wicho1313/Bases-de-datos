spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo10\Salida\CH10.txt
DESC COURSE
DESC SECTION
SET PAGESIZE 99
SET LINESIZE 150
SET NUMWIDTH 6
SET COLSEP "  || "


CLEAR COLUMNS
COLUMN C_NO FORMAT 999
COLUMN description FORMAT A28 WRAPPED
COLUMN LOCATION    FORMAT A6 WRAPPED
COLUMN INSTRUCTOR_ID FORMAT 999999
COLUMN INST_ID FORMAT 999999

REM Inserta una fila a la tabla zipcode con los valores
INSERT INTO zipcode
VALUES
('11111', 'Westerly', 'MA',
USER, TO_DATE('18-JAN-2000', 'DD-MON-YYYY'),
USER, SYSDATE);

REM prueba con nulos
INSERT INTO zipcode
VALUES
('11111', NULL, NULL, USER, SYSDATE, USER, SYSDATE);

REM describe date_example
DESCR date_example;
REM inserta una nueva fila con cada tipo de dato
INSERT INTO date_example
(col_date,
col_timestamp,
col_timestamp_w_tz,
col_timestamp_w_local_tz)
VALUES
(TO_DATE('24-MAR-2002 16:25:32',
'DD-MON-YYYY HH24:MI:SS'),
TO_TIMESTAMP('24-MAR-2002 16:25:32.0000000',
'DD-MON-YYYY HH24:MI:SS.FF'),
TO_TIMESTAMP_TZ('24-MAR-2002 16:25:32.0000000 -5:00',
'DD-MON-YYYY HH24:MI:SS.FF TZH:TZM'),
TO_TIMESTAMP('24-MAR-2002 16:25:32.0000000',
'DD-MON-YYYY HH24:MI:SS.FF'));

REM Inserta datos que luego seran redondeados
INSERT INTO course
(course_no, description, cost, prerequisite,
created_by, created_date, modified_by, modified_date)
VALUES
(900, 'Test Course', 50.57499, NULL,
'Your name', SYSDATE, 'Your name', SYSDATE);

REM utilizacion de subqueries insertando filas
INSERT INTO course
(course_no, description, cost,
prerequisite, created_by, created_date,
modified_by, modified_date)
VALUES
(1000, (SELECT description||' - Test'
FROM course
WHERE course_no = 10),
(SELECT MAX(cost)
FROM course),
20, 'MyName', SYSDATE,
'MyName', SYSDATE);

REM subqueries para insert
INSERT INTO intro_course
(course_no, description_tx, cost, prereq_no,
created_by, created_date, modified_by,
modified_date)
SELECT course_no, description, cost, prerequisite,
created_by, created_date, 'Melanie',
TO_DATE('01-JAN-2001', 'DD-MON-YYYY')
FROM course
WHERE prerequisite IS NULL;

REM inserta todo
INSERT ALL
INTO section_history
VALUES (section_id, start_date_time, course_no, section_no)
INTO capacity_history
VALUES (section_id, location, capacity)
SELECT section_id, start_date_time, course_no, section_no,
location, capacity
FROM section
WHERE TRUNC(start_date_time) < TRUNC(SYSDATE)-365;

REM Inserta todo usando condiciones
INSERT ALL
WHEN section_id BETWEEN 100 and 400 THEN
INTO section_history
VALUES (section_id, start_date_time, course_no, section_no)
WHEN capacity >= 25 THEN
INTO capacity_history
VALUES (section_id, location, capacity)
SELECT section_id, start_date_time, course_no, section_no,
location, capacity
FROM section
WHERE TRUNC(start_date_time) < TRUNC(SYSDATE)-365;

REM inserta el primero
INSERT FIRST
WHEN section_id BETWEEN 100 and 400 THEN
INTO section_history
VALUES (section_id, start_date_time, course_no, section_no)
WHEN capacity >= 25 THEN
INTO capacity_history
VALUES (section_id, location, capacity)
SELECT section_id, start_date_time, course_no, section_no,
location, capacity
FROM section
WHERE TRUNC(start_date_time) < TRUNC(SYSDATE)-365;

REM Inserta en todas las tablas normalizadas
INSERT ALL
INTO grade_distribution_normalized
VALUES (section_id, 'A', grade_a)
INTO grade_distribution_normalized
VALUES (section_id, 'B', grade_b)
INTO grade_distribution_normalized
VALUES (section_id, 'C', grade_c)
INTO grade_distribution_normalized
VALUES (section_id, 'D', grade_d)
INTO grade_distribution_normalized
VALUES (section_id, 'F', grade_f)
SELECT section_id, grade_a, grade_b,
grade_c, grade_d, grade_f
FROM grade_distribution;

REM ROLLBACK Deshace los cambios anteriores
INSERT INTO zipcode
(zip, city, state,
created_by, created_date, modified_by, modified_date)
VALUES
('22222', NULL, NULL,
USER, SYSDATE, USER, SYSDATE);
ROLLBACK;

REM Borra el que se guarde con SAVEPOINT
INSERT INTO zipcode
(zip, city, state,
created_by, created_date, modified_by, modified_date)
VALUES
('22222', NULL, NULL,
USER, SYSDATE, USER, SYSDATE);
SAVEPOINT zip22222;
ROLLBACK TO SAVEPOINT zip22222;

REM No acepta ningun valor nulo
INSERT INTO grade_type
(grade_type_code, description,
created_by, created_date, modified_by, modified_date)
VALUES
('EC', 'Extra Credit',
USER, SYSDATE, USER, SYSDATE);

REM UPDATE Manipula datos existentes en la tabla
UPDATE enrollment
SET final_grade = 90
WHERE enroll_date >= TO_DATE('01/01/2003', 'MM/DD/YYYY')
AND enroll_date < TO_DATE('02/01/2003', 'MM/DD/YYYY');

REM pasa a nulo todas las filas del atributo
UPDATE enrollment
SET final_grade = NULL;

REM Valor por defecto 0
UPDATE grade
SET numeric_grade = DEFAULT
WHERE student_id = 211
AND section_id = 141
AND grade_type_code = 'HM'
AND grade_code_occurrence = 1;

REM actualiza usando condiciones 
UPDATE enrollment
SET final_grade = CASE WHEN final_grade <=80 THEN
final_grade+5
WHEN final_grade > 80 THEN
final_grade+10
END
WHERE section_id = 100;

REM Actualiza con subqueries
UPDATE instructor
SET zip = (SELECT zip
FROM zipcode
WHERE state = 'FL')
WHERE instructor_id = 108;

REM Multiples columnas
UPDATE employee
SET (salary, title) = (SELECT salary, title
FROM employee_change
WHERE employee_id = 4)
WHERE employee_id = 4;

REM borra todas las filas luego reviven con ROLLBACK
DELETE FROM grade_conversion;
ROLLBACK;

REM borra con condicion
DELETE FROM grade_type
WHERE grade_type_code = 'EC';

DELETE FROM enrollment
WHERE student_id NOT IN
(SELECT student_id
FROM student s, zipcode z
WHERE s.zip = z.zip
AND z.city = 'Brooklyn'
AND z.state = 'NY');

DELETE FROM enrollment e
WHERE NOT EXISTS
(SELECT 'x'
FROM student s, zipcode z
WHERE s.zip = z.zip
AND s.student_id = e.student_id
AND z.city = 'Brooklyn'
AND z.state = 'NY');
spool off

