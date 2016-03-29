<%@ Language=VBScript %>
<% Response.Expires = 0 %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 6.0">

<link rel=stylesheet type="text/css" href="X001Z900.CSS">

<!--#include file="X001Z001.INC"-->
<!--#include file="X001Y004.PRC"-->

<SCRIPT LANGUAGE="javascript">

	function cmdSubmit_onclick(){
	
		 document.frmGral.submit();
		 
	}

</SCRIPT>

</HEAD>

<%

	
	'Preparar Etiqueta Body del Formulario
	wCLA001 = Session("glUsuario") 
	wURLW = Request.ServerVariables("URL")
	'wBody = "<body  onload=" & chr(34) & "Inicio '" & wCLA001 & "', '" & wURLW & "'" & chr(34) & ">"
	'Response.Write wBody
	'Fin Preparar Etiqueta Body del Formulario
	
	
	wCCI = Session("glCiaInternet") 
	wCIA = Session("glCia") 

	wTIT = "Configuración del Sitio Web" 



	
	
	wSTS ="1"	
	
		 
		
	wProceso = "Actualizar"
	wProceso2 = "Actualizarb"
		
	wDisabled = "DISABLED"
    
		strCnn	= Application("XDTA300_ConnectionString")
		
		SQL = "SELECT Z300002STS, Z300002FAC, Z300002PUS  FROM X300ZF002 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " Z300002CCI = '" & wCCI & "' "		
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wSTS = trim(rstQuery.Fields("Z300002STS"))
			wPUS = trim(rstQuery.Fields("Z300002PUS"))
			wFAC = trim(rstQuery.Fields("Z300002FAC"))
		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING
		
		wSELUNO = "" : wSELDOS = ""
		IF wSTS = "1" THEN
			wSELUNO = "selected"
		   ELSE
		    wSELDOS = "selected"
		END IF   
		
		wDIA_FED = Day(wFAC)
        If Len(Trim(wDIA_FED)) = "1" Then: wDIA_FED = "0" & wDIA_FED: End If
        wMES_FED = Month(wFAC)
        If Len(Trim(wMES_FED)) = "1" Then: wMES_FED = "0" & wMES_FED: End If
        wANO_FED = Year(wFAC)
        wFAC = wDIA_FED & "/" & wMES_FED & "/" & wANO_FED & "  " & TimeValue(wFAC)


	
	wTIT = wProceso & " " & wTIT   

	wURL = "X001X127S"
	wURLP = wURL & ".ASP?CLA001=" & wCLA001
	%>

	<body topmargin="0" leftmargin="18" rightmargin="0" bottommargin="0" bgcolor="#FFEBD6">

	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURLP%>" >

    <div align="center">
    
    <table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" align="center" height="100%"  >
<tr>
<td valign="top">

<table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF">


    &nbsp;&nbsp;
    <table BORDER="1" WIDTH="650" cellspacing="0" cellpadding="0" align="center" bordercolor="#0066CC" bgcolor="#FE9900" style="border-style: inset; border-width: 2px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" >
		 <TR>
		 <td CLASS="TDT" colspan=2><%= wTIT %></td>		  
		 </TR>	
		 
		 
		<tr>
          <td class="TDS" width="29%" ><p CLASS="P1" align="left">Inactivar Sitio Web:</p></td>
          <td class="TDD" width="70%" >
			<select size="1" name="STS">
				<option value="1" <%=wSELUNO%>>NO</option>
				<option value="3" <%=wSELDOS%>>SI</option>
			</select> 
			<b><font color="#0000FF">Solo se Inactivara los Usuarios Clientes y Vendedores
			</font></b>
			</td>
         </tr>	

			
	
		 <tr>
          <td class="TDS" width="29%" height="23" ><p CLASS="P1" align="left">Fecha de Actualización:</p></td>
          <td class="TDD" width="70%" height="23" >
			<b>
			
			<%=wFAC%> por <%=wPUS%>
    
         </b>
</td>
         </tr>
         
		<!--	<tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Pregunta 
			Secreta:</p></td>
          <td class="TDD" width="80%" >
			<INPUT NAME="PSE" size=50 value="<%=wPSE%>" maxlength="50"></td>
         </tr>

	
		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Respuesta 
			Secreta:</p></td>
          <td class="TDD" width="80%" >
			<INPUT NAME="RSE" size=50 value="<%=wRSE%>" maxlength="50"></td>
         </tr>-->


		 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center">
            <INPUT TYPE="Hidden" NAME="PROCESO" value="<%=wProceso%>">          
		  <INPUT TYPE="button" NAME="cmdSubmit" VALUE="<%=wProceso%>" onclick="return cmdSubmit_onclick()" >		  
		  <INPUT type='button' value='Cancelar' id=button1 name=button1 OnClick='javascript:history.back()'>
          
          </td>
         </tr>

	</table>
	</td>	
	</TR>	
	</table>
	<p>&nbsp;</td> 
	</tr>
	<!--<td>
<img src="../images/index/bottom.jpg" width="790" height="15" /></td>-->
</tr> 
</p> 

</td>

        </tr>
        
        
        
        
               </table>

    </td>				
  </tr>
</table>


	</div>
</FORM>
</BODY>
</HTML>