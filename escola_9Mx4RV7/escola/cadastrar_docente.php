<!DOCTYPE html>
<html lang="pt-br">
<head><meta charset="utf-8" /></head>
<body>
<?php 
// É preciso criar usuario e dar permissão conforme exemplo de cadastrar_disciplina.php

  include_once 'db.php';
  if(isset($_POST['prontuario']) and strlen($_POST['prontuario'])>6 and strlen($_POST['nome'])>2){
	  $sql = 'CALL prCriarDocente("'.strtoupper($_POST['prontuario']).'","'.$_POST['nome'].'","'.$_POST['ano'].'-'.$_POST['mes'].'-'.$_POST['dia'].'","'.$_POST['escolaridade'].'");';
    // descomente a linha abaixo para ver o comando SQL executado
    // echo $sql.'<br />';
  ?><h2><?php
	  if (!$mysqli->query($sql)) {
        echo 'Erro: ('.$mysqli->errno .') '.$mysqli->error;
	  }
	  else echo 'Cadastrada/o Docente '.$_POST['nome'].' com o Prontuário '.$_POST['prontuario'];
  ?></h2><?php
  }
?>
  <p>
   <form action="cadastrar_docente.php" method="POST">
    Prontuário: <input style="text-transform: uppercase;" type="text" name="prontuario" size="7" maxlength="7" minlength="7" />
    Nome: <input type="text" name="nome" size="20" maxlength="50" minlength="3" />
    Nascimento: <input type="text" name="dia" size="2" minlength="2" /> / <input type="text" name="mes" size="2" minlength="2" /> / <input type="text" name="ano" size="4" minlength="4" />
    Escolaridadade: <select name="escolaridade">
     <optgroup label="Ensino Básico">
      <option value="FUNDAMENTAL">Ensino Fundamental</option>
      <option value="MEDIO">Ensino Médio</option>
     </optgroup>
     <optgroup label="Ensino Superior">
      <option value="TECNOLOGO">Tecnologia</option>
      <option value="BACHARELADO">Bacharelado</option>
      <option value="LICENCIATURA">Licenciatura</option>
     </optgroup>
     <optgroup label="Pós-Graduação">
      <option value="POSGRADUACAO" selected="selected">Especialização</option>
      <option value="MESTRADO">Mestrado</option>
      <option value="DOUTORADO">Doutorado</option>
      <option value="LIVREDOCENCIA">Livre Docência</option>
     </optgroup>
    </select>
    <br /><input type="submit" name="cadastrar" value="Cadastrar Docente" />
   </form>
  </p>
  <p>Obs.: prontuário precisa ter sete caracteres e nome no mínimo três caracteres.</p>
  <p><a href="index.html">Início</a></p>
 </body>
</html>
