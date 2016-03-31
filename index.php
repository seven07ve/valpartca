<?php 
include("php/menus-links.sev.php");
include("php/dbconect.php");
?>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="Title" content="VALPARTS,C.A.">
	<meta name="description" content="Mayorista de Repuestos Automotrices en Venezuela dedicada a importar y distribuir accesorios y partes eléctricas-mecánicas-ignición -Proveedor autorizado RALLY. ">
	<meta name="keywords" content="empresa, mayorista, repuestos, partes, automotriz, automotrices, vehiculos, carros, camiones, partes eléctricas, eléctricas, partes mecánicas, mecánicas, ignición, boninas ignición, bombas agua, bombas gasolina, bujías, cables bujía, distribuidores, filtros gasolina, reluctores, rotores, tapas, sensores, vacuums, válvulas PCV, automáticos, bobinas captadoras, bornes, carboneras, luces HID, ramales cruce, relays, resistencias, switches, bocinas rueda, carburadores, cepillos limpia parabrisas, limpia parabrisas, platos clutch, discos clutch, envases, reservorios, hidrocollarines, poleas, tensores, correas" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="rating" content="general">
	<meta name="robots" content="index, follow">
	<meta name="revisit-after" content="10 days">
	<meta name="copyright" content="Este sitio y todo su contenido © Copyright 2016 VALPARTS,C.A. Mérida, Venezuela.">
	<title>VALPARTS,C.A.</title>
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
	<link href="css/estilos.css" rel="stylesheet" type="text/css">
	<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="css/flexslider.css" rel="stylesheet" type="text/css" media="screen" />
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
</head>
<body>
	<?php include_once("php/analyticstracking.php") ?>
	<section style="display:none;"><h1>VALPARTS,C.A.</h1>  <h2>Mayorista de Repuestos Automotrices en Venezuela dedicada a importar y distribuir accesorios y partes eléctricas-mecánicas-ignición -Proveedor autorizado RALLY.</h2> </section>
<header>
  <nav>
  <div class="cont-hed-sup">
<?php
echo logo('home');
echo buscador();
echo ingreso();
?>
    </div>
    <div class="botones-men">
		<div class="cont-botones-men">
<?php 
echo rs('home');
echo menu('','home');
?>
		</div>
    </div>
  </nav>
</header>
<div style="width:1260px; margin:0 auto;" >
<section>
    <!-- slider -->
		<div class="cont-slid">
            <div class="flexslider1" style="border:none;">
            <ul class="slides">
<?php
$directorio = 'imgsbanner';
$archivo  = scandir($directorio);
//ordena inversamente por nombre
//print_r($archivo);
$pos=1;
Foreach ($archivo as $valor)
{
	$valor;
	if ($valor == '.' or $valor == '..'){
	}
	else{
		//muestra la imagen
		echo '<li><img src="imgsbanner/'.$valor.'" width="1260" height="350" alt=""/></li>';
	}
}
?>
            </ul>
            </div>
		</div><!-- slider -->
 </section>
 <section class="seg-secc">
 <!--NUESTROS PRODUCTOS-->
 <div class="cont-secc" style="margin:5px 15px 25px 3px;">
     <div class="tit-secc">NUESTROS PRODUCTOS</div>
     <div class="secc-prod"><img src="imagenes/productos_rally.jpg" width="400" height="245" alt=""/></div>
 </div>
 <!--NOTICIAS-->
 <div class="cont-secc" style="margin:5px 14px 25px 0px;">
     <div class="tit-secc">NOTICIAS</div>
     <div class="secc-prod noticias">
<?php
//busqueda de los datos de la noticia
$ssql=sprintf("SELECT * FROM noticias ORDER BY id_noticia DESC LIMIT 3");
//ejecuta la sentencia sql
$resultado = $mysqli->query($ssql);
while($fila = $resultado->fetch_array(MYSQLI_ASSOC)){
	echo '<a href="noticias/noticia.php?news='.$fila["id_noticia"].'" title="View all content" style="text-decoration:none; color:#2d2d2d;">';
	echo '<div class="titulo">'.$fila["titulo"].'</div>';
	echo '<div class="cont-not">'.substr($fila["contenido"],0,600).'</div></a>';
}
?>
     </div>
 </div>
 <!--NOTICIAS-->
 <div class="cont-cat">
 	<img src="imagenes/cat-img.jpg" alt=""/>
    <div class="tit-cat">Descarga Nuestros Catálogos</div>
    <a href="catalogo/"><div class="bot-cat">Aquí</div></a>
 </div>
 <!--VIDEOS-->
 <div class="cont-secc" style="height:auto; margin:0px 2px 0px 0px;">
     <div class="tit-secc">RECURSOS</div>
     <div class="secc-rec">
         <div class="secc-rec-cont">
             <a href="multimedia/">
             <div class="rec"><img src="imagenes/vid-hom.jpg" width="110" height="85" alt=""/>Videos</div></a>
             <a href="#">
             <div class="rec"><img src="imagenes/down-hom.fw.png" width="110" height="85" alt="" />Descargas</div></a>
             <a href="#">
             <div class="rec"><img src="imagenes/dow-hom.jpg" width="110" height="85" alt="" />Blog</div></a>
         </div>
     </div>
 </div>
 </section>
	<footer>
	<?php echo pie("","home"); ?>
    <br clear="all">
    <div class="derechos"><?php echo creditos(); ?></div>
    </footer>
 
  <!-- jQuery -->
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
  <script>window.jQuery || document.write('<script src="js/libs/jquery-1.7.min.js">\x3C/script>')</script>
 <!-- FlexSlider -->
    <script defer src="scripts/jquery.flexslider.js"></script>
  
  <script type="text/javascript">
    $(function(){
      SyntaxHighlighter.all();
    });
    $(window).load(function(){
      $('.flexslider1').flexslider({
        animation: "fade",
		controlNav: true,
        start: function(slider){
          $('body').removeClass('loading');
        }
      });
    });
  </script>
  
    <script type="text/javascript">
    $(function(){
      SyntaxHighlighter.all();
    });
    $(window).load(function(){
      $('.flexslider2').flexslider({
        animation: "slide",
		directionNav: true,
        animationLoop: false,
        itemWidth: 150,
        itemMargin: 5,
		slideshow: false,
		controlNav: false,
        start: function(slider){
          $('body').removeClass('loading');
        }
      });
    });
  </script>
<!-- FlexSlider -->
<!-- cambia el titulo del select de buscador -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script>
$("#select").on( "click", function() {
  $( "span.cattit" ).replaceWith( '<span class="cattit">' + $( this ).find('option:selected').text() + '&nbsp;&nbsp;<i class="fa fa-bars"></i></span>' );
});
</script>
</body>
</html>