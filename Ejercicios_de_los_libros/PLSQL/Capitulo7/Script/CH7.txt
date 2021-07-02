
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

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_1.txt
REM pagina 367 muestra el numero minimo de costo
SELECT MIN(cost) Minimo   
FROM course;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_2.txt
REM condicion mientras el costo sea igual a 1095
SELECT course_no, description, cost   
FROM course 
WHERE cost = 1095;
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_3.txt
REM agrega un subquery para indicar que muestre info con costos minimos
SELECT course_no, description, cost   
FROM course  WHERE cost =       
 (SELECT MIN(cost)           
FROM course);
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_4.txt
REM Costo maximo
SELECT course_no, description, cost   
FROM course  WHERE cost =        
(SELECT MAX(cost)           
FROM course);
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_5.txt
REM subquery con condicion
SELECT course_no, description, cost   
FROM course  WHERE cost IN        
(SELECT cost           
FROM course          
WHERE prerequisite = 20);
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_6.txt
REM subquery con condicion negada
SELECT course_no, description, cost   
FROM course  WHERE cost NOT IN        
(SELECT cost           
FROM course          
WHERE prerequisite = 20);
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_7.txt
REM condiciones mas elaboradas
SELECT last_name, first_name   
FROM student  
WHERE student_id IN        
(SELECT student_id           
FROM enrollment          
WHERE section_id IN                
(SELECT section_id                   
FROM section                 
 WHERE section_no = 8                    
AND course_no = 20));
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_8.txt
REM condicion de una cadena, se utiliza IN y =
SELECT course_no, description   
FROM course  
WHERE course_no IN        
(SELECT course_no           
FROM section          
WHERE location = 'L211');
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_9.txt
REM con un equijoin se simplifica la consulta
SELECT c.course_no, c.description   
FROM course c, section s  
WHERE c.course_no = s.course_no    
AND s.location = 'L211';
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_10.txt
REM calificaciones mas altas
SELECT section_id, MAX(numeric_grade)   
FROM grade  
WHERE grade_type_code = 'PJ'  
GROUP BY section_id;
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_11.txt
REM otras formas de usar el in
SELECT course_no, prerequisite   
FROM course  
WHERE course_no IN (120, 220, 310);
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_12.txt
REM
SELECT course_no, prerequisite    
FROM course   
WHERE prerequisite NOT IN         
(SELECT prerequisite            
FROM course          
 WHERE course_no IN (310, 220));
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_13.txt
REM se pueden considerar nulos
SELECT course_no, prerequisite    FROM course   WHERE prerequisite NOT IN (80, NULL);
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_14.txt
rem donde no existan las condiciones 
SELECT course_no, prerequisite   
FROM course c  WHERE NOT EXISTS       
(SELECT '*'          
FROM course         
WHERE course_no IN (310, 220)           
AND c.prerequisite = prerequisite);
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_15.txt
REM compara con la menor fecha de registro
SELECT first_name, last_name
FROM student
WHERE registration_date =
(SELECT MIN(registration_date)
FROM student);
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_16.txt
REM usa condiciones mas elaboradas
SELECT c.description, s.section_no, c.cost, s.capacity
FROM course c, section s
WHERE c.course_no = s.course_no
AND s.capacity <=
(SELECT AVG(capacity)
FROM section)
AND c.cost =
(SELECT MIN(cost)
FROM course);
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_17.txt
SELECT course_no, SUM(capacity)
FROM section
GROUP BY course_no
HAVING SUM(capacity) <
(SELECT AVG(capacity)
FROM section);
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_18.txt
SELECT course_no, SUM(capacity)
FROM section
GROUP BY course_no;
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_19.txt
SELECT AVG(capacity)
FROM section;
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_20.txt
SELECT student_id, COUNT(*)
FROM enrollment
GROUP BY student_id
HAVING COUNT(*) =
(SELECT MAX(COUNT(*))
FROM enrollment
GROUP BY student_id);
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_21.txt
SELECT COUNT(*)
FROM enrollment
GROUP BY student_id;
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_22.txt
SELECT MAX(COUNT(*))
FROM enrollment
GROUP BY student_id;
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_23.txt
SELECT student_id, section_id
FROM enrollment
WHERE student_id IN
(SELECT student_id
FROM student
WHERE zip = '06820');
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_24.txt
SELECT e.student_id, e.section_id
FROM enrollment e, student s
WHERE e.student_id = s.student_id
AND s.zip = '06820';
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_25.txt
SELECT course_no, description
FROM course
WHERE course_no IN
(SELECT course_no
FROM section
WHERE instructor_id IN
(SELECT instructor_id
FROM instructor
WHERE last_name = 'Hanks'
AND first_name = 'Fernand'));
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_26.txt
REM Utilizando equijoin
SELECT c.course_no, c.description
FROM course c, section s, instructor i
WHERE c.course_no = s.course_no
AND s.instructor_id = i.instructor_id
AND i.last_name = 'Hanks'
AND i.first_name = 'Fernand';
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_27.txt
SELECT last_name, first_name
FROM student
WHERE student_id NOT IN
(SELECT student_id
FROM enrollment);
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_28.txt
SELECT section_id, capacity
FROM section
WHERE (section_id, capacity) IN
(SELECT section_id, COUNT(*)
FROM enrollment
GROUP BY section_id);
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_29.txt
SELECT student_id, section_id, numeric_grade
FROM grade
WHERE grade_type_code = 'PJ'
AND (section_id, numeric_grade) IN
(SELECT section_id, MAX(numeric_grade)
FROM grade
WHERE grade_type_code = 'PJ'
GROUP BY section_id);
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_30.txt
REM Utilizando subquerys
SELECT student_id, section_id, numeric_grade
FROM grade outer
WHERE grade_type_code = 'PJ'
AND numeric_grade =
(SELECT MAX(numeric_grade)
FROM grade
WHERE grade_type_code = outer.grade_type_code
AND section_id = outer.section_id);
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_31.txt
SELECT student_id, section_id, numeric_grade
FROM grade outer
WHERE grade_type_code = 'PJ';
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_32.txt
SELECT MAX(numeric_grade)
FROM grade
WHERE grade_type_code = 'PJ'
AND section_id = 155;
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_33.txt
SELECT MAX(numeric_grade)
FROM grade
WHERE grade_type_code = 'PJ'
AND section_id = 133;
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo7\Salidas\Ejercicio_34.txt
SELECT instructor_id, last_name, first_name, zip
FROM instructor i
WHERE EXISTS
(SELECT 'X'
FROM section
WHERE i.instructor_id = instructor_id);
spool off