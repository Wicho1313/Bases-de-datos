Spool  "C:\Users\Acer\Desktop\Ejercicios\Oracle by example\Capitulo7\Salidas\Ejercicio 3.txt"

SELECT student_id, section_id, numeric_grade
FROM grade
WHERE grade_type_code = 'PJ'
AND (section_id, numeric_grade) IN
(SELECT section_id, MAX(numeric_grade)
FROM grade
WHERE grade_type_code = 'PJ'
GROUP BY section_id);
spool off;