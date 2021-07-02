spool D:\ESCOM\bases\Ejercicios_de_los_libros\Triggers\Salidas\Practica_2.txt


prompt 2)Write a trigger to print the current values in a row being deleted.

CREATE OR REPLACE TRIGGER temp_adr
AFTER DELETE ON TEMP
FOR EACH ROW
BEGIN
    dbms_output.put_line
       (:old.x||' '||:old.y||' '||:old.z);
END;
/
SPOOL OFF