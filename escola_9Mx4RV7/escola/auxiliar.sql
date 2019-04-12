CREATE USER secretaria@localhost IDENTIFIED BY 'senha';
GRANT EXECUTE ON PROCEDURE dbEscola.prListarEstudante TO secretaria@localhost;
GRANT EXECUTE ON PROCEDURE dbEscola.prListarDisciplina TO secretaria@localhost;
GRANT EXECUTE ON PROCEDURE dbEscola.prListarTurma TO secretaria@localhost;
GRANT EXECUTE ON PROCEDURE dbEscola.prCriarEstudante TO secretaria@localhost;
GRANT EXECUTE ON PROCEDURE dbEscola.prLerEstudante TO secretaria@localhost;
GRANT EXECUTE ON PROCEDURE dbEscola.prAtualizarEstudante TO secretaria@localhost;

DELIMITER $$

CREATE PROCEDURE prListarTurma(atrSigla CHAR(5))
BEGIN
    SELECT
        t.dcCreated AS criado,
        t.dcModified AS modificado,
        d.strSigla AS sigla,
        t.strDia AS dia,
        t.strPeriodo AS periodo
                FROM dbEscola.tblTurma AS t
                JOIN dbEscola.relDisciplinaTurma AS r ON r.fkTurma = t.pkTurma
                JOIN dbEscola.tblDisciplina AS d ON d.pkDisciplina = r.fkDisciplina
		WHERE d.strSigla = atrSigla;
END$$

DELIMITER ;
