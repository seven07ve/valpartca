<?php
session_start();
$_SESSION['user_cuenta'];
$_SESSION['pasword_cuenta'];
include("php/acceso.sev.php");
$validar = validar_usuario($_SESSION['user_cuenta'],$_SESSION['pasword_cuenta']);
//echo $validar.'xxxx';
if(!$_SESSION['user_cuenta'] or !$_SESSION['pasword_cuenta']){
	echo '<SCRIPT LANGUAGE="javascript">location.href = "http://www.google.co.ve/";</SCRIPT>'; 
}
include("php/dbconect.php");
include("php/menu-admin.sev.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
<link href="../css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="scripts1.js"></script>
<title>&Aacute;rea Administrativa</title>
</head>
<body>
<div align="center">
  <div class="encabezado"> &Aacute;rea Administrativa </div>
  <!--<div class="nomb-user">Jhean account</div>-->
  <div class="menu-prim"> <?php echo menu_sup($validar) ?> </div>
  <div class="menu-sec"> <?php echo menu_sec($validar,'5')?> </div>
  <!--   CONTENIDO   -->
  <div class="contenedor" style="width:1000px; margin:0 auto;">
    <div class="cont-inf-mont">
      <h2>Solicitudes de Empleos</h2>
<?php
//CONSULTA SQL
$resultado = $mysqli->query(sprintf("SELECT * FROM solicitudes"));
if ($num_emp = $mysqli->affected_rows > 0){
	echo '<div class="background-negro" style="width:860px; text-align:left; padding:1px 20px;">';
	  $cont=1;
	while ($fila = $resultado->fetch_array(MYSQLI_ASSOC)){
		echo '<h3><div style="float:left;">'.$fila["nombre"].' <span style="margin:0 10px;">-</span> ';
		echo '<a href="../empleos/curriculos/'.$fila["pdf"].'" target="_blank">Curriculo</a></div>';
		//borrar
		echo '<form id="form'.$cont.'" name="form'.$cont.'" method="post" action="trabajos-sol-del.php" style="float:left; width:70px; margin-left:20px;"><input type="hidden" name="id_solicitud" value="'.$fila["id_solicitud"].'" /><input type="hidden" name="pdf" value="'.$fila["pdf"].'" /><input type="hidden" name="pagina" value="trabajos.php" /><input type="submit" name="boton" value="Borrar" /></form></h3><br />';
		//---
		echo '<h4>'.$fila["estado"].' <span style="margin:0 10px;">-</span> '.$fila["direccion"].'</h4>';
		echo '<h4>'.$fila["telefono"].' <span style="margin:0 10px;">-</span> '.$fila["correo"].'</h4>';
		$res_trab = $mysqli->query(sprintf("SELECT * FROM trabajos WHERE id_trabajo='".$fila["id_trabajo"]."'"));
		$job= $res_trab->fetch_array(MYSQLI_ASSOC);
		echo '<h4>'.$job["trabajo"].'</h4>';
		echo '<h4>'.$fila["descripcion"].'</h4></div>';
		 $cont++;
	}
}
?>
<!--	<div class="background-negro" style="width:860px; text-align:left; padding:1px 20px;">
    <h3><div style="float:left;">Jhean Guerrero <span style="margin:0 10px;">-</span> <a href="../empleos/curriculos/1.pdf">pdf-link.pdf</a></div><form id="form1" name="form1" method="post" action="" style="float:left; width:70px; margin-left:20px;"><input type="submit" name="boton" value="Borrar" /></form></h3><br />
    <h4>Estado ciudad <span style="margin:0 10px;">-</span> direccion</h4>
    <h4>telkefono <span style="margin:0 10px;">-</span> correo</h4>
    <h4>descripcion</h4>
    </div>-->
  <br /><br />
    </div>
  </div>
</div>
</body>
</html>