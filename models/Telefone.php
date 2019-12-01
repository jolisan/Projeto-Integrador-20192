<?php 
class Telefone{
	public $id_telefone;
	public $ddi;
	public $ddd;
	public $telefone;



	function getTelefone($connection, $idX){
		$sql = mysqli_query($connection, "SELECT * FROM usuario u LEFT JOIN telefone t ON(u.id_usuario = t.id_usuario) WHERE u.id_usuario = ".$idX."") or die( mysqli_error($sql));
		while($aux = mysqli_fetch_assoc($sql)) { 
			$this->id_telefone = $aux["id_telefone"];
  			$this->ddi = $aux["ddi"];
  			$this->ddd = $aux["ddd"];
  			$this->telefone = $aux["telefone"];
		}
	}
}

?>