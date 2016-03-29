<?php 
include("../php/dbconect.php");
include("../php/menus-links.sev.php");
include("../php/cont.sev.php");
//TOTAL DE IMG POR PAGINA
$tamano_pagina = 5;
//examino la página a mostrar y el inicio del registro a mostrar
$pagina = $_GET["pagina"];
if (!$pagina) {
$inicio = 0;
$pagina=1;
}
else {
$inicio = ($pagina - 1) * $tamano_pagina;
}
//$ssql_cont=sprintf("SELECT * FROM multimedia");
//ejecuta la sentencia sql
//$resultado_cont=$mysqli->query($ssql_cont);
//$resultado_cont->store_result();
$consulta = "SELECT * FROM multimedia";
if ($sentencia = $mysqli->prepare($consulta)) {
	/* ejecutar la consulta */
    $sentencia->execute();
	/* almacenar el resultado */
	$sentencia->store_result();
}

//----------------------------------------PAGINACION---------------------------------------------------------
$num_total_registros = $sentencia->num_rows;
//$num_total_registros = mysql_num_rows($resultado_cont);
//REDONDEO HACIA ARRIBA DEL TOTAL DE PAGINAS DEACUERDO AL TOTAL DE REGISTROS
$total_paginas = ceil($num_total_registros / $tamano_pagina);
//echo $num_total_registros;

//busqueda de los datos de la multimedia
$ssql=sprintf("SELECT * FROM multimedia ORDER BY id_multimedia DESC LIMIT ".$inicio.",".$tamano_pagina."");
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
echo menu('','mult');
?>
		</div>
    </div>
  </nav>
</header>
<div style="width:1260px; margin:0 auto;" >
<section class="contenido">
<?php
fondo('9');
contenido('9');

while($fila = $resultado->fetch_array(MYSQLI_ASSOC)){
	echo '<!--  ANUNCIO  --><a href="multimedia.php?num='.$fila["id_multimedia"].'" title="View all content" style="text-decoration:none; color:#2d2d2d;">
                    <!--IMAGEN-->'."\n";
	echo '<div class="seccion-anuncio">'."\n";					
	echo '<div class="anuncio-nombre" style="margin-top:10px;">'.$fila["titulo"].'<br />'."\n";
	echo '<div style="font-size:14px; text-transform:capitalize;">'.$fila["mes"].'/'.$fila["dia"].'/'.$fila["ano"].'</div></div>'."\n";
	echo'<div class="multi-cuerpo">'.substr($fila["contenido"],0,1000).'</div><br clear="all" /></div></div></a>'."\n";
}
?>                
                
                <!--paginacion-->
                <div style="font-family: 'Old Standard TT', serif; font-weight:bold; margin:10px 0px; text-align:center;">
<?php 
	//muestro los distintos índices de las páginas, si es que hay varias páginas
	if ($total_paginas > 1){
		for ($i=1;$i<=$total_paginas;$i++){
			if ($pagina == $i){
				//si muestro el índice de la página actual, no coloco enlace
				if ($i==$total_paginas){
					$sep = '';
				}
				else{
					$sep = ' - ';
				}
				echo '<span style="color:#999;">'.$pagina.'</span>'.$sep;
				//echo '<span style="color:#036;  font-family:Arial, Helvetica, sans-serif;">'.$pagina . ' </span>';
			}
			else{
				if ($i==$total_paginas){
					$sep = ' ';
				}
				else{
					$sep = ' - ';
				}
				//si el índice no corresponde con la página mostrada actualmente, coloco el enlace para ir a esa página
				echo '<a href="latest-news.php?pagina='.$i.'&select='.$_POST["titulo"].'" style="color:#2d2d2d; text-decoration:none;">' . $i . '</a>'.$sep;
			}
		}
	}

?>                
                
<br clear="all">
</section>
</div>
	<footer>	<?php echo pie('',''); ?>
    <br clear="all">
    <div class="derechos"><?php echo creditos(); ?></div>
    </footer>
</body>
</html>