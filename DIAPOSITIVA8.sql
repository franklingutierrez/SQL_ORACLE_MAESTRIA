/* =======================================
 \^o^/_______ EJERCICIO 1 ________\^o^/
======================================= */
/*
CREATE OR REPLACE PROCEDURE ADD_JOB
(p_id IN JOBS.JOB_ID%TYPE,
 p_name IN JOBS.JOB_TITLE%TYPE)

IS 

BEGIN

  INSERT INTO JOBS(JOB_ID,JOB_TITLE)
  VALUES
  (p_id, p_name);

END ADD_JOB;
/
BEGIN
 ADD_JOB('IT_DBA','Administrador de la BD');
COMMIT;
END;
/
SELECT * FROM JOBS WHERE JOB_ID='IT_DBA';
*/
 /* =======================================
 \^o^/_______ EJERCICIO 2 ________\^o^/
======================================= */
 
 CREATE OR REPLACE PROCEDURE QUERY_EMP

(p_id IN EMPLOYEES.EMPLOYEE_ID %TYPE,

 p_salary OUT EMPLOYEES.SALARY%TYPE,

 p_job_id OUT EMPLOYEES.JOB_ID%TYPE)

IS 

BEGIN

  SELECT SALARY, JOB_ID INTO p_salary, p_job_id

  FROM EMPLOYEES WHERE EMPLOYEE_ID = p_id;

END QUERY_EMP;

/

DECLARE

 p_salary EMPLOYEES.SALARY%TYPE;

 p_job_id EMPLOYEES.JOB_ID%TYPE;

BEGIN

 QUERY_EMP(120,p_salary,p_job_id);

 DBMS_OUTPUT.put_line('SALARY: '||p_salary||' JOB_ID: '||p_job_id);

END;
