
DELIMITER $$
 CREATE PROCEDURE listar_matriculas(param_codigo char(2))
  BEGIN
    SELECT estudante.prontuario, matricula.data, turma.codigo, disciplina.sigla FROM turma
    LEFT JOIN matricula_turma ON turma.pkTurma = matricula_turma.fkTurma
    LEFT JOIN estudante_matricula ON estudante_matricula.fkMatricula = matricula_turma.fkMatricula
    LEFT JOIN matricula ON estudante_matricula.fkMatricula = matricula.pkMatricula
    LEFT JOIN disciplina_turma ON turma.pkTurma = disciplina_turma.fkTurma
    LEFT JOIN estudante ON estudante_matricula.fkEstudante = estudante.pkEstudante
    LEFT JOIN disciplina ON disciplina_turma.fkDisciplina = disciplina.pkDisciplina
    WHERE turma.codigo LIKE CONCAT('%',param_codigo,'%');
  END$$
DELIMITER ;




DELIMITER $$
 CREATE PROCEDURE listar_turmas(param_sigla char(5))
  BEGIN
    SELECT disciplina.sigla, turma.codigo, turma.dia_da_semana FROM disciplina
	RIGHT JOIN disciplina_turma ON disciplina.pkDisciplina = disciplina_turma.fkDisciplina
	RIGHT JOIN turma ON disciplina_turma.fkTurma = turma.pkTurma
	WHERE disciplina.sigla LIKE CONCAT('%',param_sigla,'%');
  END$$
DELIMITER ;

DELIMITER $$
 CREATE PROCEDURE listar_estudantes(param_nome varchar(50))
  BEGIN
    SELECT prontuario, nome FROM estudante WHERE nome LIKE CONCAT('%',param_nome,'%');
  END$$
DELIMITER ;

DELIMITER $$
 CREATE PROCEDURE buscar_turma(param_codigo CHAR(2))
  BEGIN
   START TRANSACTION;
    SELECT codigo, created AS criado, modified AS modificado FROM turma WHERE codigo = param_codigo;
   COMMIT;
  END$$
DELIMITER ;

DELIMITER $$
 CREATE PROCEDURE buscar_estudante(param_prontuario CHAR(10))
  BEGIN
   START TRANSACTION;
    SELECT created AS criado, modified AS modificado, prontuario, nome FROM estudante WHERE prontuario = param_prontuario;
   COMMIT;
  END$$
DELIMITER ;

DELIMITER $$
 CREATE PROCEDURE buscar_matricula(param_prontuario CHAR(10), param_codigo CHAR(2))
  BEGIN
   START TRANSACTION;
    SELECT estudante.prontuario, turma.codigo, disciplina.sigla, matricula.data
    FROM estudante 
    LEFT JOIN estudante_matricula ON estudante.pkEstudante = estudante_matricula.fkEstudante
    LEFT JOIN matricula ON estudante_matricula.fkMatricula = matricula.pkMatricula
    LEFT JOIN matricula_turma ON matricula.pkMatricula = matricula_turma.fkMatricula
    LEFT JOIN turma ON matricula_turma.fkTurma = turma.pkTurma
    LEFT JOIN disciplina_turma ON turma.pkTurma = disciplina_turma.fkTurma
    LEFT JOIN disciplina ON disciplina_turma.fkDisciplina = disciplina.pkDisciplina
    WHERE estudante.prontuario = param_prontuario AND turma.codigo = param_codigo;
   COMMIT;
  END$$
DELIMITER ;

DELIMITER $$
 CREATE PROCEDURE cadastrar_estudante(param_prontuario CHAR(10), param_nome VARCHAR(50))
  BEGIN
   START TRANSACTION;
    INSERT INTO estudante (prontuario, nome) VALUES (param_prontuario, param_nome);
   COMMIT;
  END$$
DELIMITER ;

DELIMITER $$
 CREATE PROCEDURE criar_turma(param_sigla CHAR(5), param_codigo CHAR(2), param_dia ENUM('1','2','3','4','5','6','7'))
  BEGIN
   START TRANSACTION;
    INSERT INTO turma (codigo, dia_da_semana) VALUES (param_codigo, param_dia);
    INSERT INTO disciplina_turma (fkDisciplina, fkTurma)
    SELECT pkDisciplina, LAST_INSERT_ID() FROM disciplina WHERE sigla = param_sigla;
   COMMIT;
  END$$
DELIMITER ;

DELIMITER $$
 CREATE PROCEDURE buscar_disciplina(param_sigla CHAR(5))
  BEGIN
   START TRANSACTION;
    SELECT sigla, created AS criado, modified AS modificado FROM disciplina WHERE sigla = param_sigla;
   COMMIT;
  END$$
DELIMITER ;

DELIMITER $$
 CREATE PROCEDURE cadastrar_disciplina(param_sigla CHAR(5))
  BEGIN
   START TRANSACTION;
    INSERT INTO disciplina (created, sigla) VALUES (NOW(), param_sigla);
   COMMIT;
  END$$
DELIMITER ;

SELECT turma.codigo AS turma, COUNT(pkMatricula) AS quantidade
FROM disciplina
LEFT JOIN disciplina_turma ON disciplina.pkDisciplina = disciplina_turma.fkDisciplina
LEFT JOIN turma ON turma.pkTurma = disciplina_turma.fkturma
LEFT JOIN matricula_turma ON turma.pkTurma = matricula_turma.fkturma
LEFT JOIN matricula ON matricula_turma.fkMatricula = matricula.pkMatricula
WHERE disciplina.sigla = 'b1sgb'
GROUP BY turma
ORDER BY quantidade ASC
LIMIT 1
;

START TRANSACTION;


  INSERT matricula (created, data) VALUES (NOW(), NOW());

  INSERT estudante_matricula (fkEstudante, fkMatricula)
  SELECT pkEstudante AS estudante, LAST_INSERT_ID() AS matricula FROM estudante WHERE prontuario = 'SP5555555';

  INSERT matricula_turma (fkMatricula,fkTurma)
  SELECT estudante_matricula.fkMatricula, turma.pkTurma AS turma
  FROM disciplina JOIN estudante JOIN estudante_matricula
  LEFT JOIN disciplina_turma ON disciplina.pkDisciplina = disciplina_turma.fkDisciplina
  LEFT JOIN turma ON turma.pkTurma = disciplina_turma.fkturma
  LEFT JOIN matricula_turma ON turma.pkTurma = matricula_turma.fkturma
  LEFT JOIN matricula ON matricula_turma.fkMatricula = matricula.pkMatricula
  WHERE disciplina.sigla = 'b1sgb' AND estudante.prontuario = 'SP5555555' AND pkEstudanteMatricula = LAST_INSERT_ID()
  GROUP BY turma
  ORDER BY COUNT(pkMatricula) ASC
  LIMIT 1;

COMMIT;

