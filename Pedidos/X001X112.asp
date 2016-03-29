<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 6.0">

<link rel=stylesheet type="text/css" href="X001Z900.CSS">

<!--#include file="X001Y004.PRC"-->

<SCRIPT LANGUAGE="VBScript">
	'Validar Campos
	Sub cmdSubmit_onClick()
		document.frmgral.submit
	end sub

</SCRIPT>

</HEAD>

<%

	
	'Preparar Etiqueta Body del Formulario
	wCLA001 = trim(Request.QueryString("CLA001"))
	wCLA002 = trim(Request.QueryString("CLA002"))	
	wURLW = Request.ServerVariables("URL")
	wBody = "<body  onload=" & chr(34) & "Inicio '" & wCLA002 & "', '" & wURLW & "'" & chr(34) & ">"
	Response.Write wBody
	'Fin Preparar Etiqueta Body del Formulario
	
	
	wCCI = Session("glCiaInternet") 
	wCIA = Session("glCia") 

	wTIT = "Relación Gerente-Supervisor" 



	
	wNUS =""
	wCUS =""
	wEML =""
	wCLU =""
	wCVE =""
	wSTS ="1"	
	wDisabled = ""
	wProceso = "Agregar"
    IF len(wCLA002) > 0 then	 
		
		wProceso = "Actualizar"
		
		wDisabled = "DISABLED"
    
	

    end if

	
	wTIT = wProceso & " " & wTIT   

	wURL = "X001X112S"
	wURLP = wURL & ".ASP?CLA001=" & wCLA001
	%>

	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURLP%>" >

    <table BORDER="1" WIDTH="85%" cellspacing="0" cellpadding="0" align="center">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" >
		 <TR>
		 <td CLASS="TDT" colspan=3><%= wTIT %></td>		  
		 </TR>	

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Gerente:</p></td>
          <td class="TDD" width="80%" ><p CLASS="P1"><INPUT NAME="wCLA" Disabled size=15 value="<%=wCLA001%>"></P></td>
         </tr>
		 

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Supervisor:</p></td>
          <td class="TDD" width="80%" >
				<select size="1" name="CLA">
				<%

					strCnn	= Application("XDTA300_ConnectionString")
					SQL = "SELECT Z300001PUS, Z300001NUS  FROM X300ZF001 " 
					SQL = SQL & " WHERE "
					IF wCLA002 <> "" THEN
						SQL = SQL & " Z300001CCI = '" & Session("glCiaInternet") & "' AND "
						SQL = SQL & " Z300001CIA = '" & Session("glCia")  & "' AND "		
						SQL = SQL & " Z300001PUS = '" & wCLA002 & "' "
					  ELSE	
						SQL = SQL & " Z300001PUS NOT IN "
						SQL = SQL & "   (SELECT Z300005PSU FROM X300ZF005 "
						SQL = SQL & "          WHERE  Z300001CCI = Z300005CCI AND  "
						SQL = SQL & "                 Z300001CIA = Z300005CIA )   "
						SQL = SQL & " AND "					
						SQL = SQL & " Z300001CCI = '" & Session("glCiaInternet") & "' AND "
						SQL = SQL & " Z300001CIA = '" & Session("glCia")  & "' AND "		
						SQL = SQL & " Z300001CLU = 'U' "	
					END IF

					Set rstQuery = Server.CreateObject("ADODB.Recordset")
					rstQuery.Open sql , strCnn
					DO WHILE NOT rstQuery.EOF
						wPUS = trim(rstQuery.Fields("Z300001PUS"))
						wNUS = trim(rstQuery.Fields("Z300001NUS"))
						Response.Write "<option value=" & wC & wPUS & wC & ">" & wNUS & "</option>"
					    rstQuery.Movenext
					LOOP    	
					rstQuery.CLOSE
					SET rstQuery = NOTHING	
				%>	
          </td>
         </tr>

		 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center">
          <INPUT TYPE="Hidden" NAME="CL1" value="<%=wCLA001%>">
          <!--#include file="X001Y006.PRC"-->          
          </td>
         </tr>

	</table>
	</td>	
	</TR>	
	</table>
</FORM>
</BODY>
</HTML>
