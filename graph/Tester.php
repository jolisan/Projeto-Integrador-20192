<?php 

    include_once 'Graph.php';
	include_once '../config/Database.php';
	include_once '../models/Combinacoes.php';
	include_once '../models/Usuario.php';
	include_once '../models/ListaPessoa.php';


	$database = new Database();

	$db = $database->connect();

	$combinacoes = new Combinacoes($db);

	$resultado = $combinacoes->read();

	$num = $resultado->rowCount();

	if($num > 0){
		$combinacoes_arr = array();

		while($row = $resultado->fetch(PDO::FETCH_ASSOC)){
			extract($row);

			$combinacoes_item = array(
				'valor' => $valor,
				'id_cliente' => $id_cliente,
				'id_colaborador' => $id_colaborador
			);

			array_push($combinacoes_arr, $combinacoes_item);
		}
	}



	$listaCliente = new ListaPessoa();
	$listaCliente = array();


	$query = 'SELECT DISTINCT u.id_usuario, u.nome, c.id_cliente FROM usuario u INNER JOIN cliente c INNER JOIN combinacoes m WHERE c.id_cliente = m.id_cliente AND u.id_usuario = c.id_usuario';

	$stmt = $db->prepare($query);

	$stmt->execute();

	$res = $stmt;

	$test = $res->rowCount();

	if($test > 0){


		while($aux = $res->fetch(PDO::FETCH_ASSOC)){
			$auxCliente = new ListaPessoa();
			extract($aux);

			$auxCliente->id_usuario = $id_usuario;
			$auxCliente->nome = $nome;
			$auxCliente->id_cliente = $id_cliente;
			array_push($listaCliente, $auxCliente);
			unset($auxCliente);

		}

	}

	$query = 'SELECT DISTINCT u.id_usuario, u.nome, c.id_colaborador FROM usuario u INNER JOIN colaborador c INNER JOIN combinacoes m WHERE c.id_colaborador = m.id_colaborador AND u.id_usuario = c.id_usuario';

	$stmt = $db->prepare($query);

	$stmt->execute();

	$res = $stmt;

	$test = $res->rowCount();

	if($test > 0){


		while($aux = $res->fetch(PDO::FETCH_ASSOC)){
			$auxColaborador = new ListaPessoa();
			extract($aux);

			$auxColaborador->id_usuario = $id_usuario;
			$auxColaborador->nome = $nome;
			$auxColaborador->id_colaborador = $id_colaborador;
			array_push($listaCliente, $auxColaborador);
			unset($auxColaborador);

		}

	}

	function GetClientVertex($array, $idCliente){

		foreach ($array as $key => $value) {
			if($value->id_cliente == $idCliente) return $key;
		}
	}

	function GetColaboratorVertex($array, $idColaborador){

		foreach ($array as $key => $value) {
			if($value->id_colaborador == $idColaborador) return $key;
		}
	}
	
	$graph = new graph(count($listaCliente));
		

	foreach ($combinacoes_arr as $c) {
		$auxIdCliente;
		$auxIdColaborador;
		$auxNomeCliente;
		$auxNomeColaborador;

		$auxIdCliente = GetClientVertex($listaCliente, $c['id_cliente']);
		$auxIdColaborador = GetColaboratorVertex($listaCliente, $c['id_colaborador']);
		$auxNomeCliente = $listaCliente[$auxIdCliente]->nome;
		$auxNomeColaborador = $listaCliente[$auxIdColaborador]->nome;

		//PARAMETROS = ID_COLABORADOR, ID_CLIENTE, PREÇO_VENDA, NOME_COLABORADOR, NOME_CLIENTE)
		$graph->AddConection($auxIdColaborador, $auxIdCliente, $c['valor'], $auxNomeColaborador, $auxNomeCliente);
		unset($auxIdCliente, $auxIdColaborador, $auxNomeCliente, $auxNomeColaborador);

	}

	$graph->Kruskal();

?>