spool G:\ESCOM\bases\13_feb_18\spool\cambiar_fecha.txt

column parameter format a25
column value format a40 wrapped;
set space 7;

select parameter, value 
from nls_session_parameters;

select sysdate 
from dual;

alter session set NLS_DATE_FORMAT="DAY DD-MONTH-YYYY";

SELECT sysdate from dual;

alter session set NLS_LANGUAGE='ENGLISH';

SELECT sysdate from dual;

alter session set NLS_LANGUAGE='FRENCH';

SELECT sysdate from dual;

alter session set NLS_LANGUAGE='SPANISH';

select sysdate from dual;

DEFINE GNAME=Luis
set sqlprompt'&GNAME>'
REM DESPLEGAR VARIAS FEHAS
SELECT TO_CHAR(SYSDATE,'J')FROM DUAL;
SELECT TO_CHAR(TO_DATE('30-03-14'),'J') FROM DUAL;
SELECT TO_CHAR(SYSTIMESTAMP, 'J') FROM DUAL;
SELECT SYSTIMESTAMP FROM DUAL;
SELECT SYSDATE, SYSTIMESTAMP FROM DUAL;
SET sqlprompt'SQL>'
clear columns
column fecha1 format a20;
column fecha2 format a32;
select sysdate feha1, systimestamp fecha2 from dual;
REM el 1 de enero del año 4712 ac
select to_char(to_date('1-ene-4712 12:00 pm','dd-Mon-syyyy hh:mi am'),'j')
from dual;
REM el 1 de enero del año 1 de nuestra era
select to_char(to_date('1-ene-1 12:00 pm','dd-Mon-syyyy hh:mi am'),'j')
from dual;
REM el 12 de feb de 2018
select to_char(to_date('12-feb-2018 7:00 am','dd-Mon-yyyy hh:mi am'),'j')
from dual;
REM Los dias recortados por gregorio VII
select to_char(to_date('04-oct-1582 3:50 pm','dd-Mon-yyyy hh:mi am'),'j')
from dual;
REM Los dias recortados por gregorio VII
select to_char(to_date('10-oct-1582 3:50 pm','dd-Mon-yyyy hh:mi am'),'j')
from dual;
REM Los dias recortados por gregorio VII
select to_char(to_date('15-oct-1582 3:50 pm','dd-Mon-yyyy hh:mi am'),'j')
from dual;

REM encontrar diferencia entre fehas
select to_char(to_date('12-feb-2018 7:00 am','dd-Mon-yyyy hh:mi am'),'j')FECHA1,
       to_char(to_date('29-ene-2018 7:00 am','dd-Mon-yyyy hh:mi am'),'j')FECHA2,
       (to_date('12-feb-2018 7:00 am','dd-Mon-yyyy hh:mi am')-
       to_date('29-ene-2018 7:00 am','dd-Mon-yyyy hh:mi am')) "Dias|Transcurridos"
from dual;
spool off