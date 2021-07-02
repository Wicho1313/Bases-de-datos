Spool  "C:\Users\Acer\Desktop\Ejercicios\Oracle by example\Capitulo6\Salidas\Ejercicio 5.txt"

SELECT s.student_id, i.instructor_id,
s.zip, i.zip
FROM student s, instructor i
WHERE s.zip = i.zip
ORDER BY s.student_id, i.instructor_id;

spool off;