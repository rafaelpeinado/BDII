<?php
  /* altere somente a porta '3306' se necessário */
  $mysqli = new mysqli('localhost', 'secretaria', 'senha', 'dbEscola', '3306');
  if ($mysqli->connect_errno) {
    echo 'Failed to connect to MySQL:(' . $mysqli->connect_errno . ') ' . $mysqli->connect_error;
  }
  //echo $mysqli->host_info . '\n';
?>
