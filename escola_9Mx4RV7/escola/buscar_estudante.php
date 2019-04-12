<!DOCTYPE html>
<html lang="pt-br">
<head><meta charset="utf-8" /></head>
<body>
<?php 
// É preciso criar usuario e dar permissão conforme exemplo de cadastrar_disciplina.php

  $result = 0;
  include_once 'db.php';

  if(isset($_POST['prontuario']) and strlen($_POST['prontuario'])>4){
	  $sql = 'CALL buscar_estudante("'.$_POST['prontuario'].'");';
    // descomente a linha abaixo para ver o comando SQL executado
    // echo $sql.'<br />';
  ?><h2><?php
	  if ($result = $mysqli->query($sql))
      $row = $result->fetch_assoc();
	  else {
      echo 'Erro: ('.$mysqli->errno .') '.$mysqli->error;
    }
  ?></h2><?php
    if (isset($_POST['prontuario'])){
      if ($result->num_rows){
        echo '
  <h2>Resultado</h2>
    <table border="1">
    <tr><th>Prontuário</th><th>Nome</th><th>Criado</th><th>Modificado</th></tr>';
        echo '    <tr><td>'.$row['prontuario'].'</td><td>'.$row['nome'].'</td><td>'.$row['criado'].'</td><td>'.$row['modificado'].'</td></tr>';
        echo '  </table>';
      }
      else echo '<h3>Sem resultados</h3>'.date('d-m-Y H:i:s');
    }
  }
?>
  <p>
   <form action="buscar_estudante.php" method="POST">
    Prontuário: <input type="text" name="prontuario" size="10" maxlength="10" minlength="5" />
    <input type="submit" name="cadastrar" value="Buscar Estudante" />
   </form>
  </p>
  <p><a href="index.html">Início</a></p>
 </body>
</html>
