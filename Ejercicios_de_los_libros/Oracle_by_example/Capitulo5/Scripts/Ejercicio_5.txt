set echo off;
Column Localizacion format A15;
Column Capacidad format 999999;
set colsep '  *  ';

Spool  "C:\Users\Acer\Desktop\Ejercicios\Oracle by example\Capitulo5\Salidas\Ejercicio 5.txt"

SELECT location "Localizacion",
SUM(capacity) "Capacidad"
FROM section
WHERE section_no = 3
GROUP BY location
HAVING (COUNT(location) > 3
AND location LIKE 'L5%');
spool off;