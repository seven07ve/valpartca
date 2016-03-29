<?php 
/*session_start();
$_SESSION['user_cuenta'];
$_SESSION['pasword_cuenta'];
*/
include("../php/dbconect.php");

	//INSERTAR INFO DEL POSTULANTE
	$insertar= $mysqli->query("INSERT INTO solicitudes (nombre,estado,direccion,telefono,correo,id_trabajo,descripcion) VALUES ('".$_POST["nombre"]."','".$_POST["estado"]."','".$_POST["direccion"]."','".$_POST["telefono"]."','".$_POST["correo"]."','".$_POST["id_trabajo"]."','".$_POST["descripcion"]."')");
	//guarda el numero de la ultima id creada por autoincremento
	$id_img = $mysqli->insert_id;
	$dir= 'curriculos';
	if ($_FILES['img']['name'] <> ''){


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
		$new_name= $id_img.".pdf";
	//	echo $new_name;
	}
	//   para comprobar
	//echo 'dir: '.$uploads_dir.'/'.$new_name;
	
	//compruebo si las características del archivo son las que deseo 
	if ($id_img){
		if (!((strpos($tipo_archivo, "pdf")) && ($tamano_archivo < 10000000))) { 
			//$aviso ='the file type is not right.<br />Remember, only use files .gif, .jpg o .png'; 
		}
		else{ 
			if (copy($_FILES['img']['tmp_name'], "$uploads_dir/$new_name")){ 
		//			copy($_FILES['img']['tmp_name'], "imagenes/noticias/$new_name");
				$aviso ='El archivo ha sido cargado correctamente.'; 
				//ACTUALIZAR EL NOMBRE DE LA IMG
				$actualizar_img = $mysqli->query("UPDATE solicitudes SET pdf='".$new_name."' WHERE id_solicitud='".$id_img."'");
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
//header('location: '.$_POST["pagina"]);
header('Location: index.php?msj=1');
?>
