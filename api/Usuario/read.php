<?php 

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

include_once '../../config/Database.php';
include_once '../../models/Usuario.php';

$database = new Database();

$db = $database->connect();

$usuario = new Usuario($db);

$resultado = $usuario->read();

$num = $resultado->rowCount();

if($num > 0){
	$usuario_arr = array();
	$usuario_arr['data'] = array();

	while($row = $resultado->fetch(PDO::FETCH_ASSOC)){
		extract($row);

		$usuario_item = array(
			'id_usuario' => $id_usuario,
			'nome' => $nome,
			'sobrenome' => $sobrenome
		);

		array_push($usuario_arr['data'], $usuario_item);
	}

	echo json_encode($usuario_arr);
}else{
	echo json_encode(array('message' => 'Nao foi encontrado usuario!'));
}


?>