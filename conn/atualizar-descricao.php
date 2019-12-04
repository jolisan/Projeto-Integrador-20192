<?php
session_start();
include_once("conexao.php");
include_once("../models/Endereco.php");
include_once("../models/Telefone.php");

$descricaoUsuario = $_POST['descricaoUsuario'];
$idX = $_SESSION['usuarioId'];

$Tel = new Telefone();
$End = new Endereco();

$End->getEndereco($conn, $idX);
$Tel->getTelefone($conn, $idX);

  if ($descricaoUsuario != $End->descricaoUsuario)
  {
    $queryupdate = "UPDATE usuario SET descricaoUsuario = '$descricaoUsuario' WHERE id_usuario = '$idX'";
    $result = mysqli_query($conn, $queryupdate);
    if($result)
    {
      header('location:../painel/?return=descricaoatualizada');
    }
  }
else{
  header('location:../painel/?error=errotualizardescricao');
}



 ?>