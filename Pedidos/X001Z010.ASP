
<HTML>
<HEAD>

<link rel=stylesheet type="text/css" href="X001Z900.css">
</HEAD>

<SCRIPT LANGUAGE="VBScript">
	DIM wMSG
	DIM wERROR 
	SUB cmdSubmit_onClick()
		wERROR = "0"
		IF document.frmGral.LOGIN.value = ""  THEN  
		    wMSG = MsgBox("Por favor, Ingrese El Usuario",vbExclamation,"Pedidos") 
		    document.frmGral.LOGIN.focus() 
		    wERROR = "1"
		END IF  
		
		IF document.frmGral.PASSWORD.value = ""  AND wERROR = "0" THEN  
		    wMSG = MsgBox("Por favor, Ingrese Contraseña",vbExclamation,"Pedidos") 
		    document.frmGral.PASSWORD.focus() 
   		    wERROR = "1"
		END IF  
		
		IF trim(document.frmGral.PASSWORDN.value) = ""  AND wERROR = "0" THEN  
		    wMSG = MsgBox("Por favor, Ingrese Contraseña Nueva",vbExclamation,"Pedidos") 
		    document.frmGral.PASSWORDN.focus() 
   		    wERROR = "1"
		END IF  
		
		IF trim(document.frmGral.PASSWORDNN.value) = ""  AND wERROR = "0" THEN  
		    wMSG = MsgBox("Por favor, Confirme Contraseña",vbExclamation,"Pedidos") 
		    document.frmGral.PASSWORDNN.focus() 
   		    wERROR = "1"
		END IF  
		
		IF trim(document.frmGral.PASSWORDN.value) <> trim(document.frmGral.PASSWORDNN.value) AND wERROR = "0" THEN  
		    wMSG = MsgBox("Contraseña Nueva no coincide con la confirmada",vbExclamation,"Cambio de Contraseña") 
		    document.frmGral.PASSWORDNN.focus() 
   		    wERROR = "1"
		END IF  
		
		IF wERROR = "0" THEN
			document.frmGral.submit
		END IF  

		
	END SUB

</SCRIPT>


<script language="JavaScript" >


function validar() {	
	if (event.keyCode == 13) {		
		cmdSubmit_onClick()
		}
}

</SCRIPT>

<BODY ONLOAD="document.frmGral.LOGIN.focus()" scroll=no ONUNLOAD="<%Session("glAutorizacion")=""%>" topmargin="0" leftmargin="2" rightmargin="0" bottommargin="0" background="../../images/bg.gif">
     <div align="center">

<table border="0" cellspacing="0" cellpadding="0" width="100%" height="100%" id="table9" bgcolor="#FFFFFF">
  <tr> 
    <td width="50%" background="../images/bg.gif" valign="top">
	<img src="../images/px1.gif" width="1" height="1" alt="" border="0"></td>
	<td valign="top" background="../images/bg_left.gif">
	<img src="../Images/bg_left.gif" alt="" border="0"> 
    </td>
	<td valign="top">
      <table border="0" cellspacing="0" cellpadding="0" width="100%" height="62"  id="table10">
        <tr> 
          <td>
			<img src="../images/px1.gif" width="780" height="1" alt="" border="0"></td>
          <td>
			<img src="../images/px1.gif" width="1" height="1" alt="" border="0"></td>
        </tr>
      </table>
     <table border="0" width="764" cellspacing="1" id="table11">

        <tr>
        

		<td width="50%" height="222">
		<FORM NAME="frmGral" METHOD="post" ACTION="X001Z010S.asp" target="main" >
		<div align="center">
		<table border="1" width="80%" cellspacing="0" cellpadding="0" bordercolor="#0066CC" bgcolor="#FFFFFF" id="table16"  >
			<tr>
			<td width="100%" >
			<table border="0" width="100%" bgcolor="#FE9900" id="table17">
				<tr>
				<td width="10%" align="right">
				<p align="center">
				<IMG alt ="" border=0 width=32 height=32 src="images/acceso.gif"  >
				</td>
				<td width="90%" >
				<p align="left"><b>
				<font color="white" face="Tahoma" style="font-size: 11pt">
				Cambio de Contraseña</font></b></p>
				</td>
				</tr>
			</table>
			</td>
			</tr>		
			<tr>
			<td width="100%">
			<table border="0" width="100%" bgcolor="#E9E9E9" id="table18">
				<!--<tr>				
				<td width="45%" >
				<p align="right"><font color="#000000" size="2" face="Tahoma">Compañía:</font></p>
				</td>
				<td width="55%" >
				<INPUT NAME="CIA" size=15  value="CARVICA" readonly="TRUE">
				</td>
				</tr>-->
				<tr>
				<td width="45%" >
				<p align="right"><font color="#000000" face="Tahoma" size="2">Usuario:</font></p>
				</td>
				<td width="55%" >
				<INPUT NAME="LOGIN" onKeypress="validar()" size=15  value="">
				</td>
				</tr>
				<tr>
				<td width="45%" >
				<p align="right"><font color="#000000" face="Tahoma" size="2">Contraseña Actual:</font></p>
				</td>
				<td width="55%" >
				<INPUT NAME="PASSWORD" onKeypress="validar()" type="password" size=15  value="">
				</td>
				</tr>
				<tr>
				<td width="45%" >
				<p align="right"><font color="#000000" face="Tahoma" size="2">Contraseña Nueva:</font></p>
				</td>
				<td width="55%" >
				<INPUT NAME="PASSWORDN" onKeypress="validar()" type="password" size=15  value="">
				</td>
				</tr>
				<tr>
				<td width="45%" >
				<p align="right"><font color="#000000" face="Tahoma" size="2">Confirmar Contraseña:</font></p>
				</td>
				<td width="55%" >
				<INPUT NAME="PASSWORDNN" onKeypress="validar()" type="password" size=15  value="">
				</td>
				</tr>

				<tr>
				<td width="100%" colspan=2>
				</td>
				</tr>
			</table>
			</td>
			</tr>
			<!--
				<tr>
				<td width="100%" bgcolor="#ffffcc" align="center">
				<a href="X001Z001M.htm" target="main">
				"¿Olvide mi contraseña?"
				</a>  
				</td>
				</tr>
			-->
		</table>
					</div>
					<P align=center>
			<INPUT TYPE="button" NAME="cmdSubmit" VALUE="Cambiar Contraseña" tabindex="2" style="width: 143; height: 25; font-family: Tahoma; font-size: 10pt"> 
			<INPUT TYPE="button" NAME="back" VALUE="Cancelar" tabindex="2" style="width: 83; height: 25; font-family: Tahoma; font-size: 10pt" onclick="history.back(1)" ></P>    

		</FORM>
		<form NAME="frmGral0" METHOD="post" ACTION="adm/admc.asp" target="_parent">
		<div align="center">
		&nbsp;</div>
		</form>
		</td>
		</tr>
	</table>
	
    	<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</td>
	<td valign="bottom" background="../images/bg_right.gif">
	<img src="../images/bg_right.gif" alt="" border="0"></td>
	<td width="50%" background="../images/bg.gif" valign="top">
	<img src="../images/px1.gif" width="1" height="1" alt="" border="0"></td>
</tr>
</table>

		<table border="0" width="764" cellspacing="1" id="table15">

        <!--        <tr>		<td colspan=2 >		<p class="PX" >Para mayor información contactenos a traves de 		<A href="mailto:info@mipedido.com"> info@mipedido.com </a>		</p>		</td>        </tr>		-->
	</table>
	
		</div>

		<p>&nbsp;</p>
     <table border="0" width="100%" >

        
        <tr>
        
		<td width="100%" >
		&nbsp;</td>
		</tr>
        
        <!--
        <tr>
		<td colspan=2 >
		<p class="PX" >Para mayor información contactenos a traves de 
		<A href="mailto:info@mipedido.com"> info@mipedido.com </a>
		</p>
		</td>
        </tr>
		-->
	</table>
	<a href="http://www.bmasca.com" target="_blank">
	<!--#include file="copyright.inc"-->	
	</a>
</BODY>
</HTML>