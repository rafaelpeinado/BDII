CREATE DATABASE dbEscola;

USE dbEscola;

CREATE TABLE tblestudante (
  pkEstudante 		INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  upkEstudante 		BINARY(16) NOT NULL,
  dcCreated 		DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dcModified 		DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  strProntuario 	CHAR(7) NOT NULL UNIQUE,
  strNome 			VARCHAR(50) NOT NULL,
  dtNascimento 		DATE NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8;

CREATE TABLE tbldocente (
  pkDocente 		INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  upkDocente 		BINARY(16) NOT NULL,
  dcCreated 		DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dcModified 		DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  strProntuario 	CHAR(7) NOT NULL UNIQUE,
  strNome 			VARCHAR(50) NOT NULL,
  dtNascimento 		DATE NOT NULL,
  strEscolaridade 	ENUM("FUNDAMENTAL", "MEDIO", "TECNOLOGO", "BACHARELADO", "LICENCIATURA", "POSGRADUACAO", "MESTRADO", "DOUTORADO", "LIVREDOCENCIA")
) ENGINE = InnoDB CHARACTER SET = utf8;

CREATE TABLE tblturma (
  pkTurma 		INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  upkTurma 		BINARY(16) NOT NULL,
  dcCreated 	DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dcModified 	DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  strDia 		ENUM("SEGUNDA", "TERCA", "QUARTA", "QUINTA", "SEXTA", "SABADO", "DOMINGO"),
  strPeriodo 	ENUM("MATUTINO", "VESPERTINO", "NOTURNO")
) ENGINE = InnoDB CHARACTER SET = utf8;

CREATE TABLE tbldisciplina (
  pkDisciplina 		INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  upkDisciplina 	BINARY(16) NOT NULL,
  dcCreated 		DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dcModified 		DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  strSigla 			CHAR(5) NOT NULL UNIQUE,
  strNome 			VARCHAR(50) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8;

CREATE TABLE relTurmaDisciplina (
  pkTurmaDisciplina 	INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  upkTurmaDisciplina 	BINARY(16) NOT NULL,
  fkTurma 				INTEGER NOT NULL,
  fkDisciplina 			INTEGER NOT NULL,
  FOREIGN KEY (fkTurma) REFERENCES tblturma(pkTurma),
  FOREIGN KEY (fkDisciplina) REFERENCES tbldisciplina(pkDisciplina),
  UNIQUE(fkTurma)
) ENGINE = InnoDB;

CREATE TABLE relDocenteDisciplina (
  pkDocenteDiscipilna 	INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  fkDocente 			INTEGER NOT NULL,
  fkDisciplina 			INTEGER NOT NULL,
  FOREIGN KEY (fkDisciplina) REFERENCES tbldisciplina (pkDisciplina),
  FOREIGN KEY (fkDocente) REFERENCES tbldocente (pkDocente),
  UNIQUE(fkDisciplina, fkDocente)
) ENGINE = InnoDB;

CREATE TABLE relEstudanteTurma (
  pkEstudanteTurma 		INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  fkEstudante 			INTEGER NOT NULL,
  fkTurma 				INTEGER NOT NULL,
  FOREIGN KEY (fkEstudante) REFERENCES tblestudante (pkEstudante),
  FOREIGN KEY (fkTurma) REFERENCES tblturma (pkTurma),
  UNIQUE(fkEstudante, fkTurma)
) ENGINE = InnoDB;

CREATE FUNCTION fnNovaChave() RETURNS BINARY(16) DETERMINISTIC
   RETURN UNHEX(REPLACE(UUID(), "-", ""));
   

DELIMITER //
CREATE PROCEDURE prCriarEstudante(varProntuario CHAR(7), varNome VARCHAR(50), varNascimento DATE)
  BEGIN
    START TRANSACTION;
	  INSERT INTO tblestudante(upkEstudante, strProntuario, strNome, dtNascimento) VALUES (fnNovaChave(), varProntuario, varNome, varNascimento);
	COMMIT;
  END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE prAtualizarEstudante(varProntuario CHAR(7), varNome VARCHAR(50), varNascimento DATE)
  BEGIN
    START TRANSACTION;
	  UPDATE tblestudante SET strNome = varNome, dtNascimento = varNascimento WHERE strProntuario = varProntuario;
	COMMIT;
  END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE prLerEstudante(varProntuario CHAR(7))
  BEGIN
    START TRANSACTION;
	  SELECT e.dcCreated AS criado, e.dcModified AS modificado, e.strProntuario AS prontuario, e.strNome AS nome, e.dtNascimento AS nascimento FROM tblestudante e WHERE e.strProntuario = varProntuario;
	COMMIT;
  END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE prDeletarEstudante(varProntuario CHAR(7))
  BEGIN
    START TRANSACTION;
	  DELETE FROM tblestudante WHERE strProntuario = varProntuario;
	COMMIT;
  END//
DELIMITER ;


DELIMITER //
CREATE PROCEDURE prListarEstudante()
  BEGIN
    START TRANSACTION;
	  SELECT e.dcCreated AS criado, e.dcModified AS modificado, e.strProntuario AS prontuario, e.strNome AS nome, e.dtNascimento AS nascimento FROM tblestudante e;
	COMMIT;
  END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE prCriarDocente(varProntuario CHAR(7), varNome VARCHAR(50), varNascimento DATE, varEscolaridade ENUM("FUNDAMENTAL", "MEDIO", "TECNOLOGO", "BACHARELADO", "LICENCIATURA", "POSGRADUACAO", "MESTRADO", "DOUTORADO", "LIVREDOCENCIA"))
  BEGIN
    START TRANSACTION;
	  INSERT INTO tbldocente(upkDocente, strProntuario, strNome, dtNascimento, strEscolaridade) VALUES (fnNovaChave(), varProntuario, varNome, varNascimento, varEscolaridade);
	COMMIT;
  END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE prAtualizarDocente(varProntuario CHAR(7), varNome VARCHAR(50), varNascimento DATE, varEscolaridade ENUM("FUNDAMENTAL", "MEDIO", "TECNOLOGO", "BACHARELADO", "LICENCIATURA", "POSGRADUACAO", "MESTRADO", "DOUTORADO", "LIVREDOCENCIA"))
  BEGIN
    START TRANSACTION;
	  UPDATE tbldocente SET strNome = varNome, dtNascimento = varNascimento, strEscolaridade = varEscolaridade WHERE strProntuario = varProntuario;
	COMMIT;
  END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE prLerDocente(varProntuario CHAR(7))
  BEGIN
    START TRANSACTION;
	  SELECT d.dcCreated AS criado, d.dcModified AS modificado, d.strProntuario AS prontuario, d.strNome AS nome, d.dtNascimento AS nascimento FROM tbldocente d WHERE d.strProntuario = varProntuario;
	COMMIT;
  END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE prDeletarDocente(varProntuario CHAR(7))
  BEGIN
    START TRANSACTION;
	  DELETE FROM tbldocente WHERE strProntuario = varProntuario;
	COMMIT;
  END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE prListarDocente()
  BEGIN
    START TRANSACTION;
	  SELECT d.dcCreated AS criado, d.dcModified AS modificado, d.strProntuario AS prontuario, d.strNome AS nome, d.strEscolaridade AS escolaridade, d.dtNascimento AS nascimento FROM tbldocente d;
	COMMIT;
  END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE prCriarDisciplina(varSigla CHAR(5), varNome VARCHAR(50))
  BEGIN
    START TRANSACTION;
	  INSERT INTO tbldisciplina(upkDisciplina, strSigla, strNome) VALUES (fnNovaChave(), varSigla, varNome);
	COMMIT;
  END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE prAtualizarDisciplina(varSiglaAtual CHAR(7), varSiglaNova CHAR(50), varNome VARCHAR(50))
  BEGIN
    START TRANSACTION;
	  UPDATE tbldisciplina SET strSigla = varSiglaNova WHERE strSigla = varSiglaAtual AND strNome = varNome;
	COMMIT;
  END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE prLerDisciplina(varSigla CHAR(5))
  BEGIN
    START TRANSACTION;
	  SELECT d.dcCreated AS criado, d.dcModified AS modificado, d.strSigla AS sigla, d.strNome AS nome FROM tbldisciplina d WHERE d.strSigla = varSigla;
	COMMIT;
  END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE prDeletarDisciplina(varSigla CHAR(5))
  BEGIN
    START TRANSACTION;
	  DELETE FROM tbldisciplina WHERE strSigla = varSigla;
	COMMIT;
  END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE prListarDisciplina()
  BEGIN
    START TRANSACTION;
	  SELECT d.dcCreated AS criado, d.dcModified AS modificado, d.strSigla AS sigla, d.strNome AS nome FROM tbldisciplina d;
	COMMIT;
  END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE prCriarTurma(varSigla CHAR(5), varDia ENUM("SEGUNDA", "TERCA", "QUARTA", "QUINTA", "SEXTA", "SABADO", "DOMINGO"), varPeriodo ENUM("MATUTINO", "VESPERTINO", "NOTURNO"))
  BEGIN
    START TRANSACTION;
	  INSERT INTO tblturma(upkTurma, strDia, strPeriodo) VALUES (fnNovaChave(), varDia, varPeriodo);
	  INSERT INTO relTurmaDisciplina(upkTurmaDisciplina, fkTurma, fkDisciplina) SELECT fnNovaChave(), LAST_INSERT_ID(), pkDisciplina FROM tbldisciplina WHERE strSigla = varSigla;
	COMMIT;
  END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE prListarTurma(varSigla CHAR(5))
  BEGIN
    START TRANSACTION;
	  SELECT t.dcCreated AS criado, t.dcModified AS modificado, d.strSigla AS sigla, t.strDia AS dia, t.strPeriodo AS periodo FROM tblturma t, relTurmaDisciplina td, tbldisciplina d WHERE t.pkTurma = td.fkTurma AND d.pkDisciplina = td.fkDisciplina AND d.strSigla = varSigla;
  END//
DELIMITER ;