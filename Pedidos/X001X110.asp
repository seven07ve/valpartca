<%@ Language=VBScript %>
<% wSTSIMP = Request.QueryString("STSIMP") %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 6.0">
<title>PEDIDOS</title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">


</head>
<% if wSTSIMP = "S" OR wSTSIMP = "E" THEN
	wcellpadding = "3"
	if wSTSIMP = "E" THEN 
		Response.ContentType = "application/vnd.ms-excel" 
		wcellpadding = "0"
	end if	
	wBorderColor ="#C0C0C0"  %>
	<body onload="window.status='<%=Request.ServerVariables("URL")%>'">
		<div align=center>
		<table BORDER="1" WIDTH="100%" cellspacing="0" cellpadding="<%=wcellpadding%>"
		  bordercolorlight="<%=wBorderColor%>" bordercolordark="<%=wBorderColor%>" bordercolor="<%=wBorderColor%>">
<%	ELSE %>
	<body topmargin="0"  vlink="#0000FF" onload="window.status='<%=Request.ServerVariables("URL")%>'">
		<div >
		<table BORDER="0" WIDTH="<%=Session("glTamano")%>" >
<%	END IF

	wTIT = Request.QueryString("URLTIT")	
	wURLACT = TRIM(Request.QueryString("URLACT"))		
	wNOMTAB = Request.QueryString("NOMTAB")
	wCAMC01 = Request.QueryString("CAMC01")
	'wCAMC02 = Request.QueryString("CAMC02")
	'wCAMC03 = Request.QueryString("CAMC03")
	'wCAMC04 = Request.QueryString("CAMC04")


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
	
	SQL = "SELECT Z300001PUS, Z300001NUS, Z300001CLU, Z300001STS " 
	SQL = SQL & " FROM " &  wNOMTAB 	
	SQL = SQL & " WHERE " 
	SQL = SQL & " (Z300001CCI = '" & wCAMC01 & "') AND "
	SQL = SQL & " (Z300001CLU <> 'S') "	
	wWHERE = "  AND "

	wRegistros = cint(Session("glRegistros"))	
	if len(trim(Session("glBusqueda"))) > 0 then
		SQL = SQL & wWHERE
		SQL = SQL & " ((Z300001PUS LIKE '%" & ucase(Session("glBusqueda")) & "%') OR  "
		SQL = SQL & "  (Z300001NUS LIKE '%" & ucase(Session("glBusqueda")) & "%'))  "
		wRegistros = 9999
	end if	

	SQL = SQL & " ORDER BY Z300001CLU  "	
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
	
	DO WHILE NOT rstQuery.EOF and wCuenta < wRegistros 

		wC01 = trim(rstQuery.Fields(0))
		wC02 = trim(rstQuery.Fields(1))
		wC03 = trim(rstQuery.Fields(2))
		wC05 = trim(rstQuery.Fields(3))


		wTIT01 = ""
		SELECT CASE wC03
			CASE "A"
				wC03 = "Administrador"
				wC04 = ""
			CASE "V"
				wC03 = "Vendedor"
				wC04 = ""
			CASE "G"
				wC03 = "Gerente"
				wC04 = "Ver Supervisores"
			CASE "U"
				wC03 = "Supervisor"
				wC04 = "Ver Vendedores"
			CASE "S"
				wC03 = "Seguridad"
				wC04 = ""
		END SELECT

		SELECT CASE wC05
			CASE "1"
				wC05 = "Activo"
			CASE "3"
				wC05 = "Suspendido"
			CASE "9"
				wC05 = "Eliminado"
		END SELECT

			

		'Armar URL
		IF wURLACT = "X000A001_S.ASP" THEN
			wURL = wURLACT & "?NOMTAB=X002BQ101" 
			ELSE
			wURL = wURLACT & "?CLA001=" & wC01
		END IF	

		if Session("glTipoUsuario") = "A" OR Session("glTipoUsuario") = "S" then
			wTIURL = "<A href=" & wURL & " target=""_parent""> "
			wTFURL = " </A>"
		   ELSE
			wTIURL = ""
			wTFURL = ""
		END IF   	

		IF wC03 = "Gerente"  THEN
				wURLD = "X001X111_S.asp?NOMTAB=X300ZQ005&CLA001=" & wCAMC01 & "&CLA002=" & wC01 & "&CLA003=" & wC02
				wTIDURL = "<A href=" & wURLD & " target=""_parent""> "
				wTFURL = " </A>"
		END IF

		wC = chr(34)
		IF wC03 = "Supervisor" THEN
				wURLD = "X001X111_S.asp?NOMTAB=X300ZQ006&CLA001=" & wCAMC01 & "&CLA002=" & wC01  & "&CLA003=" & wC02  
				wTIDURL = "<A href=" & wC & wURLD & wC & " target=""_parent""> "
				wTFURL = " </A>"
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
		wC01 = ""
		wC02 = "Total de Usuarios : " & wCuenta 
		wC03 = "&nbsp;"
		wC04 = "&nbsp;"
		wC05 = "&nbsp;"
		Mostrar_Linea	
	end if

%>
<%'Incluir Cuerpo del Reporte %>
<!--#include file="X001X110_C.ASP"-->
</table>
</body>
</html>
