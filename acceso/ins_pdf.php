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

/*	echo 'Directorio: '.$dir_temp.'<br>';
    echo 'error: '.$error.'<br>';
    echo 'nombre: '.$nombre_archivo.'<br>';
    echo 'Tipo: '.$tipo_archivo.'<br>';
    echo 'tamano: '.$tamano_archivo.'<br>';
    echo 'Dir:'.$uploads_dir.'<br>';*/


    //NOMBRE NUEVO DEL ARCHIVO
    if (strpos($tipo_archivo, "pdf")){
        $new_name= $nombre_archivo.".pdf";
    //	echo $new_name;
    }
    //   para comprobar
    //echo 'dir: '.$uploads_dir.'/'.$new_name;

    //compruebo si las características del archivo son las que deseo
    if ($nombre_archivo){
        if (!((strpos($tipo_archivo, "pdf")) && ($tamano_archivo < 10000000))) {
            //$aviso ='the file type is not right.<br />Remember, only use files .gif, .jpg o .png';
        }
        else{
            if (copy($_FILES['img']['tmp_name'], "$uploads_dir/$new_name")){
        //			copy($_FILES['img']['tmp_name'], "imagenes/noticias/$new_name");
                $aviso ='El archivo ha sido cargado correctamente.';
                //ACTUALIZAR EL NOMBRE DE LA IMG
//				$actualizar_img = $mysqli->query("UPDATE prod_imgs SET img='".$new_name."' WHERE id_img='".$id_img."'");
            }
            else{
                $aviso ='Ocurrió algún error al subir el fichero. No pudo guardarse.';
                //ELIMINAR EL NOMBRE DE LA IMG
//				$bsql="DELETE FROM aptos_imgs WHERE id_img='".$id_img."'";
//				$borrar = $mysqli->query($bsql);
            }
        }
    }
//////////////////////////////////////////////////////////////////////////////

}
/*echo '<SCRIPT LANGUAGE="javascript">location.href = "javascript:window.history.go(-1)";</SCRIPT>';*/
echo '<SCRIPT LANGUAGE="javascript">location.href = "'.$_POST["pagina"].'";</SCRIPT>';
/*header('location: '.$_POST["pagina"]);*/
?>
