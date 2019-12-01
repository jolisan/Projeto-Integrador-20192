<?php 

include 'conexao.php';

$nome = addslashes($_POST['nomecadastro']);
$sobrenome = addslashes($_POST['sobrenomecadastro']);
$email = addslashes($_POST['emailcadastro']);
$senha = addslashes($_POST['senhacadastro']);
$tipoUsuario = addslashes($_POST['tipoUsuario']);

if(empty($nome) OR empty($sobrenome) OR empty($email) OR empty($senha)){
 // $_SESSION['campoVazio'] = 'Algum campo do cadastro está vazio!';
  header('location:../login/?error=campovazio');
}
else{

  $sql_verificar = "SELECT id_usuario FROM usuario WHERE email = '$email' ";
  $response_verificacao = $conn->query($sql_verificar);

  if(mysqli_num_rows($response_verificacao) != 0){
    header('location:../login/?error=usuarioexistente');
  }
  else{

    if($tipoUsuario == 0){ // 0 é usuario

    $senha = md5($senha);
    $sql = "INSERT INTO usuario (nome, sobrenome, email, senha, tipo_usuario, data_entrada) VALUES('$nome','$sobrenome','$email','$senha','$tipoUsuario', CURDATE())";

    if($response = $conn->query($sql)){
     $novocliente = "INSERT INTO cliente (id_usuario) VALUES(SELECT id_usuario FROM usuario WHERE email = '.$email.')";
     $conn->query($novocliente);
     header("Location: ../login/?cadastro=sucess");
    }
    else{
      header("Location: ../login/?error=entrounoelseDESSE");
      }
    }
  }

  if($tipoUsuario == 1){ // 1 é colaborador

    $senha = md5($senha);
    $sql = "INSERT INTO usuario (nome, sobrenome, email, senha, tipo_usuario, data_entrada) VALUES('$nome','$sobrenome','$email','$senha','$tipoUsuario', CURDATE())";

    if($response = $conn->query($sql)){
     header("Location: ../login/?cadastro=sucess");
    }
    else{
      header("Location: ../login/?error=entrounoelseDOOUTRO");
      }
    }
  }


$conn->close();

?>
