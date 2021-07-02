Spool  D:\ESCOM\bases\Ejercicios_de_los_libros\Oracle_by_example\Capitulo8\Salidas\Ejercicio_1.txt

SELECT instructor_id id, first_name, last_name, phone
FROM instructor
UNION
SELECT student_id, first_name, last_name, phone
FROM student
ORDER BY 3;
spool off