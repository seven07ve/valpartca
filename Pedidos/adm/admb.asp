
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

<body ONLOAD="document.frmGral.LOGIN.focus()" ONUNLOAD="<%Session("glAutorizacion")=""%>" scroll=no topmargin="0" leftmargin="2" rightmargin="0" bottommargin="0">
     <div align="center">

<table border="0" cellspacing="0" cellpadding="0" width="100%" height="100%" id="table1">
  <tr> 
    <td width="50%" background="../../images/bg.gif" valign="top">
	<img src="../../images/px1.gif" width="1" height="1" alt="" border="0"></td>
	<td valign="top" background="../../images/bg_left.gif">
	<img src="../../Images/bg_left.gif" alt="" border="0"> 
    </td>
	<td valign="top">
      <table border="0" cellspacing="0" cellpadding="0" width="100%" height="40" id="table4">
        <tr> 
          <td>
			<img src="../../images/px1.gif" width="780" height="1" alt="" border="0"></td>
          <td>
			<img src="../../images/px1.gif" width="1" height="1" alt="" border="0"></td>
        </tr>
      </table>
     <table border="0" width="764" cellspacing="1" id="table5">

        <tr>
		<td width="50%">
		<p align="center">
<b><font face="Tahoma" style="font-size: 11pt">Modulo de Actualización de Noticias 
</font></b> </p>
		</td>
        </tr>
        
        <tr>
        

		<td width="50%" height="222">
		<form NAME="frmGral" METHOD="post" ACTION="admc.asp" target="_parent">
		<div align="center">
		<table border="1" width="40%" cellspacing="0" cellpadding="0" bordercolor="#0066cc" bgcolor="#ffffff" id="table6">
			<tr>
			<td width="100%">
			<table border="0" width="100%" bgcolor="#fe9900" id="table7">
				<tr>
				<td width="10%" align="right">
				<img height="32" alt src="../images/acceso.gif" width="32" border="0">
				</td>
				<td width="90%">
				<p align="left"><b>
				<font color="#ffffff" face="Tahoma" style="font-size: 11pt">&nbsp; Control de Acceso</font></b></p>
				</td>
				</tr>
			</table>
			</td>
			</tr>		
			<tr>
			<td width="100%">
			<table border="0" width="100%" bgcolor="#e9e9e9" id="table8">
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
				<p align="right"><font face="Tahoma" size="2">Usuario:</font></p>
				</td>
				<td width="65%">
				<input NAME="LOGIN" size="15">
				</td>
				</tr>
				<tr>
				<td width="35%">
				<p align="right"><font face="Tahoma" size="2">Contraseña:</font></p>
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
			<input TYPE="submit" NAME="send" VALUE="Entrar" tabindex="2" style="font-family: Tahoma; font-size: 10pt"> 
			</p>
		<p style="MARGIN-TOP: 3px; MARGIN-BOTTOM: 10px" align="center">
				<font face="Tahoma">
				<a href="../X001Z010.ASP" target="main2">
				<font size="2">Cambio de contraseña </font>
				</a></font></p>
		</div>
		</form>
		</td>
		</tr>
	</table>
	
    </td>
	<td valign="bottom" background="../../images/bg_right.gif">
	<img src="../../images/bg_right.gif" alt="" border="0"></td>
	<td width="50%" background="../../images/bg.gif" valign="top">
	<img src="../../images/px1.gif" width="1" height="1" alt="" border="0"></td>
</tr>
</table>

		<table border="0" width="764" cellspacing="1">

        <!--       <tr>		<td colspan=2 >		<p class="PX" >Para mayor información contactenos a traves de 		<A href="mailto:info@mipedido.com"> info@mipedido.com </a>		</p>		</td>        </tr>		-->
	</table>
	
		</div>

</body>
</html>