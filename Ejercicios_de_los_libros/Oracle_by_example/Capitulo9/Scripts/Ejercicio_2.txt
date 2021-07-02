Spool  D:\ESCOM\bases\Ejercicios_de_los_libros\Oracle_by_example\Capitulo9\Salidas\Ejercicio_2.txt

SELECT course_no, description
FROM course c
WHERE NOT EXISTS
(SELECT 'X'
FROM section
WHERE c.course_no = course_no);
spool off