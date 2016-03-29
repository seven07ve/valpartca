<?php 
session_start();
$_SESSION['user_cuenta'];
$_SESSION['pasword_cuenta'];

include("php/dbconect.php");
include("php/acceso.sev.php");
$validar = validar_usuario($_SESSION['user_cuenta'],$_SESSION['pasword_cuenta']);
//BUSCA LOS ARCHIVOS PARA DAR EL NOMBRE A LA NUEVA IMG
$directorio = '../imgsweb/';
$ficheros1  = scandir($directorio);
//arsort($ficheros1, SORT_NATURAL | SORT_FLAG_CASE);
natsort($ficheros1);
//print_r($ficheros1);
echo phpversion();
Foreach ($ficheros1 as $valor)
{
	$valor;
	if ($valor == '.' or $valor == '..'){
	}
	else{
		//echo "pathinfo('../imgsweb/'.$valor);";
		$partes_ruta = pathinfo('../imgsweb/'.$valor);
		print_r($partes_ruta);
		echo '<br><br>';
		echo str_replace(".", "",substr($partes_ruta['basename'],0,-4));
		echo '<br><br>';
		//$ultimo = $partes_ruta['filename'];
		//echo '<img src="../imgsweb/'.$valor.'" alt=""/> ';

	}
}
?>