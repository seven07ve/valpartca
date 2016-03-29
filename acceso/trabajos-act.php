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
//ejecuta la sentencia sql
$resultado = $mysqli->query(sprintf("SELECT * FROM trabajos"));
if ($num_emp = $mysqli->affected_rows > 0){
	$cont=1;
	while ($fila = $resultado->fetch_array(MYSQLI_ASSOC)){
		if ($_POST["id_trabajo".$cont] == $fila['id_trabajo']){
			$activo= 1;
		}
		else{
			$activo=0;
		}
//		echo "UPDATE trabajos SET activo='".$activo."'  WHERE id_trabajo='".$fila['id_trabajo']."'";
		$activar= $mysqli->query(sprintf("UPDATE trabajos SET activo='".$activo."'  WHERE id_trabajo='".$fila['id_trabajo']."'"));
		$cont++;
	}
}

header('location: '.$_POST["pagina"]);
?>
