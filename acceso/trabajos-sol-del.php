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

$insertar= $mysqli->query("DELETE FROM solicitudes WHERE id_solicitud='".$_POST["id_solicitud"]."'");
unlink("../empleos/curriculos/".$_POST["pdf"]);

header('location: '.$_POST["pagina"]);
?>
