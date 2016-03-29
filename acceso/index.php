<?php
session_start();
$_SESSION['user_cuenta']=$_POST['adm_usuario'];
$_SESSION['pasword_cuenta']=$_POST['adm_password'];
if (!isset($_SESSION['count'])) {
	$_SESSION['count'] = 0;
//	echo 'sss'.$_SESSION['count'];
}
else {
	$_SESSION['count']++;
	//echo 'xxx'.$_SESSION['count']++;
}
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
<?php
include("php/acceso.sev.php");
include("php/menu-admin.sev.php");
$validar = validar_usuario($_SESSION['user_cuenta'],$_SESSION['pasword_cuenta']);
?>

<div class="encabezado">
&Aacute;rea Administrativa
</div>
<!--<div class="nomb-user">Jhean account</div>-->
<div class="menu-prim">
<?php echo menu_sup($validar) ?>
</div>
<!--   CONTENIDO   -->
<div style="width:100%" align="center">
	<div class="form-acceso">
<?php
form_acceso($validar);
if ($_SESSION['count'] > 3 and $validar=="incorrecto"){
	//header("location: http://www.google.com");
	exit;
}
?>
	</div>
</div>
</div>
</body>
</html>