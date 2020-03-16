--DROP TABLAS

DROP TABLE alumnos CASCADE CONSTRAINTS;
DROP TABLE ar CASCADE CONSTRAINTS;
DROP TABLE at CASCADE CONSTRAINTS;
DROP TABLE curso CASCADE CONSTRAINTS;
DROP TABLE pregunta CASCADE CONSTRAINTS;
DROP TABLE programa CASCADE CONSTRAINTS;
DROP TABLE respuestas CASCADE CONSTRAINTS;
DROP TABLE test CASCADE CONSTRAINTS;

--CREACION TABLAS

CREATE TABLE alumnos (
    alumno_id        INTEGER NOT NULL,
    alumno_nombre    VARCHAR2(20),
    alumno_curso_id  INTEGER NOT NULL
);

ALTER TABLE alumnos ADD CONSTRAINT alumnos_pk PRIMARY KEY ( alumno_id );

CREATE TABLE ar (
    ar_respuesta_id  INTEGER NOT NULL,
    ar_at_id         INTEGER NOT NULL
);

CREATE TABLE at (
    at_id         INTEGER NOT NULL,
    at_alumno_id  INTEGER NOT NULL,
    at_test_id    INTEGER NOT NULL
);

ALTER TABLE at ADD CONSTRAINT alumno_test_pk PRIMARY KEY ( at_id );

CREATE TABLE curso (
    curso_id           INTEGER NOT NULL,
    curso_nombre       VARCHAR2(20),
    curso_programa_id  INTEGER NOT NULL
);

ALTER TABLE curso ADD CONSTRAINT curso_pk PRIMARY KEY ( curso_id );

CREATE TABLE pregunta (
    pregunta_id         INTEGER NOT NULL,
    pregunta_enunciado  VARCHAR2(30),
    pregunta_puntaje    INTEGER,
    pregunta_test_id    INTEGER NOT NULL
);

ALTER TABLE pregunta ADD CONSTRAINT pregunta_pk PRIMARY KEY ( pregunta_id );

CREATE TABLE programa (
    programa_id      INTEGER NOT NULL,
    programa_nombre  VARCHAR2(20)
);

ALTER TABLE programa ADD CONSTRAINT programa_pk PRIMARY KEY ( programa_id );

CREATE TABLE respuestas (
    respuesta_id           INTEGER NOT NULL,
    respuesta_descripcion  VARCHAR2(20),
    respuesta_boolean      CHAR(1),
    respuesta_porcentaje   INTEGER,
    respuesta_pregunta_id  INTEGER NOT NULL
);

ALTER TABLE respuestas ADD CONSTRAINT respuestas_pk PRIMARY KEY ( respuesta_id );

CREATE TABLE test (
    test_id           INTEGER NOT NULL,
    test_nombre       VARCHAR2(20),
    test_descripcion  VARCHAR2(20),
    test_autor        VARCHAR2(20),
    test_unidad       VARCHAR2(20)
);

ALTER TABLE test ADD CONSTRAINT test_pk PRIMARY KEY ( test_id );

ALTER TABLE alumnos
    ADD CONSTRAINT alumnos_curso_fk FOREIGN KEY ( alumno_curso_id )
        REFERENCES curso ( curso_id );

ALTER TABLE ar
    ADD CONSTRAINT ar_at_fk FOREIGN KEY ( ar_at_id )
        REFERENCES at ( at_id );

ALTER TABLE ar
    ADD CONSTRAINT ar_respuestas_fk FOREIGN KEY ( ar_respuesta_id )
        REFERENCES respuestas ( respuesta_id );

ALTER TABLE at
    ADD CONSTRAINT at_alumnos_fk FOREIGN KEY ( at_alumno_id )
        REFERENCES alumnos ( alumno_id );

ALTER TABLE at
    ADD CONSTRAINT at_test_fk FOREIGN KEY ( at_test_id )
        REFERENCES test ( test_id );

ALTER TABLE curso
    ADD CONSTRAINT curso_programa_fk FOREIGN KEY ( curso_programa_id )
        REFERENCES programa ( programa_id );

ALTER TABLE pregunta
    ADD CONSTRAINT pregunta_test_fk FOREIGN KEY ( pregunta_test_id )
        REFERENCES test ( test_id );

ALTER TABLE respuestas
    ADD CONSTRAINT respuestas_pregunta_fk FOREIGN KEY ( respuesta_pregunta_id )
        REFERENCES pregunta ( pregunta_id );


--AGREGAR DATOS


--PROGRAMA
--programa de java
insert into programa (programa_id, programa_nombre) values (1,'java');
--programa de java
insert into programa (programa_id, programa_nombre) values (2,'android ');

--CURSOS
--curso de viña , programa java
insert into curso (curso_id, curso_nombre,curso_programa_id) values (1,'viña',1);
--curso de santiago , programa java
insert into curso (curso_id, curso_nombre,curso_programa_id) values (2,'santiago',1);
--curso de santiago, programa android
insert into curso (curso_id, curso_nombre,curso_programa_id) values (3,'santiago',2);

--ALUMNOS
--alumnos registrados en curso de VIÑA(1) y programa JAVA(1)
insert into alumnos (alumno_id, alumno_nombre, alumno_curso_id) values (1,'juan',1);
insert into alumnos (alumno_id, alumno_nombre, alumno_curso_id) values (3,'rosa',1);
insert into alumnos (alumno_id, alumno_nombre, alumno_curso_id) values (4,'pedro',1);
insert into alumnos (alumno_id, alumno_nombre, alumno_curso_id) values (5,'esteban',1);
insert into alumnos (alumno_id, alumno_nombre, alumno_curso_id) values (6,'julio',1);
insert into alumnos (alumno_id, alumno_nombre, alumno_curso_id) values (7,'cesar',1);
insert into alumnos (alumno_id, alumno_nombre, alumno_curso_id) values (8,'rosa',1);
insert into alumnos (alumno_id, alumno_nombre, alumno_curso_id) values (9,'pepa',1);
insert into alumnos (alumno_id, alumno_nombre, alumno_curso_id) values (10,'jaime',1);
insert into alumnos (alumno_id, alumno_nombre, alumno_curso_id) values (11,'joss',1);
--alumnos registrados en curso de SANTIAGO(2) y programa JAVA(1)
insert into alumnos (alumno_id, alumno_nombre, alumno_curso_id) values (2,'ana',2);
insert into alumnos (alumno_id, alumno_nombre, alumno_curso_id) values (12,'paola',2);
insert into alumnos (alumno_id, alumno_nombre, alumno_curso_id) values (13,'susana',2);
insert into alumnos (alumno_id, alumno_nombre, alumno_curso_id) values (14,'xica',2);
insert into alumnos (alumno_id, alumno_nombre, alumno_curso_id) values (15,'tati',2);
insert into alumnos (alumno_id, alumno_nombre, alumno_curso_id) values (16,'tusa',2);
insert into alumnos (alumno_id, alumno_nombre, alumno_curso_id) values (17,'anibal',2);
insert into alumnos (alumno_id, alumno_nombre, alumno_curso_id) values (18,'omar',2);
insert into alumnos (alumno_id, alumno_nombre, alumno_curso_id) values (19,'osiris',2);
insert into alumnos (alumno_id, alumno_nombre, alumno_curso_id) values (20,'cleopatra',2);
--alumnos registrados en curso de SANTIAGO(3) y programa ANDROID(2)
insert into alumnos (alumno_id, alumno_nombre, alumno_curso_id) values (21,'tomas',3);
insert into alumnos (alumno_id, alumno_nombre, alumno_curso_id) values (22,'raul',3);
insert into alumnos (alumno_id, alumno_nombre, alumno_curso_id) values (23,'alda',3);
insert into alumnos (alumno_id, alumno_nombre, alumno_curso_id) values (24,'eugenia',3);

--TEST
--test java (modulo 1)
insert into test (test_id, test_nombre, test_descripcion, test_autor, test_unidad) 
values (11,'java','seleccion multiple', 'jacob', 'unidad 1');
--test java (modulo 2)
insert into test (test_id, test_nombre, test_descripcion, test_autor, test_unidad) 
values (22,'java','seleccion multiple', 'jacob', 'unidad 2');
--base de datos (modulo1)
insert into test (test_id, test_nombre, test_descripcion, test_autor, test_unidad) 
values (33,'base de datos','seleccion multiple', 'jacob', 'unidad 1');
--test paiton sin pregunta(modulo 2)
insert into test (test_id, test_nombre, test_descripcion, test_autor, test_unidad)
values (44,'Paiton','seleccion multiple', 'Fernando', 'unidad 4');

--AT
--alumnos que rindieron el test 22
insert into at (at_id, at_alumno_id, at_test_id) values (3,1,22);
insert into at (at_id, at_alumno_id, at_test_id) values (4,2,22);
insert into at (at_id, at_alumno_id, at_test_id) values (5,3,22);
insert into at (at_id, at_alumno_id, at_test_id) values (6,4,22);
insert into at (at_id, at_alumno_id, at_test_id) values (7,5,22);
insert into at (at_id, at_alumno_id, at_test_id) values (8,6,22);
insert into at (at_id, at_alumno_id, at_test_id) values (9,7,22);
insert into at (at_id, at_alumno_id, at_test_id) values (10,8,22);
insert into at (at_id, at_alumno_id, at_test_id) values (11,9,22);
insert into at (at_id, at_alumno_id, at_test_id) values (12,10,22);
insert into at (at_id, at_alumno_id, at_test_id) values (13,11,22);
insert into at (at_id, at_alumno_id, at_test_id) values (14,12,22);
insert into at (at_id, at_alumno_id, at_test_id) values (15,13,22);
insert into at (at_id, at_alumno_id, at_test_id) values (16,14,22);
insert into at (at_id, at_alumno_id, at_test_id) values (17,15,22);
insert into at (at_id, at_alumno_id, at_test_id) values (18,16,22);
insert into at (at_id, at_alumno_id, at_test_id) values (19,17,22);
insert into at (at_id, at_alumno_id, at_test_id) values (20,18,22);
insert into at (at_id, at_alumno_id, at_test_id) values (21,19,22);
insert into at (at_id, at_alumno_id, at_test_id) values (22,20,22);
--alumnos que rindieron el test 33
insert into at (at_id, at_alumno_id, at_test_id) values (23,1,33);
insert into at (at_id, at_alumno_id, at_test_id) values (24,2,33);
insert into at (at_id, at_alumno_id, at_test_id) values (25,3,33);
insert into at (at_id, at_alumno_id, at_test_id) values (26,4,33);
insert into at (at_id, at_alumno_id, at_test_id) values (27,5,33);
insert into at (at_id, at_alumno_id, at_test_id) values (28,6,33);
insert into at (at_id, at_alumno_id, at_test_id) values (29,7,33);
insert into at (at_id, at_alumno_id, at_test_id) values (30,8,33);
insert into at (at_id, at_alumno_id, at_test_id) values (31,9,33);
insert into at (at_id, at_alumno_id, at_test_id) values (32,10,33);
insert into at (at_id, at_alumno_id, at_test_id) values (33,11,33);
insert into at (at_id, at_alumno_id, at_test_id) values (34,12,33);
insert into at (at_id, at_alumno_id, at_test_id) values (35,13,33);
insert into at (at_id, at_alumno_id, at_test_id) values (36,14,33);
insert into at (at_id, at_alumno_id, at_test_id) values (37,15,33);
insert into at (at_id, at_alumno_id, at_test_id) values (38,16,33);
insert into at (at_id, at_alumno_id, at_test_id) values (39,17,33);
insert into at (at_id, at_alumno_id, at_test_id) values (40,18,33);
insert into at (at_id, at_alumno_id, at_test_id) values (41,19,33);
insert into at (at_id, at_alumno_id, at_test_id) values (42,20,33);

--PREGUNTAS
--preguntas del test 11
insert into pregunta (pregunta_id, pregunta_enunciado, pregunta_puntaje, pregunta_test_id) 
values (1 , 'pregunta1 test11', 1, 11);
insert into pregunta (pregunta_id, pregunta_enunciado, pregunta_puntaje, pregunta_test_id) 
values (2 , 'pregunta2 test11', 1, 11);
insert into pregunta (pregunta_id, pregunta_enunciado, pregunta_puntaje, pregunta_test_id) 
values (3 , 'pregunta3 test11', 1, 11);
insert into pregunta (pregunta_id, pregunta_enunciado, pregunta_puntaje, pregunta_test_id) 
values (4 , 'pregunta4 test11', 1, 11);
insert into pregunta (pregunta_id, pregunta_enunciado, pregunta_puntaje, pregunta_test_id) 
values (5 , 'pregunta5 test11', 1, 11);
insert into pregunta (pregunta_id, pregunta_enunciado, pregunta_puntaje, pregunta_test_id) 
values (6 , 'pregunta6 test11', 1, 11);
insert into pregunta (pregunta_id, pregunta_enunciado, pregunta_puntaje, pregunta_test_id) 
values (7 , 'pregunta7 test11', 1, 11);
--preguntas del test 22
insert into pregunta (pregunta_id, pregunta_enunciado, pregunta_puntaje, pregunta_test_id) 
values (11 , 'pregunta1 test22', 1, 22);
insert into pregunta (pregunta_id, pregunta_enunciado, pregunta_puntaje, pregunta_test_id) 
values (12 , 'pregunta2 test22', 1, 22);
insert into pregunta (pregunta_id, pregunta_enunciado, pregunta_puntaje, pregunta_test_id) 
values (13 , 'pregunta3 test22', 1, 22);
insert into pregunta (pregunta_id, pregunta_enunciado, pregunta_puntaje, pregunta_test_id) 
values (14 , 'pregunta4 test22', 1, 22);
insert into pregunta (pregunta_id, pregunta_enunciado, pregunta_puntaje, pregunta_test_id) 
values (15 , 'pregunta5 test22', 1, 22);
insert into pregunta (pregunta_id, pregunta_enunciado, pregunta_puntaje, pregunta_test_id) 
values (16 , 'pregunta6 test22', 1, 22);
insert into pregunta (pregunta_id, pregunta_enunciado, pregunta_puntaje, pregunta_test_id) 
values (17 , 'pregunta7 test22', 1, 22);
insert into pregunta (pregunta_id, pregunta_enunciado, pregunta_puntaje, pregunta_test_id) 
values (18 , 'pregunta8 test22', 1, 22);
insert into pregunta (pregunta_id, pregunta_enunciado, pregunta_puntaje, pregunta_test_id) 
values (19 , 'pregunta9 test22', 1, 22);
insert into pregunta (pregunta_id, pregunta_enunciado, pregunta_puntaje, pregunta_test_id) 
values (20 , 'pregunta10 test22', 1, 22);
--preguntas del test 33
insert into pregunta (pregunta_id, pregunta_enunciado, pregunta_puntaje, pregunta_test_id) 
values (21 , 'pregunta1 test33', 1, 33);
insert into pregunta (pregunta_id, pregunta_enunciado, pregunta_puntaje, pregunta_test_id) 
values (22 , 'pregunta2 test33', 1, 33);
insert into pregunta (pregunta_id, pregunta_enunciado, pregunta_puntaje, pregunta_test_id) 
values (23 , 'pregunta3 test33', 1, 33);
insert into pregunta (pregunta_id, pregunta_enunciado, pregunta_puntaje, pregunta_test_id) 
values (24 , 'pregunta4 test33', 1, 33);
insert into pregunta (pregunta_id, pregunta_enunciado, pregunta_puntaje, pregunta_test_id) 
values (25 , 'pregunta5 test33', 1, 33);
insert into pregunta (pregunta_id, pregunta_enunciado, pregunta_puntaje, pregunta_test_id) 
values (26 , 'pregunta6 test33', 1, 33);
insert into pregunta (pregunta_id, pregunta_enunciado, pregunta_puntaje, pregunta_test_id) 
values (27 , 'pregunta7 test33', 1, 33);
insert into pregunta (pregunta_id, pregunta_enunciado, pregunta_puntaje, pregunta_test_id) 
values (28 , 'pregunta8 test33', 1, 33);
insert into pregunta (pregunta_id, pregunta_enunciado, pregunta_puntaje, pregunta_test_id) 
values (29 , 'pregunta9 test33', 1, 33);
insert into pregunta (pregunta_id, pregunta_enunciado, pregunta_puntaje, pregunta_test_id) 
values (30 , 'pregunta10 test33', 1, 33);

--RESPUESTAS

--TEST 11
--respuestas a la pregunta 1
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (3, 'alt3 test11', 'v', 0, 1);
--respuestas a la pregunta 2
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (4, 'alt1 test11', 't', 100, 2);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (5, 'alt2 test11', 'f', 0, 2);
--respuestas a la pregunta 3
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (7, 'alt1 test11', 't', 33, 3);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (8, 'alt2 test11', 't', 33, 3);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (9, 'alt3 test11', 't', 33, 3);
--respuestas a la pregunta 4
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (10, 'alt1 test11', 'f', 0, 4);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (11, 'alt2 test11', 'f', 0, 4);
--respuestas a la pregunta 5
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (13, 'alt1 test11', 'f', 0, 5);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (14, 'alt2 test11', 't', 100, 5);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (15, 'alt3 test11', 't', 0, 5);
--respuestas a la pregunta 6
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (16, 'alt1 test11', 't', 100, 6);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (17, 'alt2 test11', 'f', 0, 6);
--respuestas a la pregunta 7
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (19, 'alt1 test11', 'f', 0, 7);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (20, 'alt2 test11', 'f', 0, 7);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (21, 'alt3 test11', 'f', 0, 7);

--TEST 22
--alternativas a la pregunta 1
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (22, 'alt1 test22', 't', 50, 11);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (23, 'alt2 test22', 't', 50, 11);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (24, 'altp3 test22', 'f', 0, 11);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (25, 'alt4 test22', 'f', 0, 11);
--alternativas a la pregunta 2
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (26, 'alt1 test22', 't', 100, 12);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (27, 'alt2 test22', 'f', 0, 12);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (28, 'alt3 test22', 'f', 0, 12);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (29, 'alt4 test22', 'f', 0, 12);
--alternativas a la pregunta 3
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (30, 'alt1 test22', 't', 100, 13);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (31, 'alt2 test22', 'f', 0, 13);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (32, 'alt3 test22', 'f', 0, 13);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (33, 'alt4 test22', 'f', 0, 13);
--alternativas a la pregunta 4
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (34, 'alt1 test22', 't', 100, 14);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (35, 'alt2 test22', 'f', 0, 14);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (36, 'alt3 test22', 'f', 0, 14);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (37, 'alt4 test22', 'f', 0, 14);
--alternativas a la pregunta 5
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (38, 'alt1 test22', 't', 100, 15);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (39, 'alt2 test22', 'f', 0, 15);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (40, 'alt3 test22', 'f', 0, 15);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (41, 'alt4 test22', 'f', 0, 15);
--alternativas a la pregunta 6
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (42, 'alt1 test22', 't', 100, 16);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (43, 'alt2 test22', 'f', 0, 16);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (44, 'alt3 test22', 'f', 0, 16);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (45, 'alt4 test22', 'f', 0, 16);
--alternativas a la pregunta 7
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (46, 'alt1 test22', 't', 100, 17);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (47, 'alt2 test22', 'f', 0, 17);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (48, 'alt3 test22', 'f', 0, 17);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (49, 'alt4 test22', 'f', 0, 17);
--alternativas a la pregunta 8
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (50, 'alt1 test22', 't', 100, 18);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (51, 'alt2 test22', 'f', 0, 18);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (52, 'alt3 test22', 'f', 0, 18);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (53, 'alt4 test22', 'f', 0, 18);
--alternativas a la pregunta 9
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (54, 'alt1 test22', 't', 100, 19);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (55, 'alt2 test22', 'f', 0, 19);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (56, 'alt3 test22', 'f', 0, 19);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (57, 'alt4 test22', 'f', 0, 19);
--alternativas a la pregunta 10
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (58, 'alt1 test22', 't', 100, 20);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (59, 'alt2 test22', 'f', 0, 20);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (60, 'alt3 test22', 'f', 0, 20);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (61, 'alt4 test22', 'f', 0, 20);

--TEST 33
--alternativas a la pregunta 1
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (62, 'alt1 test22', 't', 50, 21);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (63, 'alt2 test22', 't', 50, 21);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (64, 'altp3 test22', 'f', 0, 21);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (65, 'alt4 test22', 'f', 0, 21);
--alternativas a la pregunta 2
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (66, 'alt1 test22', 't', 100, 22);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (67, 'alt2 test22', 'f', 0, 22);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (68, 'alt3 test22', 'f', 0, 22);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (69, 'alt4 test22', 'f', 0, 22);
--alternativas a la pregunta 3
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (70, 'alt1 test22', 't', 100, 23);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (71, 'alt2 test22', 'f', 0, 23);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (72, 'alt3 test22', 'f', 0, 23);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (73, 'alt4 test22', 'f', 0, 23);
--alternativas a la pregunta 4
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (74, 'alt1 test22', 't', 100, 24);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (75, 'alt2 test22', 'f', 0, 24);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (76, 'alt3 test22', 'f', 0, 24);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (77, 'alt4 test22', 'f', 0, 24);
--alternativas a la pregunta 5
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (78, 'alt1 test22', 't', 100, 25);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (79, 'alt2 test22', 'f', 0, 25);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (80, 'alt3 test22', 'f', 0, 25);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (81, 'alt4 test22', 'f', 0, 25);
--alternativas a la pregunta 6
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (82, 'alt1 test22', 't', 100, 26);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (83, 'alt2 test22', 'f', 0, 26);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (84, 'alt3 test22', 'f', 0, 26);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (85, 'alt4 test22', 'f', 0, 26);
--alternativas a la pregunta 7
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (86, 'alt1 test22', 't', 100, 27);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (87, 'alt2 test22', 'f', 0, 27);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (88, 'alt3 test22', 'f', 0, 27);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (89, 'alt4 test22', 'f', 0, 27);
--alternativas a la pregunta 8
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (90, 'alt1 test22', 't', 100, 28);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (91, 'alt2 test22', 'f', 0, 28);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (92, 'alt3 test22', 'f', 0, 28);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (93, 'alt4 test22', 'f', 0, 28);
--alternativas a la pregunta 9
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (94, 'alt1 test22', 't', 100, 29);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (95, 'alt2 test22', 'f', 0, 29);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (96, 'alt3 test22', 'f', 0, 29);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (97, 'alt4 test22', 'f', 0, 29);
--alternativas a la pregunta 10
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (98, 'alt1 test22', 'f', 0, 30);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (99, 'alt2 test22', 'f', 0, 30);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (100, 'alt3 test22', 'f', 0, 30);
insert into respuestas (respuesta_id, respuesta_descripcion, respuesta_boolean, respuesta_porcentaje, respuesta_pregunta_id) 
values (101, 'alt4 test22', 't', 100, 30);

--AR

--alumno 1 respondio: 
--test22
insert into ar (ar_respuesta_id, ar_at_id) values(22,3);  --50%
insert into ar (ar_respuesta_id, ar_at_id) values(23,3);  --50%
insert into ar (ar_respuesta_id, ar_at_id) values(26,3); 
insert into ar (ar_respuesta_id, ar_at_id) values(30,3); 
insert into ar (ar_respuesta_id, ar_at_id) values(34,3); 
insert into ar (ar_respuesta_id, ar_at_id) values(38,3); 
insert into ar (ar_respuesta_id, ar_at_id) values(42,3); 
insert into ar (ar_respuesta_id, ar_at_id) values(46,3); 
insert into ar (ar_respuesta_id, ar_at_id) values(50,3); 
insert into ar (ar_respuesta_id, ar_at_id) values(54,3); 
insert into ar (ar_respuesta_id, ar_at_id) values(58,3); 
--test3
insert into ar (ar_respuesta_id, ar_at_id) values(62,23);  --50%
insert into ar (ar_respuesta_id, ar_at_id) values(63,23);  --50%
insert into ar (ar_respuesta_id, ar_at_id) values(66,23); 
insert into ar (ar_respuesta_id, ar_at_id) values(70,23); 
insert into ar (ar_respuesta_id, ar_at_id) values(74,23); 
insert into ar (ar_respuesta_id, ar_at_id) values(78,23); 
insert into ar (ar_respuesta_id, ar_at_id) values(82,23); 
insert into ar (ar_respuesta_id, ar_at_id) values(86,23); 
insert into ar (ar_respuesta_id, ar_at_id) values(90,23); 
insert into ar (ar_respuesta_id, ar_at_id) values(94,23); 
insert into ar (ar_respuesta_id, ar_at_id) values(98,23); 

--alumno 2 respondio:
--test2
insert into ar (ar_respuesta_id, ar_at_id) values(22,4);  --50%
insert into ar (ar_respuesta_id, ar_at_id) values(23,4);  --50%
insert into ar (ar_respuesta_id, ar_at_id) values(26,4); 
insert into ar (ar_respuesta_id, ar_at_id) values(30,4); 
insert into ar (ar_respuesta_id, ar_at_id) values(34,4); 
insert into ar (ar_respuesta_id, ar_at_id) values(38,4); 
insert into ar (ar_respuesta_id, ar_at_id) values(42,4); 
insert into ar (ar_respuesta_id, ar_at_id) values(46,4); 
insert into ar (ar_respuesta_id, ar_at_id) values(50,4); 
insert into ar (ar_respuesta_id, ar_at_id) values(54,4); 
insert into ar (ar_respuesta_id, ar_at_id) values(58,4); 
--test3
insert into ar (ar_respuesta_id, ar_at_id) values(86,24); 
insert into ar (ar_respuesta_id, ar_at_id) values(90,24); 

--alumno 3 respondio
--test2
insert into ar (ar_respuesta_id, ar_at_id) values(22,5);  --50%
insert into ar (ar_respuesta_id, ar_at_id) values(23,5);  --50%
insert into ar (ar_respuesta_id, ar_at_id) values(26,5); 
insert into ar (ar_respuesta_id, ar_at_id) values(30,5); 
insert into ar (ar_respuesta_id, ar_at_id) values(34,5); 
insert into ar (ar_respuesta_id, ar_at_id) values(38,5); 
insert into ar (ar_respuesta_id, ar_at_id) values(42,5); 
insert into ar (ar_respuesta_id, ar_at_id) values(46,5); 
insert into ar (ar_respuesta_id, ar_at_id) values(50,5); 
insert into ar (ar_respuesta_id, ar_at_id) values(54,5); 
insert into ar (ar_respuesta_id, ar_at_id) values(58,5); 
--test3
insert into ar (ar_respuesta_id, ar_at_id) values(86,25); 
insert into ar (ar_respuesta_id, ar_at_id) values(90,25);

--alumno 4 respondio
--test2
insert into ar (ar_respuesta_id, ar_at_id) values(22,6);  --50%
insert into ar (ar_respuesta_id, ar_at_id) values(23,6);  --50%
insert into ar (ar_respuesta_id, ar_at_id) values(26,6); 
insert into ar (ar_respuesta_id, ar_at_id) values(30,6); 
insert into ar (ar_respuesta_id, ar_at_id) values(34,6); 
insert into ar (ar_respuesta_id, ar_at_id) values(38,6); 
insert into ar (ar_respuesta_id, ar_at_id) values(42,6); 
insert into ar (ar_respuesta_id, ar_at_id) values(46,6); 
insert into ar (ar_respuesta_id, ar_at_id) values(50,6); 
insert into ar (ar_respuesta_id, ar_at_id) values(54,6); 
insert into ar (ar_respuesta_id, ar_at_id) values(58,6); 
--test3
insert into ar (ar_respuesta_id, ar_at_id) values(74,26); 
insert into ar (ar_respuesta_id, ar_at_id) values(78,26); 
insert into ar (ar_respuesta_id, ar_at_id) values(42,26); 
insert into ar (ar_respuesta_id, ar_at_id) values(46,26); 

--alumno 5 respondio
--test2
insert into ar (ar_respuesta_id, ar_at_id) values(46,7); 
insert into ar (ar_respuesta_id, ar_at_id) values(50,7); 
insert into ar (ar_respuesta_id, ar_at_id) values(54,7); 
insert into ar (ar_respuesta_id, ar_at_id) values(58,7); 
--test3
insert into ar (ar_respuesta_id, ar_at_id) values(62,27);  --50%
insert into ar (ar_respuesta_id, ar_at_id) values(63,27);  --50%
insert into ar (ar_respuesta_id, ar_at_id) values(66,27); 
insert into ar (ar_respuesta_id, ar_at_id) values(70,27); 
insert into ar (ar_respuesta_id, ar_at_id) values(74,27); 
insert into ar (ar_respuesta_id, ar_at_id) values(78,27); 
insert into ar (ar_respuesta_id, ar_at_id) values(82,27); 
insert into ar (ar_respuesta_id, ar_at_id) values(86,27); 
insert into ar (ar_respuesta_id, ar_at_id) values(90,27); 
insert into ar (ar_respuesta_id, ar_at_id) values(94,27); 
insert into ar (ar_respuesta_id, ar_at_id) values(98,27);

--alumno 6 respondio
--test2
insert into ar (ar_respuesta_id, ar_at_id) values(46,8); 
insert into ar (ar_respuesta_id, ar_at_id) values(50,8);
insert into ar (ar_respuesta_id, ar_at_id) values(54,8); 
--test3
insert into ar (ar_respuesta_id, ar_at_id) values(74,28); 
insert into ar (ar_respuesta_id, ar_at_id) values(78,28); 
insert into ar (ar_respuesta_id, ar_at_id) values(86,28); 
insert into ar (ar_respuesta_id, ar_at_id) values(90,28);

--alumno 7 respondio
--test2
insert into ar (ar_respuesta_id, ar_at_id) values(42,9); 
insert into ar (ar_respuesta_id, ar_at_id) values(46,9); 
insert into ar (ar_respuesta_id, ar_at_id) values(50,9); 
insert into ar (ar_respuesta_id, ar_at_id) values(54,9); 
insert into ar (ar_respuesta_id, ar_at_id) values(58,9); 
--test3
insert into ar (ar_respuesta_id, ar_at_id) values(86,29); 
insert into ar (ar_respuesta_id, ar_at_id) values(90,29);

--alumno 8 respondio
--test2
insert into ar (ar_respuesta_id, ar_at_id) values(54,10); 
insert into ar (ar_respuesta_id, ar_at_id) values(58,10); 
--test3
insert into ar (ar_respuesta_id, ar_at_id) values(86,30); 

--alumno 9 respondio
--test2
insert into ar (ar_respuesta_id, ar_at_id) values(23,11);  --50%
insert into ar (ar_respuesta_id, ar_at_id) values(54,11); 
insert into ar (ar_respuesta_id, ar_at_id) values(58,11); 
--test3
insert into ar (ar_respuesta_id, ar_at_id) values(74,31); 
insert into ar (ar_respuesta_id, ar_at_id) values(78,31); 
insert into ar (ar_respuesta_id, ar_at_id) values(86,31); 
insert into ar (ar_respuesta_id, ar_at_id) values(90,31);

--alumno 10 respondio
--test2
insert into ar (ar_respuesta_id, ar_at_id) values(26,12); 
insert into ar (ar_respuesta_id, ar_at_id) values(30,12); 
insert into ar (ar_respuesta_id, ar_at_id) values(34,12);
insert into ar (ar_respuesta_id, ar_at_id) values(54,12); 
insert into ar (ar_respuesta_id, ar_at_id) values(58,12); 
--test3
insert into ar (ar_respuesta_id, ar_at_id) values(86,32); 
insert into ar (ar_respuesta_id, ar_at_id) values(90,32);

--alumno 11 respondio
--test2
insert into ar (ar_respuesta_id, ar_at_id) values(50,13); 
insert into ar (ar_respuesta_id, ar_at_id) values(54,13); 
insert into ar (ar_respuesta_id, ar_at_id) values(58,13); 
--test3
insert into ar (ar_respuesta_id, ar_at_id) values(86,33); 
insert into ar (ar_respuesta_id, ar_at_id) values(90,33);

--alumno 12 respondio
--test2
insert into ar (ar_respuesta_id, ar_at_id) values(22,14);  --50%
insert into ar (ar_respuesta_id, ar_at_id) values(23,14);  --50%
insert into ar (ar_respuesta_id, ar_at_id) values(26,14); 
insert into ar (ar_respuesta_id, ar_at_id) values(30,14); 
insert into ar (ar_respuesta_id, ar_at_id) values(34,14); 
insert into ar (ar_respuesta_id, ar_at_id) values(38,14); 
insert into ar (ar_respuesta_id, ar_at_id) values(42,14); 
insert into ar (ar_respuesta_id, ar_at_id) values(46,14); 
insert into ar (ar_respuesta_id, ar_at_id) values(50,14); 
insert into ar (ar_respuesta_id, ar_at_id) values(54,14); 
insert into ar (ar_respuesta_id, ar_at_id) values(58,14); 
--test3
insert into ar (ar_respuesta_id, ar_at_id) values(78,34); 
insert into ar (ar_respuesta_id, ar_at_id) values(86,34); 
insert into ar (ar_respuesta_id, ar_at_id) values(90,34);

--alumno 13 respondio
--test2
insert into ar (ar_respuesta_id, ar_at_id) values(23,15);  --50%
insert into ar (ar_respuesta_id, ar_at_id) values(42,15); 
insert into ar (ar_respuesta_id, ar_at_id) values(46,15); 
insert into ar (ar_respuesta_id, ar_at_id) values(50,15); 
insert into ar (ar_respuesta_id, ar_at_id) values(54,15); 
insert into ar (ar_respuesta_id, ar_at_id) values(58,15); 
--test3
insert into ar (ar_respuesta_id, ar_at_id) values(74,35); 
insert into ar (ar_respuesta_id, ar_at_id) values(78,35); 
insert into ar (ar_respuesta_id, ar_at_id) values(86,35); 
insert into ar (ar_respuesta_id, ar_at_id) values(90,35);

--alumno 14 respondio
--test2
insert into ar (ar_respuesta_id, ar_at_id) values(42,16); 
insert into ar (ar_respuesta_id, ar_at_id) values(46,16); 
insert into ar (ar_respuesta_id, ar_at_id) values(50,16); 
insert into ar (ar_respuesta_id, ar_at_id) values(54,16); 
insert into ar (ar_respuesta_id, ar_at_id) values(58,16); 
--test3
insert into ar (ar_respuesta_id, ar_at_id) values(62,36);  --50%
insert into ar (ar_respuesta_id, ar_at_id) values(63,36);  --50%
insert into ar (ar_respuesta_id, ar_at_id) values(66,36); 
insert into ar (ar_respuesta_id, ar_at_id) values(70,36); 
insert into ar (ar_respuesta_id, ar_at_id) values(74,36); 
insert into ar (ar_respuesta_id, ar_at_id) values(78,36); 
insert into ar (ar_respuesta_id, ar_at_id) values(82,36); 
insert into ar (ar_respuesta_id, ar_at_id) values(86,36); 
insert into ar (ar_respuesta_id, ar_at_id) values(90,36); 
insert into ar (ar_respuesta_id, ar_at_id) values(94,36); 
insert into ar (ar_respuesta_id, ar_at_id) values(98,36);

--alumno 15 respondo
--test2
insert into ar (ar_respuesta_id, ar_at_id) values(42,17); 
insert into ar (ar_respuesta_id, ar_at_id) values(46,17); 
insert into ar (ar_respuesta_id, ar_at_id) values(50,17); 
insert into ar (ar_respuesta_id, ar_at_id) values(54,17); 
insert into ar (ar_respuesta_id, ar_at_id) values(58,17); 
--test3
insert into ar (ar_respuesta_id, ar_at_id) values(66,37); 
insert into ar (ar_respuesta_id, ar_at_id) values(70,37); 
insert into ar (ar_respuesta_id, ar_at_id) values(86,37); 
insert into ar (ar_respuesta_id, ar_at_id) values(90,37);

--alumno 16 respondio
--test2
insert into ar (ar_respuesta_id, ar_at_id) values(23,18);  --50%
insert into ar (ar_respuesta_id, ar_at_id) values(42,18); 
insert into ar (ar_respuesta_id, ar_at_id) values(46,18); 
--test3
insert into ar (ar_respuesta_id, ar_at_id) values(70,38); 
insert into ar (ar_respuesta_id, ar_at_id) values(74,38); 
insert into ar (ar_respuesta_id, ar_at_id) values(78,38); 
insert into ar (ar_respuesta_id, ar_at_id) values(86,38); 
insert into ar (ar_respuesta_id, ar_at_id) values(90,38);

--alumno 17 respondio
--test2
insert into ar (ar_respuesta_id, ar_at_id) values(26,19); 
insert into ar (ar_respuesta_id, ar_at_id) values(30,19); 
insert into ar (ar_respuesta_id, ar_at_id) values(34,19);
insert into ar (ar_respuesta_id, ar_at_id) values(42,19); 
insert into ar (ar_respuesta_id, ar_at_id) values(46,19); 
--test3
insert into ar (ar_respuesta_id, ar_at_id) values(78,39); 
insert into ar (ar_respuesta_id, ar_at_id) values(86,39); 
insert into ar (ar_respuesta_id, ar_at_id) values(90,39);

--alumno 18 respondio
--test2
insert into ar (ar_respuesta_id, ar_at_id) values(42,20); 
insert into ar (ar_respuesta_id, ar_at_id) values(46,20); 
--test3
insert into ar (ar_respuesta_id, ar_at_id) values(70,40); 
insert into ar (ar_respuesta_id, ar_at_id) values(74,40); 
insert into ar (ar_respuesta_id, ar_at_id) values(78,40); 
insert into ar (ar_respuesta_id, ar_at_id) values(86,40); 
insert into ar (ar_respuesta_id, ar_at_id) values(90,40);

--alumno 19 respondio
--test2
insert into ar (ar_respuesta_id, ar_at_id) values(26,21); 
insert into ar (ar_respuesta_id, ar_at_id) values(30,21); 
insert into ar (ar_respuesta_id, ar_at_id) values(34,21);
insert into ar (ar_respuesta_id, ar_at_id) values(42,21); 
insert into ar (ar_respuesta_id, ar_at_id) values(46,21); 
--test3
insert into ar (ar_respuesta_id, ar_at_id) values(74,41); 
insert into ar (ar_respuesta_id, ar_at_id) values(78,41); 
insert into ar (ar_respuesta_id, ar_at_id) values(86,41); 
insert into ar (ar_respuesta_id, ar_at_id) values(90,41);

--alumno 20 respondio
--test2
insert into ar (ar_respuesta_id, ar_at_id) values(23,22);  --50%
insert into ar (ar_respuesta_id, ar_at_id) values(26,22); 
insert into ar (ar_respuesta_id, ar_at_id) values(30,22); 
insert into ar (ar_respuesta_id, ar_at_id) values(34,22);
insert into ar (ar_respuesta_id, ar_at_id) values(42,22); 
insert into ar (ar_respuesta_id, ar_at_id) values(46,22);
--test3
insert into ar (ar_respuesta_id, ar_at_id) values(66,42); 
insert into ar (ar_respuesta_id, ar_at_id) values(70,42); 
insert into ar (ar_respuesta_id, ar_at_id) values(74,42); 
insert into ar (ar_respuesta_id, ar_at_id) values(78,42); 
insert into ar (ar_respuesta_id, ar_at_id) values(86,42); 
insert into ar (ar_respuesta_id, ar_at_id) values(90,42);

--CONSULTAS

--1.Pregunta 1: Conocer el número de evaluaciones por curso.
select count(test_id) as CANTIDAD_TEST, alumno_curso_id as CURSO
from at
RIGHT join alumnos
on alumno_id = at_alumno_id
left join test
on test_id = at_test_id
group by alumno_curso_id;

--Pregunta 2: Conocer los cursos sin evaluaciones.
select distinct alumno_curso_id as "ID CURSO SIN TEST", curso_nombre, programa_nombre
from at
full join alumnos
on alumno_id = at_alumno_id
full join test
on test_id = at_test_id
full join curso
on curso_id = alumno_curso_id
full join programa
on programa_id = curso_programa_id
where test_id is null;

-- Pregunta 3: Determinar las evaluaciones con deficiencia. Una evaluación es deficiente: 

--UNA SOLA QUERY
 select test_id as ID_TEST_DEFICIENTE from test MINUS select pregunta_test_id from pregunta 
 UNION
 select pregunta_test_id  from pregunta inner join respuestas on respuesta_pregunta_id = pregunta_id  
 group by pregunta_test_id having count(respuesta_id) <=2
 UNION
 SELECT test_id
FROM (
WITH
  con1 AS (SELECT respuesta_pregunta_id,  count(*) nro_alternativas FROM respuestas GROUP BY respuesta_pregunta_id),
  con2 AS (SELECT respuesta_pregunta_id,  count(*) nro_true FROM respuestas WHERE respuesta_boolean = 't' GROUP BY respuesta_pregunta_id),
  con3 AS (SELECT respuesta_pregunta_id,  count(*) nro_false FROM respuestas WHERE respuesta_boolean = 'f' GROUP BY respuesta_pregunta_id)
SELECT con1.respuesta_pregunta_id,con1.nro_alternativas, con2.nro_true, con3.nro_false
FROM con1
LEFT JOIN con2 ON con2.respuesta_pregunta_id = con1.respuesta_pregunta_id
LEFT JOIN con3 ON con3.respuesta_pregunta_id = con1.respuesta_pregunta_id
ORDER BY con1.respuesta_pregunta_id ) x
JOIN pregunta ON pregunta.pregunta_id = x.respuesta_pregunta_id
JOIN test ON test.test_id = pregunta.pregunta_test_id
WHERE ( x.nro_alternativas  =  NVL(x.nro_true,0) )
OR    (  x.nro_alternativas =  NVL(x.nro_false,0) );

--QUERY POR SEPARADO Y MAS DETALLADO
--a.Si no tiene preguntas.
SELECT test_nombre as TEST_SIN_PREGUNTAS
from TEST
left join PREGUNTA on pregunta_test_id = test_id
WHERE PREGUNTA_TEST_ID is null;            
--b.Si hay preguntas con 2ó menos alternativas
SELECT c.test_id as "TEST CON 2 O MENOS ALTERN", c.test_nombre, x.pregunta_id, x.pregunta_enunciado
FROM (
    SELECT a.pregunta_id, a.pregunta_enunciado, a.pregunta_test_id
    FROM pregunta a
    JOIN respuestas b ON b.respuesta_pregunta_id = a.pregunta_id
    GROUP BY  a.pregunta_id, a.pregunta_enunciado, a.pregunta_test_id
    HAVING count(*) <= 2 ) x
    JOIN test c ON c.test_id = x.pregunta_test_id;
--c.Si todas las alternativas son correctas o si todas las alternativas son incorrectas
SELECT test_id AS "TEST ALERNAT INCORRECTAS", test.test_nombre, x.respuesta_pregunta_id, x.nro_alternativas, NVL(x.nro_true,0), NVL(x.nro_false,0) nro_false
FROM (
WITH
  con1 AS (SELECT respuesta_pregunta_id,  count(*) nro_alternativas FROM respuestas GROUP BY respuesta_pregunta_id),
  con2 AS (SELECT respuesta_pregunta_id,  count(*) nro_true FROM respuestas WHERE respuesta_boolean = 't' GROUP BY respuesta_pregunta_id),
  con3 AS (SELECT respuesta_pregunta_id,  count(*) nro_false FROM respuestas WHERE respuesta_boolean = 'f' GROUP BY respuesta_pregunta_id)
SELECT con1.respuesta_pregunta_id,con1.nro_alternativas, con2.nro_true, con3.nro_false
FROM con1
LEFT JOIN con2 ON con2.respuesta_pregunta_id = con1.respuesta_pregunta_id
LEFT JOIN con3 ON con3.respuesta_pregunta_id = con1.respuesta_pregunta_id
ORDER BY con1.respuesta_pregunta_id ) x
JOIN pregunta ON pregunta.pregunta_id = x.respuesta_pregunta_id
JOIN test ON test.test_id = pregunta.pregunta_test_id
WHERE ( x.nro_alternativas  =  NVL(x.nro_true,0) )
OR    (  x.nro_alternativas =  NVL(x.nro_false,0) );


--4: Determinar cuántos alumnos hay en cada curso.
SELECT p.programa_nombre, c.curso_nombre AS CURSO, COUNT(c.curso_programa_id) AS TOTAL_ALUMNOS
FROM ALUMNOS A 
RIGHT JOIN CURSO C
ON a.alumno_curso_id = c.curso_id
RIGHT JOIN  PROGRAMA P
ON c.curso_programa_id = p.programa_id
GROUP BY p.programa_nombre, c.curso_nombre, A.alumno_curso_id;

--5: Obtener  el  puntaje  no  normalizado  de  cada  evaluación.  El  puntaje  no normalizado ha sido definido (requerimiento) 
--como: P = buenas – malas/4. Si un alumno no contesta en una pregunta exactamente lo mismo que se ha definido como correcto,
--la pregunta cuenta como mala a menos que el alumno haya omitido
select (sum(pregunta_puntaje* respuesta_porcentaje / 100)/4 ) * 0.70 as nota, at_alumno_id, at_test_id
from pregunta
inner join respuestas
on respuesta_pregunta_id = pregunta_id
inner join ar
on ar_respuesta_id = respuesta_id
inner join at
on at_id = ar_at_id
group by at_id,at_alumno_id, at_test_id
order by at_alumno_id;


--6: Obtener el puntaje normalizado , o sea, de 1,0 a 7,0.
select sum(pregunta_puntaje* respuesta_porcentaje / 100 ) * 0.70 as nota, at_alumno_id, at_test_id
from pregunta
inner join respuestas
on respuesta_pregunta_id = pregunta_id
inner join ar
on ar_respuesta_id = respuesta_id
inner join at
on at_id = ar_at_id
group by at_id,at_alumno_id, at_test_id
order by at_alumno_id;

--7: Nombre  de  estudiantes  de  un  curso  determinado  que  aprueban  una evaluación determinada (donde la nota de aprobación
--mínima es un 4,0).
select sum( pregunta_puntaje * respuesta_porcentaje / 100) * 0.70 as NOTA , at_alumno_id, alumno_nombre,at_test_id, alumno_curso_id
from pregunta 
inner join respuestas
on respuesta_pregunta_id = pregunta_id
inner join ar
on ar_respuesta_id = respuesta_id
inner join at
on at_id = ar_at_id
inner join alumnos
on alumno_id = at_alumno_id
group by at_alumno_id, alumno_nombre, at_test_id, alumno_curso_id
having sum( pregunta_puntaje * respuesta_porcentaje / 100) * 0.70 > 4 and at_test_id = 22 and alumno_curso_id = 1;

--8:Nota  promedio  de  los  estudiantes  de  un  curso  determinado,  para  una evaluación de terminada.
select (sum( pregunta_puntaje * respuesta_porcentaje / 100) * 0.70 ) / (select count(alumno_id) from alumnos 
                                                              where alumno_curso_id = 2 
                                                              and at_test_id = 22 )  as PROMEDIO_CURSO,  
            at_test_id as TEST,
            alumno_curso_id as CURSO
from pregunta 
inner join respuestas
on respuesta_pregunta_id = pregunta_id
inner join ar
on ar_respuesta_id = respuesta_id
inner join at
on at_id = ar_at_id
inner join alumnos
on alumno_id = at_alumno_id
group by   at_test_id, alumno_curso_id
having at_test_id = 22 and alumno_curso_id =2;



 
