<!DOCTYPE html>
<html lang="pt-br">
<head><meta charset="utf-8" /></head>
<body>
<?php 
// É preciso criar usuario e dar permissão conforme exemplo de cadastrar_disciplina.php

  $result = 0;
  include_once 'db.php';

	$sql = 'CALL prListarDocente();';
    // descomente a linha abaixo para ver o comando SQL executado
    // echo $sql.'<br />';
	if ($result = $mysqli->query($sql))
        if ($result->num_rows){
          echo '
  <h2>Resultado</h2>
    <table border="1">
    <tr><th>Prontuário</th><th>Nome</th><th>Nascimento</th><th>Escolaridade</th><th>Inclusão</th><th>Atualização</th></tr>';
	  while ($row = $result->fetch_assoc()) {
		  $row['nascimento'] = implode('/',array_reverse(explode('-',$row['nascimento'])));
		  switch ($row['escolaridade']) {
			case "FUNDAMENTAL": $escolaridade = "Ensino Fundamental"; break;
			case "MEDIO": $escolaridade = "Ensino Médio"; break;
			case "TECNOLOGO": $escolaridade = "Tecnologia"; break;
			case "BACHARELADO": $escolaridade = "Bacharelado"; break;
			case "LICENCIATURA": $escolaridade = "Licenciatura"; break;
			case "MESTRADO": $escolaridade = "Mestrado"; break;
			case "DOUTORADO": $escolaridade = "Doutorado"; break;
			case "POSGRADUACAO": $escolaridade = "Especialização"; break;
			case "LIVREDOCENCIA": $escolaridade = "Livre Docência"; break;
		  }
            echo '    <tr><td>'.$row['prontuario'].'</td><td>'.$row['nome'].'</td><td>'.$row['nascimento'].'</td><td>'.$escolaridade.'</td><td>'.$row['criado'].'</td><td>'.$row['modificado'].'</td></tr>';
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
