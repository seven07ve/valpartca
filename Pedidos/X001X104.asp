<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 6.0">

<link rel=stylesheet type="text/css" href="X001Z900.CSS">

<!--#include file="X001Y004.PRC"-->

<SCRIPT LANGUAGE="VBScript">
<!--
	'Validar Campos
	Sub cmdSubmit_onClick()
		document.frmgral.submit
	end sub

-->
</SCRIPT>

</HEAD>

	<%

	'Preparar Etiqueta Body del Formulario
	wCLA001 = trim(Request.QueryString("CLA001"))
	wURLW = Request.ServerVariables("URL")
	wBody = "<body  onload=" & chr(34) & "Inicio '" & wCLA001 & "', '" & wURLW & "'" & chr(34) & ">"
	Response.Write wBody
	'Fin Preparar Etiqueta Body del Formulario
	
	wTIT = "Maestro de Compañias en Internet" 
	wCCI = Session("glCiaInternet") 
	wCIA = Session("glCia") 

	
	wDEL =""
	wKPC ="0"
	wPIM ="0"
	wSTS ="1"	
	wDisabled = ""
	wProceso = "Agregar"
    IF len(wCLA001) > 0 then	 
		
		wProceso = "Actualizar"
		
		wDisabled = "DISABLED"
    
		strCnn	= Application("XDTA300_ConnectionString")
	
		SQL = "SELECT * FROM X300ZF002 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " Z300002CCI ='" &  wCLA001 & "'" 	

		wACT = ""
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wDEL = trim(rstQuery.Fields("Z300002DEL"))
			wDEC = trim(rstQuery.Fields("Z300002DEC"))
			wSTS = trim(rstQuery.Fields("Z300002STS"))
			wPUS = trim(rstQuery.Fields("Z300002PUS"))
			wFAC = trim(rstQuery.Fields("Z300002FAC"))
			wFPR = trim(rstQuery.Fields("Z300002FPR"))			
			wACT =  wPUS & " el " & wFAC & "   ( Creado el " & wFPR & " ) "
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

	wURL = "X001X104S"
	wURLP = wURL & ".ASP?CLA001=" & wCLA001
	%>

	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURLP%>" >

    <table align="center" BORDER="1" WIDTH="700" cellspacing="0" cellpadding="0"  bordercolor="#0066CC" bgcolor="#FE9900" style="border-style: inset; border-width: 3px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" >
		 <TR>
		 <td CLASS="TDT" colspan=3><%= wTIT %></td>		  
		 </TR>	
		 
		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Codigo:</p></td>
          <td class="TDD" width="80%" ><p CLASS="P1"><INPUT NAME="wCLA" <%= wDisabled %> size=15 value="<%=wCLA001%>"></P></td>
         </tr>

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Descripción Larga:</td>
          <td class="TDD" width="80%" ><INPUT NAME="wDES" size=50 value="<%=wDEL%>"></td>
         </tr>

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Descripción Corta:</p></td>
          <td class="TDD" width="80%" ><INPUT NAME="DEC" size=25 value="<%=wDEC%>"></td>
         </tr>


		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Status:</p></td>
          <td class="TDD" width="80%" >
				<select size="1" name="STS">
				<option value="1" <%=wSELUNO1%>>Activo</option>
				<option value="3" <%=wSELDOS1%>>Suspendido</option>
          </td>
         </tr>

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Actualizado por:</td>
          <td class="TDD" width="80%" ><%=wACT%></td>
         </tr>

		 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center">
          <!--#include file="X001Y005.PRC"-->
          </td>
         </tr>

	</table>
	</td>	
	</TR>	
	</table>
</FORM>
</BODY>
</HTML>
