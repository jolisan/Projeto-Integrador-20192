<?php
session_start();
include_once("../conexao.php");

$senha1 = $_POST['senha1'];
$senha2 = $_POST['senha2'];
$senhaatual = $_POST['senhaatual'];

$senha1 = md5($senha1);
$senha2 = md5($senha2);
$senhaatual = md5($senhaatual);

$idX = $_SESSION['usuarioId'];

$sql = mysqli_query($conn, "SELECT * FROM usuario WHERE id_usuario = ".$idX."") or die( 
  mysqli_error($sql)
);
while($aux = mysqli_fetch_assoc($sql)) { 
  $senha_banco = $aux["senha"];
}

if (($senhaatual != $senha_banco) || ($senha1 != $senha2))
{
  header('location:../../colaborador/painel/perfil/mudar-senha/?error=errosenha');
}
else{
  $queryupdate = "UPDATE USUARIO SET senha = '$senha2' WHERE id_usuario = '$idX'";
  $result = mysqli_query($conn, $queryupdate);
  if($result)
  {
    header('location:../../colaborador/painel/perfil/mudar-senha/?return=senhaalterada');
  }
}



 ?>