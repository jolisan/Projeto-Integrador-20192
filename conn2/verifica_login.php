<?php
if(!$_SESSION['colaboradorEmail']) {
    header('Location: ../../../index.php');
    exit();
}
?>