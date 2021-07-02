spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo9\Salidas\CH8.txt
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

REM hace la union de ambas tablas
SELECT course_no, description,
section_id
FROM course JOIN section
USING (course_no)
ORDER BY course_no;

REM Utilizacion de subquery
SELECT course_no, description
FROM course c
WHERE NOT EXISTS
(SELECT 'X'
FROM section
WHERE c.course_no = course_no);

REM se unen por la izquierda
SELECT c.course_no, c.description,
s.section_id, s.course_no
FROM course c LEFT OUTER JOIN section s
ON c.course_no = s.course_no
ORDER BY c.course_no;

REM Union por la derecha
SELECT c.course_no, c.description,
s.section_id, s.course_no
FROM section s RIGHT OUTER JOIN course c
ON c.course_no = s.course_no
ORDER BY c.course_no;

REM Usando la sintaxis ANSI union por la derecha
SELECT course_no, description,
section_id
FROM section RIGHT OUTER JOIN course
USING (course_no)
ORDER BY course_no;

REM Utilizando (+)
SELECT c.course_no, c.description,
s.section_id, s.course_no
FROM course c, section s
WHERE c.course_no = s.course_no(+)
ORDER BY c.course_no;

REM Union All usa nulos y subquerys
SELECT c1.course_no, c1.description,
s.section_id, s.course_no
FROM course c1, section s
WHERE c1.course_no = s.course_no
UNION ALL
SELECT c2.course_no, c2.description,
TO_NUMBER(NULL), TO_NUMBER(NULL)
FROM course c2
WHERE NOT EXISTS
(SELECT 'X'
FROM section
WHERE c2.course_no = course_no);

REM Join completo con sintaxis ANSI
SELECT c.course_no, s.course_no, s.section_id,
c.description, s.start_date_time
FROM course c FULL OUTER JOIN section s
ON c.course_no = s.course_no;

REM prerequisito igual a 350
SELECT course_no, description
FROM course
WHERE prerequisite = 350;

REM entre 430 y 450
SELECT section_id, course_no
FROM section
WHERE course_no IN (430, 450);

REM union por la izquierda y prerequisito es 350
SELECT c.course_no cno, s.course_no sno,
c.description,
c.prerequisite prereq,
s.location loc, s.section_id
FROM course c LEFT OUTER JOIN section s
ON c.course_no = s.course_no
WHERE c.prerequisite = 350;

SELECT c.course_no cno, s.course_no sno,
c.description,
c.prerequisite prereq,
s.location loc, s.section_id
FROM course c, section s
WHERE c.course_no = s.course_no(+)
AND c.prerequisite = 350;

SELECT c.course_no cno, s.course_no sno,
c.description,
c.prerequisite prereq,
s.location loc, s.section_id
FROM course c, section s
WHERE c.course_no = s.course_no(+)
AND c.prerequisite = 350
Oracle® SQL by Example, Third Edition By Alice Rischert
- 458 -
AND s.location = 'L507';

SELECT c.course_no cno, s.course_no sno,
c.description,
c.prerequisite prereq,
s.location loc, s.section_id
FROM course c, section s
WHERE c.course_no = s.course_no(+)
AND c.prerequisite = 350
AND s.location(+) = 'L507';

SELECT c.course_no cno, s.course_no sno,
SUBSTR(c.description, 1,20),
c.prerequisite prereq,
s.location loc, s.section_id
FROM course c, section s
Oracle® SQL by Example, Third Edition By Alice Rischert
- 459 -
WHERE c.course_no = s.course_no(+)
AND c.prerequisite = 350
AND s.location(+) = 'L210';

SELECT c.course_no cno, s.course_no sno,
c.description,
c.prerequisite prereq,
s.location loc, s.section_id
FROM course c LEFT OUTER JOIN section s
ON c.course_no = s.course_no
WHERE c.prerequisite = 350
AND location = 'L507';

SELECT c.course_no cno, s.course_no sno,
c.description,
c.prerequisite prereq,
s.location loc, s.section_id
Oracle® SQL by Example, Third Edition By Alice Rischert
- 460 -
FROM course c LEFT OUTER JOIN section s
ON (c.course_no = s.course_no
AND location = 'L507')
WHERE c.prerequisite = 350;

SELECT c.course_no cno, s.course_no sno,
c.description,
c.prerequisite prereq,
s.location loc, s.section_id
FROM (SELECT *
FROM course
WHERE prerequisite = 350) c LEFT OUTER JOIN
(SELECT * FROM section
WHERE location = 'L507') s
ON (c.course_no = s.course_no);

SELECT course_no, description
FROM course c
WHERE NOT EXISTS
(SELECT 'X'
FROM section
WHERE c.course_no = course_no);

SELECT course_no, description
FROM course LEFT OUTER JOIN section
USING (course_no)
WHERE section_id IS NULL;

SELECT city, state, z.zip AS zzip, s.zip AS szip,
COUNT(s.zip) AS student_count,
COUNT(z.zip) AS wrong_value
FROM zipcode z LEFT OUTER JOIN student s
ON (z.zip = s.zip)
WHERE state = 'CT'
GROUP BY city, state, z.zip, s.zip;

SELECT city, state, zip,
(SELECT COUNT(*)
FROM student s
WHERE s.zip = z.zip) AS student_count
FROM zipcode z
WHERE state = 'CT';

SELECT course_no cou, description, cost,
location, last_name
FROM course LEFT OUTER JOIN section
USING (course_no)
LEFT OUTER JOIN instructor
USING (instructor_id)
ORDER BY course_no;

SELECT student_id, section_id, grade_type_code,
numeric_grade
FROM student LEFT OUTER JOIN enrollment
USING (student_id)
LEFT OUTER JOIN grade
USING (student_id, section_id)
WHERE student_id IN (102, 301);

SELECT s.student_id, e.section_id, g.grade_type_code,
g.numeric_grade
FROM student s, enrollment e, grade g
WHERE s.student_id IN (102, 301)
AND s.student_id = e.student_id(+)
AND e.student_id = g.student_id(+)
AND e.section_id = g.section_id(+);

SELECT course_no, description, prerequisite
FROM course;

SELECT c1.course_no,
c1.description course_descr,
c1.prerequisite,
c2.description pre_req_descr
FROM course c1 JOIN course c2
ON (c1.prerequisite = c2.course_no)
ORDER BY 3;

SELECT c1.course_no,
c1.description course_descr,
c1.prerequisite,
c2.description pre_req_descr
FROM course c1, course c2
WHERE c1.prerequisite = c2.course_no
ORDER BY 3;

SELECT grade_type_code, numeric_grade, letter_grade
FROM grade g JOIN grade_conversion c
ON (g.numeric_grade BETWEEN c.min_grade AND c.max_grade)
WHERE g.student_id = 107
ORDER BY 1, 2 DESC;

SELECT fi.student_id, mt.numeric_grade "Midterm Grade",
fi.numeric_grade "Final Grade"
FROM grade fi JOIN grade mt
ON (fi.section_id = mt.section_id
AND fi.student_id = mt.student_id)
WHERE fi.grade_type_code = 'FI'
AND fi.section_id = 86
AND mt.grade_type_code = 'MT'
AND fi.numeric_grade < mt.numeric_grade;

SELECT DISTINCT a.student_id, a.last_name,
a.street_address
FROM student a, student b
WHERE a.street_address = b.street_address
AND a.zip = b.zip
AND a.student_id <> b.student_id
ORDER BY a.street_address;

SELECT DISTINCT a.student_id, a.last_name,
a.street_address
FROM student a JOIN student b
ON (a.street_address = b.street_address
AND a.zip = b.zip
AND a.student_id <> b.student_id)
ORDER BY a.street_address;

SELECT DISTINCT b.student_id id, b.last_name,
b.street_address ||' '|| city || ', '
|| state address
FROM student a, student b, zipcode z
WHERE a.street_address = b.street_address
AND a.zip = b.zip
AND a.student_id <> b.student_id
AND z.zip = b.zip
ORDER BY address;

SELECT DISTINCT student_id id, last_name,
street_address ||' '|| city || ', '
|| state address
FROM student s, zipcode z
WHERE s.zip = z.zip
AND (street_address, s.zip) IN
(SELECT street_address, zip
FROM student
GROUP BY street_address, zip
HAVING COUNT(*) > 1)
ORDER BY address;

SELECT c1.course_no,
SUBSTR(c1.description, 1,15) course_descr,
C1.prerequisite,
SUBSTR(c2.description,1,15) pre_req_descr
FROM course c1 LEFT OUTER JOIN course c2
ON c1.prerequisite = c2.course_no
ORDER BY 1;

SELECT c1.course_no,
SUBSTR(c1.description, 1,15) course_descr,
C1.prerequisite,
SUBSTR(c2.description,1,15) pre_req_descr
FROM course c1, course c2
WHERE c1.prerequisite = c2.course_no(+)
ORDER BY 1;
spool off