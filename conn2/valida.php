<?php
	session_start();	
	//Incluindo a conexão com banco de dados
	include_once("conexao.php");	
	//O campo usuário e senha preenchido entra no if para validar
	if((isset($_POST['email'])) && (isset($_POST['senha']))){
		$email = mysqli_real_escape_string($conn, $_POST['email']); //Escapar de caracteres especiais, como aspas, prevenindo SQL injection
		$senha = mysqli_real_escape_string($conn, $_POST['senha']);
		$senha = md5($senha);
			
		//Buscar na tabela colaborador o usuário que corresponde com os dados digitado no formulário
		$result_colaborador = "SELECT u.nome, u.sobrenome, u.fotoperfil, u.email, u.saldo, t.telefone, u.id_colaborador, u.data_entrada, u.id_endereco, u.id_telefone, e.rua FROM colaborador u LEFT JOIN telefone t ON(u.id_telefone = t.id_telefone) LEFT JOIN endereco e ON(u.id_endereco = e.id_endereco) WHERE email = '$email' AND senha = '$senha' LIMIT 1";
		$resultado_colaborador = mysqli_query($conn, $result_colaborador);
		$resultado = mysqli_fetch_assoc($resultado_colaborador);
		
		//Encontrado um colaborador na tabela usuário com os mesmos dados digitado no formulário
		if(isset($resultado)){
			$_SESSION['colaboradorId'] = $resultado['id_colaborador'];
			$_SESSION['colaboradorNome'] = $resultado['nome'];
			$_SESSION['colaboradorSobrenome'] = $resultado['sobrenome'];
			$_SESSION['colaboradorEmail'] = $resultado['email'];
			$_SESSION['colaboradorSaldo'] = $resultado['saldo'];
			$_SESSION['colaboradorTelefone'] = $resultado['telefone'];
			$_SESSION['colaboradorCidade'] = $resultado['cidade'];
			$_SESSION['colaboradorEstado'] = $resultado['estado'];
			$_SESSION['colaboradorFoto'] = $resultado['fotoperfil'];
			$_SESSION['colaboradorTelefoneId'] = $resultado['id_telefone'];
			$_SESSION['colaboradorDataEntrada'] = $resultado['data_entrada'];

			header("Location: ../colaborador/painel/");
		//Não foi encontrado um colaborador na tabela usuário com os mesmos dados digitado no formulário
		//redireciona o colaborador para a página de login
	}else{	
		//Váriavel global recebendo a mensagem de erro
		$_SESSION['loginErro'] = "Usuário ou senha Inválido";
		header("Location: ../colaborador/");
	}
//O campo usuário e senha não preenchido entra no else e redireciona o usuário para a página de login
}else{
	$_SESSION['loginErro'] = "Usuário ou senha inválido";
	header("Location: ../colaborador/");
}
?>