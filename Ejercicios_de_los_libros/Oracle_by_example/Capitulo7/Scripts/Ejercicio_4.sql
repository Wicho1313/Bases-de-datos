Spool  "C:\Users\Acer\Desktop\Ejercicios\Oracle by example\Capitulo7\Salidas\Ejercicio 4.txt"

SELECT student_id, COUNT(*)
FROM enrollment
GROUP BY student_id
HAVING COUNT(*) =
(SELECT MAX(COUNT(*))
FROM enrollment
GROUP BY student_id);
spool off;