<!DOCTYPE html>
<html lang="pt-br">
<head><meta charset="utf-8" /></head>
<body>
<?php 
// É preciso criar usuario e dar permissão conforme exemplo de cadastrar_disciplina.php
  $result = 0;
  include_once 'db.php';
  if (isset($_POST['sigla'])) {
	  $sql = 'CALL prListarTurma("'.$_POST['sigla'].'");';
	  //$sql = 'CALL prListarTurma();';
	  // echo $sql.'<br />';
	  if ($result = $mysqli->query($sql))
		  if ($result->num_rows){
			  echo '<caption><h3>Disciplina: '.$_POST['sigla'].'</h3></caption>
			        <table border="1">
					<tr><th>Dia</th><th>Período</th><th>Criado</th><th>Modificado</th></tr>';
			  while ($row = $result->fetch_assoc()) {
				  echo '    <tr><td>'.$row['dia'].'</td><td>'.$row['periodo'].'</td><td>'.$row['criado'].'</td><td>'.$row['modificado'].'</td></tr>';
			  }
		      echo '  </table>';
		  }
		  else echo '<h3>Sem disciplinas '.strtoupper($_POST['sigla']).' cadastradas em '.date('d-m-Y H:i:s').'</h3>';
	  else {
		  ?><h2><?php
		  echo 'Erro: ('.$mysqli->errno .') '.$mysqli->error;
		  ?></h2><?php
	  }
  }

?>
 <p>
   <form action="listar_turmas.php" method="POST">
    Sigla: <input style="text-transform: uppercase;" type="text" name="sigla" size="5" maxlength="5" minlength="5" />
    <input type="submit" name="pesquisar" value="Pesquisar turmas" />
   </form>
  </p>
  <p><a href="index.html">Voltar</a></p>
 </body>
</html>
