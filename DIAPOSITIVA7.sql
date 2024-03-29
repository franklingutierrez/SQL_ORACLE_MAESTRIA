/* =======================================
 \^o^/_______ EJERCICIO 1 ________\^o^/
======================================= */
/*
SET SERVEROUTPUT ON

DECLARE

 J1 JOB_HISTORY%ROWTYPE;

CURSOR C1 IS SELECT * FROM JOB_HISTORY; 

BEGIN

 OPEN C1;

 LOOP

   FETCH C1 INTO J1;

   EXIT WHEN C1%NOTFOUND OR C1%ROWCOUNT>5;

   DBMS_OUTPUT.PUT_LINE('ID: '||J1.EMPLOYEE_ID||' FECHA INICIO: '||J1.START_DATE||' FECHA FIN: '||J1.END_DATE||' TRABAJO: '||J1.JOB_ID||' A�OS DE TRABAJO: '||FLOOR(MONTHS_BETWEEN(J1.END_DATE,J1.START_DATE) / 12));

 END LOOP;

 CLOSE C1;

END;

*/
/* =======================================
 \^o^/_______ EJERCICIO 2 ________\^o^/
======================================= */

--CREANDO TABLA TOP_DOGS
/*
CREATE TABLE TOP_DOGS (
Salary NUMBER(8,2)
);
*/
---------------------------------
--CREANDO BLOQUE PLSQL
SET SERVEROUTPUT ON

DECLARE

 CURSOR EMP_CURSOR(SAL NUMBER) IS SELECT * FROM EMPLOYEES WHERE SALARY > SAL;

 CURSOR EMPLSALARY_CURSOR(SAL NUMBER) IS SELECT DISTINCT(SALARY) FROM EMPLOYEES WHERE SALARY > SAL ORDER BY SALARY DESC;

 v_empl EMPLOYEES%ROWTYPE;

 v_empl_salary EMPLOYEES.SALARY%TYPE;

 v_temp_salary EMPLOYEES.SALARY%TYPE;

BEGIN

  v_temp_salary:=2000;--VALOR CUALQUIERA

  DBMS_OUTPUT.PUT_LINE('-------------------------------------------');

  DBMS_OUTPUT.PUT_LINE('EMPLEADOS CON SUELDOS ALTOS');

  DBMS_OUTPUT.PUT_LINE('-------------------------------------------');

  OPEN EMP_CURSOR(v_temp_salary);

  LOOP

    FETCH EMP_CURSOR INTO v_empl;     

    EXIT WHEN EMP_CURSOR%NOTFOUND;

     DBMS_OUTPUT.PUT_LINE('NOMBRE: '||v_empl.FIRST_NAME||', '||v_empl.LAST_NAME||' - SUELDO: '||v_empl.SALARY);  

  END LOOP;  

  DBMS_OUTPUT.PUT_LINE('CANTIDAD DE EMPLEADOS CON SUELDOS ALTOS: '||EMP_CURSOR%ROWCOUNT);

  CLOSE EMP_CURSOR; 

  DBMS_OUTPUT.PUT_LINE('-------------------------------------------');

  DBMS_OUTPUT.PUT_LINE('ALMACENAR EN LA TABLA TOP_DOGS');

  DBMS_OUTPUT.PUT_LINE('-------------------------------------------');

  OPEN EMPLSALARY_CURSOR(v_temp_salary);

  LOOP

    FETCH EMPLSALARY_CURSOR INTO v_empl_salary;     

    EXIT WHEN EMPLSALARY_CURSOR%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE(v_empl_salary);

     INSERT INTO TOP_DOGS(Salary)

     VALUES

     (v_empl_salary);

     COMMIT;

  END LOOP;  

  DBMS_OUTPUT.PUT_LINE('CANTIDAD DE REGISTROS INSERTADOS: '||EMPLSALARY_CURSOR%ROWCOUNT);

  CLOSE EMPLSALARY_CURSOR;
END;

