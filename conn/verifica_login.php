<?php
if(!$_SESSION['usuarioEmail']) {
    header('Location: ../../../index.php');
    exit();
}
?>