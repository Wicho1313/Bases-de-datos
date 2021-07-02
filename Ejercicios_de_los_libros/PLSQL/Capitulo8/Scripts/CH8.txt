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

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_1.txt
REM pagina 424 realiza la union de ambas tablas sin repetidos
SELECT first_name, last_name, phone   
FROM instructor  
UNION SELECT first_name, last_name, phone   
FROM student;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_2.txt
REM group es para ordenar filas por prioridad de izquierda a derecha
REM a demas por count nos muesta las filas duplicadas
SELECT first_name, last_name, phone, COUNT(*)   
FROM student  
GROUP BY last_name, first_name, phone HAVING COUNT(*) > 1;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_3.txt
REM hace la union sin excepciones
SELECT first_name, last_name, phone   FROM instructor  UNION ALL 
SELECT first_name, last_name, phone   FROM student; 
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_4.txt
REM Ordena
SELECT instructor_id id, first_name, last_name, phone   
FROM instructor  
UNION SELECT student_id, first_name, last_name, phone   
FROM student  
ORDER BY 3;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_5.txt
SELECT first_name, last_name,        
'Instructor' "Type"   
FROM instructor  
UNION SELECT first_name, last_name,        
'Student'   
FROM student;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_6.txt
SELECT zip   FROM instructor  UNION SELECT zip   FROM student;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_7.txt
SELECT created_by   FROM enrollment  UNION SELECT created_by   FROM grade  UNION SELECT created_by   FROM grade_type  UNION SELECT created_by   FROM grade_conversion;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_8.txt
SELECT created_by, 'GRADE' AS SOURCE, 1 AS SORT_ORDER   FROM grade  UNION SELECT created_by, 'GRADE_TYPE', 2   FROM grade_type  UNION SELECT created_by, 'GRADE_CONVERSION', 3   FROM grade_conversion  UNION SELECT created_by, 'ENROLLMENT', 4   FROM enrollment  ORDER BY 3;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_9.txt
REM Operacion minus que resta los elementos
SELECT instructor_id   FROM instructor  MINUS SELECT instructor_id   FROM section;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_10.txt
REM Lista diferente de instructors
SELECT DISTINCT instructor_id   FROM section;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_11.txt
REM Realiza la interseccion entre los dos atributos
SELECT created_by   FROM enrollment INTERSECT SELECT created_by   FROM course;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_12.txt
REM Se puede tener el mismo resultado con equijoins
SELECT DISTINCT c.course_no   FROM course c, section s  WHERE c.course_no = s.course_no;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_13.txt
REM combinacion de la union con la resta de conjunto
SELECT col1   
FROM t1 
UNION ALL 
SELECT col2   
FROM t2 MINUS 
SELECT col3   
FROM t3;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_14.txt
SELECT student_id   
FROM student INTERSECT 
SELECT student_id   
FROM enrollment;
spool off
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

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_1.txt
REM pagina 424 realiza la union de ambas tablas sin repetidos
SELECT first_name, last_name, phone   
FROM instructor  
UNION SELECT first_name, last_name, phone   
FROM student;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_2.txt
REM group es para ordenar filas por prioridad de izquierda a derecha
REM a demas por count nos muesta las filas duplicadas
SELECT first_name, last_name, phone, COUNT(*)   
FROM student  
GROUP BY last_name, first_name, phone HAVING COUNT(*) > 1;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_3.txt
REM hace la union sin excepciones
SELECT first_name, last_name, phone   FROM instructor  UNION ALL 
SELECT first_name, last_name, phone   FROM student; 
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_4.txt
REM Ordena
SELECT instructor_id id, first_name, last_name, phone   
FROM instructor  
UNION SELECT student_id, first_name, last_name, phone   
FROM student  
ORDER BY 3;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_5.txt
SELECT first_name, last_name,        
'Instructor' "Type"   
FROM instructor  
UNION SELECT first_name, last_name,        
'Student'   
FROM student;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_6.txt
SELECT zip   FROM instructor  UNION SELECT zip   FROM student;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_7.txt
SELECT created_by   FROM enrollment  UNION SELECT created_by   FROM grade  UNION SELECT created_by   FROM grade_type  UNION SELECT created_by   FROM grade_conversion;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_8.txt
SELECT created_by, 'GRADE' AS SOURCE, 1 AS SORT_ORDER   FROM grade  UNION SELECT created_by, 'GRADE_TYPE', 2   FROM grade_type  UNION SELECT created_by, 'GRADE_CONVERSION', 3   FROM grade_conversion  UNION SELECT created_by, 'ENROLLMENT', 4   FROM enrollment  ORDER BY 3;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_9.txt
REM Operacion minus que resta los elementos
SELECT instructor_id   FROM instructor  MINUS SELECT instructor_id   FROM section;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_10.txt
REM Lista diferente de instructors
SELECT DISTINCT instructor_id   FROM section;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_11.txt
REM Realiza la interseccion entre los dos atributos
SELECT created_by   FROM enrollment INTERSECT SELECT created_by   FROM course;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_12.txt
REM Se puede tener el mismo resultado con equijoins
SELECT DISTINCT c.course_no   FROM course c, section s  WHERE c.course_no = s.course_no;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_13.txt
REM combinacion de la union con la resta de conjunto
SELECT col1   
FROM t1 
UNION ALL 
SELECT col2   
FROM t2 MINUS 
SELECT col3   
FROM t3;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_14.txt
SELECT student_id   
FROM student INTERSECT 
SELECT student_id   
FROM enrollment;
spool off

spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_15.txt
SELECT zip   FROM instructor INTERSECT SELECT zip   FROM student;
spool off
spool D:\ESCOM\bases\Ejercicios_de_los_libros\PLSQL\Capitulo8\Salidas\Ejercicio_16.txt
SELECT student_id   
FROM enrollment             
 MINUS                 
SELECT student_id   
FROM student  ;        
spool off


