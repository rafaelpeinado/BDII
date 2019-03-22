CREATE DATABASE dbModelo;

USE dbModelo;

CREATE TABLE tblestudante (
  pkEstudante 		INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  strProntuario 	VARCHAR(9) NOT NULL UNIQUE,
  strNome 			VARCHAR(50) NOT NULL,
  dtNascimento 		DATE NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8;

CREATE TABLE tbldocente (
  pkDocente 		INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  strProntuario 	VARCHAR(9) NOT NULL UNIQUE,
  strNome 			VARCHAR(50) NOT NULL,
  dtNascimento 		DATE NOT NULL,
  strEscolaridade 	VARCHAR(200) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8;

CREATE TABLE tbldisciplina (
  pkDisciplina 		INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  strSigla 			VARCHAR(10) NOT NULL UNIQUE,
  strEscolaridade 	VARCHAR(200) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8;

CREATE TABLE tblturma (
  pkTurma 		INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  dtDia 		DATE NOT NULL,
  strPeriodo 	VARCHAR(15) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8;

CREATE TABLE relDocenteDisciplina (
  pkDocenteDiscipilna 	INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  fkDocente 			INTEGER NOT NULL,
  fkDisciplina 			INTEGER NOT NULL,
  FOREIGN KEY (fkDisciplina) REFERENCES tbldisciplina (pkDisciplina),
  FOREIGN KEY (fkDocente) REFERENCES tbldocente (pkDocente),
  UNIQUE(fkDisciplina, fkDocente)
) ENGINE = InnoDB;

CREATE TABLE relEstudanteTurma (
  pkEstudanteTurma 	INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  fkEstudante 		INTEGER NOT NULL,
  fkTurma 			INTEGER NOT NULL,
  FOREIGN KEY (fkEstudante) REFERENCES tblestudante (pkEstudante),
  FOREIGN KEY (fkTurma) REFERENCES tblturma (pkTurma),
  UNIQUE(fkEstudante, fkTurma)
) ENGINE = InnoDB;

CREATE TABLE relTurmaDisciplina (
  pkTurmaDisciplina INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  fkTurma 			INTEGER NOT NULL,
  fkDisciplina 		INTEGER NOT NULL,
  FOREIGN KEY (fkTurma) REFERENCES tblturma(pkTurma),
  FOREIGN KEY (fkDisciplina) REFERENCES tbldisciplina(pkDisciplina),
  UNIQUE(fkTurma)
) ENGINE = InnoDB;


INSERT INTO tblestudante VALUES (NULL, "SP1234567", "RAFAEL SILVA", "1997-03-28");
INSERT INTO tblestudante VALUES (NULL, "SP9876543", "AMANDA SOUZA", "1999-09-04");
INSERT INTO tblestudante VALUES (NULL, "SP1237896", "JOSÉ ANTÔNIO", "1980-05-09");

INSERT INTO tbldocente VALUES (NULL, "SP4567893", "OSCAR OLIVEIRA", "1972-06-21", "MESTRADO");
INSERT INTO tbldocente VALUES (NULL, "SP8529637", "MARIA APARECIDA", "1965-06-24", "DOUTORADO");
INSERT INTO tbldocente VALUES (NULL, "SP1472583", "SILVANA PEREIRA", "1980-06-29", "GRADUADO");

INSERT INTO tbldisciplina VALUES (NULL, "DB2A3", "GRADUAÇÃO");

INSERT INTO tblturma VALUES (NULL, "2019-03-01", "NOTURNO");

INSERT INTO relDocenteDisciplina VALUES (NULL, 1, 1);
INSERT INTO relDocenteDisciplina VALUES (NULL, 2, 1);
INSERT INTO relDocenteDisciplina VALUES (NULL, 3, 1);

INSERT INTO relEstudanteTurma VALUES (NULL, 1, 1);
INSERT INTO relEstudanteTurma VALUES (NULL, 2, 1);
INSERT INTO relEstudanteTurma VALUES (NULL, 3, 1);

INSERT INTO relTurmaDisciplina VALUES (NULL, 1, 1);

-- 1º adicionar upk "NULL"
-- 2º UPDATE 
-- 3º mudar upk para NOT NULL
-- em 4 entidades

-- ALTER TABLE tblestudante ALTER CONSTRAINTS pkEstudante INTEGER NOT NULL;

--ALTER TABLE tblestudante DROP PRIMARY KEY;
ALTER TABLE tblestudante ADD COLUMN upkEstudante BINARY(16) NULL FIRST; 
