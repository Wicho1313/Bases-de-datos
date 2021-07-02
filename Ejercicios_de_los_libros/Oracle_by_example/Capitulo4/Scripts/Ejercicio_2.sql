set echo off;
Column Apellido format A8;
Column Fecha1 format A3;
Column Fecha2 format A3;
Column Fecha3 format A20;
Column Hora format A10;
set colsep '  *  ';

Spool  "C:\Users\Acer\Desktop\Ejercicios\Oracle by example\Capitulo4\Salidas\Ejercicio 2.txt"

SELECT last_name "Apellido", TO_CHAR(registration_date, 'Dy') As "Fecha1",
TO_CHAR(registration_date, 'DY') As "Fecha2", TO_CHAR(registration_date, 'Month DD, YYYY') As "Fecha3",
TO_CHAR(registration_date, 'HH:MI pm') As "Hora"
FROM student
WHERE student_id IN (123, 161, 190);

Spool off;