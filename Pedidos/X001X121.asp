<%@ Language=VBScript %>
<% wSTSIMP = Request.QueryString("STSIMP") %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<title>Clientes</title>
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
	<body topmargin="0" leftmargin="18" rightmargin="0" bottommargin="0" vlink="#0000FF" bgcolor="<%=Request.Cookies("CAR")("Color1")%>" onload="window.status='<%=Request.ServerVariables("URL")%>'" style="text-align: center" scroll="auto">
		
		<table width="919" height="100%" border="0" bgcolor="#ffffff" align="center" cellpadding="0" cellspacing="0"  >
		<tr><td valign="top"  >
			<table BORDER="1" width="919" bordercolor="#FFFFFF" cellspacing="0" align="center" cellpadding="5" >
<%	END IF

	wTIT = Request.QueryString("URLTIT")	
	wURLACT = TRIM(Request.QueryString("URLACT"))		
	wNOMTAB = "X300AQ002_002"
	wPAR = wPAR & "&CAMC01=A300002CCL" 
	
	wCAMC01 = "A300002CCL"
	wCAMC02 = "A300002RSO" 
	wCAMC03 = "A300020CVE" 
	wCAMC04 = "A300020NOM"		
	wFAM = Request.Form("FAMILIA") 
	wDES = Request.Form("DES") 
			
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
	SQL = SQL & ", " & wCAMC03 & ", " & wCAMC04
	SQL = SQL & " FROM " &  wNOMTAB 		
	SQL = SQL & " WHERE "
	SQL = SQL & " A300002CCI = '" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " A300002CIA = '01' AND "
	SQL = SQL & " A300002NIC = 'D001' "
	if Session("glTipoUsuario") = "C" then
		SQL = SQL & " AND "
		SQL = SQL & " A300002CCL = '" & Session("glUsuario") & "' "
	end if
	if Session("glTipoUsuario") = "V" then
		SQL = SQL & "  AND "
		SQL = SQL & " A300020CVE = '" & Session("glCodVendedor") & "' "
	end if
    'if Session("glTipoUsuario") = "U" then
	'	SQL = SQL & "  AND "
	'	SQL = SQL & "  Z300006PSU = '" & Session("glUsuario") & "' "		
	'end if 		
	If len(trim(wFAM)) > 0 and wFAM <> "000" then
		SQL = SQL & " AND A300002CCL ='" & wFAM & "' "
	End if 		
	If len(trim(wDES)) > 0 then
		SQL = SQL & " AND "
		SQL = SQL & " (( A300002CCL LIKE '%" & ucase(wDES) & "%') OR  "
		SQL = SQL & "  ( A300002RSO LIKE '%" & ucase(wDES) & "%') OR  "
		SQL = SQL & "  ( A300020CVE LIKE '%" & ucase(wDES) & "%') OR  "
		SQL = SQL & "  ( A300020NOM LIKE '%" & ucase(wDES) & "%'))  "
	End If 
				
	SQL = SQL & " ORDER BY A300002CCL "

	wRegistros = cint(Session("glRegistros"))	

	'Response.Write SQL	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	
    rstQuery.Open sql , strCnn
	wTipo = "D"
	wCLASS = "TDD"
	wCuenta = 0
	wTC03 = 0 
	wTC04 = 0
	wTC05 = 0
	wCCL = 0
	DO WHILE NOT rstQuery.EOF 'and (wFAM > 0 or wDES <> "") 

		wC01 = trim(rstQuery.Fields(0))
		wC02 = trim(rstQuery.Fields(1))
		wC03 = trim(rstQuery.Fields(2))
		wC04 = trim(rstQuery.Fields(3))
		
		IF ISNULL(wC04) OR LEN(TRIM(wC04)) = 0 THEN
			wC04 = "NO DISPONIBLE"
		END IF 
		'wC05 = trim(rstQuery.Fields(4))
		'wC06 = trim(rstQuery.Fields(5))
		'wC06 = right("0" & Day(wC06),2) & "-" & right("0" & Month(wC06),2) & "-" & Year(wC06)	


		
			'IF wCCL <> trim(rstQuery.Fields(6)) THEN
		'		wTIT = trim(rstQuery.Fields(6)) & " - " & trim(rstQuery.Fields(7)) 
		'		Mostrar_Titulo			
		'	wCCL = trim(rstQuery.Fields(6))
		'END IF 


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
		wC02 = "&nbsp;"		
		wC03 = "&nbsp;"
		wC04 = "&nbsp;"
		wC05 = "&nbsp;"
		wC06 = "&nbsp;"
		wC07 = "&nbsp;"
		wC08 = "&nbsp;"
		Mostrar_Linea	
	end if

%>
<%'Incluir Cuerpo del Reporte %>
<!--#include file="X001X121_C.ASP"-->

</table>
</td> 
</tr> 
</table> 
</body>
</html>
