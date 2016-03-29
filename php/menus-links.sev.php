<?php
function logo($pag){
	if ($pag == "home"){
		echo '<div class="logo"><a href=""><img src="imagenes/logo.png" alt=""/></a></div>';
	}
	else{
		echo '<div class="logo"><a href=""><img src="../imagenes/logo.png" alt=""/></a></div>';
	}
}
function buscador(){
	echo '<div class="cont-buscador">
        <form id="form1" name="form1" method="post" style="">
          <div class="cont-select">
            <div class="cont-mask-select"> <span class="cattit">Todo&nbsp;&nbsp;<i class="fa fa-bars"></i></span> </div>
            <select name="select" id="select">
              <option class="seleccion" value="0">Todo</option>
              <option class="seleccion" value="1">Carburadores</option>
              <option class="seleccion" value="2">Bujías</option>
            </select>
          </div>
          <div class="cont-bot-busc"> <span><i class="fa fa-search"></i></span>
            <input type="submit" name="ir" id="ir" value="&nbsp;&nbsp;">
          </div>
          <div class="cont-prim-busqueda">
            <div class="cont-sec-busqueda">
              <input type="search" name="search" id="search">
            </div>
          </div>
        </form>
      </div>';
}
function ingreso(){
	echo '<div class="ingreso">';
	 echo '<div class="boton-cuenta"><a href="http://www.valpartca.com/contacto" class="boton" ><i class="fa fa-sign-in"></i> Afiliarse</a></div> '."";
     echo '<div class="boton-cuenta"><a href="http://www.valpartca.com/demo"" class="boton" ><i class="fa fa-cuenta"></i> Ingresar</a></div>'."\n";
	 echo '</div>';
}

function rs($pag){
	if ($pag == 'home'){
	echo '<div class="rs">
        <a href="https://www.facebook.com/CorporacionValpartsCa" target="_blank"><img src="imagenes/face.fw.png" width="37" height="36" alt=""/></a>
        <a href="https://twitter.com/Valparts" target="_blank"><img src="imagenes/twitter.fw.png" width="37" height="36" alt=""/></a>
        </div>';
	}
	else{
			echo '<div class="rs">
        <a href="https://www.facebook.com/CorporacionValpartsCa" target="_blank"><img src="../imagenes/face.fw.png" width="37" height="36" alt=""/></a>
        <a href="https://twitter.com/Valparts" target="_blank"><img src="../imagenes/twitter.fw.png" width="37" height="36" alt=""/></a>
        </div>';
	}
}
function menu($lan,$pag){
	//coloca los vinculos y la clase cuando no se esta en home
	$who = '"../quienes-somos/" class="boton-men"';
	$noti = '"../noticias/" class="boton-men"';
	$marc = '"../nuestras-marcas/" class="boton-men"';
	$cat = '"../catalogo/" class="boton-men"';
	$mult = '"../multimedia/" class="boton-men"';
	$cont = '"../contacto/" class="boton-men"';
	$empl = '"../empleos/" class="boton-men"';
	//coloca la linea inferior del menu de la seccion actual y quita el vinculo
	if ($pag == 'who'){
		$who = '"" class="boton-men" style="border-bottom: 4px solid #D0D0D0; height:41px;"';
	}
	if ($pag == 'noti'){
		$noti = '"" class="boton-men" style="border-bottom: 4px solid #D0D0D0; height:41px;"';
	}
	if ($pag == 'noticia'){
		$noti = '"../noticias/" class="boton-men" style="border-bottom: 4px solid #D0D0D0; height:41px;"';
	}
	if ($pag == 'marc'){
		$marc = '"" class="boton-men" style="border-bottom: 4px solid #D0D0D0; height:41px;"';
	}
	if ($pag == 'cat'){
		$cat = '"" class="boton-men" style="border-bottom: 4px solid #D0D0D0; height:41px;"';
	}
	if ($pag == 'mult'){
		$mult = '"../multimedia/" class="boton-men" style="border-bottom: 4px solid #D0D0D0; height:41px;"';
	}
	if ($pag == 'cont'){
		$cont = '"" class="boton-men" style="border-bottom: 4px solid #D0D0D0; height:41px;"';
	}
	if ($pag == 'empl'){
		$empl = '"" class="boton-men" style="border-bottom: 4px solid #D0D0D0; height:41px;"';
	}
	//ESPANOL
	if ($lan == ''){
		//vinculos cuando se esta en home
		if ($pag == 'home'){
			echo '<!-- BOTONES -->
				<a href="empleos/" class="boton-men"'.$empl.' >Empleos</a>
				<a href="contacto/" class="boton-men"'.$cont.' >Contacto</a>
				<a href="multimedia/" class="boton-men"'.$mult.' >Multimedia</a>
				<a href="catalogo/" class="boton-men"'.$cat.' >Catálogos</a>
				<a href="nuestras-marcas/" class="boton-men"'.$marc.' >Nuestras Marcas</a>
				<a href="noticias/" class="boton-men"'.$noti.' >Noticias</a>
				<a href="quienes-somos/" class="boton-men"'.$who.' >Quienes Somos</a>
				<!-- BOTONES -->';
//				<a href="catalogo/catalogo.pdf" target="_blank" class="boton-men" >Catálogo</a>
		}
		//vinculos en el resto de la pagina
		else{
			echo '<!-- BOTONES -->
				<a href='.$empl.' >Empleos</a>
				<a href='.$cont.' >Contacto</a>
				<a href='.$mult.' >Multimedia</a>
				<a href='.$cat.' >Catálogos</a>
				<a href='.$marc.' >Nuestras Marcas</a>
				<a href='.$noti.' >Noticias</a>
				<a href='.$who.' >Quienes Somos</a>
				<a href="../" class="boton-men" >Inicio</a>
				<!-- BOTONES -->';
		}
	}
	//ingles
	else{
		echo '<!-- BOTONES -->
			<td><div class="bot"><a href="index.php"><li><div class="botones">HOME</div></li></a></div></td>
			<td><div class="bot"><a href="rally.php"><li'.$rall.'><div class="botones">RALLY</div></li></a></div></td>
            <td><div class="bot"><a href="catalogo.php"><li'.$cat.'><div class="botones">CATALOG</div></li></a></div></td>
            <td><div class="bot"><a href="contacto.php"><li'.$cont.'><div class="botones">CONTACT</div></li></a></div></td>
            <td><div class="bot"><a href="distribuidores.php"><li'.$dis.'><div class="botones">DEALERS</div></li></a></div></td>
            <!-- BOTONES -->';
	}
}

//MENU DE PIE DE PAGINA
function pie($lan,$pag){
		//coloca los vinculos cuando no se esta en home
	$who = '../quienes-somos/';
	$noti = '../noticias/';
	$marc = '../nuestras-marcas/';
	$cat = '../catalogo/';
	$mult = '../multimedia/';
	$cont = '../contacto/';
	$cont = '../empleos/';
	//coloca la linea inferior del menu de la seccion actual y quita el vinculo
	if ($pag == 'who'){
		$who = '';
	}
	if ($pag == 'noti'){
		$noti = '';
	}
	if ($pag == 'noticia'){
		$noti = '../noticias/';
	}
	if ($pag == 'marc'){
		$marc = '';
	}
	if ($pag == 'cat'){
		$cat = '';
	}
	if ($pag == 'mult'){
		$mult = '../multimedia/';
	}
	if ($pag == 'cont'){
		$cont = '';
	}
	if ($pag == 'empl'){
		$empl = '';
	}
	//español
	if ($lan == ''){
				//vinculos cuando se esta en home
		if ($pag == 'home'){
			echo '<!-- BOTONES -->';
			echo '<div class="col-foot"><a href="quienes-somos/">Quienes Somos</a></div>
		<div class="col-foot"><a href="noticias/">Noticias</a></div>
		<div class="col-foot"><a href="nuestras-marcas/">Nuestras Marcas</a></div>
		<div class="col-foot"><a href="catalogo/">Catálogos</a></div>
		<div class="col-foot"><a href="multimedia/">Multimedia</a></div>
		<div class="col-foot"><a href="contacto/">Contacto</a></div>
		<div class="col-foot"><a href="contacto/">Afiliarse</a></div>
		<div class="col-foot"><a href="http://www.valpartca.com/demo">Ingresar</a></div>
		<div class="col-foot"><a href="empleos/">Empleos</a></div>';
			echo '<!-- BOTONES -->';
		}
		//vinculos en el resto de la pagina
		else{
			echo '<!-- BOTONES -->';
			echo '<div class="col-foot"><a href="'.$who.'">Quienes Somos</a></div>
		<div class="col-foot"><a href="'.$noti.'">Noticias</a></div>
		<div class="col-foot"><a href="'.$marc.'">Nuestras Marcas</a></div>
		<div class="col-foot"><a href="'.$cat.'">Catálogos</a></div>
		<div class="col-foot"><a href="'.$mult.'">Multimedia</a></div>
		<div class="col-foot"><a href="'.$cont.'">Contacto</a></div>
		<div class="col-foot"><a href="'.$cont.'">Afiliarse</a></div>
		<div class="col-foot"><a href="http://www.valpartca.com/demo">Ingresar</a></div>
		<div class="col-foot"><a href="'.$empl.'">Empleos</a></div>';
			echo '<!-- BOTONES -->';
		}
	}
	else{
		
	}
}
function  creditos(){
	echo '<span style="color:#FFFFFF;">Corporación Valparts, C.A. RIF: J-29875968-2 &copy; 2015 Todos los derechos reservados.</span><a href="http://netsaluti.net/studio/" target="_blank"> Diseño y desarrollo: Netsaluti Studio.</a>';
}
?>