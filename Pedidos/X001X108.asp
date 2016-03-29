<%@ Language=VBScript %>
<% Response.Expires = 0 %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel=stylesheet type="text/css" href="X001Z900.CSS">

<!--#include file="X001Z001.INC"-->
<!--#include file="X001Y004.PRC"-->

<SCRIPT LANGUAGE="javascript">

	function cmdSubmit_onclick(){
	
		 document.frmGral.submit();
		 
	}

</SCRIPT>
<style type="text/css" >

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

	wTIT = "Mis Datos" 



	
	wNUS =""
	wCUS =""
	wEML =""
	wCLU =""
	wCVE =""
	wSTS ="1"	
	wDisabled = ""
	wProceso = "Agregar"
	wSEL04 = "selected"
    IF len(wCLA001) > 0 then	 
		
		wProceso = "Actualizar"
		wProceso2 = "Actualizarb"
		
		wDisabled = "DISABLED"
    
    	IF Session("glTipoUsuario") = "C" THEN
		
		strCnn	= Application("XDTA300_ConnectionString")
	
		SQL = "SELECT * FROM X300ZF001, X300AF002 " 
		SQL = SQL & " WHERE "		
		SQL = SQL & " Z300001CCI = '" & wCCI & "' AND "
		SQL = SQL & " Z300001CIA = '" & wCIA & "' AND "		
		SQL = SQL & " Z300001PUS = '" &  wCLA001 & "' AND"
		SQL = SQL & " Z300001CCI = A300002CCI AND "
		SQL = SQL & " Z300001PUS = A300002CCL "
	

		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wNUS = trim(rstQuery.Fields("Z300001NUS"))
			wCUS = trim(rstQuery.Fields("Z300001CUS"))
			'wRPC = trim(rstQuery.Fields("Z300001RPC"))
			'wPPC = trim(rstQuery.Fields("Z300001PPC"))			
			wEML = trim(rstQuery.Fields("Z300001EML"))
			wCLU = trim(rstQuery.Fields("Z300001CLU"))
			wCVE = trim(rstQuery.Fields("Z300001CVE"))
			wCED = trim(rstQuery.Fields("Z300001CED"))
			wRIF = trim(rstQuery.Fields("A300002RIF"))
			'wNIT = trim(rstQuery.Fields("Z300001NIT"))
			wTEL = trim(rstQuery.Fields("A300002NT1"))
			wCED = trim(rstQuery.Fields("A300002CRL"))
			wRSE = trim(rstQuery.Fields("Z300001RSE"))
			wPSE = trim(rstQuery.Fields("Z300001PSE"))
			wSTS = trim(rstQuery.Fields("Z300001STS"))
			wFUA = trim(rstQuery.Fields("Z300001FUA"))

		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING	
		
		ELSE
		
		SQL = "SELECT * FROM X300ZF001 " 
		SQL = SQL & " WHERE "		
		SQL = SQL & " Z300001CCI = '" & wCCI & "' AND "
		SQL = SQL & " Z300001CIA = '" & wCIA & "' AND "		
		SQL = SQL & " Z300001PUS = '" &  wCLA001 & "'"
	
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wNUS = trim(rstQuery.Fields("Z300001NUS"))
			wCUS = trim(rstQuery.Fields("Z300001CUS"))
			'wRPC = trim(rstQuery.Fields("Z300001RPC"))
			'wPPC = trim(rstQuery.Fields("Z300001PPC"))			
			wEML = trim(rstQuery.Fields("Z300001EML"))
			wCLU = trim(rstQuery.Fields("Z300001CLU"))
			wCVE = trim(rstQuery.Fields("Z300001CVE"))
			wCED = trim(rstQuery.Fields("Z300001CED"))
			'wRIF = trim(rstQuery.Fields("A300002RIF"))
			'wNIT = trim(rstQuery.Fields("Z300001NIT"))
			wTEL = trim(rstQuery.Fields("Z300001TEL"))
			wRSE = trim(rstQuery.Fields("Z300001RSE"))
			wPSE = trim(rstQuery.Fields("Z300001PSE"))
			wSTS = trim(rstQuery.Fields("Z300001STS"))
			wFUA = trim(rstQuery.Fields("Z300001FUA"))

		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING
		
		END IF
			
		wDIA_FED = Day(wFUA)
        If Len(Trim(wDIA_FED)) = "1" Then: wDIA_FED = "0" & wDIA_FED: End If
        wMES_FED = Month(wFUA)
        If Len(Trim(wMES_FED)) = "1" Then: wMES_FED = "0" & wMES_FED: End If
        wANO_FED = Year(wFUA)
        wFUA = wDIA_FED & "/" & wMES_FED & "/" & wANO_FED & "  " & TimeValue(wFUA)


    end if
	
	wTIT = wProceso & " " & wTIT   

	wURL = "X001X108S"
	wURLP = wURL & ".ASP?CLA001=" & wCLA001
	

	
	%>

	<body topmargin="0" leftmargin="18" rightmargin="0" bottommargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>">

    
    <table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" align="center" height="100%" >
<tr>
<td valign="top"  >
<br>
<table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF">

	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURLP%>" >


    	&nbsp;&nbsp;&nbsp; 
    <table BORDER="1" WIDTH="650" cellspacing="0" cellpadding="0" align="center" bordercolor="#ffffff" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" style="border-style: inset; border-width: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" cellpadding="5"  >
		 <TR>
		 <td CLASS="TDT" colspan=2 height="30" ><%= wTIT %></td>		  
		 </TR>	
		 
		 <tr>
          <td class="TDS" width="29%" ><p CLASS="P1" align="left">Usuario:</p></td>
          <td class="TDD" width="70%" ><p CLASS="P1"><INPUT NAME="wCLA" <%= wDisabled %> size=15 value="<%=wCLA001%>"></P></td>
         </tr>

		 <tr>
          <td class="TDS" width="29%" ><p CLASS="P1" align="left">Nombre:</p></td>
          <td class="TDD" width="70%" >
		  <INPUT NAME="wDES" size=30 value="<%=wNUS%>" type=hidden >
		  <INPUT NAME="wDES1" disabled size=50 value="<%=wNUS%>" maxlength="30"></td>
         </tr>
         
         <%IF Session("glTipoUsuario") = "C" THEN%>
         
         <tr>
          <td class="TDS" width="29%" ><p CLASS="P1" align="left">Rif:</p></td>
          <td class="TDD" width="70%" >
		  <INPUT NAME="RIF" size=30 value="<%=wRIF%>" type=hidden >
		  <INPUT NAME="RIF" disabled size=50 value="<%=wRIF%>" maxlength="30"></td>
         </tr>
                  
          <tr>
          <td class="TDS" width="29%" ><p CLASS="P1" align="left">Teléfono:</p></td>
          <td class="TDD" width="70%" >
		  <INPUT NAME="TEL" size=30 value="<%=wTEL%>" type=hidden >
		  <INPUT NAME="TEL" disabled size=50 value="<%=wTEL%>" maxlength="30"></td>
         </tr>
         
         <tr>
          <td class="TDS" width="29%" ><p CLASS="P1" align="left">Cédula:</p></td>
          <td class="TDD" width="70%" >
		  <INPUT NAME="CED" size=30 value="<%=wCED%>" type=hidden >
		  <INPUT NAME="CED" disabled size=50 value="<%=wCED%>" maxlength="30"></td>
         </tr>


		
		 
		 <% END IF %>

		 <tr>
          <td class="TDS" width="29%" ><p CLASS="P1" align="left">Contraseña:</p></td>
          <td class="TDD" width="70%" >
    		<INPUT TYPE=password NAME="CUS" size=10 value="<%=wCUS%>" maxlength="10"></td>
         </tr>

	

	
		 <tr>
          <td class="TDS" width="29%" ><p CLASS="P1" align="left">E-mail:</p></td>
          <td class="TDD" width="70%" >
			<INPUT NAME="EML" size=50 value="<%=wEML%>" maxlength="50"></td>
         </tr>

	
		 <tr>
          <td class="TDS" width="29%" height="23" ><p CLASS="P1" align="left">
		  Ultimo Acceso a la Web:</p></td>
          <td class="TDD" width="70%" height="23" >
			<b>
				<%=wFUA%>
    
         </b>
</td>
         </tr>
         
	

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
	
	
	
</FORM>
	
	
	</td> 
	</tr>
        
        
        
               </table>

    </td>				
  </tr>
</table>


	
</BODY>
</HTML>