<?php 
include("../php/dbconect.php");
include("../php/menus-links.sev.php");
include("../php/cont.sev.php");

//busqueda de los datos de la noticia
$ssql=sprintf("SELECT * FROM noticias WHERE id_noticia='".$_GET["news"]."'");
//ejecuta la sentencia sql
$resultado = $mysqli->query($ssql);
$resultado2 =  $mysqli->query($ssql);

//busqueda de la ultima noticia
$row_meta = $resultado2->fetch_array(MYSQLI_ASSOC);
$meta = $row_meta["titulo"]." ".strip_tags(substr($row_meta["contenido"],0,800));
?>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="Title" content="VALPARTS,C.A.">
	<meta name="description" content="<?php echo $meta; ?>">
	<meta name="keywords" content="empresa, mayorista, repuestos, partes, automotriz, automotrices, vehiculos, carros, camiones, partes eléctricas, eléctricas, partes mecánicas, mecánicas, ignición, boninas ignición, bombas agua, bombas gasolina, bujías, cables bujía, distribuidores, filtros gasolina, reluctores, rotores, tapas, sensores, vacuums, válvulas PCV, automáticos, bobinas captadoras, bornes, carboneras, luces HID, ramales cruce, relays, resistencias, switches, bocinas rueda, carburadores, cepillos limpia parabrisas, limpia parabrisas, platos clutch, discos clutch, envases, reservorios, hidrocollarines, poleas, tensores, correas" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="rating" content="general">
	<meta name="robots" content="index, follow">
	<meta name="revisit-after" content="10 days">
	<meta name="copyright" content="Este sitio y todo su contenido © Copyright 2016 VALPARTS,C.A. Mérida, Venezuela.">
	<title><?php echo $row_meta["titulo"]; ?> VALPARTS,C.A.</title>
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
echo menu('','noticia');
?>
		</div>
    </div>
  </nav>
</header>
<div style="width:1260px; margin:0 auto;" align="center">
<?php
fondo('8');
?>
				<!--  TITULO DE LA SECCION  -->
				<div style="width:1260px;height:auto;" align="left">
<?php 
while($fila = $resultado->fetch_array(MYSQLI_ASSOC)){
	echo '<h2>'.$fila["titulo"].'<br />'."\n";
	echo '<div style="font-size:14px; text-transform:capitalize;">'.$fila["mes"].'/'.$fila["dia"].'/'.$fila["ano"].'</h2></div>'."\n";
	echo '<div class="seccion-anuncio" style="width:1200px; margin:30px;">'."\n";					
	echo'<div class="anuncio-cuerpo2">'.$fila["contenido"].'</div><br clear="all" /></div>'."\n";
}
?>                
                </div>
                <!--paginacion-->
                <div style="font-family: 'Old Standard TT', serif; font-weight:bold; margin:10px 0px; text-align:center;">
                </div>
<br clear="all">
</section>
</div>
	<footer>
	<?php echo pie("","noticia"); ?>
    <br clear="all">
    <div class="derechos"><?php echo creditos(); ?></div>
    </footer>
</body>
</html>