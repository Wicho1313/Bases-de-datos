spool G:\ESCOM\bases\15_feb_18_queries\q5.txt
PROMPT DESPLIEGA EMPLEADOS CON SALARIOS ENTRE 4000 Y 7000
COLUMN EMP_NO FORMAT 9999
COLUMN FIRST_NAME FORMAT A10
COLUMN APELLIDO FORMAT A12 JUS CENTER
COLUMN Jefe FORMAT 9999
COLUMN SALARY FORMAT $99,999.00
SELECT EMPLOYEE_ID EMP_NO, FIRST_NAME, LAST_NAME APELLIDO, MANAGER_ID "Jefe", SALARY
FROM EMPLOYEES
WHERE SALARY BETWWEEN 4000 AND 7000
ORDER BY 3;
spool off