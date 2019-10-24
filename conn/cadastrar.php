<?php 

include 'conexao.php';

$nome = addslashes($_POST['nomecadastro']);
$sobrenome = addslashes($_POST['sobrenomecadastro']);
$email = addslashes($_POST['emailcadastro']);
$senha = addslashes($_POST['senhacadastro']);
$senha = md5($senha);

$sql = "INSERT INTO usuario (id_usuario, nome, sobrenome, email, senha, data_entrada) VALUES";
$sql .= "(default, '$nome','$sobrenome','$email','$senha', CURDATE())";

if ($conn->query($sql) === TRUE) {
	echo  "Usuário incluído com sucesso!";
    header("Location: ../index.php?cadastro=sucess");
} 
else if(empty($nome) AND empty($sobrenome) AND empty($email) AND empty($senha))
{
 // $_SESSION['campoVazio'] = 'Algum campo do cadastro está vazio!';
  header('location:../index.php?error=campovazio');
}
else {
  echo "Erro: " . $sql . "<br>" . $conn->error;
  //header('location:../index.php?error=usuarioexistente');
}

$conn->close();

?>
