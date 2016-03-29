<?php 
session_start();
$_SESSION['user_cuenta'];
$_SESSION['pasword_cuenta'];

include("php/dbconect.php");
include("php/acceso.sev.php");
$validar = validar_usuario($_SESSION['user_cuenta'],$_SESSION['pasword_cuenta']);
if ($validar <> "correcto"){
	echo '<SCRIPT LANGUAGE="javascript">location.href = "http://www.google.co.ve/";</SCRIPT>';
}

$insertar= $mysqli->query("INSERT INTO trabajos (trabajo) VALUES ('".$_POST["trabajo"]."')");
header('location: '.$_POST["pagina"]);
?>
