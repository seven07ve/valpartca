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
//BUSCA LOS ARCHIVOS PARA DAR EL NOMBRE A LA NUEVA IMG
$directorio = '../catalogo';
/*$ficheros1  = scandir($directorio);
asort($ficheros1);
$id_cat=catalogo;*/

$dir= '../catalogo';
if ($_FILES['img']['name'] <> ''){
    //INSERTAR INFO DE LA IMAGEN
//	$insertar= $mysqli->query("INSERT INTO prod_imgs (id_prod,carpeta,posicion) VALUES ('".$_POST["id_prod"]."','".$_POST["id_prod"]."','".$_POST["posicion"]."')");
    //guarda el numero de la ultima id creada por autoincremento
//	$id_cat = $mysqli->insert_id;

    //---------------------------------------MONTAR ARCHIVO
	$nombre_archivo = $_FILES['img']['name'];
    $tipo_archivo = $_FILES['img']['type'];
    $tamano_archivo = $_FILES['img']['size'];
    $dir_temp = $_FILES['img']['tmp_name'];
    $error = $_FILES['userfile']['error'];
    $uploads_dir = $dir;
	
	if (strpos($nombre_archivo, ".pdf.pdf")){
		$nombre = str_replace(".pdf.pdf", "", $nombre_archivo);
		//echo 'pdf='.$nombre;
	}
	else{
		$nombre = str_replace(".pdf", "", $nombre_archivo);
		//echo 'sinpdf'.$nombre;
	}

	$nombre = htmlentities($nombre, ENT_QUOTES, 'UTF-8');

	$isql="INSERT INTO catalogos (nombre) VALUES ('".$nombre."')";
	//ejecuta la sentencia usql
	$insertar = $mysqli->query($isql);
	//guarda el numero de la ultima id creada por autoincremento
	$id_cat = $mysqli->insert_id;
/*	echo 'Directorio: '.$dir_temp.'<br>';
    echo 'error: '.$error.'<br>';
    echo 'nombre: '.$nombre_archivo.'<br>';
    echo 'Tipo: '.$tipo_archivo.'<br>';
    echo 'tamano: '.$tamano_archivo.'<br>';
    echo 'Dir:'.$uploads_dir.'<br>';*/


    //NOMBRE NUEVO DEL ARCHIVO

	$new_name = $id_cat.".pdf";

	//compruebo si las características del archivo son las que deseo
	if ($nombre_archivo){
		if (!((strpos($tipo_archivo, "pdf")) && ($tamano_archivo < 10000000))) {
			//MENSAJE
			$pagina = 'modificar.php?msje=1&num=3';
		}
		else{
			if (copy($_FILES['img']['tmp_name'], "$uploads_dir/$new_name")){
				//MENSAJE
				$pagina =$_POST["pagina"];
				//ACTUALIZAR EL NOMBRE DE LA IMG
				$actualizar_img = $mysqli->query("UPDATE catalogos SET nomb_arch='".$new_name."' WHERE id_catalogo='".$id_cat."'");
			}
			else{
				$aviso ='Ocurrió algún error al subir el fichero. No pudo guardarse.';
			}
		}
	}
//////////////////////////////////////////////////////////////////////////////

}

/*echo '<SCRIPT LANGUAGE="javascript">location.href = "javascript:window.history.go(-1)";</SCRIPT>';*/
echo '<SCRIPT LANGUAGE="javascript">location.href = "'.$pagina.'";</SCRIPT>';
/*header('location: '.$_POST["pagina"]);*/
?>
