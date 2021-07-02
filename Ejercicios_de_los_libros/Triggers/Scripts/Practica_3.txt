spool D:\ESCOM\bases\Ejercicios_de_los_libros\Triggers\Salidas\Practica_3.txt

prompt 3)Write all six possible row level triggers: BEFORE and AFTER ROW for INSERT, UPDATE, and DELETE.

prompt BEFORE INSERT

CREATE OR REPLACE TRIGGER temp_bir
BEFORE INSERT ON TEMP
FOR EACH ROW
BEGIN
    dbms_output.put_line('executing temp_bir');
END;
/
prompt AFTER INSERT

CREATE OR REPLACE TRIGGER temp_air
AFTER INSERT ON TEMP
FOR EACH ROW
BEGIN
    dbms_output.put_line('executing temp_air');
END;
/
prompt BEFORE UPDATE

CREATE OR REPLACE TRIGGER temp_bur
BEFORE UPDATE ON TEMP
FOR EACH ROW
BEGIN
dbms_output.put_line('executing temp_bur');
END;
/
prompt AFTER UPDATE

CREATE OR REPLACE TRIGGER temp_aur
AFTER UPDATE ON TEMP
FOR EACH ROW
BEGIN
    dbms_output.put_line('executing temp_aur');
END;
/
prompt BEFORE DELETE

CREATE OR REPLACE TRIGGER temp_bdr
BEFORE DELETE ON TEMP
FOR EACH ROW
BEGIN
    dbms_output.put_line('executing temp_bdr');
END;
/
prompt AFTER DELETE

CREATE OR REPLACE TRIGGER temp_adr
AFTER DELETE ON TEMP
FOR EACH ROW
BEGIN
    dbms_output.put_line('executing temp_adr');
END;
/
SPOOL OFF
