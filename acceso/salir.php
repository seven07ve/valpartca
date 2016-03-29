<?php
session_start();
$_SESSION['user_cuenta'];
$_SESSION['pasword_cuenta'];

if (isset($_SESSION["user_cuenta"]))
{
unset($_SESSION["user_cuenta"]);
}
if (isset($_SESSION["pasword_cuenta"]))
{
unset($_SESSION["pasword_cuenta"]);
}
include("php/acceso.sev.php");
$validar = validar_usuario($_SESSION['user_cuenta'],$_SESSION['pasword_cuenta']);
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
  <div class="menu-prim"> </div>
  <!--   CONTENIDO   -->
  <div class="contenedor">
      <h2>Hasta Luego</h2>
      <br />
      <br />
  </div>
</div>
</body>
</html>