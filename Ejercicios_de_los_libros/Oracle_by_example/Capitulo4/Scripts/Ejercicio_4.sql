set echo off;
Column Apellido format A15;
Column Fecha format A20;
set colsep '  *  ';

Spool  "C:\Users\Acer\Desktop\Ejercicios\Oracle by example\Capitulo4\Salidas\Ejercicio 4.txt"

SELECT last_name "Apellido", TO_CHAR(registration_date, 'DD-MON-YYYY HH24:MI:SS') "Fecha"
FROM student
WHERE registration_date = TO_DATE('22-JAN-2003', 'DD-MON-YYYY');

Spool off;