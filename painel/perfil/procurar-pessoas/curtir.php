<?php
	session_start();	

include_once("../../../conn/conexao.php");

$id_usuario = $_POST['id_usuario'];
$id_colaborador = $_POST['id_colaborador'];


$sql_verificar = "SELECT * FROM pedidos_combinacoes WHERE id_colaborador = '$id_colaborador' AND id_usuario = '$id_usuario'";
$response_verificacao = $conn->query($sql_verificar);

if(mysqli_num_rows($response_verificacao) != 0){
  header('location: ../procurar-pessoas/?error=jacurtido');
}
else{

  $sql = "INSERT INTO pedidos_combinacoes(id_usuario, id_colaborador) VALUES('$id_usuario', '$id_colaborador');";
  if($response = $conn->query($sql)){
    header("Location: ../procurar-pessoas/?sucess=curtidaenviada");
    }

  else{
    $_SESSION['loginErro'] = "Erro - diretório procurar-pessoas - arruma aí";
    header("Location: ../painel/?erro=deuerroirmao");
  }
}
?>