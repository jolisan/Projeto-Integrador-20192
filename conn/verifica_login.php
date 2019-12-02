<?php
if(!$_SESSION['usuarioEmail']) {
    header('Location: ../../../../login/');
    exit();
}
?>