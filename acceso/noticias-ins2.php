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
<!-- TinyMCE -->
<script type="text/javascript" src="tinymce_4.1.8/tinymce/js/tinymce/tinymce.min.js"></script>
<script>
tinymce.init({
    selector: "textarea#elm1",
    theme: "modern",
    width: 900,
    height: 400,
    plugins: [
         "advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
         "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
         "save table contextmenu directionality emoticons template paste textcolor"
   ],
   content_css: "css/content.css",
   toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | l      ink image | print preview media fullpage | forecolor backcolor emoticons", 
   style_formats: [
        {title: 'Bold text', inline: 'b'},
        {title: 'Red text', inline: 'span', styles: {color: '#ff0000'}},
        {title: 'Red header', block: 'h1', styles: {color: '#ff0000'}},
        {title: 'Example 1', inline: 'span', classes: 'example1'},
        {title: 'Example 2', inline: 'span', classes: 'example2'},
        {title: 'Table styles'},
        {title: 'Table row 1', selector: 'tr', classes: 'tablerow1'}
    ]
 }); 
</script>
<!-- /TinyMCE -->
<!-- TinyMCE -->
<title>&Aacute;rea Administrativa</title>
</head>
<body>
<div align="center">
  <?php
date_default_timezone_set('America/Caracas');

//busqueda de los nombres y apellidos del usuario
$query = sprintf("SELECT * FROM administrador WHERE adm_correo='".$_SESSION['user_cuenta']."' AND adm_pass='".$_SESSION['pasword_cuenta']."'");
//ejecuta la sentencia sql
$result = $mysqli->query($query);
$row =$result->fetch_array(MYSQLI_ASSOC);
$nombres=$row["adm_nombre"];
$apellidos=$row["adm_apellido"];
?>
  <?php
//
?>
  <div class="encabezado"> &Aacute;rea Administrativa </div>
  <!--<div class="nomb-user">Jhean account</div>-->
  <div class="menu-prim"> <?php echo menu_sup($validar) ?> </div>
  <!--   CONTENIDO   -->
  <div class="contenedor">
    <div style="float:left; width:900px; height:800px; margin:30px 3% 0; display:inline-block;">
      <h2>Agregar Noticias</h2>
      <form action="news-insd.php" method="post" enctype="multipart/form-data" name="form1" id="form1" style="margin-left:0; width:900px;">
        <label> Titulo<br />
          <input name="titulo" type="text" required="required" id="titulo" onblur="vacio(this.value)" onkeyup="longitud(this.value, 140)" size="100" maxlength="140" />
          <br />
          <span id="not-tit-long">Ya alcanzó el límite.</span> <span id="not-tit-restantes"> restantes:</span>
          <input name="resta" readonly="readonly" type="hidden" id="resta" size="3"/>
          <input id="aviso" style="font-size:14px; text-align:center; color:rgba(255,0,4,1.00);" value="No hay titulo">
          <br />
        </label>
        <label> Fecha<br />
          Día:
          <input name="dia" type="text" required="required" id="dia" onblur="checkfecha(this.value,this.id)" value="<?php echo date("d")?>" size="2" maxlength="2" />
        </label>
        <label> Mes:
          <input name="mes" type="text" required="required" id="mes" onblur="checkfecha(this.value,this.id)" value="<?php echo date("m")?>" size="2" maxlength="2" />
        </label>
        <label> Año:
          <input name="ano" type="text" required="required" id="ano" onblur="checkfecha(this.value,this.id)" value="<?php echo date("Y")?>" size="4" maxlength="4" />
          <br />
          <br />
        </label>
        <label>
          <textarea name="area" id="elm1"></textarea>
        </label>
        <br />
        <label> Por<br />
          <input name="autor" type="text" required="required" id="autor" value="<?php echo $apellidos.' '.$nombres; ?>" size="60" maxlength="100" />
        </label>
        <br />
        <br />
        <input type="submit" name="publicar" value="Publish" onmouseup="vacio(document.form1.titulo.value)" />
      </form>
      <br />
      <br />
    </div>
    <!--IMAGENES-->
    <div style="width:360px; height:800px; display:inline-block; margin:30px 0 0; padding:100px 0 0; background:#000000; overflow:auto;">
      <form action="ins_img.php" method="post" enctype="multipart/form-data" name="form2" id="form2" style="margin-bottom:80px;">
		<input type="hidden" name="MAX_FILE_SIZE"  value="6000000"/>
        <label for="fileField2">Agregar Imagen </label>
        <input type="hidden" name="pagina" value="noticias-ins.php" />
        <input type="file" name="img" id="fileField2" style="margin:0 0 15px" />
        <input type="submit" name="submit" id="submit" value="Agregar" />
      </form>
      
<?php
$directorio = '../imgsweb';
$ficheros1  = scandir($directorio);
//$ficheros2  = scandir($directorio, 1);
asort($ficheros1);
Foreach ($ficheros1 as $valor)
{
	if ($valor == '.' or $valor == '..'){
	}
	else{
		echo '<div style="width:230px; min-height:200px; margin:5px 0;"><img src="http://127.0.0.1/0-valpar/imgsweb/'.$valor.'" style="vertical-align:middle;" alt="" width="230"/></div>';
	}
}
?>      

    </div>
  </div>
</div>
</body>
</html>