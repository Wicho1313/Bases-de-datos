spool D:\ESCOM\bases\21_feb_18\spools\creacion_de_packs.txt
CREATE OR REPLACE PACKAGE pkg
IS FUNCTION year number
RETURN INTEGER;
function deploy_fecha
return vaarchar2;
function deploy_fecha_2
return verchar2;
END;
/
REM CREA CUERPO DEL PACKAGE
CREATE OR REPLACE PACKAGE BODY pkg
IS 
BEGIN
c_year_number CONSTRAINT INTEGER:=2017;
c_deploy_fecha varchar2(20);
c_deploy_fecha_2 varchar2(35);
END;
/
FUNCTION year_number
RETURN INTEGER
IS
BEGIN 
RETURN c_year_number;
END;
/
FUNCTION deploy_fecha
RETURN varchar2
IS
BEGIN
c_deploy_fecha:=to_char(sysdate,'j');
RETURN c_deploy_fecha;
END;
/
FUNCTION deploy_fecha_2
return varchar2
IS
BEGIN
c_deploy_fecha_2:=to_char(sysdate,'DAY DD/MONTH/RRRR');
RETURN c_deploy_fecha_2;
END;
/
SELECT pkg.year_number
from dual;
select pkg.deploy_fecha
from dual;
select pkg.deploy_fecha_2
from dual;
spool off