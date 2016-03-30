<?php 
include("../php/menus-links.sev.php");
include("../php/cont.sev.php");
?>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="Title" content="VALPARTS,C.A.">
	<meta name="description" content="Somos una organización venezolana que tiene por objeto ofrecer a nuestros clientes una amplia cartera de productos automotrices de alta calidad, con precios competitivos y excelente atención, claramente posicionada en la Ciudad de Mérida, e inequívocamente orientada hacia la excelencia, veracidad y oportunidad a la hora de dar respuestas a las inquietudes presentadas por nuestros clientes. ">
	<meta name="keywords" content="empresa, mayorista, repuestos, partes, automotriz, automotrices, vehiculos, carros, camiones, partes eléctricas, eléctricas, partes mecánicas, mecánicas, ignición, boninas ignición, bombas agua, bombas gasolina, bujías, cables bujía, distribuidores, filtros gasolina, reluctores, rotores, tapas, sensores, vacuums, válvulas PCV, automáticos, bobinas captadoras, bornes, carboneras, luces HID, ramales cruce, relays, resistencias, switches, bocinas rueda, carburadores, cepillos limpia parabrisas, limpia parabrisas, platos clutch, discos clutch, envases, reservorios, hidrocollarines, poleas, tensores, correas" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="rating" content="general">
	<meta name="robots" content="index, follow">
	<meta name="revisit-after" content="10 days">
	<meta name="copyright" content="Este sitio y todo su contenido © Copyright 2016 VALPARTS,C.A. Mérida, Venezuela.">
	<title>QUIENES SOMOS - VALPARTS,C.A.</title>
	<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />
	<link href="../css/estilos.css" rel="stylesheet" type="text/css">
	<link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
</head>
<body>
	<?php include_once("php/analyticstracking.php") ?>
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
echo menu('','who');
?>
		</div>
    </div>
  </nav>
</header>
<div style="width:1260px; margin:0 auto;" >
<?php
fondo('1');
contenido('1');
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