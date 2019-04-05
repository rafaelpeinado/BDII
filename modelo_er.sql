CREATE DATABASE dbEscola;

USE dbEscola;

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

CREATE FUNCTION fnNovaChave() RETURNS BINARY(16) DETERMINISTIC
   RETURN UNHEX(REPLACE(UUID(), '-', ''));

DELIMITER //
CREATE PROCEDURE prCadastrarDocente (OUT varProntuario VARCHAR(7), varNome VARCHAR(50), varEscolaridade VARCHAR(200), varNascimento DATE)
	 BEGIN
		 START TRANSACTION; -- se tiver só uma query, é preciosismo
			 INSERT INTO tbldocente(upkDocente, strProntuario, strNome, strEscolaridade, dtNascimento) VALUES (fnNovaChave(), varProntuario, varNome, varEscolaridade, varNascimento);
			 COMMIT;
	 END//
DELIMITER;

CALL prCadastrarDocente ("SP1234567", "ANA MARIA BRAGA", "SUPERIOR", "1923-10-12");


-- funcionando a partir daqui errado ainda
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
  strEscolaridade 	ENUM('Ensino Fundamental', 'Ensino Médio', 'Tecnologia', 'Bacharelado', 'Licenciatura', 'Especialização', 'Mestrado', 'Doutorado', 'Livre Docência')
) ENGINE = InnoDB CHARACTER SET = utf8;

CREATE TABLE tblturma (
  pkTurma 		INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  upkTurma 		BINARY(16) NOT NULL,
  dcCreated 	DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dcModified 	DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  dtDia 		DATE NOT NULL,
  strPeriodo 	VARCHAR(15) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8;

CREATE TABLE tbldisciplina (
  pkDisciplina 		INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  upkDisciplina 	BINARY(16) NOT NULL,
  dcCreated 		DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dcModified 		DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  strSigla 			VARCHAR(10) NOT NULL UNIQUE,
  fkTurma 			INTEGER NOT NULL,
  FOREIGN KEY (fkTurma) REFERENCES tblturma(pkTurma) 			
) ENGINE = InnoDB CHARACTER SET = utf8;

CREATE FUNCTION fnNovaChave() RETURNS BINARY(16) DETERMINISTIC
   RETURN UNHEX(REPLACE(UUID(), '-', ''));
   
INSERT INTO tblestudante(upkEstudante, strProntuario, strNome, dtNascimento) VALUES (fnNovaChave(), "1234567", "RAFAEL SILVA", "1997-03-28");
INSERT INTO tblestudante(upkEstudante, strProntuario, strNome, dtNascimento) VALUES (fnNovaChave(), "9876543", "AMANDA SOUZA", "1999-09-04");
INSERT INTO tblestudante(upkEstudante, strProntuario, strNome, dtNascimento) VALUES (fnNovaChave(), "1237896", "JOSÉ ANTÔNIO", "1980-05-09");

INSERT INTO tbldocente(upkDocente, strProntuario, strNome, dtNascimento, strEscolaridade) VALUES (fnNovaChave(), "4567893", "OSCAR OLIVEIRA", "1972-06-21", "MESTRADO");
INSERT INTO tbldocente(upkDocente, strProntuario, strNome, dtNascimento, strEscolaridade) VALUES (fnNovaChave(), "8529637", "MARIA APARECIDA", "1965-06-24", "DOUTORADO");
INSERT INTO tbldocente(upkDocente, strProntuario, strNome, dtNascimento, strEscolaridade) VALUES (fnNovaChave(), "1472583", "SILVANA PEREIRA", "1980-06-29", "Especialização");

INSERT INTO tblturma(upkTurma, dtDia, strPeriodo) VALUES (fnNovaChave(), "2019-03-01", "NOTURNO");

INSERT INTO tbldisciplina(upkDisciplina, strSigla, fkTurma) VALUES (fnNovaChave(), "DB2A3", 1);

/*DELIMITER //
CREATE PROCEDURE prCadastrarDocente (varProntuario CHAR(7), varNome VARCHAR(50), varEscolaridade VARCHAR(200), varNascimento DATE)
	 BEGIN
		 START TRANSACTION; -- se tiver só uma query, é preciosismo
			 INSERT INTO tbldocente(upkDocente, strProntuario, strNome, strEscolaridade, dtNascimento) VALUES (fnNovaChave(), varProntuario, varNome, varEscolaridade, varNascimento);
		 COMMIT;
	 END//
DELIMITER ;	

CALL prCadastrarDocente ("1234567", "ANA MARIA BRAGA", "SUPERIOR", "1923-10-12");*/

DELIMITER //
CREATE PROCEDURE prCriarEstudante(varProntuario CHAR(7), varNome VARCHAR(50), varNascimento DATE)
  BEGIN
    START TRANSACTION;
	  INSERT INTO tblestudante(upkEstudante, strProntuario, strNome, dtNascimento) VALUES (fnNovaChave(), varProntuario, varNome, varNascimento);
	COMMIT;
  END//
DELIMITER ;

CALL prCriarEstudante("3216547", "ANTONIO VIEIRA", "1968-08-27");

DELIMITER //
CREATE PROCEDURE prAtualizarEstudante(varProntuario CHAR(7), varNome VARCHAR(50), varNascimento DATE)
  BEGIN
    START TRANSACTION;
	  UPDATE tblestudante SET strNome = varNome, dtNascimento = varNascimento WHERE strProntuario = varProntuario;
	COMMIT;
  END//
DELIMITER ;

CALL prAtualizarEstudante("3216547", "ANTONIO VIEIRA DA SILVA", "1968-08-27");

DELIMITER //
CREATE PROCEDURE prLerEstudante(varProntuario CHAR(7))
  BEGIN
    START TRANSACTION;
	  SELECT e.dcCreated, e.dcModified, e.strProntuario, e.strNome, e.dtNascimento FROM tblestudante e WHERE e.strProntuario = varProntuario;
	COMMIT;
  END//
DELIMITER ;

CALL prLerEstudante("3216547");

DELIMITER //
CREATE PROCEDURE prDeletarEstudante(varProntuario CHAR(7))
  BEGIN
    START TRANSACTION;
	  DELETE FROM tblestudante WHERE strProntuario = varProntuario;
	COMMIT;
  END//
DELIMITER ;

CALL prDeletarEstudante("3216547");

DELIMITER //
CREATE PROCEDURE prListarEstudante()
  BEGIN
    START TRANSACTION;
	  SELECT e.dcCreated, e.dcModified, e.strProntuario, e.strNome, e.dtNascimento FROM tblestudante e;
	COMMIT;
  END//
DELIMITER ;

CALL prListarEstudante();

DELIMITER //
CREATE PROCEDURE prCriarDocente(varProntuario CHAR(7), varNome VARCHAR(50), varNascimento DATE, varEscolaridade ENUM('Ensino Fundamental', 'Ensino Médio', 'Tecnologia', 'Bacharelado', 'Licenciatura', 'Especialização', 'Mestrado', 'Doutorado', 'Livre Docência'))
  BEGIN
    START TRANSACTION;
	  INSERT INTO tbldocente(upkDocente, strProntuario, strNome, dtNascimento, strEscolaridade) VALUES (fnNovaChave(), varProntuario, varNome, varNascimento, varEscolaridade);
	COMMIT;
  END//
DELIMITER ;

CALL prCriarDocente("9872243", "THIAGO XAVIER", "1992-03-10", "Bacharelado");

DELIMITER //
CREATE PROCEDURE prAtualizarDocente(varProntuario CHAR(7), varNome VARCHAR(50), varNascimento DATE, varEscolaridade ENUM('Ensino Fundamental', 'Ensino Médio', 'Tecnologia', 'Bacharelado', 'Licenciatura', 'Especialização', 'Mestrado', 'Doutorado', 'Livre Docência'))
  BEGIN
    START TRANSACTION;
	  UPDATE tbldocente SET strNome = varNome, dtNascimento = varNascimento, strEscolaridade = varEscolaridade WHERE strProntuario = varProntuario;
	COMMIT;
  END//
DELIMITER ;

CALL prAtualizarDocente("9872243", "THIAGO XAVIER DA SILVA", "1992-03-10", "Bacharelado");

DELIMITER //
CREATE PROCEDURE prDeletarDocente(varProntuario CHAR(7))
  BEGIN
    START TRANSACTION;
	  DELETE FROM tbldocente WHERE strProntuario = varProntuario;
	COMMIT;
  END//
DELIMITER ;

CALL prDeletarDocente("4567893");

DELIMITER //
CREATE PROCEDURE prListarDocente()
  BEGIN
    START TRANSACTION;
	  SELECT d.dcCreated, d.dcModified, d.strProntuario, d.strNome, d.strEscolaridade, d.dtNascimento FROM tbldocente d;
	COMMIT;
  END//
DELIMITER ;

CALL prListarDocente();

