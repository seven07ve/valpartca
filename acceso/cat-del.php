<?php
session_start();
$_SESSION['user_cuenta'];
$_SESSION['pasword_cuenta'];

include("php/dbconect.php");
include("php/acceso.sev.php");
$validar = validar_usuario($_SESSION['user_cuenta'],$_SESSION['pasword_cuenta']);
if ($validar <> "correcto"){
    echo '<SCRIPT LANGUAGE="javascript">location.href = "http://www.google.co.ve/";</SCRIPT>';
}

//ELIMINAR EL NOMBRE DE LA IMG
$bsql="DELETE FROM catalogos WHERE id_catalogo='".$_POST["id_catalogo"]."'";
$borrar = $mysqli->query($bsql);

$directorio = '../catalogo/'.$_POST["id_catalogo"].'pdf';
unlink($directorio);
/*echo '<SCRIPT LANGUAGE="javascript">location.href = "javascript:window.history.go(-1)";</SCRIPT>';*/
echo '<SCRIPT LANGUAGE="javascript">location.href = "'.$_POST["pagina"].'";</SCRIPT>';
/*header('location: '.$_POST["pagina"]);*/
?>
