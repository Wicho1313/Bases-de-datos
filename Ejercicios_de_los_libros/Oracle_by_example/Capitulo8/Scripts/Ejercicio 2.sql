Spool  D:\ESCOM\bases\Ejercicios_de_los_libros\Oracle_by_example\Capitulo8\Salidas\Ejercicio_2.txt

SELECT created_by, 'GRADE' AS SOURCE, 1 AS SORT_ORDER
FROM grade
UNION
SELECT created_by, 'GRADE_TYPE', 2
FROM grade_type
UNION
SELECT created_by, 'GRADE_CONVERSION', 3
FROM grade_conversion
UNION
SELECT created_by, 'ENROLLMENT', 4
FROM enrollment
ORDER BY 3;
spool off