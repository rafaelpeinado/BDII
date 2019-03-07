CREATE DATABASE dbCepAberto;

USE dbCepAberto;

CREATE TABLE tblestado (
  pkEstado 	INTEGER NOT NULL PRIMARY KEY,
  strNome 	VARCHAR(20) NOT NULL,
  strSigla 	VARCHAR(2) NOT NULL UNIQUE
) ENGINE = MyISAM CHARACTER SET = utf8;

CREATE TABLE tblcidade (
  pkCidade 	INTEGER NOT NULL PRIMARY KEY,
  strNome 	VARCHAR(60) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8;

CREATE TABLE tblcep (
  pkCep 			CHAR(8) NOT NULL PRIMARY KEY,
  strLogradouro 	VARCHAR(150) NOT NULL,
  strBairro 		VARCHAR(80) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8;


CREATE TABLE relEstadoCidade (
  pkEstadoCidade 	INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  fkEstado 			INTEGER NOT NULL,
  fkCidade 			INTEGER NOT NULL,
  FOREIGN KEY(fkEstado) REFERENCES tblestado(pkEstado),
  FOREIGN KEY(fkCidade) REFERENCES tblcidade(pkCidade),
  UNIQUE(fkCidade)
) ENGINE = MyISAM;

CREATE TABLE relCidadeCep (
  pkCidadeCep 	INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  fkCep 		CHAR(8) NOT NULL,
  fkCidade 		INTEGER NOT NULL,
  FOREIGN KEY(fkCep) REFERENCES tblcep(pkCep),
  FOREIGN KEY(fkCidade) REFERENCES tblcidade(pkCidade),
  UNIQUE(fkCep)
) ENGINE = MyISAM;

CREATE TABLE relEstadoCep (
  pkEstadoCep 	INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  fkEstado 		INTEGER NOT NULL,
  fkCep 		CHAR(8) NOT NULL,
  FOREIGN KEY(fkEstado) REFERENCES tblestado(pkEstado),
  FOREIGN KEY(fkCep) REFERENCES tblcep(pkCep),
  UNIQUE(fkCep)
) ENGINE = MyISAM;


DESC tblcidade;
ALTER TABLE tblcidade ADD COLUMN dcCreated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER pkCidade;
ALTER TABLE tblcidade MODIFY COLUMN strNome VARCHAR(70) NOT NULL;
ALTER TABLE tblcidade DROP COLUMN dcCreated;


-- IMPORTAR DADOS
LOAD DATA INFILE "D://ARQUIVOS DOS ALUNOS//RAFAEL//07032019//cepaberto_XLupMw9//estados.cepaberto//states.csv" INTO TABLE tblestado FIELDS TERMINATED BY ','

-- quando o sistema for fechado a modelagem entidade relacionamento sempre terá problemas 


-- como fazer uma .csv
--- número decimais precisam ser separados por ponto Ex: 100837.34
--- se o conteúdo tem virgula, o dados precisam ser limitados por aspas Ex: "carro, casa, etc."
--- e se começar com aspas, colocar mais aspas Ex: ""eu, você, nós""

-- mysql dump