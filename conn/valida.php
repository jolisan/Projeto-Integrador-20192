<?php
	session_start();	
	//Incluindo a conexão com banco de dados
	include_once("conexao.php");	
	//O campo usuário e senha preenchido entra no if para validar
	if((isset($_POST['email'])) && (isset($_POST['senha']))){
		$email = mysqli_real_escape_string($conn, $_POST['email']); //Escapar de caracteres especiais, como aspas, prevenindo SQL injection
		$senha = mysqli_real_escape_string($conn, $_POST['senha']);
		$senha = md5($senha);
			
		//Buscar na tabela usuario o usuário que corresponde com os dados digitado no formulário
		$result_usuario = "SELECT u.nome, u.sobrenome, u.fotoperfil, u.email, u.saldo, t.telefone, u.id_usuario, u.data_entrada, u.id_endereco, u.id_telefone, e.rua FROM usuario u LEFT JOIN telefone t ON(u.id_telefone = t.id_telefone) LEFT JOIN endereco e ON(u.id_endereco = e.id_endereco) WHERE email = '$email' AND senha = '$senha' LIMIT 1";
		$resultado_usuario = mysqli_query($conn, $result_usuario);
		$resultado = mysqli_fetch_assoc($resultado_usuario);
		
		//Encontrado um usuario na tabela usuário com os mesmos dados digitado no formulário
		if(isset($resultado)){
			$_SESSION['usuarioId'] = $resultado['id_usuario'];
			$_SESSION['usuarioNome'] = $resultado['nome'];
			$_SESSION['usuarioSobrenome'] = $resultado['sobrenome'];
			$_SESSION['usuarioEmail'] = $resultado['email'];
			$_SESSION['usuarioSaldo'] = $resultado['saldo'];
			$_SESSION['usuarioTelefone'] = $resultado['telefone'];
			$_SESSION['usuarioCidade'] = $resultado['cidade'];
			$_SESSION['usuarioEstado'] = $resultado['estado'];
			$_SESSION['usuarioFoto'] = $resultado['fotoperfil'];
			$_SESSION['telefoneId'] = $resultado['id_telefone'];
			$_SESSION['dataEntrada'] = $resultado['data_entrada'];

			header("Location: ../painel/");
		//Não foi encontrado um usuario na tabela usuário com os mesmos dados digitado no formulário
		//redireciona o usuario para a página de login
	}else{	
		//Váriavel global recebendo a mensagem de erro
		$_SESSION['loginErro'] = "Usuário ou senha Inválido";
		header("Location: ../index.php");
	}
//O campo usuário e senha não preenchido entra no else e redireciona o usuário para a página de login
}else{
	$_SESSION['loginErro'] = "Usuário ou senha inválido";
	header("Location: ../index.php");
}
?>