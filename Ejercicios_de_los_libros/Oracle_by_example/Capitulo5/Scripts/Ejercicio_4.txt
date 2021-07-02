set echo off;
Column Localizacion format A15;
Column Instructor format 999999;
Column Localizaciones format 999999;
Column Capacidad format 999999;
set colsep '  *  ';

Spool  "C:\Users\Acer\Desktop\Ejercicios\Oracle by example\Capitulo5\Salidas\Ejercicio 4.txt"

SELECT location "Localizacion", instructor_id "Instructor",
COUNT(location) "Localizaciones",
SUM(capacity) "Capacidad"
FROM section
GROUP BY location, instructor_id
HAVING SUM(capacity) > 50
ORDER BY "Capacidad" DESC;
spool off;