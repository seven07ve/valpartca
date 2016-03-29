<%@ Language=VBScript %>
<% wSTSIMP = Request.QueryString("STSIMP") %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 6.0">
<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.3)">
<title>PEDIDOS</title>
<link rel=stylesheet type="text/css" href="../X001Z900.CSS">
<script language="Javascript"> 
	function uno(src,color_entrada) { 
		src.bgColor=color_entrada;src.style.cursor="hand"; 
	} 
	function dos(src,color_default) { 
	  src.bgColor=color_default;src.style.cursor="default"; 
	} 
</script> 
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
	
	<body ALIGN="CENTER" vlink="#0000FF" onload="window.status='<%=Request.ServerVariables("URL")%>'" topmargin="2" leftmargin="15" rightmargin="0"   >
		<div >
		<!--
			WIDTH="750" Pantalla 800X600
		-->
		<%'=Session("glTamano")%>
		<table BORDER="0" WIDTH="764" ALIGN="center" > 
<%	END IF

	
	wURLACT = TRIM(Request.QueryString("URLACT"))		

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

    wShowURL = "S"
	wNOMTAB = Request.QueryString("NOMTAB")
	wSTSPED = Request.QueryString("STSPED")	
	


    
	'wCODCNY = Session("glCompania")	     
	strCnn = Application("XDTA300_ConnectionString")

	'Cargar Datos
	SQL = " SELECT * "
	SQL = SQL & " FROM X300ZF050"
	SQL = SQL & " ORDER BY Z300050FEC "			
    Set rstQuery = Server.CreateObject("ADODB.Recordset")	
	'Response.Write strCnn
    rstQuery.Open sql , strCnn    
	wTipo = "D"
	wCLASS = "TDD"
	wCuenta = 0 	
	DO WHILE NOT rstQuery.EOF
		wCOD = trim(rstQuery("Z300050FEC"))
		wC01 = trim(rstQuery("Z300050TIL"))
		wC02 = trim(rstQuery("Z300050STS"))		
		wC03 = trim(rstQuery("Z300050PUS"))
		wCLA = trim(rstQuery("Z300050CDN"))	
		
		If trim(wC02) = "0" Then
			wC02 = "Inactiva"
		  else		
			wC02 = "Activa"
		End If		
		
  		wDIA = DAY(wCOD)
		wMES = MONTH(wCOD)
		wANO = YEAR(wCOD)	
		IF LEN(TRIM(wDIA))< 2 THEN
			wDIA = "0" & wDIA
		END IF	
		IF LEN(TRIM(wMES))< 2 THEN
		    wMES = "0" & wMES
		END IF		
		wFECHAP = wANO & "-" & wMES & "-"  & wDIA
		wFECHAP_02 = wDIA & "-" & wMES & "-"  & wANO 
		
		'wCOCEL = "onMouseOver=""uno(this,'cccccc');"" onMouseOut=""dos(this,'FFFFFF');"" " 
		
		'Armar URL
		wURL = "../../ASPX/C001D001.ASPX"
		wURL = wURL & "?CODCOR=" & wCLA		
		
		wTIURL = "<A href=" & wURL & " target=""_parent""> "
		wTFURL = " </A>"
		
		Mostrar_Linea
		wCuenta = wCuenta + 1
		rstQuery.MoveNext 
	LOOP		
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	

%>
<%'Incluir Cuerpo del Reporte %>
<!--#include file="X010Z300C.ASP"-->
</table>
<center><p></p></center>
</body>
</html>
