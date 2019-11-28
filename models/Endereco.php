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


	function getEndereco($connection, $idX){
		$sql2 = mysqli_query($connection, "SELECT * FROM usuario u LEFT JOIN endereco e ON(u.id_endereco = e.id_endereco) WHERE id_usuario = ".$idX."") or die( mysqli_error($sql2));
		while($aux = mysqli_fetch_assoc($sql2)) { 
			$this->id_endereco = $aux["id_endereco"];
			$this->rua = $aux["rua"];
			$this->numero = $aux["numero"];
			$this->cep = $aux["cep"];
			$this->complemento = $aux["complemento"];
	  		$this->cidade = $aux["cidade"];
	  		$this->estado = $aux["estado"];
	  		$this->pais = $aux["pais"];
		}
	}
}

?>