<?php
	session_start();	

include_once("../../../../conn/conexao.php");

$id_cliente = $_POST['id_cliente'];
$id_colaborador = $_POST['id_colaborador'];
$valor = $_POST['valor'];
$descricao = $_POST['descricao'];


$query = mysqli_query($conn, "SELECT id_cliente from cliente where id_usuario = ".$id_cliente."");

$row = mysqli_fetch_array($query);

$queryProcedure = mysqli_query($conn, "CALL PC_InserirCombinacaoChecandoIdade( ".$valor.", '".$descricao."', '".$descricao."', ".$row["id_cliente"].", ".$id_colaborador.")");

if($queryProcedure == 1){
	header('location: ../lista-combinacoes-pendentes/?return=matchaceito');
}

?>