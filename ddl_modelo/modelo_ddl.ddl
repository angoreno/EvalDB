-- Generado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   en:        2020-03-28 01:21:02 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE tbl_alternat (
    cmp_idalternativa    INTEGER NOT NULL,
    cmp_descripcion      VARCHAR2(100 CHAR) NOT NULL,
    cmp_vresp            CHAR(1) NOT NULL,
    cmp_porcentaje       FLOAT(1) NOT NULL,
    tbl_preg_cmp_idpreg  INTEGER NOT NULL
);

ALTER TABLE tbl_alternat ADD CONSTRAINT tbl_alternativa_pk PRIMARY KEY ( cmp_idalternativa );

CREATE TABLE tbl_alumn (
    cmp_rut                     VARCHAR2(12 CHAR) NOT NULL,
    cmp_nombre                  VARCHAR2(15 CHAR) NOT NULL,
    cmp_apellido                VARCHAR2(15 CHAR) NOT NULL,
    tbl_curso_cmp_idcurso       INTEGER NOT NULL,
    tbl_programa_cmp_idprogram  INTEGER NOT NULL
);

ALTER TABLE tbl_alumn ADD CONSTRAINT tbl_alumno_pk PRIMARY KEY ( cmp_rut );

CREATE TABLE tbl_curso (
    cmp_idcurso      INTEGER NOT NULL,
    cmp_nombre       VARCHAR2(50 CHAR) NOT NULL,
    cmp_descripcion  VARCHAR2(100 CHAR) NOT NULL,
    cmp_cant_alum    INTEGER NOT NULL
);

ALTER TABLE tbl_curso ADD CONSTRAINT tbl_curso_pk PRIMARY KEY ( cmp_idcurso );

CREATE TABLE tbl_preg (
    cmp_idpreg           INTEGER NOT NULL,
    cmp_enunciado        VARCHAR2(100 CHAR) NOT NULL,
    cmp_puntaje          INTEGER NOT NULL,
    tbl_test_cmp_idtest  INTEGER NOT NULL
);

ALTER TABLE tbl_preg ADD CONSTRAINT tbl_pregunta_pk PRIMARY KEY ( cmp_idpreg );

CREATE TABLE tbl_programa (
    cmp_idprogram    INTEGER NOT NULL,
    cmp_nombre       VARCHAR2(30 CHAR) NOT NULL,
    cmp_descripcion  VARCHAR2(100 CHAR) NOT NULL
);

ALTER TABLE tbl_programa ADD CONSTRAINT tbl_programa_pk PRIMARY KEY ( cmp_idprogram );

CREATE TABLE tbl_registros (
    cmp_idregistro                  INTEGER NOT NULL,
    tbl_programa_cmp_idprogram      INTEGER NOT NULL,
    tbl_test_cmp_idtest             INTEGER NOT NULL,
    tbl_curso_cmp_idcurso           INTEGER NOT NULL,
    tbl_alumn_cmp_rut               VARCHAR2(12 CHAR) NOT NULL,
    tbl_preg_cmp_idpregunta         INTEGER NOT NULL,
    tbl_alternat_cmp_idalternativa  INTEGER NOT NULL
);

ALTER TABLE tbl_registros ADD CONSTRAINT tbl_registros_pk PRIMARY KEY ( cmp_idregistro );

CREATE TABLE tbl_test (
    cmp_idtest       INTEGER NOT NULL,
    cmp_nombre       VARCHAR2(50 CHAR) NOT NULL,
    cmp_descripcion  VARCHAR2(100 CHAR) NOT NULL,
    cmp_programa     VARCHAR2(70 CHAR) NOT NULL,
    cmp_unidad       VARCHAR2(50 CHAR) NOT NULL,
    cmp_autor        VARCHAR2(30 CHAR) NOT NULL,
    cmp_fcreacion    DATE NOT NULL
);

ALTER TABLE tbl_test ADD CONSTRAINT tbl_test_pk PRIMARY KEY ( cmp_idtest );

ALTER TABLE tbl_alternat
    ADD CONSTRAINT tbl_alternativa_tbl_preg_fk FOREIGN KEY ( tbl_preg_cmp_idpreg )
        REFERENCES tbl_preg ( cmp_idpreg );

ALTER TABLE tbl_alumn
    ADD CONSTRAINT tbl_alumn_tbl_curso_fk FOREIGN KEY ( tbl_curso_cmp_idcurso )
        REFERENCES tbl_curso ( cmp_idcurso );

ALTER TABLE tbl_alumn
    ADD CONSTRAINT tbl_alumn_tbl_programa_fk FOREIGN KEY ( tbl_programa_cmp_idprogram )
        REFERENCES tbl_programa ( cmp_idprogram );

ALTER TABLE tbl_preg
    ADD CONSTRAINT tbl_pregunta_tbl_test_fk FOREIGN KEY ( tbl_test_cmp_idtest )
        REFERENCES tbl_test ( cmp_idtest );

ALTER TABLE tbl_registros
    ADD CONSTRAINT tbl_registros_tbl_alternat_fk FOREIGN KEY ( tbl_alternat_cmp_idalternativa )
        REFERENCES tbl_alternat ( cmp_idalternativa );

ALTER TABLE tbl_registros
    ADD CONSTRAINT tbl_registros_tbl_alumn_fk FOREIGN KEY ( tbl_alumn_cmp_rut )
        REFERENCES tbl_alumn ( cmp_rut );

ALTER TABLE tbl_registros
    ADD CONSTRAINT tbl_registros_tbl_curso_fk FOREIGN KEY ( tbl_curso_cmp_idcurso )
        REFERENCES tbl_curso ( cmp_idcurso );

ALTER TABLE tbl_registros
    ADD CONSTRAINT tbl_registros_tbl_preg_fk FOREIGN KEY ( tbl_preg_cmp_idpregunta )
        REFERENCES tbl_preg ( cmp_idpreg );

ALTER TABLE tbl_registros
    ADD CONSTRAINT tbl_registros_tbl_programa_fk FOREIGN KEY ( tbl_programa_cmp_idprogram )
        REFERENCES tbl_programa ( cmp_idprogram );

ALTER TABLE tbl_registros
    ADD CONSTRAINT tbl_registros_tbl_test_fk FOREIGN KEY ( tbl_test_cmp_idtest )
        REFERENCES tbl_test ( cmp_idtest );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             17
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
