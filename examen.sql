---ELIMINAR TABLAS
/* DROP TABLE PEDIDO;
DROP TABLE DETALLE; */
--CONSULTA TABLAS
/* select table_name from user_tables order by table_name; */

--CREANDO TABLA PEDIDO-------------
/* CREATE TABLE PEDIDO(
	id_cliente NUMBER,
	orden NUMBER,
	fecha DATE
);
 */
--CREANDO TABLA DETALLE
/* CREATE TABLE DETALLE(
	id_producto NUMBER,
	cantidad NUMBER,
	precio NUMBER(10,2)
); */

--CREANDO LOS OBJETOS TIPOS

/* CREATE TABLE pedido 
(
  id_cliente  NUMBER(8),
  order NUMBER(8),
  detalle detalleOBJ
); */




----------OBJETO DETALLE------------
/* CREATE OR REPLACE TYPE DETALLEOBJ AS OBJECT(
	id_producto NUMBER,
	cantidad NUMBER,
	precio NUMBER(8,2)
); */
/
--CONSTRUCTOR FUNCTION DETALLEOBJ(id_producto NUMBER, cantidad NUMBER, precio NUMBER) RETURN SELF AS RESULT
---- CREACION DE TABLA PEDIDO ----
/* CREATE TABLE PEDIDO(
	id_cliente NUMBER,
	orden NUMBER,
	fecha DATE,
	detalle DETALLEOBJ
); */



---- INSERTANDO DATOS DE CUADRO ----

/* DECLARE
	detalletmp DETALLEOBJ;
BEGIN
	detalletmp := DETALLEOBJ(1,100,4);
	INSERT INTO PEDIDO VALUES(100,11, '22/08/2020',detalletmp);
	
	detalletmp := DETALLEOBJ(2,120,6);
	INSERT INTO PEDIDO VALUES(100,11, '22/08/2020',detalletmp);

	detalletmp := DETALLEOBJ(null,null,null);
	INSERT INTO PEDIDO VALUES(200,34, '17/09/2020',detalletmp);

	detalletmp := DETALLEOBJ(1,50,4);
	INSERT INTO PEDIDO VALUES(100,78, '24/11/2020',detalletmp);

END;
/ */


set serveroutput on;
declare
 cliente number:=207;
 orden number:=50;
 numero number;
 cantidad number:=10;
begin
  FOR i IN 1..20 LOOP
        INSERT INTO PEDIDO VALUES (cliente,orden,TO_DATE('2020/06/27', 'yyyy/mm/dd'), detalleOBJ(i,100,5));
        cliente := cliente + 1;
        orden := orden + 1;
      END LOOP;
end;