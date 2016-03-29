<?php 
function vinculo($id){
	if ($id == 1){
		 echo "../quienes-somos/";
	}
	elseif ($id == 2){
		 echo "../nuestras-marcas/";
	}
	elseif ($id == 3){
		 echo "../multimedia/";
	}
	elseif ($id == 4){
		 echo "../contacto/";
	}
	elseif ($id == 4){
		 echo "../empleos/";
	}
}

function menu_sup($validar){
include("php/dbconect.php");
	if ($validar == "correcto"){
		$result = $mysqli->query("SELECT id_solicitud FROM solicitudes");
		$num_sol='';
		if ($num_sol = $mysqli->affected_rows > 0){}
		
	echo '<ul class="bot-menu-prim">
<li><a href="salir.php" title="SALIR">SALIR</a></li>
<li><a href="modificar.php?num=5" title="EMPLEOS">'.$num_sol.' EMPLEOS</a></li>
<li><a href="modificar.php?num=4" title="CONTACTO">CONTACTO</a></li>
<li><a href="multi-ins.php" title="MULTIMEDIA">MULTIMEDIA</a></li>
<li><a href="modificar.php?num=3" title="CATÁLOGO">CATÁLOGO</a></li>
<li><a href="modificar.php?num=2" title="MARCAS">MARCAS</a></li>
<li><a href="noticias-ins.php" title="NOTICIAS">NOTICIAS</a></li>
<li><a href="modificar.php?num=1" title="QUIENES">QUIENES</a></li>
<li><a href="banner.php" title="SLIDERS">SLIDERS</a></li>';
echo '</ul>
<br clear="all">';
	}
}

function menu_sec($validar,$seccion){
	include("php/dbconect.php");
	if ($validar == "correcto"){
		//noticias
		if ($seccion == "8"){
//			echo '<a href="noticias-list.php">lista</a><img src="imagenes/sep.png"/>';
			echo '<a href="modificar.php?num=8">editar</a><img src="imagenes/sep.png"/>';
			echo '<a href="noticias-ins.php">agregar</a><img src="imagenes/sep.png"/>';
			echo '<a href="noticias-mod-sel.php">modificar</a><img src="imagenes/sep.png"/>';
			echo '<a href="noticias-del-sel.php">eliminar</a><img src="imagenes/sep.png"/>';
		}
		//multimedia
		elseif ($seccion == "9"){
//			echo '<a href="noticias-list.php">lista</a><img src="imagenes/sep.png"/>';
			echo '<a href="modificar.php?num=9">editar</a><img src="imagenes/sep.png"/>';
			echo '<a href="multi-ins.php">agregar</a><img src="imagenes/sep.png"/>';
			echo '<a href="multi-mod-sel.php">modificar</a><img src="imagenes/sep.png"/>';
			echo '<a href="multi-del-sel.php">eliminar</a><img src="imagenes/sep.png"/>';
		}
		//empleos
		elseif ($seccion == "5"){
			$result = $mysqli->query("SELECT id_solicitud FROM solicitudes");
			$num_sol='';
			if ($num_sol = $mysqli->affected_rows > 0){}
			echo '<a href="modificar.php?num=5">editar</a><img src="imagenes/sep.png"/>';
			echo '<a href="trabajos-ins.php">Trabajos</a><img src="imagenes/sep.png"/>';
			echo '<a href="trabajos.php">'.$num_sol.' solicitudes</a><img src="imagenes/sep.png"/>';
		}
		else{
		}
	}
}
?>