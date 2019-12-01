<?php 

class Combinacoes{
    private $table = 'combinacoes';
	private $connection;

	public $id_combinacoes;
	public $data;
	public $valor;
	public $nome_encontro;
	public $descricao;
	public $id_cliente;
	public $id_colaborador; 


	public function __construct($db){
		$this->connection = $db;
	}

	public function read(){
		$query = 'SELECT * FROM '.$this->table.' ORDER BY id_combinacoes ASC';

		$stmt = $this->connection->prepare($query);

		$stmt->execute();

		return $stmt;
	}

}

?>