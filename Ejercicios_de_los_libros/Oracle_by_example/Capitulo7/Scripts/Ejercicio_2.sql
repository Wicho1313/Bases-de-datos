Spool  "C:\Users\Acer\Desktop\Ejercicios\Oracle by example\Capitulo7\Salidas\Ejercicio 2.txt"

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
spool off;