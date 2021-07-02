Spool  "C:\Users\Acer\Desktop\Ejercicios\Oracle by example\Capitulo7\Salidas\Ejercicio 5.txt"

SELECT first_name, last_name, student_id
FROM student s
WHERE EXISTS
(SELECT NULL
FROM enrollment
WHERE s.student_id = student_id
GROUP BY student_id
HAVING COUNT(*) >= 3);
spool off;