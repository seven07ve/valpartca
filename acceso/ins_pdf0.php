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
$id_img=catalogo;*/

$dir= '../catalogo';
if ($_FILES['img']['name'] <> ''){
    //INSERTAR INFO DE LA IMAGEN
//	$insertar= $mysqli->query("INSERT INTO prod_imgs (id_prod,carpeta,posicion) VALUES ('".$_POST["id_prod"]."','".$_POST["id_prod"]."','".$_POST["posicion"]."')");
    //guarda el numero de la ultima id creada por autoincremento
//	$id_img = $mysqli->insert_id;

    //---------------------------------------MONTAR ARCHIVO
	$nombre_archivo = $_FILES['img']['name'];
    $tipo_archivo = $_FILES['img']['type'];
    $tamano_archivo = $_FILES['img']['size'];
    $dir_temp = $_FILES['img']['tmp_name'];
    $error = $_FILES['userfile']['error'];
    $uploads_dir = $dir;

	if (strpos($nombre_archivo, ".pdf.pdf")){
		$nombre = str_replace(".pdf.pdf", "", $nombre_archivo);
		$nombre = htmlentities($nombre, ENT_QUOTES, 'UTF-8');
		//echo 'pdf='.$nombre;
	}
	else{
		$nombre = str_replace(".pdf", "", $nombre_archivo);
		$nombre = htmlentities($nombre, ENT_QUOTES, 'UTF-8');
		//echo 'sinpdf'.$nombre;
	}
	echo 'Directorio: '.$dir_temp.'<br>';
    echo 'error: '.$error.'<br>';
    echo 'nombre: '.$nombre_archivo.'<br>';
    echo 'Tipo: '.$tipo_archivo.'<br>';
    echo 'tamano: '.$tamano_archivo.'<br>';
    echo 'Dir:'.$uploads_dir.'<br>';


    //NOMBRE NUEVO DEL ARCHIVO
/*    if (strpos($tipo_archivo, "pdf")){
		$nombre_archivo = str_replace(" ", "_", $nombre_archivo);
		$new_name = htmlentities($nombre_archivo, ENT_QUOTES,'UTF-8');
    	echo $new_name;
    }*/
    //   para comprobar
    //echo 'dir: '.$uploads_dir.'/'.$new_name;
}
?> 