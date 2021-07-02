
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

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo6\Salidas\Ejercicio_1.txt
rem pag 329 dos tablas mostradas
SELECT course.course_no, section_no, description,
location, instructor_id
FROM course, section
WHERE course.course_no = section.course_no;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo6\Salidas\Ejercicio_2.txt
rem pag 330 se hacen alias de las tablas
SELECT c.course_no C_NO, s.section_no, c.description,
s.location, s.instructor_id INST_ID
FROM course c, section s
WHERE c.course_no = s.course_no
    and rownum <= 20;
spool off
	
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo6\Salidas\Ejercicio_3.txt
rem pag 330 atrubuto null 
SELECT instructor_id, zip, last_name, first_name
FROM instructor
WHERE zip IS NULL;

rem pag 330 no es nulo
SELECT instructor_id, zip, last_name, first_name
FROM instructor
WHERE zip is not NULL;
spool off


spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo6\Salidas\Ejercicio_4.txt
rem pag 330 consulta el instructor 110
SELECT instructor_id, zip, last_name, first_name
FROM instructor
WHERE instructor_id = 110;
spool off


spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo6\Salidas\Ejercicio_5.txt
rem la profrs Irene Willing no aparece en el desplegado
SELECT i.instructor_id, i.zip, i.last_name, i.first_name
FROM instructor i, zipcode z
WHERE i.zip = z.zip;
spool off


spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo6\Salidas\Ejercicio_6.txt
rem el equijoin siempre considera la clausula USING
SELECT course_no, s.section_no, c.description,
	s.location, s.instructor_id
	FROM course c JOIN section s
	USING (course_no);
spool off


spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo6\Salidas\Ejercicio_7.txt
REM Union interna
SELECT course_no, s.section_no, c.description,
	s.location, s.instructor_id
	FROM course c INNER JOIN section s
	USING (course_no);
spool off


 spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo6\Salidas\Ejercicio_8.txt
REM hace la union en una condicion 
SELECT c.course_no, s.section_no, c.description,        
s.location, s.instructor_id   
FROM course c JOIN section s     
ON (c.course_no = s.course_no);
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo6\Salidas\Ejercicio_9.txt
REM se crean condiciones adicionales (descripcion comienza con B)
SELECT c.course_no, s.section_no, c.description,        
s.location, s.instructor_id   
FROM course c JOIN section s     
ON (c.course_no = s.course_no)  
WHERE description LIKE 'B%';
spool off

 spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo6\Salidas\Ejercicio_10.txt
REM une tablas con columnas llamadas igual
SELECT course_no, s.section_no, c.description,        
s.location, s.instructor_id   
FROM course c NATURAL JOIN section s;
spool off

 spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo6\Salidas\Ejercicio_11.txt
REM cuenta las filas de ambas tablas
SELECT COUNT(*)   FROM section, instructor;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo6\Salidas\Ejercicio_12.txt
REM lista de filas, todas las combinaciones entre dos tablas
SELECT s.instructor_id alias_1,        
i.instructor_id alias_2   
FROM section s, instructor i;
spool off

 spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo6\Salidas\Ejercicio_13.txt
REM da las filas del producto cartesiano, el cross join reemplaza las comas
SELECT COUNT(*)   
FROM section CROSS JOIN instructor;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo6\Salidas\Ejercicio_14.txt
REM Tiene mas condiciones
SELECT c.course_no, s.section_no, c.description, s.location,        
s.instructor_id, i.last_name, i.first_name   
FROM course c, section s, instructor i  
WHERE c.course_no = s.course_no    
AND s.instructor_id = i.instructor_id;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo6\Salidas\Ejercicio_15.txt
REM on tiene condiciones opcionales
SELECT c.course_no, s.section_no, c.description, s.location,        
s.instructor_id, i.last_name, i.first_name   
FROM course c JOIN section s     
ON (c.course_no = s.course_no)   
JOIN instructor i     
ON (s.instructor_id = i.instructor_id);
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo6\Salidas\Ejercicio_16.txt
REM Mientras el zip de ambas tablas sea igual y queda ordenado en orden descendente
SELECT s.last_name, s.zip, z.state, z.city
FROM student s, zipcode z
WHERE s.zip = z.zip
ORDER BY s.zip;
spool off

 spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo6\Salidas\Ejercicio_17.txt
REM Otra forma de hacer la operacion anterior con un join
SELECT s.last_name, s.zip, z.state, z.city
FROM student s JOIN zipcode z
ON (s.zip = z.zip)
ORDER BY s.zip;
spool off

 spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo6\Salidas\Ejercicio_18.txt
REM No se utiliza un alias para evitar causar error
SELECT s.last_name, zip, z.state, z.city
FROM student s JOIN zipcode z
USING (zip)
ORDER BY zip;
spool off

 spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo6\Salidas\Ejercicio_19.txt
REM nuestra estudiantes con el mismo id en ambas tablas
SELECT s.first_name, s.last_name, s.student_id
FROM student s, enrollment e
WHERE s.student_id = e.student_id
ORDER BY s.last_name;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo6\Salidas\Ejercicio_20.txt
rem con distinct muestra los alumnos sin repetirse
SELECT DISTINCT s.first_name, s.last_name, s.student_id
FROM student s, enrollment e
WHERE s.student_id = e.student_id
ORDER BY s.last_name;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo6\Salidas\Ejercicio_21.txt
REM Con clausula USING
SELECT first_name, last_name, student_id
FROM student JOIN enrollment
USING (student_id)
ORDER BY last_name;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo6\Salidas\Ejercicio_22.txt
REM muestra alimnos sin prerequisito
SELECT c.course_no, c.description, s.section_no
FROM course c, section s
WHERE c.course_no = s.course_no
AND c.prerequisite IS NULL
ORDER BY c.course_no, s.section_no;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo6\Salidas\Ejercicio_23.txt
REM hace lo mismo que el anterior pero con formato ANSI
SELECT c.course_no, c.description, s.section_no
FROM course c JOIN section s
ON (c.course_no = s.course_no)
WHERE c.prerequisite IS NULL
ORDER BY c.course_no, section_no;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo6\Salidas\Ejercicio_24.txt
REM muestra con condiciones en fecha, to_date convierte a formato fecha 
SELECT e.student_id, s.course_no,
TO_CHAR(e.enroll_date,'MM/DD/YYYY HH:MI PM'),
e.section_id
FROM enrollment e JOIN section s
ON (e.section_id = s.section_id)
WHERE s.course_no = 20
AND e.enroll_date >= TO_DATE('01/30/2003','MM/DD/YYYY')
AND e.enroll_date < TO_DATE('01/31/2003','MM/DD/YYYY');
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo6\Salidas\Ejercicio_25.txt
REM Sale un producto cartesiano
SELECT s.student_id, i.instructor_id,
s.zip, i.zip
FROM student s, instructor i
WHERE s.zip = i.zip
ORDER BY s.student_id, i.instructor_id;
spool off