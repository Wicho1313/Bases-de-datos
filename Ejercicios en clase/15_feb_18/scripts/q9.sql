spool G:\ESCOM\bases\15_feb_18_queries\q9.txt
PROMPT DESPLIEGA LOS ATRIBUTOS COUNTRY_ID, SU NOMBRE Y SU REGION
COLUMN COUNTRY_ID FORMAT A4
COLUMN COUNTRY_NAME FORMAT A14 WORD_WRAPPED
COLUMN REGION FORMAT 9999
SELECT COUNTRY_ID, COUNTRY_NAME, REGION_ID REGION
FROM COUNTRIES;
spool off