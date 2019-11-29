<?php

class Usuario{
	private $table = 'usuario';
	private $connection;

	public $id_usuario;
	public $nome;
	public $sobrenome;
	public $cpf;
	public $rg;
	public $data_aniversario;
	public $data_entrada;
	public $email;
	public $senha;
	public $id_endereço;
	public $id_telefone;
	public $saldo;
	public $fotoperfil;


	public function __construct($db){
		$this->connection = $db;
	}


	public function read(){
		$query = 'SELECT * FROM '.$this->table.' ORDER BY id_usuario ASC';

		$stmt = $this->connection->prepare($query);

		$stmt->execute();

		return $stmt;
	}
}

?>