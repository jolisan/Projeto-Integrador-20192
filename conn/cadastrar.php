<?php 

include 'conexao.php';

$nome = addslashes($_POST['nomecadastro']);
$sobrenome = addslashes($_POST['sobrenomecadastro']);
$email = addslashes($_POST['emailcadastro']);
$senha = addslashes($_POST['senhacadastro']);
$tipoUsuario = addslashes($_POST['tipoUsuario']);
$datanascimento = $_POST['datanascimento'];


if(empty($nome) OR empty($sobrenome) OR empty($email) OR empty($senha) OR empty($datanascimento) OR $tipoUsuario == NULL){
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
     $sql = "INSERT INTO usuario (nome, sobrenome, email, senha, tipo_usuario, data_aniversario, data_entrada) VALUES('$nome','$sobrenome','$email','$senha','$tipoUsuario','$datanascimento', CURDATE())";
 
     if($response = $conn->query($sql)){
      header("Location: ../login/?cadastro=sucess");
     }
     else{
       header("Location: ../login/?error=errocadastro");
       }
     }
   }
 
   if($tipoUsuario == 1){ // 1 é colaborador
 
     $senha = md5($senha);
     $sql = "INSERT INTO usuario (nome, sobrenome, email, senha, tipo_usuario, data_aniversario, data_entrada) VALUES('$nome','$sobrenome','$email','$senha','$tipoUsuario','$datanascimento', CURDATE())";
 
     if($response = $conn->query($sql)){
      header("Location: ../login/?cadastro=sucess");
     }
     else{
       header("Location: ../login/?error=errocadastro");
       }
     }
   }
 
 
$conn->close();

?>
