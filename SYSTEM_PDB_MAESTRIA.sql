--CONSULTAS PARA USUARIOS
select * from ALL_USERS; --enlistar usuarios creados en el PDB

--CREACIÓN  Y ELIMINACION DE USUARIO
create user pepe identified by pepe container = current; -- CREANDO USUARIO LOCAL

grant creaate session to pepe;



--CONSULTAS PARA PDBS
select con_id, name from v$pdbs;

