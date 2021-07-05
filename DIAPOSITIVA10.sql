/* =======================================
 \^o^/_______ EJERCICIO 1 ________\^o^/
======================================= */
/*
SET SERVEROUTPUT ON

DECLARE 

  TYPE taa_departments IS TABLE OF

   VARCHAR(50)

   INDEX BY PLS_INTEGER;

  v_array taa_departments;

BEGIN

  v_array(1):='Amazonas';

  v_array(2):='Áncash';

  v_array(3):='Apurímac';

  v_array(4):='Arequipa';

  v_array(5):='Ayacucho';

  v_array(6):='Cajamarca';

  v_array(7):='Cusco';

  v_array(8):='Huancavelica';

  v_array(9):='Huánuco';

  v_array(10):='Ica';

  v_array(11):='Junín';

  v_array(12):='La Libertad';

  v_array(13):='Lambayeque';

  v_array(14):='Lima';

  v_array(15):='Loreto';

  v_array(16):='Madre de Dios';

  v_array(17):='Moquegua';

  v_array(18):='Pasco';

  v_array(19):='Piura';

  v_array(20):='Puno';

  v_array(21):='San Martín';

  v_array(22):='Tacna';

  v_array(23):='Tumbes';   

   

  DBMS_OUTPUT.PUT_LINE(v_array(23));

  DBMS_OUTPUT.PUT_LINE('Array asociativo de '||v_array.count||' elementos');

  v_array.DELETE(23);

  DBMS_OUTPUT.PUT_LINE('Array asociativo de '||v_array.count||' elementos');

  v_array(24) := 'Ucayali';

  DBMS_OUTPUT.PUT_LINE(v_array(24));

  DBMS_OUTPUT.PUT_LINE('Array asociativo de '||v_array.count||' elementos');

END;

*/


/* =======================================
 \^o^/_______ EJERCICIO 2 ________\^o^/
======================================= */
/*
SET SERVEROUTPUT ON

DECLARE

TYPE arra_names

IS

 TABLE OF VARCHAR(50) INDEX BY PLS_INTEGER;

 v_array arra_names;

BEGIN

 v_array(1):='Franklin';

 v_array(2):='Hiustong';

 v_array(3):='Consuelo';

 v_array(4):='Denny';

 v_array(5):='Laura';

 v_array(6):='Gabriel';

 FOR i IN 1..v_array.count

 LOOP

  dbms_output.put_line(v_array(i));

 END LOOP;

 dbms_output.put_line('Array asociativo de '||v_array.count||' elementos');

END;

*/

/* =======================================
 \^o^/_______ EJERCICIO 3 ________\^o^/
======================================= */
/*
CREATE TABLE XYZ
( 
 NOMBRE VARCHAR2(50),
 NOTA NUMBER
);

*/

BEGIN

 INSERT INTO XYZ(NOMBRE, NOTA) VALUES ('MAURICIO',3);

 INSERT INTO XYZ(NOMBRE, NOTA) VALUES ('FRANKLIN',19);

 INSERT INTO XYZ(NOMBRE, NOTA) VALUES ('ALEMBERT',8);

 INSERT INTO XYZ(NOMBRE, NOTA) VALUES ('ADELAIDA',10);

 INSERT INTO XYZ(NOMBRE, NOTA) VALUES ('ROCIO',12);

 INSERT INTO XYZ(NOMBRE, NOTA) VALUES ('UBER',13);

 INSERT INTO XYZ(NOMBRE, NOTA) VALUES ('CESAR',15);

 INSERT INTO XYZ(NOMBRE, NOTA) VALUES ('LIZARDO',18);

 INSERT INTO XYZ(NOMBRE, NOTA) VALUES ('WILLIAM',19);

 INSERT INTO XYZ(NOMBRE, NOTA) VALUES ('PABLO',11);

 INSERT INTO XYZ(NOMBRE, NOTA) VALUES ('DENY',14);

 INSERT INTO XYZ(NOMBRE, NOTA) VALUES ('GERSON',2);

END;

/



CREATE OR REPLACE TYPE notas AS VARRAY(5) OF VARCHAR2(1);

/

DECLARE

 n notas;

 CURSOR EST_CURSOR IS SELECT * FROM XYZ;

BEGIN

 n:=notas();

 n.extend(4);  

 

 FOR i IN EST_CURSOR LOOP

  CASE

   WHEN i.NOTA>0 AND i.NOTA<=5 THEN n(4):='D'; 

   WHEN i.NOTA>5 AND i.NOTA<=10 THEN n(3):='C';

   WHEN i.NOTA>10 AND i.NOTA<=15 THEN n(2):='B'; 

   WHEN i.NOTA>15 AND i.NOTA<=20 THEN n(1):='A';

  END CASE;

 END LOOP;

 DBMS_OUTPUT.PUT_LINE('------------------------------');

 DBMS_OUTPUT.PUT_LINE('MOSTRANDO LO INSERTADO EN EL VARRAY');

 DBMS_OUTPUT.PUT_LINE('------------------------------');

 FOR i IN 1..4 LOOP  

  DBMS_OUTPUT.PUT_LINE(n(i));

 END LOOP;

 DBMS_OUTPUT.PUT_LINE('------------------------------');

 DBMS_OUTPUT.PUT_LINE('MOSTRANDO ESTUDIANTES CON NOTAS Y LETRAS');

 DBMS_OUTPUT.PUT_LINE('------------------------------');

 BEGIN

  FOR i IN EST_CURSOR LOOP

   CASE

    WHEN i.NOTA>0 AND i.NOTA<=5 THEN DBMS_OUTPUT.PUT_LINE('NOMBRE: '||i.NOMBRE||' - NOTA: '|| i.NOTA||' - LETRA: '||n(4)); 

    WHEN i.NOTA>5 AND i.NOTA<=10 THEN DBMS_OUTPUT.PUT_LINE('NOMBRE: '||i.NOMBRE||' - NOTA: '|| i.NOTA||' - LETRA: '||n(3));

    WHEN i.NOTA>10 AND i.NOTA<=15 THEN DBMS_OUTPUT.PUT_LINE('NOMBRE: '||i.NOMBRE||' - NOTA: '|| i.NOTA||' - LETRA: '||n(2)); 

    WHEN i.NOTA>15 AND i.NOTA<=20 THEN DBMS_OUTPUT.PUT_LINE('NOMBRE: '||i.NOMBRE||' - NOTA: '|| i.NOTA||' - LETRA: '||n(1));

   END CASE;

  END LOOP;

 END;

END;