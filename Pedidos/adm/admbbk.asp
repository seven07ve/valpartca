
<%@ Language=VBScript %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 6.0">
<link rel="stylesheet" type="text/css" href="../X001Z900.css">
</head>

<script language="JavaScript1.2" >

if ("<%=Session("glAutorizacion")%>" != '') {
	
	if ("<%=Session("glAutorizacion")%>" == 'UNE') {
		alert("Usuario No Existe")  
	}
	if ("<%=Session("glAutorizacion")%>" == 'CI') {
		alert("Clave Incorrecta")  
	}	  
	if ("<%=Session("glAutorizacion")%>" == 'UNA') {
		alert("Usuario No Autorizado")  
	}	
}

</script>

<body ONLOAD="document.frmGral.LOGIN.focus()" ONUNLOAD="<%Session("glAutorizacion")=""%>" scroll=no>
     <div align="center">
     <table border="0" width="764" cellspacing="1">

        <tr>
		<td width="50%" colspan="2">
		<p align="center">
Modulo de Actualización de Noticias </p>
		</td>
        </tr>
        
        <tr>
        

		<td width="50%" height="222">
		<form NAME="frmGral" METHOD="post" ACTION="admc.asp" target="_parent">
		<div align="center">
		<BR>
		<table border="1" width="40%" cellspacing="0" cellpadding="0" bordercolor="#0066cc" bgcolor="#ffffff">
			<tr>
			<td width="100%">
			<table border="0" width="100%" bgcolor="#fe9900">
				<tr>
				<td width="10%" align="right">
				<img height="32" alt src="../images/acceso.gif" width="32" border="0">
				</td>
				<td width="90%">
				<p align="left"><font color="#ffffff">Control de Acceso</font></p>
				</td>
				</tr>
			</table>
			</td>
			</tr>		
			<tr>
			<td width="100%">
			<table border="0" width="100%" bgcolor="#e9e9e9">
				<!--<tr>
				<td width="35%">
				<p align="right">Compañia:</p>
				</td>
				<td width="65%">
				<input NAME="CIA" size="15" value="CARVICA" readonly>
				</td>
				</tr>-->
				<tr>
				<td width="35%">
				<p align="right">Usuario:</p>
				</td>
				<td width="65%">
				<input NAME="LOGIN" size="15">
				</td>
				</tr>
				<tr>
				<td width="35%">
				<p align="right">Contraseña:</p>
				</td>
				<td width="65%">
				<input NAME="PASSWORD" type="password" size="15">
				</td>
				</tr>
				<tr>
				<td width="100%" colspan="2">
				</td>
				</tr>
			</table>
			</td>
			</tr>
			
		</table>
			<p align="center" style="MARGIN-TOP: 5px; MARGIN-BOTTOM: 0px">
			<input TYPE="submit" NAME="send" VALUE="Entrar" tabindex="2"> 
			</p>
		<p style="MARGIN-TOP: 3px; MARGIN-BOTTOM: 10px" align="center">
				<a href="../X001Z010.ASP" target="main">
				<font style="FONT-SIZE: 8pt">Cambio de contraseña</font><font size="2">
				</font>
				</a></p>
		</div>
		</form>
		</td>
		</tr><!--        <tr>		<td colspan=2 >		<p class="PX" >Para mayor información contactenos a traves de 		<A href="mailto:info@mipedido.com"> info@mipedido.com </a>		</p>		</td>        </tr>		-->
	</table>
	
		</div>

</body>
</html>