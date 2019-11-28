<?php
class Match{
	public $id_match;
	public $id_usuario;
	public $id_colaborador;
	public $data;
	public $valor;
	public $nome_encontro;
	public $descricao;

	function getMatchList($connection){
		$lista_matches = array();

	    $query = mysqli_query($connection, "SELECT * FROM `match`") or die(mysqli_error($query));

		while($aux = mysqli_fetch_assoc($query)) { 
			$this->id_match = $aux["id_match"];
			$this->id_usuario = $aux["id_usuario"];
			$this->id_colaborador = $aux["id_colaborador"];
			$this->data = $aux["data"];
			$this->valor = $aux["valor"];
			$this->nome_encontro = $aux["nome_encontro"];
			$this->descricao = $aux["descricao"];

			array_push($lista_matches, $this);
		}

		return $lista_matches;
	}

}

?>