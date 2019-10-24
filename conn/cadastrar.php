<?php 

include 'conexao.php';

$nome = addslashes($_POST['nomecadastro']);
$sobrenome = addslashes($_POST['sobrenomecadastro']);
$email = addslashes($_POST['emailcadastro']);
$senha = addslashes($_POST['senhacadastro']);

if(empty($nome) OR empty($sobrenome) OR empty($email) OR empty($senha)){
 // $_SESSION['campoVazio'] = 'Algum campo do cadastro está vazio!';
  header('location:../index.php?error=campovazio');
}
else{

  $sql_verificar = "SELECT id_usuario FROM usuario WHERE email = '$email' ";
  $response_verificacao = $conn->query($sql_verificar);

  if(mysqli_num_rows($response_verificacao) != 0){
    header('location:../index.php?error=usuarioexistente');
  }
  else{
    $senha = md5($senha);
    $sql = "INSERT INTO usuario (nome, sobrenome, email, senha, data_entrada) VALUES('$nome','$sobrenome','$email','$senha', CURDATE())";

    if($response = $conn->query($sql)){
     header("Location: ../index.php?cadastro=sucess");
    }
    else{
      header("Location: ../index.php?error=usuarioexistente");
    }
  }
}

$conn->close();

?>
