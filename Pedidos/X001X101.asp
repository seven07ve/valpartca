<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 12.0">

<link rel=stylesheet type="text/css" href="X001Z900.CSS">

<!--#include file="X001Y004.PRC"-->

<SCRIPT LANGUAGE="VBScript">
<!--
	Sub cmdSubmit_onClick()

		if not isnumeric(document.frmGral.A300002LCR.value) then
			alert "Debe introducir solo numeros en el Limite de Credito"
			document.frmGral.A300002LCR.focus
			else			
			document.frmgral.submit
		end if	
	
	end sub

	-->
 </SCRIPT>
<style type="text/css">


html{overflow-y:scroll} 
	
body {margin-right: 0px;}


</style> 

</HEAD>

<%

	'Preparar Etiqueta Body del Formulario
	wCLA001 = trim(Request.QueryString("CLA001"))
	wURLW = Request.ServerVariables("URL")
	wBody = "<body  onload=" & chr(34) & "Inicio '" & wCLA001 & "', '" & wURLW & "'" & chr(34) & ">"
	Response.Write wBody
	'Fin Preparar Etiqueta Body del Formulario

'wClave = trim(Request.QueryString("CLA001"))
'wC = chr(34)'
	
'if wClave = "" then
'	wBody = "<body  onload=" & wC & "Inicio ' '" & wC & ">"
 '  else
  ' 	wBody = "<body  onload=" & wC & "Inicio '0'" & wC & ">"
'end if
	
'Response.Write wBody
	   	

'<body  onload="Inicio ''">


	wTIT = "Maestro de Clientes" 
	wCCI = Session("glCiaInternet") 
	wCIA = Session("glCia") 

		
	wA300002RSO =""
	wA300002RIF =""
	wA300002NIT =""
	wA300002NT1 =""
	wA300002NRL =""
	wA300002PDE =""
	wA300002LCR =""	
	wDisabled = ""
	wProceso = "Agregar"
    IF len(wCLA001) > 0 then	 
		
		wProceso = "Actualizar"
		
		wDisabled = "DISABLED"
    
		strCnn	= Application("XDTA300_ConnectionString")
	
		SQL = "SELECT * FROM X300AF002 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " A300002CCI = '" & wCCI & "' AND "
		SQL = SQL & " A300002CIA = '" & wCIA & "' AND "
		SQL = SQL & " A300002CCL ='" &  wCLA001 & "'" 	

		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wA300002RSO = trim(rstQuery.Fields("A300002RSO"))
			wA300002RIF = trim(rstQuery.Fields("A300002RIF"))
			wA300002NIT = trim(rstQuery.Fields("A300002NIT"))
			wA300002NT1 = trim(rstQuery.Fields("A300002NT1"))
			wA300002NRL = trim(rstQuery.Fields("A300002NRL"))
			wA300002PDE = trim(rstQuery.Fields("A300002PPP"))
			wA300002SCR = trim(rstQuery.Fields("A300002SCR"))
			wA300002STS = trim(rstQuery.Fields("A300002STS"))
			wA300002LCR = formatnumber(trim(rstQuery.Fields("A300002LCR")),2)			
		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING	

		wSELUNO = "" : wSELDOS = ""
		IF wA300002SCR = "1" THEN
			wSELUNO = "selected"
		   ELSE
		    wSELDOS = "selected"
		END IF   
		
		wSELUNO1 = "" : wSELDOS1 = ""
		IF wA300002STS = "1" THEN
			wSELUNO1 = "selected"
		   ELSE
		    wSELDOS1 = "selected"
		END IF   

    end if
	
	wTIT = wProceso & " " & wTIT   

	wURL = "X001X101S.ASP?CODACT=A&CLA001=" & wCLA001
	


	%>

	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURL %>" >

    <div align="center">

    <table BORDER="1" WIDTH="700" cellspacing="0" cellpadding="0"  bordercolor="#0066CC" bgcolor="#FE9900" style="border-style: inset; border-width: 2px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
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
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Raz�n Social:</p></td>
          <td class="TDD" width="80%" ><INPUT NAME="wDES" size=40 value="<%=wA300002RSO%>"></td>
         </tr>

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Rif:</p></td>
          <td class="TDD" width="80%" ><INPUT NAME="A300002RIF" size=20 value="<%=wA300002RIF%>"></td>
         </tr>

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Nit:</p></td>
          <td class="TDD" width="80%" ><INPUT NAME="A300002NIT" size=20 value="<%=wA300002NIT%>"></td>
         </tr>

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Telefono:</p></td>
          <td class="TDD" width="80%" ><INPUT NAME="A300002NT1" size=15 value="<%=wA300002NT1%>"></td>
         </tr>

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Contacto:</p></td>
          <td class="TDD" width="80%" ><INPUT NAME="A300002NRL" size=40 value="<%=wA300002NRL%>"></td>
         </tr>

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">% Pronto Pago:</p></td>
          <td class="TDD" width="80%" ><INPUT NAME="A300002PDE" size=3 value="<%=wA300002PDE%>"></td>
         </tr>

	

	

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Status del Cliente:</p></td>
          <td class="TDD" width="80%" >
				<select size="1" name="A300002STS">
				<option value="1" <%=wSELUNO1%>>Activo</option>
				<option value="3" <%=wSELDOS1%>>Suspendido</option>
          </td>
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
	</div>
</FORM>

</BODY>
</HTML>
