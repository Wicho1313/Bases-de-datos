Spool  D:\ESCOM\bases\Ejercicios_de_los_libros\Oracle_by_example\Capitulo8\Salidas\Ejercicio_5.txt
SELECT student_id
FROM student
INTERSECT
SELECT student_id
FROM enrollment;
spool off