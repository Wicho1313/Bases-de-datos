set echo off;
Column Apellido format A15;
Column Fecha format A20;
set colsep '  *  ';

Spool  "C:\Users\Acer\Desktop\Ejercicios\Oracle by example\Capitulo4\Salidas\Ejercicio 3.txt"

SELECT last_name "Apellido", registration_date "Fecha"
FROM student
WHERE registration_date = TO_DATE('22-JAN-2003', 'DD-MON-YYYY');

Spool off;