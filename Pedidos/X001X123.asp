<%@ Language=VBScript %>
<% wSTSIMP = Request.QueryString("STSIMP") %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<title>PEDIDOS</title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">

<style type="text/css">
	html{overflow-y:scroll} 
</style>

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
	<body topmargin="0" leftmargin="18" rightmargin="0" vlink="#0000FF" bottommargin="0" onload="window.status='<%=Request.ServerVariables("URL")%>'" style="text-align: center" scroll="YES" bgcolor="<%=Request.Cookies("CAR")("Color1")%>"  >
		
		<table BORDER="0" WIDTH="919" bgcolor="#FFFFFF" align="center" cellpadding="6" cellspacing="1" >
<%	END IF

	wTIT = Request.QueryString("URLTIT")	
	wURLACT = TRIM(Request.QueryString("URLACT"))		
	wNOMTAB = Request.QueryString("NOMTAB")
	wCLA001 = Request.QueryString("CLA001")
	wCLA002 = Request.QueryString("CLA002")
 

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
	
	SQL = "SELECT B300123FAM, B300120DEC " 
	SQL = SQL & " FROM X300BQ123"
	SQL = SQL & " WHERE "
	SQL = SQL & " B300123CCI = '" & wCLA001 & "' AND"
	SQL = SQL & " B300123CCL = '" & wCLA002 & "'"
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
		
		wURL = wURLACT & "?CLA001=" & wCLA001 & "&CLA002=" & wCLA002 & "&CLA003=" & wC01 
		

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
<!--#include file="X001X123_C.ASP"-->
</table>
</body>
</html>
