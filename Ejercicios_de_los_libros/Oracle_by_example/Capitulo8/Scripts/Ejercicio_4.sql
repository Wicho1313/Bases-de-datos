Spool  D:\ESCOM\bases\Ejercicios_de_los_libros\Oracle_by_example\Capitulo8\Salidas\Ejercicio_4.txt

SELECT course_no, description
FROM course
MINUS
SELECT s.course_no, c.description
FROM section s, course c
WHERE s.course_no = c.course_no;
spool off