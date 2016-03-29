<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<link rel=stylesheet type="text/css" href="X001Z900.css">
<SCRIPT LANGUAGE="VBScript">
Function Inicio(wCL1, wURL)

	document.FrmBuscar.BUSCAR.focus()

	window.status = wURL

End Function


</SCRIPT>

</HEAD>
	<%

	'Preparar Etiqueta Body del Formulario
	wCLA001 = Request.QueryString("CLA001")	
	wURLW = Request.ServerVariables("URL")
	wBody = "<body  onload=" & chr(34) & "Inicio '" & wCLA001 & "', '" & wURLW & "'" & chr(34) & ">"
	Response.Write wBody
	'Fin Preparar Etiqueta Body del Formulario

	wURLTIT = Request.QueryString("URLTIT")
	wCLA001 = Request.QueryString("CLA001")
	wCLA002 = Request.QueryString("CLA002")
	wURLA = "X001Z100D.ASP" & "?CLA001=" & wCLA001 & "&CLA002=" & wCLA002
	'wTITULO = "Agregar varios Item a " & wURLTIT
	wTITULO = "Agregar varios Item al pedido"
%>

<FORM NAME="FrmBuscar" METHOD="post" ACTION="<%=wURLA%>" >

<P>&nbsp;</P>
<table border="1" width="75%" align=center cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" >
      <table border="0" width="100%" bgcolor="#336699">
        <tr>
        <td width="10%" align="right">
		<IMG alt ="" border=0 width=24 height=24 src="images/buscar.gif"  >
		</td>
		<td width="90%" >
		<p align="left"><font color="#ffff00">
		<%=wTITULO%></font></p>
		</td>
		</tr>
		</table>
	</td>
	</tr>		
  <tr>
    <td width="100%">
      <table border="0" width="100%" bgcolor="#ffffcc">
        <tr>
          <td width="25%" >
            <p align="right"><font color="#0000ff">Agregar por:</font></p>
          </td>
          <td width="75%" >
		<INPUT NAME="BUSCAR" size=35 value="<%=Session("glAgregar")%>" tabindex="1">
          </td>
        </tr>
        <tr>
          <td width="100%" colspan=2>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td width="100%" bgcolor="#ffffcc">
      <P align=center>
	<INPUT TYPE="Hidden" NAME="TITULO" value="<%=wTITULO%>">          
	<INPUT TYPE="submit" NAME="send" VALUE="Buscar" tabindex="2"> 
	<INPUT type='button' value='Cancelar' id=button1 name=button1 OnClick='javascript:history.back()'>
      </P>    
    </td>
  </tr>
</table>

</FORM>
</BODY>
</HTML>
