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
	$mensaje="La Imagen fué Actualizada<br>Banner del Home <br> La Imagen debe tener un tamaño de 1260x300 px";
}
else{
		$mensaje="Banner del Home <br> La Imagen debe tener un tamaño de 1260x300 px";
}
echo '<br /><br /><h2>'.$mensaje.'</h2><br /><br />';
$directorio = '../imgsbanner';
$archivo  = scandir($directorio);
//ordena inversamente por nombre
//print_r($archivo);
$pos=1;
Foreach ($archivo as $valor)
{
	$valor;
	if ($valor == '.' or $valor == '..'){
	}
	else{
		//muestra la imagen
		echo "<h3>Imagen $pos<br></h3>";
		echo '<img src="../imgsbanner/'.$valor.'" width="630" height="250" alt=""/>';
		//echo "pathinfo('../imgsweb/'.$valor);";
		$partes_ruta = pathinfo('../imgsweb/'.$valor);		
//para  versiones posteriores a php5.2
//		$ultimo = explode("-",$partes_ruta['filename']);
//para  versiones anteriores a php5.2
		$ultimo = explode("-",str_replace(".", "",substr($partes_ruta['basename'],0,-4)));
		//echo '<img src="../imgsweb/'.$valor.'" alt=""/> ';
		//echo 'nombre '.$valor;
//		echo 'cc'.$ultimo["1"];
		$sig_nomb=$ultimo["1"]+1;
		echo '<br /><br />
      <form action="ins_img-banner.php" method="post" enctype="multipart/form-data" name="form'.$pos.'" id="form'.$pos.'" style="margin-bottom:30px;">
        <input type="hidden" name="MAX_FILE_SIZE"  value="6000000"/>
        <label for="fileField2"><h3>Actualizar Imagen '.$pos.'</h3></label>
        <input type="hidden" name="nomb_act" value="'.$valor.'" />';
        echo "<input type=\"hidden\" name=\"nomb_sig\" value=\"$pos-".$sig_nomb."\" />";
        echo '<input type="hidden" name="pagina" value="banner.php?msj=1" />
        <input type="file" name="img" id="fileField2" style="margin:0 0 15px" />
        <input type="submit" name="submit" id="submit" value="Actualizar" />
      </form>';
		$pos++;
	}
}
?>
      <br />
      <br />
      
  </div>
</div>
</body>
</html>