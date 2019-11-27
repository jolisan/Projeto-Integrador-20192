<?php
session_start();
include_once("conexao.php");

$telefone = $_POST['telefone'];~
$cidade = $_POST['cidade'];
$estado = $_POST['estado'];
$idX = $_SESSION['usuarioId'];

$sql = mysqli_query($conn, "SELECT t.telefone, u.id_telefone, t.ddi, t.ddd FROM usuario u LEFT JOIN telefone t ON(u.id_telefone = t.id_telefone) WHERE id_usuario = ".$idX."") or die( 
  mysqli_error($sql)
);
while($aux = mysqli_fetch_assoc($sql)) { 
  $telefone_banco = $aux["telefone"];
}

$sql2 = mysqli_query($conn, "SELECT e.cidade, e.estado, u.id_endereco FROM usuario u LEFT JOIN endereco e ON(u.id_endereco = e.id_endereco) WHERE id_usuario = ".$idX."") or die( 
  mysqli_error($sql2)
);
while($aux = mysqli_fetch_assoc($sql2)) { 
  $cidade_banco = $aux["cidade"];
  $estado_banco = $aux["estado"];
}

//////////////////////////////////////////////////////////////////////////////////////////////////

if ($telefone != $telefone_banco)
{
  $queryupdate = "UPDATE telefone JOIN usuario u LEFT JOIN telefone t ON t.id_telefone = u.id_telefone SET t.telefone = '$telefone' WHERE id_usuario = '$idX'";
  $result = mysqli_query($conn, $queryupdate);
  if($result)
  {
    header('location:../painel/perfil/informacoes-pessoais/?return=dadosatualizados');
  }
}

if ($cidade != $cidade_banco)
{
  $queryupdate2 = "UPDATE endereco JOIN usuario u LEFT JOIN endereco e ON e.id_endereco = u.id_endereco SET e.cidade = '$cidade' WHERE id_usuario = '$idX'";
  $result2 = mysqli_query($conn, $queryupdate2);
  if($result2)
  {
    header('location:../painel/perfil/informacoes-pessoais/?return=dadosatualizados');
  }
}

if ($estado != $estado_banco)
{
  $queryupdate3 = "UPDATE endereco JOIN usuario u LEFT JOIN endereco e ON e.id_endereco = u.id_endereco SET e.estado = '$estado' WHERE id_usuario = '$idX'";
  $result3 = mysqli_query($conn, $queryupdate3);
  if($result3)
  {
    header('location:../painel/perfil/informacoes-pessoais/?return=dadosatualizados');
  }
}
else{
  header('location:../painel/perfil/informacoes-pessoais/?error=errotualizar');
}



 ?>