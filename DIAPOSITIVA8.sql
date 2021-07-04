/* =======================================
 \^o^/_______ EJERCICIO 1 ________\^o^/
======================================= */
DECLARE 
  JOBS1 JOBS%ROWTYPE; 
 BEGIN 
   SELECT * 
   INTO JOBS1 
   FROM jobs WHERE JOBS.job_id = 'IT_DBA';  
   DBMS_OUTPUT.PUT_LINE('JOB_ID: '||(JOBS1.JOB_ID)||' JOB_TITLE: '||JOBS1.JOB_TITLE||' MIN_SALARY: '||JOBS1.MIN_SALARY||' MAX_SALARY: '||JOBS1.MAX_SALARY); 
 END;  
END;
 
 /* =======================================
 \^o^/_______ EJERCICIO 2 ________\^o^/
======================================= */
 
CREATE OR REPLACE PROCEDURE QUERY_EMP( 
  p_emplid IN employees.employee_id%type, 
  p_sala OUT employees.salary%type, 
  p_job OUT employees.job_id%type)  
  IS 
BEGIN 
  SELECT salary, job_id 
  INTO p_sala, p_job 
  FROM employees 
  WHERE employee_id = p_emplid;   
END QUERY_EMP;   
 
SET SERVEROUTPUT ON 
DECLARE 
 v_salary NUMBER; 
 v_job VARCHAR2(15); 
BEGIN 
QUERY_EMP(120, v_salary, v_job); 
DBMS_OUTPUT.PUT_LINE('SALARIO: '||v_salary || '  JOB_ID: ' ||v_job); 
END;