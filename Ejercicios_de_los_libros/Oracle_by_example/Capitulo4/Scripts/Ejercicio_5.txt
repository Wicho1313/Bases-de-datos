set echo off;
Column Grado format A15;
Column Fecha format A20;
Column Descripcion format A30;
set colsep '  *  ';

Spool  "C:\Users\Acer\Desktop\Ejercicios\Oracle by example\Capitulo4\Salidas\Ejercicio 2.txt"

SELECT grade_type_code "Grado", description "Descripcion", created_date "Fecha"
FROM grade_type
WHERE created_date = '31-DEC-98';

Spool off;