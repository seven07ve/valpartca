<?php 
include("../php/menus-links.sev.php");
include("../php/cont.sev.php");
?>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="Title" content="VALPARTS,C.A.">
	<meta name="description" content="catalogo de bobinas, catalogo de bombas de gasolina, catalogo de carburadores, catalogo de cubos de rueda, catalogo de distribuidores, catalogo motores. ">
	<meta name="keywords" content="empresa, mayorista, repuestos, partes, automotriz, automotrices, vehiculos, carros, camiones, partes eléctricas, eléctricas, partes mecánicas, mecánicas, ignición, boninas ignición, bombas agua, bombas gasolina, bujías, cables bujía, distribuidores, filtros gasolina, reluctores, rotores, tapas, sensores, vacuums, válvulas PCV, automáticos, bobinas captadoras, bornes, carboneras, luces HID, ramales cruce, relays, resistencias, switches, bocinas rueda, carburadores, cepillos limpia parabrisas, limpia parabrisas, platos clutch, discos clutch, envases, reservorios, hidrocollarines, poleas, tensores, correas" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="rating" content="general">
	<meta name="robots" content="index, follow">
	<meta name="revisit-after" content="10 days">
	<meta name="copyright" content="Este sitio y todo su contenido © Copyright 2016 VALPARTS,C.A. Mérida, Venezuela.">
<title>CATÁLOGOS - VALPARTS,C.A.</title>
<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />
<link href="../css/estilos.css" rel="stylesheet" type="text/css">
<link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
</head>
<body>
	<?php include_once("../php/analyticstracking.php") ?>
<header>
  <nav>
  <div class="cont-hed-sup">
<?php
echo logo('');
echo buscador();
echo ingreso();
?>
    </div>
    <div class="botones-men">
		<div class="cont-botones-men">
<?php 
echo rs('');
echo menu('','cat');
?>
		</div>
    </div>
  </nav>
</header>
<div style="width:1260px; margin:0 auto;" >
<?php
fondo('3');
contenido('3'); 
$directorio = '../catalogo';
$archivo  = scandir($directorio);
//ordena inversamente por nombre
//print_r($archivo);
echo '<div class="seccion-anuncio" style="margin:0 auto;">'."\n";		
Foreach ($archivo as $valor)
{
	$valor;
	if ($valor == '.' or $valor == '..' or $valor == '_notes' or $valor == 'index.php'){
	}
	else{
		//muestra la imagen
//		echo '<h3><a href="../catalogo/'.$valor.'">'.$valor.'</a></h3>';
		//echo "pathinfo('../catalogo/'.$valor);";
		$partes_ruta = pathinfo('../catalogo/'.$valor);		
//para  versiones posteriores a php5.2
//		$ultimo = explode("-",$partes_ruta['filename']);
//para  versiones anteriores a php5.2
		$ultimo = explode(".",$partes_ruta['basename']);
		echo '<a href="../catalogo/'.$valor.'" target="_blank"  style="text-decoration:none; color:#2d2d2d; text-shadow: #888888 2px 2px 3px;">
		<div class="anuncio-nombre" style="margin-top:10px;">'.$ultimo[0].'</div></a><br />'."\n";
	}
}
echo'</div>'."\n";
?>
<br clear="all">
</section>
</div>
	<footer>
	<?php echo pie('',''); ?>
    <br clear="all">
    <div class="derechos"><?php echo creditos(); ?></div>
    </footer>
</body>
</html>