Spool  D:\ESCOM\bases\Ejercicios_de_los_libros\Oracle_by_example\Capitulo9\Salidas\Ejercicio_6.txt

COLUMN course_no FORMAT 999999999
COLUMN section_id FORMAT 999999999
COLUMN description FORMAT A30
SELECT c.course_no, s.course_no, s.section_id,
c.description, s.start_date_time
FROM course c, section s
WHERE c.course_no = s.course_no(+)
UNION
SELECT c.course_no, s.course_no, s.section_id,
c.description, s.start_date_time
FROM course c, section s
WHERE c.course_no(+) = s.course_no;
spool off