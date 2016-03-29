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

<title>&Aacute;rea Administrativa</title>
</head>
<body>
<div align="center">
  <div class="encabezado"> &Aacute;rea Administrativa </div>
  <!--<div class="nomb-user">Jhean account</div>-->
  <div class="menu-prim"> <?php echo menu_sup($validar) ?> </div>
<!--  <div class="menu-sec"> <?php //echo menu_sec($validar,'not')?> </div>-->
  <!--   CONTENIDO   -->
  <div class="contenedor">
<?php
if ($_GET["msj"] == 1){
	$mensaje="El Catálogo fué Actualizado";
}
else{
		$mensaje="Catálogo";
}
echo '<br /><br /><h2>'.$mensaje.'</h2>';
?>
      
      <form action="ins_pdf.php" method="post" enctype="multipart/form-data" name="form2" id="form2" style="margin-bottom:30px;">
        <input type="hidden" name="MAX_FILE_SIZE"  value="6000000"/>
        <label for="fileField2">Actualizar Catálogo</label><br /><br />
        <input type="hidden" name="pagina" value="catalogo.php?msj=1" />
        <input type="file" name="img" id="fileField2" style="margin:0 0 15px" />
        <input type="submit" name="submit" id="submit" value="Agregar" />
      </form>

      <br />
      <br />
      
  </div>
</div>
</body>
</html>