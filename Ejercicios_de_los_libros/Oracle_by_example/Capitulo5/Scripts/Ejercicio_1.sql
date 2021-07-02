set echo off;
Column Seccion format 999999;
Column Secciones format 999999;
set colsep '  *  ';

Spool  "C:\Users\Acer\Desktop\Ejercicios\Oracle by example\Capitulo5\Salidas\Ejercicio 1.txt"

SELECT COUNT(DISTINCT section_id) "Secciones", COUNT(section_id) "Seccion"
FROM enrollment;
spool off;