<?php 
include("../php/dbconect.php");
include("../php/menus-links.sev.php");
include("../php/cont.sev.php");

//busqueda de los datos de la noticia
$ssql=sprintf("SELECT * FROM noticias WHERE id_noticia='".$_GET["news"]."'");
//ejecuta la sentencia sql
$resultado = $mysqli->query($ssql);

?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>VALPARTS,C.A.</title>
<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />
<link href="../css/estilos.css" rel="stylesheet" type="text/css">
<link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

</head>

<body>
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