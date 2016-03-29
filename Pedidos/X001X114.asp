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
<title>Usuarios</title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<style type="text/css" >

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
	<body topmargin="0" leftmargin="18" bgcolor="<%=Request.Cookies("CAR")("Color1")%>"   rightmargin="0" vlink="#0000FF" onload="window.status='<%=Request.ServerVariables("URL")%>'" style="text-align: center" scroll="auto">
		<div >
		<table BORDER="1" align="center"   width="919" bordercolor="#FFFFFF" cellspacing="0" cellpadding="6" >
<%	END IF

	wTIT = Request.QueryString("URLTIT")	
	wURLACT = TRIM(Request.QueryString("URLACT"))		
	wNOMTAB = Request.QueryString("NOMTAB")
	wCAMC01 = Request.QueryString("CAMC01")
	wCAMC02 = Request.QueryString("CAMC02")
	wCAMC03 = Request.QueryString("CAMC03")
	wCAMC04 = Request.QueryString("CAMC04")

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
    
	
	wCAMXXX = left(wCAMC01,7) 


	strCnn	= Application("XDTA300_ConnectionString")
	
	SQL = "SELECT " & wCAMC01 & ", " & wCAMC02 
	SQL = SQL & ", " & wCAMC03 & ", " & wCAMC04 & ", Z300001CLU, Z300001MEX, " 
	SQL = SQL & " Z300001CVE, Z300001MTF, Z300001FPR, Z300001FUA, Z300001VIS, "
	SQL = SQL & " Z300001AIV, Z300001MNC FROM " &  wNOMTAB 	
	if wNOMTAB <> "X201ZF002" THEN
		SQL = SQL & " WHERE "
		SQL = SQL & wCAMXXX & "CCI ='" & Session("glCiaInternet") & "'  "
		SQL = SQL & " AND " & wCAMXXX & "CIA ='" & Session("glCia") & "' "
		wWHERE = " AND "
	  ELSE 	
		wWHERE = " WHERE "
	END IF	
	If Session("glTipoUsuario") = "V" Then 
		SQL = SQL & " AND Z300001CLU = 'C' "
		SQL = SQL & " AND Z300001CVE = '" & Session("glCodVendedor") & "'"
	End If 
	wRegistros = cint(Session("glRegistros"))	
	if len(trim(Session("glBusqueda"))) > 0 then
		SQL = SQL & wWHERE
		SQL = SQL & " ((" & wCAMC01 & " LIKE '%" & ucase(Session("glBusqueda")) & "%') OR  "
		SQL = SQL & "  ( Z300001CVE LIKE '%" & ucase(Session("glBusqueda")) & "%') OR  "
		SQL = SQL & "  (" & wCAMC02 & " LIKE '%" & ucase(Session("glBusqueda")) & "%'))  "
		wRegistros = 9999
	end if	
	If Session("glTipoUsuario") = "V" Then 
		SQL = SQL & "  ORDER BY Z300001NUS "
	End If 
	'Response.Write SQL
	'Sql = "SELECT A0301BPREM, A0301DBPRE FROM H03AF01 "
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
		wC02 = left(trim(rstQuery.Fields(1)),33)
		wC03 = trim(rstQuery.Fields(2))
		'wC04 = trim(rstQuery.Fields(3))
		wC05 = trim(rstQuery.Fields(4))
		wC06 = trim(rstQuery.Fields(5))
		wC07 = trim(rstQuery.Fields(6))
		wC08 = trim(rstQuery.Fields(7))
		wC09 = trim(rstQuery.Fields(8))
		wC09 = Right("00" & day(wC09),2) & "-" & Right("00" & month(wC09),2) & "-" & year(wC09) 
		wC10 = trim(rstQuery.Fields(9))
		wC10 = Right("00" & day(wC10),2) & "-" & Right("00" & month(wC10),2) & "-" & year(wC10)
		wC11 = trim(rstQuery.Fields(10))
		wC04 = trim(rstQuery.Fields(11))
		wC12 = trim(rstQuery.Fields(12))
		
		IF wC04 = "0" THEN 
			wC04 = "NO"
		  ELSE
			wC04 = "SI"
		END IF 
		
		IF wC12 = "0" THEN 
			wC12 = "NO"
		  ELSE
			wC12 = "SI"
		END IF 
		
		IF LEN(TRIM(wC07)) = 0 THEN
			wC07 = "&nbsp;"
		END IF 
		wTIUURL = ""
		IF wC05 = "A" Then
		   wC05 = "Admin."
		  ElseIf wC05 = "C" Then
		   wC05 = "Cliente"
		  ElseIf wC05 = "V" Then
		   wC05 = "Vendedor"
   		  ElseIf wC05 = "S" Then
		   wC05 = "Supervisor"
		   wURLT = "X001X137_S.asp?CLA001=" & Session("glCiaInternet") & "&NOMTAB=X300ZF006" & "&CLA002=" & wC01 & "&CLA003=" & wC02 
		   wTIUURL = "<A href=" & wURLT & " target=""_parent"">"
   	      ElseIf wC05 = "G" Then
		   wC05 = "Gerente"
   	      ElseIf wC05 = "D" Then
		   wC05 = "Director"
		End If
		
		IF wC03 = "1" THEN
		   wC03 = "ACT"
		  ELSE
   	       wC03 = "INAC"
		END IF 

		IF wC06 = "0" THEN
		   wC06 = "NO"
		  ELSE
   	       wC06 = "SI"
		END IF 
		
		IF wC08 = "0" THEN
		   wC08 = "NO"
		  ELSE
   	       wC08 = "SI"
		END IF 

		
		'Armar URL
		
		IF wURLACT = "X000A001_S.ASP" THEN
			wURL = wURLACT & "?NOMTAB=X002BQ101" 
			ELSE
			wURL = wURLACT & "?CLA001=" & wC01
		END IF	

		if Session("glTipoUsuario") = "A" then
			wTIURL = "<A href=" & wURL & " target=""_parent""> "
			wTFURL = " </A>"
		   ELSE
			wTIURL = ""
			wTFURL = ""
		END IF   	

		SELECT CASE wNOMTAB
			'Maestro de Clientes
			CASE "X201AF002"
			'Lista de Precio
			CASE "X201AF018"
				wC03 = "Detalle"
				wURLD = "X001X105_S.asp?NOMTAB=X201AQ018&CLA001=" & wC01
				wTIDURL = "<A href=" & wURLD & " target=""_parent""> "
				wTFURL = " </A>"

		END SELECT	


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
		wC07 = "&nbsp;"
		wC08 = "&nbsp;"
		wC09 = "&nbsp;"
		wC10 = "&nbsp;"
		wC11 = "&nbsp;"
		wC12 = "&nbsp;"
		
		Mostrar_Linea	
	end if

%>
<%'Incluir Cuerpo del Reporte %>
<!--#include file="X001X114_C.ASP"-->
</table>
</body>
</html>
