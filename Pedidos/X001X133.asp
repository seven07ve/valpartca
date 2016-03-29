<%@ Language=VBScript %>
<% Response.Expires = 0 %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 12.0">

<link rel=stylesheet type="text/css" href="X001Z900.CSS">

<!--#include file="X001Z001.INC"-->
<!--#include file="X001Y004.PRC"-->

<SCRIPT LANGUAGE="javascript">

	function cmdSubmit_onclick(){
	
		 document.frmGral.submit();
		 
	}

</SCRIPT>
<style>

html{overflow-y:scroll} 

</style>
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

	wTIT = "Tipos de Documento a Visualizar en Edo. de Cuenta" 



	
	wNUS =""
	wCUS =""
	wEML =""
	wCLU =""
	wCVE =""
	wSTS ="1"	
	wDisabled = ""
	wProceso = "Agregar"
	wSEL04 = "selected"
    	
		wProceso = "Guardar"
		wProceso2 = "Actualizarb"
		
		wDisabled = "DISABLED"
    
		strCnn	= Application("XDTA300_ConnectionString")
	
		SQL = "SELECT Z300002DEL, Z300002TDO, Z300002PU2, Z300002FA2 "
		SQL = SQL & " FROM X300ZF002 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " Z300002CCI = '" & wCCI & "' "
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wDEL = trim(rstQuery.Fields("Z300002DEL"))
			wTDO = trim(rstQuery.Fields("Z300002TDO"))
			wPUS = trim(rstQuery.Fields("Z300002PU2"))
			wFUA = trim(rstQuery.Fields("Z300002FA2"))
		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING
		
		IF NOT ISNULL(wFUA) THEN	
			wDIA_FED = Day(wFUA)
        	If Len(Trim(wDIA_FED)) = "1" Then: wDIA_FED = "0" & wDIA_FED: End If
        	wMES_FED = Month(wFUA)
        	If Len(Trim(wMES_FED)) = "1" Then: wMES_FED = "0" & wMES_FED: End If
        	wANO_FED = Year(wFUA)
        	wFUA = wDIA_FED & "/" & wMES_FED & "/" & wANO_FED & "  " & TimeValue(wFUA) & " por " & wPUS
        	ELSE
        	wFUA = "NO DISPONIBLE"
		END IF

   
	
	
	wURL = "X001X133S.asp"
	%>

	<body topmargin="0" leftmargin="18" rightmargin="0" bottommargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>">

	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURL%>" >

    <div align="center">
    
    <table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" align="center" height="100%" >
<tr>
<td valign="top"  >

<table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF">


    &nbsp;&nbsp;
    <table BORDER="1" WIDTH="650" cellspacing="0" cellpadding="0" align="center" bordercolor="#ffffff" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" style="border-style: inset; border-width: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" cellpadding="4"  >
		 <TR>
		 <td CLASS="TDT" colspan=2 height="30" ><%= wTIT %></td>		  
		 </TR>	
		 
		 <tr>
          <td class="TDS" width="29%" ><p CLASS="P1" align="left">Compañia Web/Movil::</p></td>
          <td class="TDD" width="70%" ><p CLASS="P1">
          <b><%=wCCI%></b></P></td>
         </tr>

		 <tr>
          <td class="TDS" width="29%" ><p CLASS="P1" align="left">Nombre:</p></td>
          <td class="TDD" width="70%" >
		  <b><%=wDEL%></b></td>
         </tr>

		 <tr>
          <td class="TDS" width="29%" ><p CLASS="P1" align="left">Documentos:</p></td>
          <td class="TDD" width="70%" >
			<INPUT NAME="TDO" size=50 value="<%=wTDO%>" maxlength="100"><strong><br><br>
			Ejemplo: 'FAC', 'N/C', 'N/D', 'CHD'</strong><br><br></td>
         </tr>

	
		 <tr>
          <td class="TDS" width="29%" height="23" ><p CLASS="P1" align="left">Fecha de Actualización:</p></td>
          <td class="TDD" width="70%" height="23" >
			<b>
				<%=wFUA%>
    
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
		  <INPUT TYPE="button" NAME="cmdSubmit" VALUE="<%=wProceso%>" onclick="return cmdSubmit_onclick();" >
	  	  <INPUT type="button" value="Regresar" id="button1" name="button1" OnClick="javascript:window.open('X001X002.asp','main')">
          
          </td>
         </tr>

	</table>
	</td>	
	</TR>	
	</table>
	<p>&nbsp;</td> 
	</tr>
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