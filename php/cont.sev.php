<?php 
//funcion que verifica si el usuario y el password son correctos
function contenido($num){
	include("dbconect.php");
	//busqueda de los datos de la noticia
	$ssql=sprintf("SELECT titulo,contenido,autor,fecha,id_cont FROM contenido WHERE id_cont='".$num."'");
	//ejecuta la sentencia sql
	$resultado = $mysqli->query($ssql);
	$fila = $resultado->fetch_array(MYSQLI_ASSOC);
		echo $fila["contenido"];
}
function fondo($num){
	include("dbconect.php");
	//busqueda de los datos de la noticia
	$ssql=sprintf("SELECT fondo, repetir FROM contenido WHERE id_cont='".$num."'");
	//ejecuta la sentencia sql
	$resultado = $mysqli->query($ssql);
	$fila = $resultado->fetch_array(MYSQLI_ASSOC);
	$repetir = $fila["repetir"];
	echo '<section class="contenido" ';
	echo 'style="background:url(../imgsbg/'.$fila["fondo"].')';
	$rep = array("0" => "no-repeat", "1" => "repeat", "2" => "repeat-x", "3" =>"repeat-y");
	echo ' '.$rep[$repetir].'">';
}
?>