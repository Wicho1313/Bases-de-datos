Spool  "C:\Users\Acer\Desktop\Ejercicios\Oracle by example\Capitulo6\Salidas\Ejercicio 2.txt"

SELECT s.first_name, s.last_name, s.student_id
FROM student s, enrollment e
WHERE s.student_id = e.student_id
ORDER BY s.last_name;

spool off;