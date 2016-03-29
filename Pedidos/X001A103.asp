<%@ Language=VBScript %>
<% wSTSIMP = Request.QueryString("STSIMP") %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 6.0">
<title>PEDIDOS</title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
</head>
<% if wSTSIMP = "S"  THEN
	wcellpadding = "3"
	wBorderColor ="#C0C0C0"  %>
	<body onload="window.status='<%=Request.ServerVariables("URL")%>'" ALIGN="CENTER">
		<div align=center>

		<table BORDER="1" WIDTH="100%" cellspacing="0" cellpadding="<%=wcellpadding%>"
		  bordercolorlight="<%=wBorderColor%>" bordercolordark="<%=wBorderColor%>" bordercolor="<%=wBorderColor%>" align="center" >
		  
<%	ELSE %>
	<body ALIGN="CENTER" vlink="#0000FF" onload="window.status='<%=Request.ServerVariables("URL")%>'" topmargin="0" leftmargin="15" rightmargin="0" >
		<div >
		<!--
			WIDTH="750" Pantalla 800X600
		-->
		<table BORDER="0" WIDTH="764" align="center"   > 
<%	END IF

	wTIT = Request.QueryString("URLTIT")	
	wURLACT = TRIM(Request.QueryString("URLACT"))
	wCLA001 = Request.QueryString("CLA001")
	wCLA002 = Request.QueryString("CLA002")
	wCLA003 = Request.QueryString("CLA003")
	wCLA004 = Request.QueryString("CLA004")
	wCLA005 = Request.QueryString("CLA005")
	
	wB300101CCI = Session("glCiaInternet")
	wB300101CIA = Session("glCia")
	
	IF wCLA005 = "000" THEN : wCLA005 = "" : END IF 

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
    
	wNOMTAB = Request.QueryString("NOMTAB")

	strCnn	= Application("XDTA300_ConnectionString")
	

	'BUSCA PORCENTAJE DE PRONTO PAGO
	SQL = "SELECT * FROM X300AQ004 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " B300100OPE = '" &  wCLA001 & "' AND "	
	SQL = SQL & " B300100NPE = '" &  wCLA002 & "' "	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		wPPP = trim(rstQuery.Fields("A300002PPP"))
		Session("glPPP") = wPPP
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	
		
	'CARGA PRODUCTOS
	SQL = "SELECT A300003CPR, A300003DEL, A300003PUA, A300003CIN, "
	SQL = SQL & " A300003MAR, A300003REF, A300003PIM " 
	SQL = SQL & " FROM X300AQ003 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " A300003CCI ='" & wB300101CCI & "' AND "
	SQL = SQL & " A300003CIA ='" & wB300101CIA & "' "
	IF len(trim(wCLA003)) > 0 THEN		
		SQL = SQL & " AND "
		SQL = SQL & " A300003CPR LIKE '%" & ucase(wCLA003) & "%' "
	END IF 
	IF len(trim(wCLA004)) > 0 THEN		
		SQL = SQL & " AND "
		SQL = SQL & "  A300003DEL LIKE '%" & ucase(wCLA004) & "%' "
	END IF 	
	IF len(trim(wCLA005)) > 0 THEN		
		SQL = SQL & " AND "
		SQL = SQL & "  A300003NLP LIKE '%" & ucase(wCLA005) & "%' "
	END IF 

	SQL = SQL & " ORDER BY A300003CPR DESC " 	
	'Response.Write SQL
	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn    
	wTipo = "D"
	wCLASS = "TDD"
	'wCuenta = 0
	wTC03 = 0 
	wTC08 = 0
	wTC09 = 0
	DO WHILE NOT rstQuery.EOF 'and wCuenta < cint(Session("glRegistros"))

		wC01 = trim(rstQuery.Fields("A300003CPR"))
		wC02 = left(trim(rstQuery.Fields("A300003DEL")),40)
		wC03 = trim(rstQuery.Fields("A300003CIN"))
		wC04 = trim(rstQuery.Fields("A300003PUA"))
		wC05 = trim(rstQuery.Fields("A300003MAR"))
		wC06 = left(trim(rstQuery.Fields("A300003REF")),10)		
		wPIM = trim(rstQuery.Fields("A300003PIM"))
		
		'wC09 = trim(rstQuery.Fields("B300101MNE"))
		
		wPPP = CDbl(wPPP)     

	    wC04 = wC04 - ((wC04 * wPPP) / 100)

	    wC07 = wPIM
	    
	    wFIV = 1 + (wPIM / 100)
	    
	    IF wFIV > 1 THEN
	        wUIVA = Round(wC04 * wFIV, 2)	        
	       ELSE 
	        wUIVA = wC04
        END IF 
        
        wC09 = wUIVA
				
		
		IF isnull(wC04) then : wC04 = 0 :   end if		
		

		wTC03 = wTC03 + wC03
		
		wTC09 = wTC09 + wC09


		wC04 = formatnumber(wC04,2)
		
		wC09 = formatnumber(wC09,2)

		'Armar URL
		'IF wURLACT = "X000A001_S.ASP" THEN
		'	wURL = wURLACT & "?NOMTAB=X002BQ101" 
		'	ELSE
		wURL = "X001A103_A.ASP" & "?CLA001=" & wCLA001 & "&CLA002=" & wCLA002 & "&CLA003=" & wC01
		'END IF	
		wTIURL = "<A href=" & wURL & " target=""main""> "
		wTFURL = " </A>"


		Mostrar_Linea
		rstQuery.MoveNext 
		wCuenta = wCuenta + 1
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	

	IF wCuenta > 0 then
		wCLASS = "TD1"
		wTipo = "T"
		wC01 = wCuenta
		wC02 = "Totales"		
		wC03 = wTC03
		wC04 = "&nbsp;"
		wC05 = "&nbsp;"
		wC06 = "&nbsp;"		
		wC07 = "&nbsp;"		
		
		wC09 = wTC09	
		wC03 = formatnumber(wC03,0)
		wC09 = formatnumber(wC09,2)
		Mostrar_Linea	
		'&nbsp;
	end if
		
%>
<%'Incluir Cuerpo del Reporte %>
<!--#include file="X001A103_C.ASP"-->
</table>
<center><p></p></center>
</body>
</html>


