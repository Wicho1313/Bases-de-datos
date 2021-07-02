FROM student s, zipcode z
                *
ERROR at line 2:
ORA-00942: table or view does not exist 


SELECT s.last_name FROM student s, zipcode z
                                   *
ERROR at line 1:
ORA-00942: table or view does not exist 


SP2-0734: unknown command beginning "WHERE s.zi..." - rest of line ignored.
SP2-0734: unknown command beginning "ORDER BY s..." - rest of line ignored.
