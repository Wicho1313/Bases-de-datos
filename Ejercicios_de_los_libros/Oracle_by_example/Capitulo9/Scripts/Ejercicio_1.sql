Spool  D:\ESCOM\bases\Ejercicios_de_los_libros\Oracle_by_example\Capitulo9\Salidas\Ejercicio_1.txt

column course_no format 99999999
column description format A30
column section_id format 99999999
SELECT course_no, description,
section_id
FROM course JOIN section
USING (course_no)
ORDER BY course_no;
spool off