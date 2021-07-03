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
/*
SET SERVEROUTPUT ON

--DESCRIBE V$DATABASE;

--SELECT NAME, CREATED FROM V$DATABASE;

DECLARE 

v_pdb v$pdbs.NAME%type :='ORCLPDB';
v_date DATE;
v_date2 NUMERIC;
v_date3 DATE:=SYSDATE; --'01-07-2021';
BEGIN
  SELECT CREATION_TIME INTO v_date FROM v$pdbs WHERE NAME=v_pdb;
  v_date2 := (To_Date(v_date3, 'DD-MM-YYYY')- To_Date(v_date,'DD-MM-YYYY'));
  IF v_date2 < 30 THEN
    DBMS_OUTPUT.PUT_LINE ('PDB CREADO ANTES DE 30 DIAS, ACT. TRANSCURRIO'||v_date2||'DIAS.');
  ELSE
    DBMS_OUTPUT.PUT_LINE ('PDB CREADO DESPUES DE 30 DIAS, ACT. TRANSCURRIO'||v_date2||'DIAS.');
END IF;
END;
/
*/

/* =======================================
 \^o^/_______ EJERCICIO 5 ________\^o^/
======================================= */
/*
SET SERVEROUTPUT ON

--SELECT * FROM DBA_OBJECTS;

DECLARE

 v_numobjs NUMBER;

BEGIN

 SELECT COUNT(*) INTO v_numobjs

 FROM DBA_OBJECTS;


 --DBMS_OUTPUT.PUT_LINE(v_numobjs);


 CASE

  WHEN v_numobjs>4000 THEN DBMS_OUTPUT.PUT_LINE('La cantidad de objetos de la tabla DBA_OBJECTS es mayor a 4000.');

  WHEN v_numobjs<=4000 AND v_numobjs>=2000 THEN DBMS_OUTPUT.PUT_LINE('La cantidad de objetos de la tabla DBA_OBJECTS se encuentra entre 2000 y 4000.');

  WHEN v_numobjs<2000 THEN DBMS_OUTPUT.PUT_LINE('La cantidad de objetos de la tabla DBA_OBJECTS es menor a 2000.');

 END CASE;

END;

*/



/* =======================================
 \^o^/_______ EJERCICIO 6 ________\^o^/
======================================= */
/*
SET SERVEROUTPUT ON

DECLARE 

 v_empleado EMPLOYEES%ROWTYPE;

 v_total NUMBER;

BEGIN  

 SELECT COUNT(*) INTO v_total

 FROM EMPLOYEES;
 

 FOR i IN 100..(v_total+99) LOOP  

  SELECT * INTO v_empleado  

  FROM EMPLOYEES

  WHERE EMPLOYEES.EMPLOYEE_ID = i;

   
  IF v_empleado.SALARY > 8000 THEN

   DBMS_OUTPUT.PUT_LINE('FIRST_NAME: '||v_empleado.FIRST_NAME||' - LAST_NAME: '||v_empleado.LAST_NAME||' - SALARY: '||v_empleado.SALARY);

  END IF;   

 END LOOP;

END;
*/


-------------OTRA FORMA
-- FORMATO CON CONDICION FOR

SET SERVEROUTPUT ON
DECLARE
  v_countrow INTEGER;
  v_first_name EMPLOYEES.FIRST_NAME%type;
  v_last_name EMPLOYEES.LAST_NAME%type;
  v_salary EMPLOYEES.SALARY%type;

BEGIN
  
  SELECT COUNT(EMPLOYEE_ID) INTO v_countrow FROM EMPLOYEES;
  
  FOR i IN 0..v_countrow-1 LOOP
    
    SELECT FIRST_NAME, LAST_NAME, SALARY INTO v_first_name, v_last_name, v_salary
    FROM EMPLOYEES OFFSET i ROWS FETCH NEXT 1 ROWS ONLY;
    
    IF v_salary > 8000 THEN
      DBMS_OUTPUT.PUT_LINE(v_first_name || ' - '||v_last_name|| ' - '||v_salary);
      END IF;
  END LOOP;

END;
/

-- FORMATO CON CONDICION WHILE
/*
SET SERVEROUTPUT ON
DECLARE
  v_countrow INTEGER;
  v_row INTEGER:=0;
  v_first_name EMPLOYEES.FIRST_NAME%type;
  v_last_name EMPLOYEES.LAST_NAME%type;
  v_salary EMPLOYEES.SALARY%type;

BEGIN
  
  SELECT COUNT(EMPLOYEE_ID) INTO v_countrow FROM EMPLOYEES;
  WHILE v_row < v_countrow LOOP
    
    SELECT FIRST_NAME, LAST_NAME, SALARY INTO v_first_name, v_last_name, v_salary
    FROM EMPLOYEES OFFSET v_row ROWS FETCH NEXT 1 ROWS ONLY;
    
    IF v_salary > 8000 THEN
      DBMS_OUTPUT.PUT_LINE(v_first_name || ' - '||v_last_name|| ' - '||v_salary);
      END IF;
      v_row:= v_row + 1;
  END LOOP;

END;
/
*/