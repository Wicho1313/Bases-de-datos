set echo off;
Column Primera format A15;
Column Ultima format A15;
set colsep '  *  ';

Spool  "C:\Users\Acer\Desktop\Ejercicios\Oracle by example\Capitulo5\Salidas\Ejercicio 2.txt"

SELECT MIN(registration_date) "Primera", MAX(registration_date) "Ultima"
FROM student;
spool off;