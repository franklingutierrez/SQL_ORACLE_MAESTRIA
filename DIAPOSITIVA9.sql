/* =======================================
 \^o^/_______ EJERCICIO 1 ________\^o^/
======================================= */

CREATE OR REPLACE FUNCTION Q_JOB(

  J_ID IN JOBS.JOB_ID%TYPE

)

RETURN VARCHAR2

IS

 v_puesto_trab JOBS.JOB_TITLE%TYPE:='';

BEGIN

  SELECT JOB_TITLE INTO v_puesto_trab FROM JOBS 

  WHERE 

  JOB_ID = J_ID;

  RETURN v_puesto_trab;

EXCEPTION

  WHEN NO_DATA_FOUND THEN

    DBMS_OUTPUT.PUT_line('NO EXISTE EL PUESTO DE TRABAJO');

END Q_JOB;

/

SET SERVEROUTPUT ON

DECLARE

 G_TITLE JOBS.JOB_TITLE%TYPE;

 J_ID JOBS.JOB_ID%TYPE;

BEGIN

 J_ID:='SA_REP';

 G_TITLE:=Q_JOB(J_ID);

 DBMS_OUTPUT.PUT_LINE('ID TRABAJO: '||J_ID||' - NOMBRE DEL PUESTO DE TRABAJO: '||G_TITLE);

END;

/* =======================================
 \^o^/_______ EJERCICIO 2 ________\^o^/
======================================= */
/*
CREATE OR REPLACE FUNCTION ANNUAL_COMP(

  SUELDO IN EMPLOYEES.SALARY%TYPE:=0,

  P_COMISION IN EMPLOYEES.COMMISSION_PCT%TYPE:=0

)

RETURN NUMBER

IS

 v_anual_compensation EMPLOYEES.SALARY%TYPE:='';

BEGIN

  v_anual_compensation:=(SUELDO*12)+(P_COMISION*SUELDO*12);

  RETURN v_anual_compensation;

END ANNUAL_COMP;

/
*/
--=========================Hacer la consulta
--SELECT EMPLOYEE_ID, LAST_NAME,ANNUAL_COMP(SALARY,COMMISSION_PCT) FROM EMPLOYEES WHERE DEPARTMENT_ID = 80;