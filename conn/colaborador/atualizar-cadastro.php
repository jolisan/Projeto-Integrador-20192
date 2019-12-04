<?php
session_start();
include_once("../conexao.php");
include_once("../../models/Endereco.php");
include_once("../../models/Telefone.php");

$telefone = $_POST['telefone'];
$ddi = $_POST['ddi'];
$ddd = $_POST['ddd'];
$cidade = $_POST['cidade'];
$estado = $_POST['estado'];
$rua = $_POST['rua'];
$numero = $_POST['numero'];
$cep = $_POST['cep'];
$complemento = $_POST['complemento'];
$pais = $_POST['pais'];
$cpf = $_POST['cpf'];
$rg = $_POST['rg'];
$data_nascimento = $_POST['data_nascimento'];

$idX = $_SESSION['usuarioId'];

$Tel = new Telefone();
$End = new Endereco();

$End->getEndereco($conn, $idX);
$Tel->getTelefone($conn, $idX);


//////////////////////////////////////////////////////////////////////////////////////////////////
if($telefone != $Tel->telefone || $ddi != $Tel->ddi || $ddi != $Tel->ddd || $rua != $End->rua || $numero != $End->numero || $cep != $End->cep || $complemento != $End->complemento ||$cidade != $End->cidade || $estado != $end->estado|| $cpf != $end->cpf|| $rg != $end->rg|| $data_nascimento != $end->data_nascimento){
  if ($telefone != $Tel->telefone)
  {
    $queryupdate = "UPDATE telefone JOIN usuario u LEFT JOIN telefone t ON t.id_usuario = u.id_usuario SET t.telefone = '$telefone' WHERE u.id_usuario = '$idX'";
    $result = mysqli_query($conn, $queryupdate);
    if($result)
    {
      header('location:../../colaborador/painel/perfil/informacoes-pessoais/?return=dadosatualizados');
    }
  }

  if ($ddi != $Tel->ddi)
  {
    $queryupdate = "UPDATE telefone JOIN usuario u LEFT JOIN telefone t ON t.id_usuario = u.id_usuario SET t.ddi = '$ddi' WHERE u.id_usuario = '$idX'";
    $result = mysqli_query($conn, $queryupdate);
    if($result)
    {
      header('location:../../colaborador/painel/perfil/informacoes-pessoais/?return=dadosatualizados');
    }
  }

  if ($ddd != $Tel->ddd)
  {
    $queryupdate = "UPDATE telefone JOIN usuario u LEFT JOIN telefone t ON t.id_usuario = u.id_usuario SET t.ddd = '$ddd' WHERE u.id_usuario = '$idX'";
    $result = mysqli_query($conn, $queryupdate);
    if($result)
    {
      header('location:../../colaborador/painel/perfil/informacoes-pessoais/?return=dadosatualizados');
    }
  }

  if ($cpf != $End->cpf)
  {
    $queryupdate = "UPDATE usuario SET cpf = '$cpf' WHERE id_usuario = '$idX'";
    $result = mysqli_query($conn, $queryupdate);
    if($result)
    {
      header('location:../../colaborador/painel/perfil/informacoes-pessoais/?return=dadosatualizados');
    }
  }

  if ($rg != $End->rg)
  {
    $queryupdate = "UPDATE usuario SET rg = '$rg' WHERE id_usuario = '$idX'";
    $result = mysqli_query($conn, $queryupdate);
    if($result)
    {
      header('location:../../colaborador/painel/perfil/informacoes-pessoais/?return=dadosatualizados');
    }
  }

  if ($data_nascimento != $End->data_nascimento)
  {
    $queryupdate = "UPDATE usuario SET data_aniversario = '$data_nascimento' WHERE id_usuario = '$idX'";
    $result = mysqli_query($conn, $queryupdate);
    if($result)
    {
      header('location:../../colaborador/painel/perfil/informacoes-pessoais/?return=dadosatualizados');
    }
  }

  if ($rua != $End->rua)
  {
    $queryupdate = "UPDATE endereco JOIN usuario u LEFT JOIN endereco e ON e.id_usuario = u.id_usuario SET e.rua = '$rua' WHERE u.id_usuario = '$idX'";
    $result = mysqli_query($conn, $queryupdate);
    if($result)
    {
      header('location:../../colaborador/painel/perfil/informacoes-pessoais/?return=dadosatualizados');
    }
  }

  if ($numero != $End->numero)
  {
    $queryupdate = "UPDATE endereco JOIN usuario u LEFT JOIN endereco e ON e.id_usuario = u.id_usuario SET e.numero = '$numero' WHERE u.id_usuario = '$idX'";
    $result = mysqli_query($conn, $queryupdate);
    if($result)
    {
      header('location:../../colaborador/painel/perfil/informacoes-pessoais/?return=dadosatualizados');
    }
  }

  if ($cep != $End->cep)
  {
    $queryupdate = "UPDATE endereco JOIN usuario u LEFT JOIN endereco e ON e.id_usuario = u.id_usuario SET e.cep = '$cep' WHERE u.id_usuario = '$idX'";
    $result = mysqli_query($conn, $queryupdate);
    if($result)
    {
      header('location:../../colaborador/painel/perfil/informacoes-pessoais/?return=dadosatualizados');
    }
  }

  if ($complemento != $End->complemento)
  {
    $queryupdate = "UPDATE endereco JOIN usuario u LEFT JOIN endereco e ON e.id_usuario = u.id_usuario SET e.complemento = '$complemento' WHERE u.id_usuario = '$idX'";
    $result = mysqli_query($conn, $queryupdate);
    if($result)
    {
      header('location:../../colaborador/painel/perfil/informacoes-pessoais/?return=dadosatualizados');
    }
  }

  if ($cidade != $End->cidade)
  {
    $queryupdate = "UPDATE endereco JOIN usuario u LEFT JOIN endereco e ON e.id_usuario = u.id_usuario SET e.cidade = '$cidade' WHERE u.id_usuario = '$idX'";
    $result = mysqli_query($conn, $queryupdate);
    if($result)
    {
      header('location:../../colaborador/painel/perfil/informacoes-pessoais/?return=dadosatualizados');
    }
  }

  if ($estado != $End->estado)
  {
    $queryupdate = "UPDATE endereco JOIN usuario u LEFT JOIN endereco e ON e.id_usuario = u.id_usuario SET e.estado = '$estado' WHERE u.id_usuario = '$idX'";
    $result = mysqli_query($conn, $queryupdate);
    if($result)
    {
      header('location:../../colaborador/painel/perfil/informacoes-pessoais/?return=dadosatualizados');
    }
  }

  if ($pais != $End->pais)
  {
    $queryupdate = "UPDATE endereco JOIN usuario u LEFT JOIN endereco e ON e.id_usuario = u.id_usuario SET e.pais = '$pais' WHERE u.id_usuario = '$idX'";
    $result = mysqli_query($conn, $queryupdate);
    if($result)
    {
      header('location:../../colaborador/painel/perfil/informacoes-pessoais/?return=dadosatualizados');
    }
  }
}
else{
  header('location:../../colaborador/painel/perfil/informacoes-pessoais/?error=errotualizar');
}



 ?>