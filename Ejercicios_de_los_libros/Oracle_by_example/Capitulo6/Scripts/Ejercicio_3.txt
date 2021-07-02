Spool  "C:\Users\Acer\Desktop\Ejercicios\Oracle by example\Capitulo6\Salidas\Ejercicio 3.txt"

SELECT c.course_no, c.description, s.section_no
FROM course c, section s
WHERE c.course_no = s.course_no
AND c.prerequisite IS NULL
ORDER BY c.course_no, s.section_no;

spool off;