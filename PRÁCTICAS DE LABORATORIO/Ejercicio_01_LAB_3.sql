CAP 6 SQL BY EXAMPLE página 326	
	Pasos: 
	1.Conectarse con "sysdba".
		connect as sysdba;
		......
		......
	2.Crear el usuario temporal.
		CREATE USER student IDENTIFIED by learn
		DEFAULT TABLESPACE users
		TEMPORARY TABLESPACE temp;
	3.Darle atributos e ese usuario.
		GRANT CONNECT, RESOURCE TO student;
	4.Conectarse con ese usuario.
	5.Alterar el idioma.
		alter session set nls_date_LANGUAGE='ENGLISH';
	6.Instalar la Base de Datos
		@@ DIRECCION_DE_LA_CARPETA/NOMBRE_DEL_ARCHIVO.SQL
			Ejemplo: @@ G:\BDD\O11\createStudent.sql
	
	CLEAR SCREEN
	REM 6/marzo/2017
	REM INICIO
	rem configura salida
	SET PAGESIZE 99
	set LINESIZE 150
	SET COLSEP '||'
	SET UNDERLINE'='
	--
	COLUMN COURSE_NO FORMAT 999
	COLUMN SECTION_NO FORMAT 999
	COLUMN DESCRIPTION FORMAT A30
	COLUMN SALON FORMAT A7
	COLUMN INSTRUCTOR_ID FORMAT 9999
	SELECT course.course_no, section_no, description,
	Location SALON, instructor_id
	FROM course, section
	WHERE course.course_no = section.course_no;
	--
	REM ESPECIFICAR ALIAS A NOMBRES DE TABLAS
	REM
	SELECT c.course_no,s.section_no,c.description,
			s.location,s.instructor_id
			FROM course c,section s
			where c.course_no=s.course_no
			AND ROWNUM <= 25;
	--
	REM OPERADOR LIKE
	--
	SELECT c.course_no,s.section_no,c.description,
				s.location,s.instructor_id
				FROM course c,section s
				WHERE c.course_no=s.course_no
				AND c.description LIKE 'Intro to%';
	--
	REM NULL
	SELECT instructor_id, zip, last_name, first_name
	FROM instructor
	WHERE zip IS NULL;
	--
	PROMPT EL INSTRUCTOR WILLING NO APARECE POR NO TENER EL CODIGO POSTAL
	SELECT i.instructor_id, i.zip, i.last_name, i.first_name
	FROM instructor i, zipcode z
	WHERE i.zip = z.zip;
	--
	PROMPT JOIN USING(COURSE)
	SELECT course_no, s.section_no, c.description,
	s.location, s.instructor_id
	FROM course c JOIN section s
	USING (course_no);
	--
	PROMPT ON CONDITION EN EL JOIN
	SELECT c.course_no, s.section_no, c.description,
	s.location, s.instructor_id
	FROM course c JOIN section s
	ON (c.course_no=s.course_no);
	--
	PROMPT DESPLEGAR SOLO LAS 20 PRIMERAS TUPLAS
	SELECT c.course_no,s.section_no,c.description,
	s.location,s.instructor_id
	FROM course c JOIN section s
	ON (c.course_no=s.course_no
	AND ROWNUM <=20);
	--
	PROMPT SEPARANDO LA CONDICION DE FILTRADO DE LA CONDICION DE JOIN DE
	SELECT c.course_no, s.section_no, c.description,
	s.location, s.instructor_id
	FROM course c JOIN section s
	ON (c.course_no=s.course_no)
	WHERE description LIKE 'B%';
	--
	PROMPT PRODUCTO CARTESIANO 10X78=780
	SELECT COUNT(*)
		FROM section;
	Select COUNT(*)
		FROM instructor;
	SELECT COUNT(*)
		FROM section,instructor;
	--
	PROMPT The ANSI standard Cross-Join
	--
	SELECT COUNT(*)
		FROM section CROSS JOIN instructor;
	PROMPT CLAUSURA ORDER BY
	--
	SELECT s.last_name, s.zip, z.state,z.city
	FROM students s, zipcode zip
	WHERE s.zip = z.zip
	ORDER BY s.zip;
	PROMPT FORMATO ANSI
	SELECT s.last_name, s.zip, z.state, z.city
	FROM student s JOIN zipcode z
	ON(s.zip 0 z.zip)
	ORDER BY s.zip;
	--
	PROMPT
	SLECT s.last_name,zip,z.state, z.city
	FROM student s JOIN zipcode z
	USING (zip)
	ORDER BY zip;
	
	PROMPT However,if you are not interesed u¿in the
	PROMPT SECTION_ID 
	PROMPT and you want to only list
	PROMT the names without
	PROMT the duplication, use DISTINCT in the SELECT
	PROMT statement
	
	SELECT DISTINCT s.first_name, s.last_name,s.student_id
	FROM student s, enrollement e
	WHERE s.student_id = e.student_id
	order by s.last_name;
	
	PROMPT CON PRERREQUISITO NULL
	
	COLUMN REQUISITO FORMAT A15
	
	SELECT c.course_no, c.description, s.section_no,
	NVL(TO_CHAR(c.PREREQUISITE),'Sin Requisito')
								REQUISITO
	FROM course.c,section s
	WHERE c.course_no = s.course_no
	AND c.prerequisite IS NULL
	ORDER BY c.course_no,s.section_no;
	--
	PROMPT T he ANSI join distinguishes the join condition
	PROMPT from the filtering criteria.
	SELECT c.course_no,c.description, s.section_no
	FROM course c JOIN section s
	ON (c.course_no = s.course_no)
	WHERE c.prerequisite IS NULL
	ORDER BY c.course_no, section_no;
	REM FINAL
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	






