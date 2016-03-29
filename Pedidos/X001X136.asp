<%@ Language=VBScript %>
<%

Response.Expires = -1
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"

%>

<% wSTSIMP = Request.QueryString("STSIMP") %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<title>PEDIDOS</title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<style type="text/css">
	html{overflow-y:scroll} 
</style>

<!--#include file="X001Z001.INC"-->

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
	<body topmargin="0" bottommargin="0" leftmargin="18" rightmargin="0" vlink="#0000FF" onload="window.status='<%=Request.ServerVariables("URL")%>'" style="text-align: center" scroll="YES" bgcolor="<%=Request.Cookies("CAR")("Color1")%>"  >
		<table border="0" height="100%" width="919" align="center" bgcolor="#ffffff" cellpadding="0" cellspacing="0"   ><tr><td valign="top"  >
		<table BORDER="0" WIDTH="919" bgcolor="#FFFFFF" align="center" cellspacing="1" cellpadding="4"  >
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
	
	SQL = "SELECT B300127CCI, B300127CGR " 
	SQL = SQL & " FROM X300BF127"
	SQL = SQL & " WHERE "
	SQL = SQL & " B300127CCI = '" & Session("glCiaInternet") & "' "
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
		
		SQL = "SELECT A300035DGR FROM X300AF035 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " A300035CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " A300035CGR = '" & wC02 & "'  "		
		'Response.Write sql
		Set rstQuery1 = Server.CreateObject("ADODB.Recordset")
		rstQuery1.Open sql , strCnn
		IF NOT rstQuery1.EOF THEN
			wDPC = trim(rstQuery1.Fields(0))
			wEXISTE = "S"
		END IF
		rstQuery1.Close 
		set rstQuery1 = nothing
		
		wC01 = wC02
		wC02 = wDPC
		
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
<!--#include file="X001X136_C.ASP"-->
</table> 

</td>
</tr>
</table>
</body>

</html>
