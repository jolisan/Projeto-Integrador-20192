<?php
	session_start();
	
	unset(
		$_SESSION['colaboradorId'],
		$_SESSION['colaboradorNome'],
		$_SESSION['colaboradorEmail'],
		$_SESSION['colaboradorSenha']
	);
	
	$_SESSION['logindeslogado'] = "Deslogado com sucesso";
	//redirecionar o colaborador para a página de login
	header("Location: ../");
?>