<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!--META HTTP-EQUIV="REFRESH" CONTENT="600"/-->

<title>InsysWeb</title>
<meta name="keywords" content="Comercializadora Estadio, C.A.">
<meta name="description" content="Comercializadora Estadio">
<meta name="author" content="Comercializadora Estadio, C.A.">

<link rel=stylesheet type="text/css" href="styleventas.CSS" />


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

function validar() {	
	if (event.keyCode == 13) {		
		enviar()
		}
}

function load() {

	if (document.frmGral.LOGIN.value == '') {
		document.frmGral.LOGIN.focus()
		}
		else {
		document.frmGral.PASSWORD.focus()
	}

}

function enviar() {

	var err

	document.frmGral.cmdEnviar.disabled = true;

	err = '0'

	if (document.frmGral.LOGIN.value == '') {
		alert('Por favor, Ingrese El Usuario');
		document.frmGral.cmdEnviar.disabled = false;
		document.frmGral.LOGIN.focus();
		err = '1'
	}

	if (document.frmGral.PASSWORD .value == '' && err == '0') {
		alert('Por favor, Ingrese Contraseña');
		document.frmGral.cmdEnviar.disabled = false;
		document.frmGral.PASSWORD .focus();
		document.frmGral.LOGIN.value = document.frmGral.LOGIN.value; 
		err = '1'
	}

	if (err == '0') {
		document.frmGral.submit(); 
	}
	
}
</script>


</head>

<%

wQ = TRIM(Request.QueryString("q"))	


%>

<body ONUNLOAD="<%Session("glAutorizacion")=""%>" onload="load();">
<div align="center">
  <p><b><font size="4">Control de Acceso</font></b></p>
  <table width="305" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><table width="305" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td valign="top" align="center"  ><table width="305" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td ><form NAME="frmGral" METHOD="post" ACTION="../Pedidos/defaults.asp" target="_parent" >
                    
                                       <table style="width: 100%" cellpadding="2">
                    
                    
                    
						<input name="CIA" type="hidden"  value="VAL"/>
	
						
						
						
						
						<tr>
							<td ><div align="right">
                            <strong>Usuario:</strong>
                        </div></td>
							<td ><input name="LOGIN" size="15" maxlength="15"  value="<%=Session("glUsuario")%>" onkeypress="validar();"/></td>
							<td><input type="button" name="cmdEnviar" value="Entrar" onclick="javascript:enviar();" tabindex="2" style="font-weight: bold;  border-style:solid; border-width:2px; width:55px; height:25px" /></td>
						</tr>
						<tr>
							<td ><strong>Contraseña:</strong></td>
							<td ><input name="PASSWORD" type="password" maxlength="10" size="15" value="" onkeypress="validar();" /></td>
							<td>&nbsp;</td>
						</tr>
					</table>
                </form></td>
              </tr>
              </table></td>
        </tr>
      </table></td>
    </tr>
    </table>
	<p style="margin-top: 0; margin-left: 0; margin-right: 0"><b><span style="font-size: 8pt">
	Desarrollado por: <a target="_blank" href="http://www.insystech.com.ve">Insystech, C.A. </a></span>
	</b></p>
	<p style="margin-top: 39px;">
	<img src="LogoFuerzaVentas.png" alt=""/></p>


</div>
</body>
</html>
