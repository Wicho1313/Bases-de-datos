SPOOL D:\ESCOM\bases\Ejercicios_de_los_libros\Triggers\Salidas\Practica_1.txt

prompt 1)Write a trigger that fires ONLY under the following conditions:
UPDATE when Y changes from NULL to a NOT NULL value.
INSERT when X is between 1 and 10.


CREATE TABLE TEMP(X NUMBER, Y NUMBER, Z NUMBER DEFAULT 5);

CREATE OR REPLACE TRIGGER temp_aiur
AFTER INSERT OR UPDATE OF Y ON TEMP
FOR EACH ROW
WHEN (OLD.Y IS NULL and NEW.Y IS NOT NULL
      OR NEW.X BETWEEN 1 AND 10)
BEGIN
    CASE
    WHEN inserting THEN
        dbms_output.put_line('X := '||:new.x);
    WHEN updating THEN
       dbms_output.put_line
          ('Y is reset from NULL');
    END CASE;
END;
/

SPOOL OFF
