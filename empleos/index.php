<?php 
include("../php/menus-links.sev.php");
include("../php/cont.sev.php");
include("../php/dbconect.php");
?>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="Title" content="VALPARTS,C.A.">
	<meta name="description" content="Eres Administrador o Contador Eres responsable Proactivo  experiencia Contribuyentes Especiales. Manejo del Software no es limitativo. Participa en el proceso reclutamiento Envía tu currículo. ">
	<meta name="keywords" content="empresa, mayorista, repuestos, partes, automotriz, automotrices, vehiculos, carros, camiones, partes eléctricas, eléctricas, partes mecánicas, mecánicas, ignición, boninas ignición, bombas agua, bombas gasolina, bujías, cables bujía, distribuidores, filtros gasolina, reluctores, rotores, tapas, sensores, vacuums, válvulas PCV, automáticos, bobinas captadoras, bornes, carboneras, luces HID, ramales cruce, relays, resistencias, switches, bocinas rueda, carburadores, cepillos limpia parabrisas, limpia parabrisas, platos clutch, discos clutch, envases, reservorios, hidrocollarines, poleas, tensores, correas" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="rating" content="general">
	<meta name="robots" content="index, follow, archve">
	<meta name="revisit-after" content="10 days">
	<meta name="copyright" content="Este sitio y todo su contenido © Copyright 2016 VALPARTS,C.A. Mérida, Venezuela.">
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
echo menu('','empl');
?>
	 </div>
    </div>
  </nav>
</header>
<div style="width:1260px; margin:0 auto;" >
<?php
fondo('5');
?>
  <div style="height:auto;">
<?php contenido('5'); ?>
<br clear="all"><br clear="all"></div>
<?php
if ($_GET["msj"] == 1){
	echo '<div style="font-weight:bold" align="center">Su Información ha sido enviada.
      <br /><br />
      Le responderemos a la mayor brevedad.</div>';
}
else{
	echo '<div style="font-weight:bold margin-top:20px;">Por favor, utilice el formulario para enviarnos su Información.
      <br /><br />
      </div>';
}
?>
    <form action="enviado.php" method="post" enctype="multipart/form-data" name="form2" id="form2" style=" width:700px; margin:20px 0 0;">
      <label for="textfield2">&nbsp;</label>
      <input class="campos" name="nombre" type="text" required id="nombre" placeholder="Apellidos y Nombres" />
      <br />
      <label for="textfield2" style="margin-top:18px;">&nbsp;</label>
      <input class="campos" name="estado" type="text" required id="estado" placeholder="Estado y Ciudad" />
      <br />
      <label for="textfield2" style="margin-top:18px;">&nbsp;</label>
      <input class="campos" name="direccion" type="text" required id="direccion" placeholder="Dirección" style="width:600px;" />
      <br />
      <label for="textfield2" style="margin-top:18px;">&nbsp;</label>
      <input class="campos" name="telefono" type="text" required id="email" placeholder="Teléfono" />
      <br />
      <label for="textfield2" style="margin-top:18px;">&nbsp;</label>
      <input class="campos" name="correo" type="email" required id="correo" placeholder="Correo" />
      <br />
      <label for="textfield2" style="margin-top:18px;">&nbsp;</label>
      <br />
      <label for="fileField" style="margin-left:7px;">Curriculo:</label>
      <input type="file" name="img" id="fileField">
      <br />
      <label for="select" style="margin-left:7px;">Seleccione el Trabajo:</label>
      <select class="campos" name="id_trabajo" id="select" style="margin-top:10px;">
        <option>Seleccione</option>
<?php
$res_trab=$mysqli->query("SELECT * FROM trabajos");
while ($fila=$res_trab->fetch_array(MYSQLI_ASSOC)){
	echo '<option value="'.$fila["id_trabajo"].'">'.$fila["trabajo"].'</option>';
}
$res_trab->close();
?>
      </select>
      <br />
      <textarea class="camp-texto" name="descripcion" cols="45" rows="5" required id="textarea" placeholder="Información"></textarea>
      <br /><br />
      <div style="position:relative">
      <input type="submit" class="enviar" name="submit2" id="boton" value="Enviar&nbsp;&nbsp;&nbsp;&nbsp;"/><span style="position:relative; top:0px; left:-24px;"><i class="fa fa-envelope-o"></i></span></div>
    </form>
    <br clear="all">
  </section>
</div>
<footer>	<?php echo pie('',''); ?> <br clear="all">
  <div class="derechos"><?php echo creditos(); ?></div>
</footer>
</body>
</html>