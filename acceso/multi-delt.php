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
//ELIMINAR
$ssql="DELETE FROM multimedia WHERE id_multimedia='".$_POST['id_multimedia']."'";
//ejecuta la sentencia sql
$resultado = $mysqli->query($ssql);
?>
  <div class="encabezado"> &Aacute;rea Administrativa </div>
  <!--<div class="nomb-user">Jhean account</div>-->
  <div class="menu-prim"> <?php echo menu_sup($validar) ?> </div>
  <div class="menu-sec"> <?php echo menu_sec($validar,'9')?> </div>
  <!--   CONTENIDO   -->
  <div class="contenedor">
      <h2>El Artículo Multimedia fué Eliminado</h2>
      <br />
      <br />
  </div>
</div>
</body>
</html>