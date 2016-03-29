<%@ Language=VBScript %>
<% wSTSIMP = Request.QueryString("STSIMP") %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<title>Usuarios Supervisados</title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">


</head>
<% if wSTSIMP = "S" OR wSTSIMP = "E" THEN
	wcellpadding = "3"
	if wSTSIMP = "E" THEN 
		Response.ContentType = "application/vnd.ms-excel" 
		wcellpadding = "0"
	end if	
	wBorderColor ="#C0C0C0"  %>
	<body onload="window.status='<%=Request.ServerVariables("URL")%>'" style="text-align: center">
		<div align=center>
		<table BORDER="1" WIDTH="100%" cellspacing="0" cellpadding="<%=wcellpadding%>"
		  bordercolorlight="<%=wBorderColor%>" bordercolordark="<%=wBorderColor%>" bordercolor="<%=wBorderColor%>">
<%	ELSE %>
<style type="text/css">
	html{overflow-y:scroll} 
</style>

	<body topmargin="0" leftmargin="17" rightmargin="0" vlink="#0000FF" onload="window.status='<%=Request.ServerVariables("URL")%>'" style="text-align: center" scroll="yes" bgcolor="<%=Request.Cookies("CAR")("Color1")%>">


	<div align="center"  >
	<table border="0" height="100%" width="919" bgcolor="#FFFFFF" cellspacing="0"  > <tr><td valign="top" >

		<div >
		<table BORDER="0" WIDTH="919" cellpadding="5" >
<%	END IF

	wTIT = Request.QueryString("URLTIT")	
	wURLACT = TRIM(Request.QueryString("URLACT"))		
	wNOMTAB = Request.QueryString("NOMTAB")
	wCLA001 = Request.QueryString("CLA001")
	wCLA002 = Request.QueryString("CLA002")
 
	'RESPONSE.WRITE wNOMTAB 
	'Mostrar Encabezado para impresion
	if wSTSIMP = "S" THEN
		'Mostrar Titulo
		Mostrar_Titulo
		'Mostrar Encabezado
		wTipo = "E"
		wCLASS = "TDS"
		wShowURL = "N"
		Mostrar_Linea
	   ELSE	
		wShowURL = "S" 	
	END IF
	
	'Mostrar Encabezado para impresion
    
	
	'wCAMXXX = left(wCAMC01,7) 

	strCnn	= Application("XDTA300_ConnectionString")
	
	IF wNOMTAB = "X300ZF006" THEN
		SQL = "SELECT Z300006PUS, NOMVEN " 
		SQL = SQL & " FROM X300ZQ006 "
		SQL = SQL & " WHERE "
		SQL = SQL & " Z300006CCI = '" & wCLA001 & "' AND"
		SQL = SQL & " Z300006PSU = '" & wCLA002 & "'"
	  ELSE
		SQL = "SELECT B300123FAM, B300121DEC "
		SQL = SQL & " FROM X300BQ123"
		SQL = SQL & " WHERE "
		SQL = SQL & " B300123CCI = '" & wCLA001 & "' AND"
		SQL = SQL & " B300123CCL = '" & wCLA002 & "'"
	END IF 
	
	'Response.Write SQL

	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	
    rstQuery.Open sql , strCnn
	wTipo = "D"
	wCLASS = "TDD"
	wCuenta = 0
	wTC03 = 0 
	wTC04 = 0
	wTC05 = 0
	
	DO WHILE NOT rstQuery.EOF 'and wCuenta < wRegistros 

		wC01 = trim(rstQuery.Fields(0))
		wC02 = trim(rstQuery.Fields(1))
		'wC03 = trim(rstQuery.Fields(2))
		
		'Armar URL
		
		wURL = wURLACT & "?CLA001=" & wCLA001 & "&CLA002=" & wCLA002 & "&CLA003=" & Replace(wC01," ", "%20") 
		

		if Session("glTipoUsuario") = "A" then
			wTIURL = "<A href=" & wURL & " target=""_parent""> "
			wTFURL = " </A>"
		   ELSE
			wTIURL = ""
			wTFURL = ""
		END IF   	

		

		Mostrar_Linea
		rstQuery.MoveNext 
		wCuenta = wCuenta + 1

	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	

	wTIURL = ""
	wTFURL = ""


	IF wCuenta > 0 then
		wCLASS = "TD1"
		wTipo = "T"
		wC01 = wCuenta
		wC02 = "Totales"		
		wC03 = "&nbsp;"
		wC04 = "&nbsp;"
		wC05 = "&nbsp;"
		wC06 = "&nbsp;"
		Mostrar_Linea	
	end if

%>
<%'Incluir Cuerpo del Reporte %>
<!--#include file="X001X137_C.ASP"-->
</table>


</td></tr></table></div>

</body>
</html>
