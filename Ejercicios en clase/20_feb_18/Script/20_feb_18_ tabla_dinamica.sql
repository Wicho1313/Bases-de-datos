set serveroutput on//Anrtes de ejecutar cualquier 

set sqlprompt"_user_connect_identifier'Sergio>'"//
prompt (1)
//Donde se guardara la salida de los archivos.
//Tablas dinamicas cuando $
//"set timing on"comienza a contar el tiempo de ejecución.

spool D:\ESCOM\bases\20_feb_18\salida1.txt
set flush
set linesize 150
set pagesize 30
column tzname format a45;
column tzabbrev format a45;
set timing on
SELECT TZNAME,TZABBREV
	FROM V$TIMEZONE_NAMES;
	set timing off
spool off

//where rownum <=25;

prompt (2)
spool D:\ESCOM\bases\20_feb_18\salida-V$TABLESPACE.txt
COLUMN TS# FORMAT 999;
column NAME format a25;
column INCLUDED_IN_DATABASE_BACKUP format a25
SELECT TS#,NAME,INCLUDED_IN_DATABASE_BACKUP
FROM V$TABLESPACE;
spool off

prompt(3)
spool D:\ESCOM\bases\20_feb_18\salida-V$PARAMETER.txt
column name format a25
column value format a25
column description format a70
select name, value, description 
from v$parameter;
spool off

prompt(4)
spool D:\ESCOM\bases\20_feb_18\salida-SER_INDEXES.txt
column INDEX_NAME FORMAT A25
COLUMN INDEX_TYPE FORMAT A25
COLUMN TABLE_OWNER FORMAT A25
COLUMN TABLE_NAME FORMAT A25
COLUMN BLEVEL FORMAT A25
COLUMN LEAF_BLOCKS FORMAT A 25
SELECT INDEX_NAME, INDEX_TYPE, TABLE_OWNER, TABLE_NAME,
BLEVEL, LEAF_BLOCKS 
FROM USER_INDEXES;
spool off
prompt(5)
spool D:\ESCOM\bases\20_feb_18\salida-ROLE_SYS_PRIVS.txt
COLUMN ROLE FORMAT A35
COLUMN PRIVILEGE FORMAT A35
COLUMN ADMIN_OPTION FORMAT A35
SELECT ROLE, PRIVILEGE, ADMIN_OPTION
FROM ROLE_SYS_PRIVS;
spool off
prompt(6)
spool D:\ESCOM\bases\20_feb_18\salida-nls_instance_parameters.txt
COLUMN PARAMETER FORMAT A35
COLUMN VALUE FORMAT A35
SELECT PARAMETER, VALUE FROM NLS_INSTANCE_PARAMETERS;
spool off
prompt(7)
spool D:\ESCOM\bases\20_feb_18\salida-USER_SEQUENCES.txt
COLUMN SEQUENCE_NAME FORMAT A25
COLUMN MIN_VALUE FORMAT 9999
COLUMN MAX_VALUE FORMAT 9999
COLUMN LAST_NUMBER FORMAT 9999
SELECT SEQUENCE_NAME, MIN_VALUE, MAX_VALUE, LAST_NUMBER
FROM USER_SEQUENCES;
spool off
prompt(8)
spool D:\ESCOM\bases\20_feb_18\salida-P252-2.txt
COLUMN "CURRENT DATE" FORMAT A18
COLUMN "YEAR 88" FORMAT A10
COLUMN "YEAR 18" FORMAT A18
SELECT TO_CHAR(SYSDATE, 'MM/DD/YYYY') "CURRENT DATE",
       TO_CHAR(TO_DATE('10/14/88','MM/DD/RR'),'YYYY') "YEAR 88",
       TO_CHAR(TO_DATE('10/14/18','MM/DD/RR'),'YYYY') "YEAR 18"
FROM DUAL;
spool off
prompt(9)
spool D:\ESCOM\bases\20_feb_18\salida-P252-1.txt
COLUMN "CURRENT DATE" FORMAT A18
COLUMN "YEAR 88" FORMAT A10
COLUMN "YEAR 18" FORMAT A18
SELECT TO_CHAR(SYSDATE, 'MM/DD/YYYY') "CURRENT DATE",
       TO_CHAR(TO_DATE('14/OCT/88','DD/MON/RR'),'YYYY') "YEAR 88",
       TO_CHAR(TO_DATE('14/OCT/18','DD/MON/RR'),'YYYY') "YEAR 18"
FROM DUAL;
spool off
prompt(10)
spool D:\ESCOM\bases\20_feb_18\salida-P248.txt
set serveroutput on
DECLARE 
a TIMESTAMP WITH TIME ZONE;
b TIMESTAMP WITH TIME ZONE;
c TIMESTAMP WITH TIME ZONE;
d TIMESTAMP WITH TIME ZONE;
e DATE;
BEGIN
a:= TIMESTAMP '2002-02-19 11:52:00.00 -05:00';
b:= TIMESTAMP '2002-02-19 14:00:00.000000000 -05:00';
c:= TIMESTAMP '2002-02-19 13:52:00 -05:00';
d:= TIMESTAMP '2002-02-19 11:52:00.00';
e:= DATE '2002-02-19';
DBMS_OUTPUT.PUT_LINE(a);
DBMS_OUTPUT.PUT_LINE(b);
DBMS_OUTPUT.PUT_LINE(c);
DBMS_OUTPUT.PUT_LINE(d);
DBMS_OUTPUT.PUT_LINE(e);
END;
/
spool off
prompt(11)
spool D:\ESCOM\bases\20_feb_18\salida-P245.txt
set serveroutput on
DECLARE
a TIMESTAMP;
b TIMESTAMP;
BEGIN
a:= TO_TIMESTAMP('24-FEB-2002 09.00.00.50');
b:= to_timestamp('02/24/02 09.00.00.50 PM','mm/dd/yyyy hh:mi:ssxff AM');
DBMS_OUTPUT.PUT_LINE(a);
DBMS_OUTPUT.PUT_LINE(b);
END;
/
spool off
prompt(12)
spool D:\ESCOM\bases\20_feb_18\consulta_usuarios_de_sys.txt
PROMPT CONSULTA A LOS USUARIOS DE SYS
SELECT username, account_status, lock_date, expiry_date
from dba_users;
PROMPT CONSULTA AL USUARIO STUDENT
SELECT username, account_status, expiry_date from dba_users
where username='student';
spool off

prompt(13)
prompt ALTER USER ACCOUNT UNLOCK;
spool D:\ESCOM\bases\20_feb_18\USER_UNLOCK.txt
SET PAGESIZE 0
SET FEEDBACK OFF
SELECT 'DROP TABLE' || table_name ||';'
from user_tables
where table_name LIKE UPPER ('HR');
SPOOL drop.cmd
/
SPOOL OFF
@drop.cmd
(14)
spool D:\ESCOM\bases\20_feb_18\Paquetes.txt
SELECT owner ||'.'||name refs_table, referenced_owner ||'.'||
referenced_name table_referenced
from all_dependencies
where owner LIKE UPPER('HR')
AND TYPE IN ('PACKAGE','PACKAGE BODY', 'PROCEDURE','FUNCTION')
AND referenced_type IN ('TABLE','VIEW')
ORDER BY owner, name, referenced_owner, referenced_name;
spool off
prompt(15)
spool D:\ESCOM\bases\20_feb_18\Trigger.txt
drop table temp;
CREATE TABLE temp (N NUMBER);
CREATE OR REPLACE TRIGGER temp_air
AFTER INSERT ON TEMP
FOR EACH ROW
BEGIN
dbms_output.put_line('executing temp_air');
END;
/
INSERT INTO temp VALUES(10);
INSERT INTO temp VALUES(20);
INSERT INTO temp VALUES(30);
INSERT INTO temp VALUES(40);
INSERT INTO temp VALUES(50);
INSERT INTO temp VALUES(60);
INSERT INTO temp select * from temp;
select * from temp;
spool off
prompt(16)
spool D:\ESCOM\bases\20_feb_18\Despliega_Triggers_activos.txt
PROMPT DESPLEGAR LOS TRIGGERS ACTIVOS
PROMPT ACTIVAR LOS TRIGGERS
PROMPT DESACTIVAR LOS TRIGGERS

CREATE OR REPLACE TRIGGER temp_aur
AFTER UPDATE ON TEMP
FOR EACH ROW
WHEN(NEW.N BETWEEN 1 AND 10)
BEGIN
DBMS_OUTPUT.PUT_LINE('EXECUTING temp_aur');
END;
/
drop table TEMP;
create table TEMP (N NUMBER, M NUMBER DEFAULT 5);
create or replace trigger temp_bur
before update on TEMP for each row
begin
dbms_output.put_line('BUR old N:'||:old.n||'M:'||:old.M);
dbms_output.put_line('BUR new N:'||:new.n||'M:'||:new.M);
END;
/

create or replace trigger temp_aur after update on temp 
for each row
BEGIN
dbms_output.put_line('AUR old N:'||:old.n||'M:'||:old.M);
dbms_output.put_line('AUR new N:'||:new.n||'M:'||:new.M);
END;
/
insert into TEMP (n) values (1);
update TEMP set n=n+1 where n>=1;

UPDATE TEMP SET m=2 WHERE M=5;
spool off