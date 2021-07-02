Spool  D:\ESCOM\bases\Ejercicios_de_los_libros\Oracle_by_example\Capitulo9\Salidas\Ejercicio_5.txt

SELECT c.course_no, c.description,
s.section_id, s.course_no
FROM course c RIGHT OUTER JOIN section s
ON c.course_no = s.course_no
ORDER BY c.course_no;
spool off