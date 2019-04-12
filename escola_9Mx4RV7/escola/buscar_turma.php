<!DOCTYPE html>
<html lang="pt-br">
<head><meta charset="utf-8" /></head>
<body>
<?php 
// É preciso criar usuario e dar permissão conforme exemplo de cadastrar_disciplina.php

  $result = 0;
  include_once 'db.php';

  if(isset($_POST['codigo']) and strlen($_POST['codigo'])==2){
	  $sql = 'CALL buscar_turma("'.$_POST['codigo'].'");';
    // descomente a linha abaixo para ver o comando SQL executado
    // echo $sql.'<br />';
  ?><h2><?php
	  if ($result = $mysqli->query($sql))
      $row = $result->fetch_assoc();
	  else {
      echo 'Erro: ('.$mysqli->errno .') '.$mysqli->error;
    }
  ?></h2><?php
    if (isset($_POST['codigo'])){
      if ($result->num_rows){
        echo '
  <h2>Resultado</h2>
    <table border="1">
    <tr><th>Código</th><th>Criado</th><th>Modificado</th></tr>';
        echo '    <tr><td>'.$row['codigo'].'</td><td>'.$row['criado'].'</td><td>'.$row['modificado'].'</td></tr>';
        echo '  </table>';
      }
      else echo '<h3>Sem resultados</h3>'.date('d-m-Y H:i:s');
    }
  }
?>
  <p>
   <form action="buscar_turma.php" method="POST">
    Código: <input type="text" name="codigo" size="2" maxlength="2" minlength="2" />
    <input type="submit" name="cadastrar" value="Buscar Turma" />
   </form>
  </p>
  <p><a href="index.html">Início</a></p>
 </body>
</html>
