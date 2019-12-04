<?php

include("../../../conn/conexao.php");

if (empty($_POST['mensagem'] || $_POST['id_usuario'] || $_POST['id_colaborador'] || $_POST['valor'] ) ) {
    header('Location: index.php');
}

$mensagem = $_POST['mensagem'];
$idx = $_POST['id_usuario'];
$idColaborador = $_POST['id_colaborador'];
$valor = $_POST['valor'];

$sql = mysqli_query($conn, "UPDATE pedidos_combinacoes SET descricao = '$mensagem', valor = '$valor' WHERE id_usuario = '$idx' AND id_colaborador = '$idColaborador' ");

if($sql){
    header('Location: index.php');
}
else{
    header('Location: index.php');
}

?>