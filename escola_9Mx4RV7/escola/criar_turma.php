<!DOCTYPE html>
<html lang="pt-br">
<head><meta charset="utf-8" /></head>
<body>
<?php 
// É preciso criar usuario e dar permissão conforme exemplo de cadastrar_disciplina.php

  include_once 'db.php';

  if(isset($_POST['codigo']) and strlen($_POST['codigo'])==2 and strlen($_POST['sigla'])>3){
    $sql = 'CALL buscar_disciplina("'.$_POST['sigla'].'");';
    // descomente a linha abaixo para ver o comando SQL executado
    // echo $sql.'<br />';
    $result = $mysqli->query($sql);
?><h2><?php
    if ($result->num_rows == 1){
      $sql = 'CALL criar_turma("'.$_POST['sigla'].'","'.$_POST['codigo'].'","'.$_POST['dia_da_semana'].'");';
      // descomente a linha abaixo para ver o comando SQL executado
      // echo $sql.'<br />';
      $mysqli->next_result();
      if (!$mysqli->query($sql)) echo 'Erro: ('.$mysqli->errno .') '.$mysqli->error;
      else echo 'Cadastrada Turma '.$_POST['codigo'].' na Disciplina '.$_POST['sigla'];
    }
    else {
      echo 'Disciplina não encontrada';
    }
?></h2><?php
  }
?>
  <p>
   <form action="criar_turma.php" method="POST">
    Disciplina: <input type="text" name="sigla" size="5" maxlength="5" minlength="3" />
    Código: <input type="text" name="codigo" size="2" maxlength="2" minlength="2" />
    Dia: <select name="dia_da_semana">
      <option value="2">Segunda-feira</option>
      <option value="3">Terça-feira</option>
      <option value="4">Quarta-feira</option>
      <option value="5">Quinta-feira</option>
      <option value="6">Sexta-feira</option>
      <option value="7">Sábado</option>
      <option value="1">Domingo</option>
    </select> 
    <input type="submit" name="cadastrar" value="Criar Turma" />
   </form>
  </p>
  <p>Obs.: Usar a sigla no caixa disciplina. Código da turma deve ter dois caracteres.</p>
  <p><a href="index.html">Voltar</a></p>
 </body>
</html>