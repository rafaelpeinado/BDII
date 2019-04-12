<!DOCTYPE html>
<html lang="pt-br">
<head><meta charset="utf-8" /></head>
<body>
<?php 
// É preciso criar usuario e dar permissão conforme exemplo de cadastrar_disciplina.php

  $result = 0;
  include_once 'db.php';

  if(isset($_POST['codigo']) and strlen($_POST['codigo'])==2){
	  $sql = 'CALL listar_matriculas("'.$_POST['codigo'].'");';
    // descomente a linha abaixo para ver o comando SQL executado
    // echo $sql.'<br />';
	  if ($result = $mysqli->query($sql))
        if ($result->num_rows){
          echo '
    <table border="1">
    <tr><th>Disciplina</th><th>Turma</th><th>Data de matrícula</th><th>Prontuário</th></tr>';
          while ($row = $result->fetch_assoc()) {
            echo '    <tr><td>'.$row['sigla'].'</td><td>'.$row['codigo'].'</td><td>'.$row['data'].'</td><td>'.$row['prontuario'].'</td></tr>';
          }
          echo '  </table>';
        }
      else echo '<h3>Sem resultados</h3>'.date('d-m-Y H:i:s');
	  else {
  ?><h2><?php
      echo 'Erro: ('.$mysqli->errno .') '.$mysqli->error;
  ?></h2><?php
    }
  }
?>
  <p>
   <form action="listar_matriculas.php" method="POST">
    Código da turma: <input type="text" name="codigo" size="2" maxlength="2" minlength="2" />
    <input type="submit" name="listar" value="Listar Turmas" />
   </form>
  </p>
  <p>Obs: a sigla da disciplina deve ter cinco caracteres.</p>
  <p><a href="index.html">Início</a></p>
 </body>
</html>
