<?php
session_start();
include_once("conexao.php");
include_once("../models/Endereco.php");
include_once("../models/Telefone.php");

$telefone = $_POST['telefone'];~
$cidade = $_POST['cidade'];
$estado = $_POST['estado'];
$idX = $_SESSION['usuarioId'];

$Tel = new Telefone();
$End = new Endereco();

$End->getEndereco($conn, $idX);
$Tel->getTelefone($conn, $idX);


//////////////////////////////////////////////////////////////////////////////////////////////////
if($telefone != $Tel->telefone || $cidade != $End->cidade || $estado != $end->estado){
    if ($telefone != $Tel->telefone)
  {
    $queryupdate = "UPDATE telefone JOIN usuario u LEFT JOIN telefone t ON t.id_usuario = u.id_usuario SET t.telefone = '$telefone' WHERE u.id_usuario = '$idX'";
    $result = mysqli_query($conn, $queryupdate);
    if($result)
    {
      header('location:../painel/perfil/informacoes-pessoais/?return=dadosatualizados');
    }
  }

  if ($cidade != $End->cidade)
  {
    $queryupdate2 = "UPDATE endereco JOIN usuario u LEFT JOIN endereco e ON e.id_usuario = u.id_usuario SET e.cidade = '$cidade' WHERE u.id_usuario = '$idX'";
    $result2 = mysqli_query($conn, $queryupdate2);
    if($result2)
    {
      header('location:../painel/perfil/informacoes-pessoais/?return=dadosatualizados');
    }
  }

  if ($estado != $End->estado)
  {
    $queryupdate3 = "UPDATE endereco JOIN usuario u LEFT JOIN endereco e ON e.id_usuario = u.id_usuario SET e.estado = '$estado' WHERE u.id_usuario = '$idX'";
    $result3 = mysqli_query($conn, $queryupdate3);
    if($result3)
    {
      header('location:../painel/perfil/informacoes-pessoais/?return=dadosatualizados');
    }
  }
}
else{
  header('location:../painel/perfil/informacoes-pessoais/?error=errotualizar');
}



 ?>