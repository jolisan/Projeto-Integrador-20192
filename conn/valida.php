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
		$result_usuario = "SELECT u.nome, u.tipo_usuario, u.sobrenome, u.fotoperfil, u.email, u.saldo, t.telefone, u.id_usuario, u.data_entrada, e.id_endereco, t.ddi, t.ddd, e.rua FROM usuario u INNER JOIN telefone t ON(u.id_usuario = t.id_usuario) INNER JOIN endereco e ON(e.id_usuario = u.id_usuario) WHERE email = '$email' AND senha = '$senha' LIMIT 1";
		$resultado_usuario = mysqli_query($conn, $result_usuario);
		$resultado = mysqli_fetch_assoc($resultado_usuario);
		
		//Encontrado um usuario na tabela usuário com os mesmos dados digitado no formulário
		if(isset($resultado)){
			$_SESSION['usuarioId'] = $resultado['id_usuario'];
			$_SESSION['usuarioNome'] = $resultado['nome'];
			$_SESSION['usuarioSobrenome'] = $resultado['sobrenome'];
			$_SESSION['usuarioEmail'] = $resultado['email'];
			$_SESSION['usuarioSaldo'] = $resultado['saldo'];
			$_SESSION['usuarioDDI'] = $resultado['ddi'];
			$_SESSION['usuarioDDD'] = $resultado['ddd'];
			$_SESSION['usuarioTelefone'] = $resultado['telefone'];
			$_SESSION['usuarioCidade'] = $resultado['cidade'];
			$_SESSION['usuarioEstado'] = $resultado['estado'];
			$_SESSION['usuarioFoto'] = $resultado['fotoperfil'];
			$_SESSION['telefoneId'] = $resultado['id_telefone'];
			$_SESSION['dataEntrada'] = $resultado['data_entrada'];
			$tipoUsuario = $resultado['tipo_usuario'];
			if($tipoUsuario == 0){
				header("Location: ../painel/");
			}
			if($tipoUsuario == 1){
				header("Location: ../colaborador/painel");
			}
		//Não foi encontrado um usuario na tabela usuário com os mesmos dados digitado no formulário
		//redireciona o usuario para a página de login
	}else{	
		//Váriavel global recebendo a mensagem de erro
		$_SESSION['loginErro'] = "Usuário ou senha Inválido";
		header("Location: ../login");
	}
//O campo usuário e senha não preenchido entra no else e redireciona o usuário para a página de login
}else{
	$_SESSION['loginErro'] = "Usuário ou senha inválido";
	header("Location: ../login");
}
?>