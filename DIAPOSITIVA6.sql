/*=======================================
 \^o^/_______ EJERCICIO 1 ________\^o^/
=======================================*/

/*CREATE TABLE PRUEBA (id INTEGER);

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
*/


/*=======================================
 \^o^/_______ EJERCICIO 2 ________\^o^/
=======================================*/
/*
SET SERVEROUTPUT ON

DECLARE

 p_empnro EMPLOYEES.EMPLOYEE_ID%TYPE;

 p_salary EMPLOYEES.SALARY%TYPE;

 p_bonus EMPLOYEES.SALARY%TYPE;

BEGIN

 p_empnro := 178;

 SELECT SALARY INTO p_salary

 FROM EMPLOYEES

 WHERE EMPLOYEES.EMPLOYEE_ID = p_empnro;

   

 BEGIN

  CASE

  WHEN p_salary<5000 THEN

   p_bonus:= (10*p_salary)/100;

  WHEN p_salary>=5000 AND p_salary<=10000 THEN

   p_bonus:= (15*p_salary)/100;

  WHEN p_salary>10000 THEN

   p_bonus:= (20*p_salary)/100;

  WHEN p_salary IS NULL THEN

   p_bonus:= 0;

  END CASE;

  DBMS_OUTPUT.PUT_LINE('Número de Empleado: '|| p_empnro ||' SUELDO: '|| p_salary||' Bonificación Resultante: '||(p_bonus));

 END;

END;
*/

SET SERVEROUTPUT ON
DECLARE
  p_empnro INTEGER := 100;
  p_salary EMPLOYEES.SALARY%type;
  p_bono NUMERIC(8)
BEGIN
END;
/
  
