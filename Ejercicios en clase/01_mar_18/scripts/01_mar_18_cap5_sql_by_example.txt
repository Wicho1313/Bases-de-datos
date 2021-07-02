spool G:\ESCOM\bases\01_mar_18\cap5_sql_by_example.txt          
REM COUNT AND NULLS
SELECT COUNT(final_grade),COUNT(section_id),
COUNT(*)
FROM enrollment;

REM COUNT DISTINCT
SELECT COUNT(DISTINCT section_id),
COUNT(section_id)
FROM enrollment;

select AVG(capacity), AVG(NVL(capacity,0))
from section;

rem function min max
select MIN(capacity),Max(capacity)
from section;

prompt min max con otros tipos de datos
select MIN(registration_date) "First",
MAX(registration_date) "Last"
from student;
select MIN(description) AS MIN
MAX (description) AS MAX
FROM course;

select AVG(
CASE WHEN prerequisite IS NOT NULL THEN cost*1.1
WHEN prerequisite=20 THEN cost*1.2
ELSE cost
END) AS PROMEDIO;

SELECT COOUNT(*)
FROM course
WHERE prerequisite IS NULL COUNT(*);

select count(distinct student_id)
FROM enrollment;

SELECT NVL (MAX(modified_date),TO_DATE('12-MAR-2005','DD-MON-YYYY'))
FROM enrollment;

SELECT location
from section
group by location;

select location, count(*),
SUM(capacity) AS sum,
MIN(capacity) AS min,
MAX(capacity) AS max
from section
group by location;

select location, capacity, section_id
from section
where location='L211';

SELECT location, instructor_id, count(*), SUM(apacity) AS sum,MIN(capacity) AS min,
MAX(capacity) AS max
from section
grooup by location, instructor_id;

select location, instructor_id,capacity, section_id
from section
where location='L210'
ORDER BY 1,2;

SELECT location "location", instructor_id, count(location) "total locations", SUM(capacity) "total capacity"
from section
group by location, instructor_id
order by "total capacity" desc;

rem clausula having
select location "location", instructor_id, count(location) "total locations" SUM(capacity) "total capacity"
from section
group by location, instructor_id
HAVING SUM(capaity)>50
order by "total capacity" desc;

prompt clausula where y having
select location "location", instructor_id, count(location) "total locations" SUM(capacity) "total capacity"
from section
where section_no IN(2,3)
GROUP BY location, instructor_id
HAVING SUM(capacity)>50;

rem funciones de agregacion anidadas
select MAX(COUNT(*))
FROM enrollment
group by section_id;

select prerequisite, count(*)
from course
group by prerequisite
order by prerequisite;

rem nulls first
select prerequisite, count(*)
from course
group by prerequisite
order by prerequisite NULLS FIRST;

SELECT student_id, COUNT(*)
FROM enrollment
group by student_id
HAVING COUNT(*)>2;

SELECT course_no "course #",
AVG(capacity) "AVG.Capacity",
ROUND(AVG(capacity)) "Rounded AVG. CAPACITY"
FROM section
group by course_no;


SELECT course_no "course #",
AVG(capacity) "AVG.Capacity",
ROUND(AVG(capacity)) "Rounded AVG. CAPACITY"
FROM section
group by course_no;
HAVING COUNT(*)=2;
spool off