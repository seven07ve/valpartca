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
<!-- TinyMCE -->
<script type="text/javascript" src="../tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript">
	tinyMCE.init({
		// General options
		mode : "textareas",
		theme : "advanced",
		width : 900,
		height: 400,
		plugins : "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount,advlist,autosave",

		// Theme options
		theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
		theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
		theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
		theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak,restoredraft",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_statusbar_location : "bottom",
		theme_advanced_resizing : true,

		// Example content CSS (should be your site CSS)
		content_css : "css/content.css",

		// Drop lists for link/image/media/template dialogs
		template_external_list_url : "lists/template_list.js",
		external_link_list_url : "lists/link_list.js",
		external_image_list_url : "lists/image_list.js",
		media_external_list_url : "lists/media_list.js",

		// Style formats
		style_formats : [
			{title : 'Bold text', inline : 'b'},
			{title : 'Red text', inline : 'span', styles : {color : '#ff0000'}},
			{title : 'Red header', block : 'h1', styles : {color : '#ff0000'}},
			{title : 'Example 1', inline : 'span', classes : 'example1'},
			{title : 'Example 2', inline : 'span', classes : 'example2'},
			{title : 'Table styles'},
			{title : 'Table row 1', selector : 'tr', classes : 'tablerow1'}
		],

		// Replace values for the template plugin
		template_replace_values : {
			username : "Some User",
			staffid : "991234"
		}
	});
</script>
<!-- TinyMCE -->
<title>&Aacute;rea Administrativa</title>
</head>
<body>
<div align="center">
  <?php
date_default_timezone_set('America/Caracas');

//busqueda de los datos de la noticia
$ssql=sprintf("SELECT titulo,contenido,dia,mes,ano,autor,id_noticia FROM noticias WHERE id_noticia='".$_GET["num"]."'");
//ejecuta la sentencia sql
$resultado = $mysqli->query($ssql);
$fila = $resultado->fetch_array(MYSQLI_ASSOC);
	$titulo = $fila["titulo"];
	$contenido = $fila["contenido"];
	$dia = $fila["dia"];
	$mes = $fila["mes"];
	$ano = $fila["ano"];
	$autor = $fila["autor"];
	$id_noticia = $fila["id_noticia"];
?>
?>
  <div class="encabezado"> &Aacute;rea Administrativa </div>
  <!--<div class="nomb-user">Jhean account</div>-->
  <div class="menu-prim"> <?php echo menu_sup($validar) ?> </div>
  <div class="menu-sec"> <?php echo menu_sec($validar,'8')?> </div>
  <!--   CONTENIDO   -->
  <div class="contenedor">
    <div class="cont-inf-mont">
      <h2>Modificar Noticias</h2>
      <form action="noticias-modf.php" method="post" name="form1" id="form1" style="margin-left:0; width:900px;">
      <input type="hidden" name="id_noticia" value="<?php echo $id_noticia ?>" />
        <label> Titulo<br />
          <input name="titulo" type="text" required="required" id="titulo" onblur="vacio(this.value)" onkeyup="longitud(this.value, 140)" size="100" maxlength="140" value="<?php echo $titulo ?>" />
          <br />
          <span id="not-tit-long" style="display:none;">Ya alcanzó el límite.</span> <span id="not-tit-restantes" style="display:none;"> restantes:</span>
          <input name="resta" readonly="readonly" type="hidden" id="resta" size="3"/>
          <input id="aviso" style="font-size:14px; text-align:center; color:rgba(255,0,4,1.00); display:none;" value="No hay titulo">
          <br />
        </label>
        <label> Fecha<br />
          Día:
          <input name="dia" type="text" required="required" id="dia" onblur="checkfecha(this.value,this.id)" value="<?php echo $dia ?>" size="2" maxlength="2" />
        </label>
        <label> Mes:
          <input name="mes" type="text" required="required" id="mes" onblur="checkfecha(this.value,this.id)" value="<?php echo $mes ?>" size="2" maxlength="2" />
        </label>
        <label> Año:
          <input name="ano" type="text" required="required" id="ano" onblur="checkfecha(this.value,this.id)" value="<?php echo $ano ?>" size="4" maxlength="4" />
          <br />
          <br />
        </label>
        <label>
          <textarea name="elm1" id="elm1"><?php echo $contenido ?></textarea>
        </label>
        <br />
        <label> Por<br />
          <input name="autor" type="text" required="required" id="autor" value="<?php echo $autor ?>" size="60" maxlength="100" />
        </label>
        <br />
        <br />
        <input type="submit" name="publicar" value="Guardar" onmouseup="vacio(document.form1.titulo.value)" />
      </form>
      <br />
      <br />
    </div>
    <!--IMAGENES-->
    <div class="mont-img">
      <form action="ins_img.php" method="post" enctype="multipart/form-data" name="form2" id="form2" style="margin-bottom:30px;">
		<input type="hidden" name="MAX_FILE_SIZE"  value="6000000"/>
        <label for="fileField2">Agregar Imagen </label>
        <input type="hidden" name="pagina" value="noticias-mod.php?num=<?php $id_multimedia ?>" />
        <input type="file" name="img" id="fileField2" style="margin:0 0 15px" />
        <input type="submit" name="submit" id="submit" value="Agregar" />
      </form>
      
<?php
$directorio = '../imgsweb';
$ficheros1  = scandir($directorio);
//ordena inversamente por nombre
arsort($ficheros1);
Foreach ($ficheros1 as $valor)
{
	if ($valor == '.' or $valor == '..'){
	}
	else{
		echo '<div class="cont-img-mont"><img src="../imgsweb/'.$valor.'" style="vertical-align:middle;" alt="" width="230"/></div>';
		echo '<form action="del_img.php" method="post"id="form" style="margin-bottom:5px 0;">';
		echo '<input type="hidden" name="imagen" value="'.$valor.'" />';
		echo '<input type="hidden" name="pagina" value="noticias-mod.php?num='.$fila["id_noticia"].'" />';
		echo '<input type="submit" id="submit" value="Eliminar" /></form>';
	}
}
?>      

    </div>
  </div>
</div>
</body>
</html>