<!DOCTYPE html>
<html lang="pt-br">
<head><meta charset="utf-8" /></head>
<body>
<?php 
// É preciso criar usuario e dar permissão conforme exemplo de cadastrar_disciplina.php
  
  
  
  $botao = '<input type="submit" name="cadastrar" value="Cadastrar Estudante" />';
  $prontuario = '';
  $prontuario_tipo = 'text';
  $nome = '';
  $dia = '';
  $mes = '';
  $ano = '';
  $obs = 'Obs.: prontuário precisa ter sete caracteres e nome no mínimo três caracteres.';
  
  include_once 'db.php';
  
  // deletando dados
  if(isset($_GET['deletar']) and strlen($_GET['deletar'])>6){
	  $sql = 'CALL prDeletarEstudante("'.$_GET['deletar'].'");';
    // descomente a linha abaixo para ver o comando SQL executado
    // echo $sql.'<br />';
  ?><h2><?php
	  if (!$mysqli->query($sql)) {
        echo 'Erro: ('.$mysqli->errno .') '.$mysqli->error;
	  }
	  else echo 'Deletada/o Estudante com o Prontuário '.$_GET['deletar'];
  ?></h2><?php
  }

  // atualizando dados
  if(isset($_GET['atualizar']) and strlen($_GET['atualizar'])>6){
	  $sql = 'CALL prLerEstudante("'.$_GET['atualizar'].'");';
    // descomente a linha abaixo para ver o comando SQL executado
    // echo $sql.'<br />';
  ?><h2><?php
	  if (!($result=$mysqli->query($sql))) {
        echo 'Erro: ('.$mysqli->errno .') '.$mysqli->error;
	  }
	  else $row = $result->fetch_assoc();
	  $botao = '<input type="submit" name="atualizar" value="Atualizar Estudante" />';
	  $prontuario = $row['prontuario'];
      $prontuario_tipo = 'hidden';
	  list($ano, $mes, $dia) = explode('-',$row['nascimento']);
	  $nome = $row['nome'];
	  $obs = '';
	  
  ?></h2><?php
  }
  if(isset($_POST['atualizar']) and isset($_POST['prontuario']) and strlen($_POST['prontuario'])>6 and strlen($_POST['nome'])>2){
	  $sql = 'CALL prAtualizarEstudante("'.strtoupper($_POST['prontuario']).'","'.$_POST['nome'].'","'.$_POST['ano'].'-'.$_POST['mes'].'-'.$_POST['dia'].'");';
    // descomente a linha abaixo para ver o comando SQL executado
    // echo $sql.'<br />';
  ?><h2><?php
	  if (!$mysqli->query($sql)) {
        echo 'Erro: ('.$mysqli->errno .') '.$mysqli->error;
	  }
	  else echo 'Atualizada/o Estudante '.$_POST['nome'].' com o Prontuário '.$_POST['prontuario'];
  ?></h2><?php
  }


  
  // cadastrando estudante
  if(isset($_POST['cadastrar']) and isset($_POST['prontuario']) and strlen($_POST['prontuario'])>6 and strlen($_POST['nome'])>2){
	  $sql = 'CALL prCriarEstudante("'.strtoupper($_POST['prontuario']).'","'.$_POST['nome'].'","'.$_POST['ano'].'-'.$_POST['mes'].'-'.$_POST['dia'].'");';
    // descomente a linha abaixo para ver o comando SQL executado
    // echo $sql.'<br />';
  ?><h2><?php
	  if (!$mysqli->query($sql)) {
        echo 'Erro: ('.$mysqli->errno .') '.$mysqli->error;
	  }
	  else echo 'Cadastrada/o Estudante '.$_POST['nome'].' com o Prontuário '.$_POST['prontuario'];
  ?></h2><?php
  }
?>
  <p>
   <form action="cadastrar_estudante.php" method="POST">
    Prontuário: <input style="text-transform: uppercase;" type="<?php echo $prontuario_tipo; ?>" name="prontuario" size="7" maxlength="7" minlength="7" value="<?php echo $prontuario; ?>" /><?php echo $prontuario; ?>
    Nome: <input type="text" name="nome" size="20" maxlength="50" minlength="3" value="<?php echo $nome; ?>" />
	Nascimento: <input type="text" name="dia" size="2" minlength="2" value="<?php echo $dia; ?>" /> / <input type="text" name="mes" size="2" minlength="2" value="<?php echo $mes; ?>" /> / <input type="text" name="ano" size="4" minlength="4" value="<?php echo $ano; ?>" />
    <br /><?php echo $botao; ?>
   </form>
  </p>
  <p><?php echo $obs; ?></p>
  <p><a href="index.html">Início</a></p>
 </body>
</html>
