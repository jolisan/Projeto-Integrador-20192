<?php

include("../../../../conn/conexao.php");

if (empty($_POST['mensagem'] || $_POST['id_usuario'] || $_POST['id_colaborador'] ) ) {
    header('Location: colaborador/painel/perfil/chat/index.php');
}

$mensagem = $_POST['mensagem'];
$idx = $_POST['id_usuario'];
$idColaborador = $_POST['id_colaborador'];


$sql = mysqli_query($conn, "INSERT INTO mensagem(conteudo, data_ocorrencia, id_usuario_envio, id_usuario_recebe) VALUES('$mensagem', CURDATE(), '$idx', '$idColaborador')");

if($sql){
    header('Location: ../../../../colaborador/painel/perfil/chat/index.php?id='.$idColaborador);
}
else{
    header('Location: ../../../../colaborador/painel/perfil/chat/index.php?id='.$idColaborador);
}

?>