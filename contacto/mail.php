<?php
//------------------------------------------------------------------ CORREO PARA NETSALUTI STUDIO -----------------------------------
if ($_POST["nombre"] == "" or $_POST["email"] == "" or $_POST["mensaje"] == ""){
	echo '<SCRIPT LANGUAGE="javascript">location.href = "index.html";</SCRIPT>';
}
else{
//	$para  = 'jheancg@gmail.com' . ', '; // atención a la coma
//	$para .= 'omarleandro@hotmail.com';
	$para = "ventasvalparts@gmail.com";
//	$para = "jheancg@gmail.com";
	$asunto = ' - '.$_POST["asunto"];
	$cuerpo='<div style="width:650px; background-color:#FF9A09; padding:50px;" align="center">
<div style="width:600px; font-family:\'Oswald\', sans-serif; font-size:20px; color:#FFF; border:1px dashed #CDCDCD; padding:30px;">
<br /><span style="color:#443F3F; font-weight:bold;">
<span style="text-transform:capitalize; color:#FFFFFF;">'.$_POST["nombre"].'</span><br />'.$_POST["ciudad"].'<br />'.$_POST["email"].'</span>
<br /><br />'.$_POST["mensaje"].'<br /><br /><br /><br /></div><br clear="all" /><br clear="all" /></div>';   
//	$cuerpo= $_POST["nombre"].$_POST["email"].$_POST["mensaje"];
	//para el envío en formato HTML
	$headers  = "MIME-Version: 1.0\r\n";
	$headers .= "Content-type: text/html; charset=iso-8859-1\r\n";
	//dirección del remitente
	$headers .= "From: Valpartca <contacto@valpartca.com>\r\n";
	mail($para,$asunto,$cuerpo,$headers);
/*echo '<SCRIPT LANGUAGE="javascript">location.href = "index.php?msj=1";</SCRIPT>';*/
header('Location: index.php?msj=1');
}
?>
