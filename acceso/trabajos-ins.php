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
      <h2>Sección Agregar o Activar Empleos</h2>
<?php
$mensaje2= "Activar Empleo";
if ($_GET["msje"] == 1){
	$mensaje="El Trabajo fué Agregado";
}
elseif ($_GET["msje"] == 2){
	$mensaje="El Trabajo fué Eliminado";
}
elseif($_GET["msje"] == 3){
	$mensaje2= "Cambios Realizados";
}

echo '<h2>'.$mensaje.'</h2><br /><br />';
echo '<div class="background-negro"><form id="form1" name="form1" method="post" action="trabajos-insd.php">
      <h3>Agregar empleo</h3><p>
		<input type="hidden" name="pagina" value="trabajos-ins.php?msje=1" />
        <label for="textfield"></label>
        <input type="text" name="trabajo" id="textfield" />';
echo ' <input type="submit" name="submit" id="submit" value="Guardar" /></p>';
echo '	</form></div><br><br>';
//CONSULTA SQL
$resultado = $mysqli->query(sprintf("SELECT * FROM trabajos"));
if ($num_emp = $mysqli->affected_rows > 0){
	echo '<div class="background-negro"><form id="form2" name="form2" method="post" action="trabajos-act.php">
		<input type="hidden" name="pagina" value="trabajos-ins.php?msje=3" />
      <p>';
	  $cont=1;
	  echo '<h3>'.$mensaje2.'</h3><br />';
	while ($fila = $resultado->fetch_array(MYSQLI_ASSOC)){
		$check= "";
		if ($fila["activo"] == 1){
			$check= ' checked="checked"';
		}
		echo '<label>
          <input type="checkbox" name="id_trabajo'.$cont.'" value="'.$fila["id_trabajo"].'" id="id_trabajo_0"'.$check.' />
         '.$fila["trabajo"].'</label>';
		 $cont++;
	}
	echo '</p><p><input type="submit" name="submit" id="submit" value="Activar" /></p></form></div><br /><br />';
}
//CONSULTA SQL
$res_del = $mysqli->query(sprintf("SELECT * FROM trabajos"));
if ($num_emp = $mysqli->affected_rows > 0){
	echo '<div class="background-negro"><form id="form2" name="form2" method="post" action="trabajos-del.php">
		<input type="hidden" name="pagina" value="trabajos-ins.php?msje=2" />
      <p>';
	  $cont=1;
	  echo '<h3>Seleccione para Eliminar Empleo</h3><br />';
	while ($fila = $res_del->fetch_array(MYSQLI_ASSOC)){
		echo '<label>
          <input type="checkbox" name="id_trabajo'.$cont.'" value="'.$fila["id_trabajo"].'" id="id_trabajo_0" />
         '.$fila["trabajo"].'</label>';
		 $cont++;
	}
	echo '</p><p><input type="submit" name="submit" id="submit" value="Eliminar" /></p></form></div>';
}
?>

  <br /><br />
    </div>
  </div>
</div>
</body>
</html>