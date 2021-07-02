set echo off;
Column Promedio format 9999;
Column Minimo format A15;
Column Maximo format A15;
set colsep '  *  ';

Spool  "C:\Users\Acer\Desktop\Ejercicios\Oracle by example\Capitulo5\Salidas\Ejercicio 3.txt"

SELECT AVG(CASE WHEN prerequisite IS NOT NULL THEN cost*1.1
WHEN prerequisite = 20 THEN cost*1.2
ELSE cost
END) As "Promedio", MIN(description) As "Minimo", MAX(description) As "Maximo"
FROM course;
spool off;
