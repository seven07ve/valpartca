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
echo menu('','cont');
?>
	</div>
    </div>
  </nav>
</header>
<div style="width:1260px; margin:0 auto;" >
<?php
fondo('4');
?>
  <div style="height:auto;">
<?php contenido('4'); ?>
<br clear="all"><br clear="all"></div>
<?php
if ($_GET["msj"] == 1){
	echo '<div style="font-weight:bold" align="center">Su mensaje ha sido enviado.
      <br /><br />
      Procuraremos responderle a la mayor brevedad.</div>';
}
else{
	echo '<div style="font-weight:bold margin-top:20px;">Por favor, utilice el formulario para enviarnos un mensaje.
      <br /><br />
      Procuraremos responderle a la mayor brevedad.</div>';
}
?>
    <form id="form2" name="form2" method="post" action="mail.php" style=" width:500px; margin:20px 0 0;">
      <label for="textfield2">&nbsp;</label>
      <input class="campos" name="nombre" type="text" required id="nombre" placeholder="Apellidos y Nombres" />
      <br />
      <label for="textfield2" style="margin-top:18px;">&nbsp;</label>
      <input class="campos" name="ciudad" type="text" required id="ciudad" placeholder="Estado y Ciudad" />
      <br />
      <label for="textfield2" style="margin-top:18px;">&nbsp;</label>
      <input class="campos" name="email" type="email" required id="email" placeholder="Correo" />
      <br />
      <label for="textfield2" style="margin-top:18px;">&nbsp;</label>
      <input class="campos" name="asunto" type="text" required id="ciudad" placeholder="Asunto" />
      <br />
      <textarea class="camp-texto" name="mensaje" cols="45" rows="5" required id="textarea" placeholder="Texto"></textarea>
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