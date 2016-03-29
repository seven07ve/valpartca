<?php 
include("php/menus-links.sev.php");
include("php/dbconect.php");
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>VALPARTS,C.A.</title>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<link href="css/estilos.css" rel="stylesheet" type="text/css">
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="css/flexslider.css" rel="stylesheet" type="text/css" media="screen" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

</head>
<body>
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