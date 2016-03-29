<?php 
//funcion que verifica si el usuario y el password son correctos
function validar_usuario($usuario,$password){
	if (!$usuario){
	$var = "vacio";
	}
	else{
		include("dbconect.php");
		//include("menu-admin.sev.php");
		
		//Chequear usuario y password
		$query = sprintf("SELECT adm_correo, adm_pass FROM administrador WHERE adm_correo='".$usuario."' AND adm_pass='".$password."'");
//echo $query;
		//busca en la bd
		$result = $mysqli->query($query);
		//usuario o password no coinciden
		if ($mysqli->affected_rows == 0){
			$validar = 'incorrecto';
			unset($_SESSION['user_cuenta']);
			unset($_SESSION['pasword_cuenta']);
		}
		//intento de hack
		elseif ($mysqli->affected_rows > 1){
			$validar = header("www.google.com");
		}
		//ususario y password correcto
		elseif ($mysqli->affected_rows == 1){
			$validar = 'correcto';
		}
		/* liberar la serie de resultados */
		mysqli_free_result($result);
	}
	return $validar;
}

//funcion para extraer la info del usuario
function datos_usuario($usuario,$password){
	include("dbconect.php");
	if ($password == ''){
		$query = sprintf("SELECT * FROM administrador WHERE adm_correo='".$usuario."'");
	}
	else{
		$query = sprintf("SELECT * FROM administrador WHERE adm_correo='".$usuario."' AND adm_pass='".$password."'");
		
	}
	$result = $mysqli->query($query);
	//$row = $result->fetch_array(MYSQLI_ASSOC);
	return $result->fetch_array(MYSQLI_ASSOC);
//	return $row;
}

//funcion que muestra el formulario de acceso, mensajes de error o la bienvenida
function form_acceso($validar){
	if ($validar == "correcto"){
		$row = datos_usuario($_SESSION['user_cuenta'],$_SESSION['pasword_cuenta']);
		echo '<br><br><span style="font-size:22px;">BIENVENIDO</span><br><br><span style="font-size:18px;">'.$row["adm_nombre"].' '.$row["adm_apellido"].'</span>';
	}
	else{
		echo '<span style="font-size:20px; color:#CCC; margin:10px 0px 10px 0px;">INGRESAR AL &Aacute;REA ADMINISTRATIVA</span>';
		if ($validar == "incorrecto"){
			echo '<span style="font-size:12px; color:##FFFF00;"><br />Nombre de usuario o contraseña no válidos.</span>';
		}
		echo '<br />
					<form id="form1" name="form1" method="post" action="" style="margin-top:30px;">
							Usuario:<br />
							<input type="text" name="adm_usuario" required id="text1" autofocus="autofocus" style="text-align:center;" />
							<br /><br />
							Contraseña:<br />
							<input type="password" name="adm_password" required id="password1" style="text-align:center;" />
							<br /><br />
							<input type="submit" name="button" id="button" value="Ingresar" />
					</form>';
		if ($validar == "incorrecto"){ 
			echo '<span style="font-size:12px">&iquest;No puedes iniciar seci&oacute;n? <a href="rac.php" style="color:##2626FF;">Recuperar contraseña</a></span>'; 
		}
	}
}

//funcion que verifica si el usuario o el correo son correctos
function recuperar_datos($email){
	if (!$email){
	$var = "vacio";
	}
	else{
		include("php/dbconect.php");
		
		//Checkear usuario y password
		$query = sprintf("SELECT adm_correo FROM administrador WHERE adm_correo='".$email."'");
//echo $query;
		//busca en la bd
		$result = $mysqli->query($query);
		//usuario o password no coinciden
		if ($mysqli->affected_rows == 0){
			$validar = 'incorrecto';
			unset($_SESSION['user_cuenta']);
			unset($_SESSION['pasword_cuenta']);
		}
		//intento de hack
		elseif ($mysqli->affected_rows > 1){
			$validar = header("www.google.com");
		}
		//ususario y password correcto
		elseif ($mysqli->affected_rows == 1){
			$validar = 'correcto';
		}
		/* liberar la serie de resultados */
		mysqli_free_result($result);
	}
	return $validar;
}

//funcion que muestra el formulario de recuperacion de datos
function form_recuperacion($validar){
	if ($validar && $validar <> "incorrecto"){
	echo '<span style="font-size:20px"><br /><br />Your password has been sent by mail.<br /><br /><a href="index.php" style="font-size:14px; color:#FF6;">Back to Sign in</a></span>';
	return $email;
	}
	else{
		echo '<span style="font-size:20px;">Recover password<br /></span>';
		if ($validar == "incorrecto"){
			echo '<span style="font-size:12px; color:#CC3333;">The email doesn\'t match.</span>';
		}
		echo '<br /><br />
			<form id="form1" name="form1" method="post" action="">
				Email<br /><input type="text" name="email" id="email" />
			<br /><br />
				<input type="submit" name="button" id="button" value="Sent" />
					</form>';
		if ($validar == "incorrecto"){ 
			echo '<span style="font-size:12px">If you don\'t remember your email account.</span><span style="font-size:12px; color:#FF6;"> Contact the web admin.</span>'; 
		}
	}
}

?>