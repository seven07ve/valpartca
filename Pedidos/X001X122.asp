<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 6.0">

<link rel=stylesheet type="text/css" href="X001Z900.CSS">



</HEAD>

<%

	
	'Preparar Etiqueta Body del Formulario
	wCLA001 = trim(Request.QueryString("CLA001"))
	wURLW = Request.ServerVariables("URL")
	wBody = "<body  >"
	Response.Write wBody
	'Fin Preparar Etiqueta Body del Formulario
	
	
	wCCI = Session("glCiaInternet") 
	wCIA = Session("glCia") 

	wTIT = "Usuarios Registrados en el Sistema" 



	
	wNUS =""
	wCUS =""
	wEML =""
	wCLU =""
	wCVE =""
	wMEX ="0"
	wSTS ="1"	
	wDisabled = ""
	
	wSEL04 = "selected"
    
    
		strCnn	= Application("XDTA300_ConnectionString")
	
		SQL = "SELECT COUNT(*) AS WCUENTA FROM X300ZF001 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " Z300001CCI = '" & wCCI & "' AND "
		SQL = SQL & " Z300001CIA = '" & wCIA & "' AND "		
		SQL = SQL & " Z300001CLU = 'C' "		
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wCLI = CDBL(rstQuery.Fields("WCUENTA"))			
		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING		
		
		SQL = "SELECT COUNT(*) AS WCUENTA FROM X300ZF001 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " Z300001CCI = '" & wCCI & "' AND "
		SQL = SQL & " Z300001CIA = '" & wCIA & "' AND "		
		SQL = SQL & " Z300001CLU = 'V' "		
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wVEN = CDBL(rstQuery.Fields("WCUENTA"))			
		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING
		
		SQL = "SELECT COUNT(*) AS WCUENTA FROM X300ZF001 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " Z300001CCI = '" & wCCI & "' AND "
		SQL = SQL & " Z300001CIA = '" & wCIA & "' AND "		
		SQL = SQL & " Z300001CLU = 'S' "		
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wSUP = CDBL(rstQuery.Fields("WCUENTA"))			
		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING
		
		SQL = "SELECT COUNT(*) AS WCUENTA FROM X300ZF001 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " Z300001CCI = '" & wCCI & "' AND "
		SQL = SQL & " Z300001CIA = '" & wCIA & "' AND "		
		SQL = SQL & " Z300001CLU = 'G' "		
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wGER = CDBL(rstQuery.Fields("WCUENTA"))			
		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING
		
		SQL = "SELECT COUNT(*) AS WCUENTA FROM X300ZF001 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " Z300001CCI = '" & wCCI & "' AND "
		SQL = SQL & " Z300001CIA = '" & wCIA & "' AND "		
		SQL = SQL & " Z300001CLU = 'D' "		
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wDIR = CDBL(rstQuery.Fields("WCUENTA"))			
		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING		
		
		SQL = "SELECT COUNT(*) AS WCUENTA FROM X300ZF001 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " Z300001CCI = '" & wCCI & "' AND "
		SQL = SQL & " Z300001CIA = '" & wCIA & "' AND "		
		SQL = SQL & " Z300001CLU = 'A' "		
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wADM = CDBL(rstQuery.Fields("WCUENTA"))			
		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING	
		
		wTOT = 	wCLI + wVEN + wSUP + wGER + wDIR + wADM
	
	%>

	

    <div align="center">

    <table BORDER="1" WIDTH="500" cellspacing="0" cellpadding="0"  bordercolor="#0066CC" bgcolor="#FE9900" style="border-style: inset; border-width: 2px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" >
		 <TR>
		 <td CLASS="TDT" colspan=2 height="29"><%= wTIT %></td>		  
		 </TR>	
		 
		 <tr>
          <td class="TDS" width="38%" height="20" ><p CLASS="P1" align="left">
			Clientes:</p></td>
          <td class="TDD" width="60%" height="20" ><p CLASS="P1"><b><%=wCLI%></b></P></td>
         </tr>

		 <tr>
          <td class="TDS" width="38%" height="20" ><p CLASS="P1" align="left">
			Vendedores:</p></td>
          <td class="TDD" width="60%" height="20" >
			<p CLASS="P1"><b><%=wVEN%></b></p></td>
         </tr>

		 <tr>
          <td class="TDS" width="38%" height="20" ><p CLASS="P1" align="left">
			Supervisores:</p></td>
          <td class="TDD" width="60%" height="20" ><p CLASS="P1"><b><%=wSUP%></b>    </p>      </td>
         </tr>
			<tr>
          <td class="TDS" width="38%" height="20" ><p CLASS="P1" align="left">
			Gerentes:</p></td>
          <td class="TDD" width="60%" height="20" ><p CLASS="P1"><b><%=wGER%></b>    </p>      </td>
         </tr>

		 <tr>
          <td class="TDS" width="38%" height="20" ><p CLASS="P1" align="left">
			Directores:</p></td>
          <td class="TDD" width="60%" height="20" ><p CLASS="P1"><b><%=wDIR%></b>    </p>      </td>
         </tr>

		 <tr>
          <td class="TDS" width="38%" height="20" ><p CLASS="P1" align="left">
			Administradores del Sitio:</p></td>
          <td class="TDD" width="60%" height="20" ><p CLASS="P1"><b><%=wADM%></b></p></td>
         </tr>


		 <tr>
          <td class="TDS" width="38%" height="24" ><p CLASS="P1" align="left">
			<b>Total Usuarios:</b></p></td>
          <td class="TDD" width="60%" height="24" >
				<p CLASS="P1"><b><%=wTOT%></b></p></td>
    
         </tr>

		 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center">
            <INPUT type='button' value='Regresar' id=button1 name=button1 OnClick='javascript:history.back()'>        
          </td>
         </tr>

	</table>
	</td>	
	</TR>	
	</table>
	</div>

</BODY>
</HTML>
