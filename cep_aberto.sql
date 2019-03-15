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
  -- fazer pk autoincrement e criar strCep
  pkCep 			CHAR(8) NOT NULL PRIMARY KEY,
  strLogradouro 	VARCHAR(150) NOT NULL,
  strBairro 		VARCHAR(80) NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8;


CREATE TABLE relestadocidade (
  pkEstadoCidade 	INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  fkEstado 			INTEGER NOT NULL,
  fkCidade 			INTEGER NOT NULL,
  FOREIGN KEY(fkEstado) REFERENCES tblestado(pkEstado),
  FOREIGN KEY(fkCidade) REFERENCES tblcidade(pkCidade),
  UNIQUE(fkCidade)
) ENGINE = MyISAM;

CREATE TABLE relcidadecep (
  pkCidadeCep 	INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  fkCep 		CHAR(8) NOT NULL,
  fkCidade 		INTEGER NOT NULL,
  FOREIGN KEY(fkCep) REFERENCES tblcep(pkCep),
  FOREIGN KEY(fkCidade) REFERENCES tblcidade(pkCidade),
  UNIQUE(fkCep)
) ENGINE = MyISAM;

CREATE TABLE relestadocep (
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
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/states.csv" INTO TABLE tblestado FIELDS TERMINATED BY ',' (pkEstado, strNome, strSigla);
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cities.csv" INTO TABLE tblcidade FIELDS TERMINATED BY ',' (pkCidade, strNome);
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sp.cepaberto_parte_4.csv" INTO TABLE tblcep FIELDS TERMINATED BY ',' (pkCep, strLogradouro, strBairro);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cities.csv" INTO TABLE relestadocidade FIELDS TERMINATED BY ',' (fkCidade, @dummy, fkEstado);
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sp.cepaberto_parte_4.csv" INTO TABLE relcidadecep FIELDS TERMINATED BY ',' (fkCep, @dummy, @dummy2, fkCidade, @dummy3);
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sp.cepaberto_parte_4.csv" INTO TABLE relestadocep FIELDS TERMINATED BY ',' (fkCep, @dummy, @dummy2, @dummy3, fkEstado);
-- após mudanças
-- LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sp.cepaberto_parte_4.csv" INTO TABLE relestadocep FIELDS TERMINATED BY ',' ENCLOSED BY '"' (@cep, @dummy, @dummy2, @dummy3, fkEstado) SET fkCep = (SELECT pkCep FROM tblcep WHERE strCEP = @cep);

-- quando o sistema for fechado a modelagem entidade relacionamento sempre terá problemas 


-- como fazer uma .csv
--- número decimais precisam ser separados por ponto Ex: 100837.34
--- se o conteúdo tem virgula, o dados precisam ser limitados por aspas Ex: "carro, casa, etc."
--- e se começar com aspas, colocar mais aspas Ex: ""eu, você, nós""

-- mysql dump

select c.pkCep, c.strLogradouro, c.strBairro, ci.strNome, e.strNome, e.strSigla from tblcep c, tblcidade ci, tblestado e, relcidadecep rcc, relestadocep rec, relestadocidade reci
where  rcc.fkCep = c.pkCep
and rcc.fkCidade = ci.pkCidade
and rec.fkCep = pkCep
and rec.fkEstado = pkEstado
and reci.fkCidade = pkCidade
and reci.fkEstado = pkEstado
and pkCep = 13271603;