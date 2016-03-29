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

//ELIMINAR
$resultado = $mysqli->query(sprintf("SELECT * FROM trabajos"));
if ($num_emp = $mysqli->affected_rows > 0){
	$cont=1;
	while ($fila = $resultado->fetch_array(MYSQLI_ASSOC)){
		if ($_POST["id_trabajo".$cont] == $fila["id_trabajo"]){
			$borrar = $mysqli->query(sprintf("DELETE FROM trabajos WHERE id_trabajo='".$_POST["id_trabajo".$cont]."'"));
		}
		$cont++;
	}
}
header('location: '.$_POST["pagina"]);
?>
