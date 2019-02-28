CREATE DATABASE dbRevisao;

USE dbRevisao;

CREATE TABLE tblproprietario (
	pkProprietario INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	strNome VARCHAR(50) NOT NULL,
	strCpf CHAR(11) NOT NULL UNIQUE,
	dtNascimento DATE NOT NULL,
	strObservacao VARCHAR(200) NULL
) ENGINE = InnoDB CHARACTER SET = utf8;

CREATE TABLE tblpet (
	pkPet INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	strRga VARCHAR(10) NULL UNIQUE DEFAULT NULL, 
	strNome VARCHAR(50) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8;

CREATE TABLE relproprietariopet (
	-- chave primária em relacionamento? caso queira migrar de banco, verificar se os dados estão corretos na auditoria
	pkProprietarioPet INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	fkProprietario INTEGER NOT NULL,
	fkPet INTEGER NOT NULL REFERENCES tblpet (pkPet),
	FOREIGN KEY (fkProprietario) REFERENCES tblproprietario (pkProprietario),
	UNIQUE (fkProprietario, fkPet)
) ENGINE = InnoDB;


INSERT INTO tblproprietario 
VALUES (NULL, 'JOAQUIM RAMOS', '12345678911', '2000-03-20', 'OBSERVAÇÃO 1');
INSERT INTO tblproprietario 
VALUES (NULL, 'JOAQUINA ABREU', '12345678922', '1998-10-10', 'OBSERVAÇÃO 2');
INSERT INTO tblproprietario 
VALUES (NULL, 'RIVALDO SILVA', '12345678933', '1972-07-29', 'OBSERVAÇÃO 3');

INSERT INTO tblpet (strNome)
VALUES ('REX');
INSERT INTO tblpet
VALUES (NULL, '1234567890', 'CINDY');
INSERT INTO tblpet
VALUES (NULL, NULL, 'DUKE');

INSERT INTO relproprietariopet
VALUES (NULL, 1, 2);
INSERT INTO relproprietariopet
VALUES (NULL, 2, 3);
INSERT INTO relproprietariopet
VALUES (NULL, 3, 1);


-- MyiSAM
-- InnoDB

-- "" != NULL, pois null é um campo que nunca foi preenchido. enquanto "" é um campo preenchido por 0 caracteres

CREATE DATABASE dbNome;

USE dbNome;

-- ESTRUTURA MÍNIMA DE ENTIDADE
CREATE TABLE tblnome (
	pkNome INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	dcCreated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	dcModified DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP -- TRIGGER
	-- SE NÃO FOR REQUISITOS DO SISTEMA E SEMPRE COLOCA O DC
)	ENGINE = InnoDB CHARACTER SET = utf8;

-- ESTRUTURA DE RELACIONAMENTO
CREATE TABLE relproprietariopet (
	-- chave primária em relacionamento? caso queira migrar de banco, verificar se os dados estão corretos na auditoria
	pkProprietarioPet	INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	fkProprietario		INTEGER NOT NULL,
	fkPet				INTEGER NOT NULL,
	FOREIGN KEY (fkPet) REFERENCES tblpet (pkPet),
	FOREIGN KEY (fkProprietario) REFERENCES tblproprietario (pkProprietario),
	UNIQUE (fkProprietario, fkPet) -- ALTERAR CONFORME CARDINALIDADE, NESSE CASO n para n
	-- 1  2 <- ENTIDADE
	-- *..* UNIQUE(fkEntidade1, fkEntidade2)
	-- 1..1 UNIQUE(fkEntidade1), UNIQUE(fkEntidade2)
	-- 1..* UNIQUE(fkEntidade2)
) ENGINE = InnoDB;



-- sistemas elásticos
-- CREATE INDEX -- INDEX serve para fazer pesquisas mais rápidas
-- O UNIQUE já indexa os dados

-- METADADOS - informações dos dados/dados sobre dados - METADADOS PODEM classificar, ordenar, pesquisar e reutilizar dados
-- DUBLIN CORE - created, modified, deleted, creator, publisher


-- SHOW TABLES
-- SHOW CREATE TABLE tblproprietario
-- DESC tblproprietario


-- COLOCAR DC NAS TABELAS JA EXISTENTES
ALTER TABLE tblproprietario ADD COLUMN dcCreated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER pkProprietario;
ALTER TABLE tblproprietario ADD COLUMN dcModified DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP AFTER dcCreated;
UPDATE tblproprietario SET dcCreated = 0;
UPDATE tblproprietario SET dcModified = NULL;
UPDATE tblproprietario SET strNome = 'RIVALDO DA SIVLA' WHERE pkProprietario = 3;

