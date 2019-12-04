<?php 
class Endereco{
	public $id_endereco;
	public $rua;
	public $numero;
	public $cep;
	public $complemento;
	public $cidade;
	public $estado;
	public $pais;

	public $cpf;
	public $rg;
	public $data_nascimento;
	public $descricaoUsuario;

	function getEndereco($connection, $idX){
		$sql2 = mysqli_query($connection, "SELECT * FROM usuario u LEFT JOIN endereco e ON(u.id_usuario = e.id_usuario) WHERE u.id_usuario = ".$idX."") or die( mysqli_error($sql2));
		while($aux = mysqli_fetch_assoc($sql2)) { 
			$this->id_endereco = $aux["id_endereco"];
			$this->rua = $aux["rua"];
			$this->numero = $aux["numero"];
			$this->cep = $aux["cep"];
			$this->complemento = $aux["complemento"];
	  		$this->cidade = $aux["cidade"];
	  		$this->estado = $aux["estado"];
				$this->pais = $aux["pais"];
				
				$this->cpf = $aux["cpf"];
	  		$this->rg = $aux["rg"];
				$this->data_nascimento = $aux["data_aniversario"];
				$this->descricaoUsuario = $aux["descricaoUsuario"];
		}
	}
}

?>