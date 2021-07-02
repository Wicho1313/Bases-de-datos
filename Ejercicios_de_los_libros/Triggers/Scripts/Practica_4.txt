spool D:\ESCOM\bases\Ejercicios_de_los_libros\Triggers\Salidas\Practica_4.txt

prmompt 4)Write two triggers that accomplish the same as the prior six triggers.

CREATE OR REPLACE TRIGGER temp_biudr
BEFORE INSERT OR UPDATE OR DELETE ON TEMP
FOR EACH ROW
BEGIN
    CASE
    WHEN inserting THEN
        dbms_output.put_line('inserting before');
    WHEN updating THEN
        dbms_output.put_line('updating before');
    WHEN deleting THEN
        dbms_output.put_line('deleting before');
    END CASE;
END;
/
CREATE OR REPLACE TRIGGER temp_aiudr
AFTER INSERT OR UPDATE OR DELETE ON TEMP
FOR EACH ROW
BEGIN
    CASE
    WHEN inserting THEN
        dbms_output.put_line('inserting after');
    WHEN updating THEN
        dbms_output.put_line('updating after');
    WHEN deleting THEN
        dbms_output.put_line('deleting after');
    END CASE;
END;
/


SPOOL OFF