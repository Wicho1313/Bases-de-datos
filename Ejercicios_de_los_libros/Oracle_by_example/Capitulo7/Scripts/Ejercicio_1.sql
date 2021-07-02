Spool  "C:\Users\Acer\Desktop\Ejercicios\Oracle by example\Capitulo7\Salidas\Ejercicio 1.txt"

SELECT e.student_id, e.section_id
FROM enrollment e, student s
WHERE e.student_id = s.student_id
AND s.zip = '06820';

spool off;