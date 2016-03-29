<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 6.0">

<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<!--#include file="X001Y004.PRC"-->

<SCRIPT LANGUAGE="VBScript">

	Sub cmdSubmit_onClick()

		document.frmgral.submit
		
	end sub

	Sub cmdBuscarCliente_onClick()
		
		document.frmGral.PROCESO.VALUE = "Buscar"
		document.frmgral.submit
		
	end sub


</SCRIPT>



</HEAD>

	<%

	'Preparar Etiqueta Body del Formulario
	wCLA001 = trim(Request.QueryString("CLA001"))
	wCLABUS = trim(Request.QueryString("CLABUS"))
	wERROR  = trim(Request.QueryString("ERROR"))	
	wURLW = Request.ServerVariables("URL")
	wBody = "<body  align=""center"" style=""text-align: center"" topmargin=""0"" leftmargin=""19"" rightmargin=""0"" >"
	'onload=" & chr(34) & "Inicio '" & wCLA001 & "', '" & wURLW & "'" & chr(34) & "
	Response.Write wBody
	'Fin Preparar Etiqueta Body del Formulario
		
	wTIT = "Pedido" 
	wCLA001 = TRIM(Request.QueryString("CLA001"))
	wCLA002 = TRIM(Request.QueryString("CLA002"))
	wB300100CCI = Session("glCiaInternet")
	wB300100CIA = Session("glCia")
    wDisabled = ""	

		
	IF Session("glTipoUsuario") = "C" THEN
	   wB300100CCL = Session("glUsuario")
	   wA300002RSO = Session("glUsuarioNombre")
	   wDisabled = "disabled"
	END IF 

	wPEDIDO = "Nuevo"		
	
	wA300002NT1 =""
	wA300002LCR =""	
	wProceso = "Agregar"
    IF len(wCLA001) > 0 then	 

		'wPEDIDO = wCLA001 & "-" & wCLA002
		wPEDIDO = wCLA002

		wProceso = "Actualizar"
		
		strCnn	= Application("XDTA300_ConnectionString")
	
		SQL = "SELECT B300100CCL, A300002RSO, B300100CPE, B300100STS "
		SQL = SQL & " FROM X300BQ100 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " B300100CCI ='" & wB300100CCI & "' AND "
		SQL = SQL & " B300100CIA ='" & wB300100CIA & "' AND "
		SQL = SQL & " B300100OPE ='" & wCLA001 & "' AND "
		SQL = SQL & " B300100NPE = " & wCLA002 & " "

		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wA300002RSO = trim(rstQuery.Fields("A300002RSO"))
			wB300100CCL = trim(rstQuery.Fields("B300100CCL"))
			wB300100CPE = trim(rstQuery.Fields("B300100CPE"))
			wSTS = trim(rstQuery.Fields("B300100STS"))
		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING	

		wSELUNO1 = "" : wSELDOS1 = ""
		IF wSTS = "1" THEN
		   wSELUNO1 = "selected"
		  ELSE
		   wSELDOS1 = "selected"
		END IF   
    end if
	
	wTIT = wProceso & " " & wTIT   
	
	IF wCLABUS <> "" THEN
		wB300100CCL = wCLABUS
	END IF

	'wERROR = "Cliente no Existe"

	wURL = "X001A100_AS.ASP"
	%>

	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURL%>" >

    <table border="0" cellspacing="0" cellpadding="0" width="100%" height="100%">
  <tr> 
    <td width="50%" background="../../images/bg.gif" valign="top">
	<img src="../..images/px1.gif" width="1" height="1" alt="" border="0"></td>
	<td valign="top" background="../../images/bg_left.gif">
	<img src="../../Images/bg_left.gif" alt="" border="0"> 
    </td>
	<td valign="top">
    
      <table border="0" cellspacing="0" cellpadding="0" width="100%" height="38" >
        <tr>
                <td height="40" >
    
    &nbsp;<table align="center" BORDER="1" WIDTH="700" cellspacing="0" cellpadding="0"  bordercolor="#0066CC" bgcolor="#FE9900" style="border-style: inset; border-width: 3px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" >
		 <TR>
		 <td CLASS="TDT" colspan=3>
			<p CLASS="P1" style="margin-top: 3px; margin-bottom: 3px"><%= wTIT %></p></td>		  
		 </TR>	

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Pedido:</p></td>
          <td class="TDD" width="80%" ><p CLASS="P1">
			<INPUT NAME="PEDIDO" Disabled size=6 value="<%=wPEDIDO%>"></P></td>
         </tr>
		 
		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Código Cliente:</p></td>
          <td class="TDD" width="80%" ><p CLASS="P1"><INPUT NAME="wCLA" size=15 <%=wDisabled%> value="<%=wB300100CCL%>"><%=wA300002RSO%>
          <% IF Session("glTipoUsuario") <> "C" THEN %>
          <INPUT TYPE="button" NAME="cmdBuscarCliente" VALUE="Buscar">
          <% END IF %>
          <font color="#FF0000"><b><%=wERROR%></b></FONT>
		  
          </P></td>
         </tr>


		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Comentario:</p></td>
          <td class="TDD" width="80%" ><INPUT NAME="wDES" size=80 maxlength=150  value="<%=wB300100CPE%>"><p style="margin-top: 3px; margin-bottom: 3px">
			<font size="2">*Indique algún comentario respecto al pedido.</font></td>
         </tr>
		<% If Session("glTipoUsuario") <> "C" Then %>	
		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Status:</p></td>
          <td class="TDD" width="80%" >
				<select size="1" name="STS">
				<option value="1" <%=wSELUNO1%>>Sin Comunicar</option>
				<option value="2" <%=wSELDOS1%>>Comunicado</option>
          </td>
         </tr>
		<% End If %>

		 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center">
		  <INPUT TYPE="Hidden" NAME="CLA001" value="<%=wCLA001%>">          
		  <INPUT TYPE="Hidden" NAME="CLA002" value="<%=wCLA002%>">          
          <!--#include file="X001Y005.PRC"-->
          </td>
         </tr>

	</table>
	</td>	
	</TR>	
	</table>
	   </tr>
        <tr> 
          <td>
			<img src="../../images/px1.gif" width="780" height="1" alt="" border="0"></td>
          <td>
			<img src="../../images/px1.gif" width="1" height="1" alt="" border="0"></td>
        </tr>
      </table>
    </td>
	<td valign="bottom" background="../../images/bg_right.gif">
	<img src="../../images/bg_right.gif" alt="" border="0"></td>
	<td width="50%" background="../../images/bg.gif" valign="top">
	<img src="../..images/px1.gif" width="1" height="1" alt="" border="0"></td>
</tr>
</table>

	
</FORM>
</BODY>
</HTML>
