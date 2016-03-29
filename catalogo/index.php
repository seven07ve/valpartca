<?php 
include("../php/menus-links.sev.php");
include("../php/cont.sev.php");
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