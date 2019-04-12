<!DOCTYPE html>
<html lang="pt-br">
<head><meta charset="utf-8" /></head>
<body>
<?php 
// É preciso criar usuario e dar permissão conforme exemplo de cadastrar_disciplina.php

  include_once 'db.php';
  if(isset($_POST['sigla']) and strlen($_POST['sigla'])==5){
	  $sql = 'CALL prCriarTurma("'.$_POST['sigla'].'","'.$_POST['dia'].'","'.$_POST['periodo'].'");';
    // descomente a linha abaixo para ver o comando SQL executado
    // echo $sql.'<br />';
  ?><h2><?php
	  if (!$mysqli->query($sql)) {
        echo 'Erro: ('.$mysqli->errno .') '.$mysqli->error;
	  }
	  else echo 'Cadastrada/o turma de '.$_POST['sigla'];
  ?></h2><?php
  }
?>
  <p>
   <form action="cadastrar_turma.php" method="POST">
    Disciplina: <select name="sigla">
<?php  
   $sql = 'CALL prListarDisciplina();';
   if ($result = $mysqli->query($sql))
   if ($result->num_rows){
      while ($row = $result->fetch_assoc()) {
        echo '   <option value="'.$row['sigla'].'">'.$row['nome'].'</option>';
      }
   }
   else echo '<h3>Sem resultados</h3>'.date('d-m-Y H:i:s');
?>  </select>
    Dia: <select name="dia">
      <option value="SEGUNDA">Segunda-feira</option>
      <option value="TERÇA">Terça-feira</option>
      <option value="QUARTA">Quarta-feira</option>
      <option value="QUINTA">Quinta-feira</option>
      <option value="SEXTA">Sexta-feira</option>
      <option value="SABADO">Sábado</option>
      <option value="DOMINGO">Domingo</option>
    </select>
    Período: <select name="periodo">
      <option value="MATUTINO">Manhã</option>
      <option value="VESPERTINO">Tarde</option>
      <option value="NOTURNO">Noite</option>
    </select>
    <br /><input type="submit" name="cadastrar" value="Cadastrar Turma" />
   </form>
  </p>
  <p><a href="index.html">Início</a></p>
 </body>
</html>
