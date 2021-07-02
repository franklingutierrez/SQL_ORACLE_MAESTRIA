/* =======================================
 \^o^/_______ EJERCICIO 1 ________\^o^/
======================================= */

/* CREATE TABLE PRUEBA (id INTEGER);

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
*/



/* =======================================
 \^o^/_______ EJERCICIO 2 ________\^o^/
======================================= */
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

  DBMS_OUTPUT.PUT_LINE('Numero de Empleado: '|| p_empnro ||' SUELDO: '|| p_salary||' Bonificación Resultante: '||(p_bonus));

 END;

END;
/
*/
/* --MODO DOS DEL EJERCICIO 2--------------------
SET SERVEROUTPUT ON
DECLARE
  p_empnro INTEGER := 100;
  p_salary EMPLOYEES.SALARY%type;
  p_bono NUMERIC(8,2) := 0;
BEGIN
  SELECT SALARY INTO p_salary FROM EMPLOYEES WHERE EMPLOYEE_ID = p_empnro;
  
  IF p_salary < 5000 THEN
      p_bono := 10/100;
  ELSIF p_salary >= 5000 AND p_salary <= 10000 THEN
      p_bono := 15/100;
    ELSIF p_salary > 10000 THEN
      p_bono := 20/100;
    ELSIF p_salary IS NULL THEN
      p_bono := 0;
    END IF;
    DBMS_OUTPUT.PUT_LINE ('BONIFICACIÓN =>'|| (p_salary * p_bono));
    
END;
*/


/* =======================================
 \^o^/_______ EJERCICIO 3 ________\^o^/
======================================= */

--Creando la tbala a partir de la tabla EMPLOYEES
/*
CREATE TABLE EMP AS select * from EMPLOYEES;

ALTER TABLE EMP ADD STARTS varchar2(50);
*/

-- =====================Segunda parte
/*
set serveroutput on
DECLARE
  p_numemp EMP.EMPLOYEE_ID%type:= 174;
  p_salary EMP.SALARY%type;
  v_asterisco EMP.STARTS%type:= NULL;
BEGIN
  SELECT SALARY INTO p_salary FROM EMP WHERE EMPLOYEE_ID = p_numemp;
  v_asterisco := LPAD('*', ROUND((p_salary / 1000),0),'*');
  UPDATE EMP SET STARTS = v_asterisco WHERE EMPLOYEE_ID = p_numemp;
  DBMS_OUTPUT.PUT_LINE ('RPTA =>'||v_asterisco);
END;
/
*/
--Consultando con un Select
--SELECT EMPLOYEE_ID, SALARY, STARTS FROM EMP WHERE EMPLOYEE_ID=184 OR EMPLOYEE_ID=174 OR EMPLOYEE_ID=176


/* =======================================
 \^o^/_______ EJERCICIO 4 ________\^o^/
======================================= */
SET SERVEROUTPUT ON

--DESCRIBE V$DATABASE;

--SELECT NAME, CREATED FROM V$DATABASE;

DECLARE 

v_pdb v$pdbs.NAME%type :='ORCLPDB';
v_date DATE;
v_date2 NUMERIC;
v_date3 DATE:=SYSDATE; --01-07-2021
BEGIN
  SELECT CREATION_TIME INTO v_date FROM v$pdbs WHERE NAME=v_pdb;
  v_date2 := (To_Date(v_date3, 'DD-MM-YYYY')- To_Date(v_date,'DD-MM-YYYY'));
  IF v_date 2 < 30 THEN
    DBMS_OUTPUT.PUT_LINE ('PDB CREADO ANTES DE 30 DIAS, ACT. TRANSCURRIO'||v_date2||'DIAS.')
  ELSE
    DBMS_OUTPUT.PUT_LINE ('PDB CREADO ANTES DE 30 DIAS, ACT. TRANSCURRIO'||v_date2||'DIAS.')
END
END