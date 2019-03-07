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


