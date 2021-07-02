/*
regla RTECAR 2.2
Página 72, capítulo 3 del libro Fundamentals...
*/

CLEAR SCREEN
REM ELIMINAR TODO EL EJERCICIO
Drop table EMPLEA;
Drop table electrodomestico;

REM Clase 27 de febrero de 2018
REM INICIO
create table EMPLEA(
nif integer CONSTRAINT NIF_PK primary key,
nombre varchar2(12),
apellidos varchar2(20),
nivel integer,
ocupacion varchar2(20)
);

	insert into EMPLEA Values (10,'Nancy','Devolio',6,'GERENTE');
	insert into EMPLEA Values (20,'Andrew','Fuller',1,'VENDEDOR');
	insert into EMPLEA Values (30,'Janet','Leverling',1,'VENDEDOR');
	insert into EMPLEA Values (40,'Margaret','Peacock',2,'CONTADOR');
	insert into EMPLEA Values (50,'Steven','Rodriguez',2,'PROGRAMADOR');
	insert into EMPLEA Values (60,'Rosy','BUchanan',3,'ANALISTA');
	insert into EMPLEA Values (70,'Mary','Sumaya',3,'CONTADOR');
	
select * from EMPLEA;

Drop table ELECTRODOMESTICO;
create table ELECTRODOMESTICO(
APARATO integer primary key,
MARCA varchar2(14),
MODELO varchar2(12),
nif integer);

	insert into ELECTRODOMESTICO Values (10001,'Radio sony','S223',60);
	insert into ELECTRODOMESTICO Values (20002,'TELE samsung','S50x20',50);
	insert into ELECTRODOMESTICO Values (30001,'tablet dell','venue8',70);
	insert into ELECTRODOMESTICO Values (40001,'monitor lanix','lx900t',40);
	insert into ELECTRODOMESTICO Values (50004,'Router syscom','WNRT617G',20);
	insert into ELECTRODOMESTICO Values (60005,'radio pionner','DEH-X65',30);
	insert into ELECTRODOMESTICO Values (70008,'Ipad mac','AIR2',10);

select * from ELECTRODOMESTICO;
	
prompt declara la llave foranea

	ALTER TABLE ELECTRODOMESTICO
	ADD CONSTRAINT FK_ELECTRO_RTCAR2_2 FOREIGN KEY (nif)
	REFERENCES EMPLEA (nif);

	select apellidos, marca, modelo
	from EMPLEA E,electrodomestico ED
	where E.nif = ED.nif;
	
DESC USER_CONSTRAINTS;

SELECT OWNER,TABLE_NAME,CONSTRAINT_NAME,CONSTRAINT_TYPE
	FROM USER_CONSTRAINTS;
REM FINAL