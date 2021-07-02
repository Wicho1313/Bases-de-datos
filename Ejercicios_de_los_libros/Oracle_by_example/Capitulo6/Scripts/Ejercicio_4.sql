Spool  "C:\Users\Acer\Desktop\Ejercicios\Oracle by example\Capitulo6\Salidas\Ejercicio 4.txt"

SELECT e.student_id, s.course_no,
TO_CHAR(e.enroll_date,'MM/DD/YYYY HH:MI PM'),
e.section_id
FROM enrollment e JOIN section s
ON (e.section_id = s.section_id)
WHERE s.course_no = 20
AND e.enroll_date >= TO_DATE('01/30/2003','MM/DD/YYYY')
AND e.enroll_date < TO_DATE('01/31/2003','MM/DD/YYYY');

spool off;