/*=======================================
 \^o^/_______ EJERCICIO 1 ________\^o^/
=======================================*/

CREATE TABLE PRUEBA (id INTEGER);

SET SERVEROUTPUT ON
DECLARE
BEGIN
  FOR ROW1 IN 1..10 LOOP
    IF ROW1 != 6 AND ROW1 != 8 THEN
      INSERT INTO PRUEBA(id) VALUES (ROW1);
      DBMS_OUTPUT.PUT_LINE ('Se inserto el # '||ROW1);
    END IF;
  END LOOP;
END;
/