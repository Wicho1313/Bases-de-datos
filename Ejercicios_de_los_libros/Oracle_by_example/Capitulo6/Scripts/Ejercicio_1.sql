Spool  "C:\Users\Acer\Desktop\Ejercicios\Oracle by example\Capitulo6\Salidas\Ejercicio 1.txt"

SELECT s.last_name, s.zip, z.state, z.city
FROM student s, zipcode z
WHERE s.zip = z.zip
ORDER BY s.zip;
spool off;