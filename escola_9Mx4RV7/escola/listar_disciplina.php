<!DOCTYPE html>
<html lang="pt-br">
<head><meta charset="utf-8" /></head>
<body>
<?php 
// É preciso criar usuario e dar permissão conforme exemplo de cadastrar_disciplina.php

  $result = 0;
  include_once 'db.php';

	$sql = 'CALL prListarDisciplina();';
    // descomente a linha abaixo para ver o comando SQL executado
    // echo $sql.'<br />';
	if ($result = $mysqli->query($sql))
        if ($result->num_rows){
          echo '
  <h2>Resultado</h2>
    <table border="1">
    <tr><th>Sigla</th><th>Nome</th><th>Inclusão</th><th>Atualização</th></tr>';
	  while ($row = $result->fetch_assoc()) {
            echo '    <tr><td>'.$row['sigla'].'</td><td>'.$row['nome'].'</td><td>'.$row['criado'].'</td><td>'.$row['modificado'].'</td></tr>';
          }
          echo '  </table>';
      }
      else echo '<h3>Sem resultados</h3>'.date('d-m-Y H:i:s');
	  else {
  ?><h2><?php
      echo 'Erro: ('.$mysqli->errno .') '.$mysqli->error;
  ?></h2><?php
  }
?>
  <p><a href="index.html">Início</a></p>
 </body>
</html>
