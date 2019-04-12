<!DOCTYPE html>
<html lang="pt-br">
<head><meta charset="utf-8" /></head>
<body>
<?php 
// É preciso criar usuario e dar permissão conforme exemplo abaixo:
// CREATE USER secretaria@localhost IDENTIFIED BY 'senha';
// GRANT EXECUTE ON PROCEDURE dbEscola.prCriarDisciplina TO secretaria@localhost;

  include_once 'db.php';
  if(isset($_POST['sigla']) and strlen($_POST['sigla'])==5 and strlen($_POST['nome'])>3){
	  $sql = 'CALL prCriarDisciplina("'.$_POST['sigla'].'","'.$_POST['nome'].'");';
    // descomente a linha abaixo para ver o comando SQL executado
    //echo $sql.'<br />';
  ?><h2><?php
	  if (!$mysqli->query($sql)) {
        echo 'Erro: ('.$mysqli->errno .') '.$mysqli->error;
	  }
	  else echo 'Cadastrada/o Disciplina '.$_POST['nome'].' com a sigla '.$_POST['sigla'];
  ?></h2><?php
  }
?>
  <p>
   <form action="cadastrar_disciplina.php" method="POST">
    Sigla: <input style="text-transform: uppercase;" type="text" name="sigla" size="5" maxlength="5" minlength="5" />
    Nome: <input type="text" name="nome" size="20" maxlength="50" minlength="3" />
    <br /><input type="submit" name="cadastrar" value="Cadastrar Disciplina" />
   </form>
  </p>
  <p>Obs.: prontuário precisa ter sete caracteres e nome no mínimo três caracteres.</p>
  <p><a href="index.html">Início</a></p>
 </body>
</html>
