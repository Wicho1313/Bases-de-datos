set echo off;
Column Apellido format A15;
Column Registro format A20;
Column Fecha format A20;
set colsep '  *  ';

Spool  "C:\Users\Acer\Desktop\Ejercicios\Oracle by example\Capitulo4\Salidas\Ejercicio 1.txt"

SELECT last_name "Apellido", registration_date "Registro", TO_CHAR(registration_date, 'MM/DD/YYYY') As "Fecha"
FROM student
WHERE student_id IN (123, 161, 190);

Spool off;