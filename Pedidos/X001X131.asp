<%@ Language=VBScript %>
<% Response.Expires = 0 %>
<% Response.AddHeader "PRAGMA", "NO-CACHE" %>

<% wSTSIMP = Request.QueryString("STSIMP") %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 6.0">
<title>Detalle Factura</title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
</head>

<!--#include file="X001Z001.INC"-->





<!--#include file="X001Y001.PRC"-->

<% if wSTSIMP = "S"  THEN
	wcellpadding = "3"
	wBorderColor ="#C0C0C0"  %>
	<body onload="window.status='<%=Request.ServerVariables("URL")%>'" ALIGN="CENTER">
		<div align=center>

		<table BORDER="1" WIDTH="100%" cellspacing="0" cellpadding="<%=wcellpadding%>"
		  bordercolorlight="<%=wBorderColor%>" bordercolordark="<%=wBorderColor%>" bordercolor="<%=wBorderColor%>" align="center" >
		  
<%	ELSE %>


<body topmargin="0" bgcolor="#000000" leftmargin="17" rightmargin="0" vlink="#0000FF" onload="window.status='<%=Request.ServerVariables("URL")%>'" style="text-align: center" scroll="yes">
		<div >
		<table BORDER="1" WIDTH="790" cellpadding="6" cellspacing="0" bordercolor="#FFFFFF" align="center" >

		<!--
			WIDTH="750" Pantalla 800X600
		-->
		
		

<%  

	wTIT = Request.QueryString("URLTIT")	
	wURLACT = TRIM(Request.QueryString("URLACT"))
	IF ISNULL(wURLACT) OR TRIM(wURLACT) = "" THEN
		wURLACT = "X001A101_A.ASP"
	END IF 

	wCLA001 = Request.QueryString("CAMC01")
	wCLA002 = Request.QueryString("CAMC02")
	wB300201CCI = Session("glCiaInternet")
	wB300201CIA = Session("glCia")
	
	IF ISNULL(wTIT) OR TRIM(wTIT) = "" THEN
		'wNOMCLI = BuscarClientePedido ( wCLA001, wCLA002 )
		'wTIT = "Pedido " & wCLA002 & " de "  &  wNOMCLI 
	END IF 

	strCnn	= Application("XDTA300_ConnectionString")
	



%>	 
		<table BORDER="1" width="790" align="center"  bordercolor="#FFFFFF" cellspacing="0" cellpadding="5"  > 
<%	END IF


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


	SQL = "SELECT B300200PIM "
	SQL = SQL & " FROM X300BF200 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " B300200CCI ='" & wB300201CCI & "' AND "
	SQL = SQL & " B300200CIA ='" & wB300201CIA & "' AND "
	SQL = SQL & " B300200NFA ='" & wCLA002 & "' "	
	'response.write sql
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	'RESPONSE.WRITE SQL
	IF NOT rstQuery.EOF THEN
		wPIM = trim(rstQuery.Fields("B300200PIM"))		
	END IF 
	rstQuery.CLOSE
	SET rstQuery = NOTHING	

	
	SQL = " SELECT B300201CPR, B300201DEL, B300201UDE, B300201PFI, "
	SQL = SQL & " B300201PLI, B300201MNE,  B300201NFA, " 
	SQL = SQL & " B300201DEP, B300201PRD, B300201DPP, B300201MAR " 
	SQL = SQL & " FROM X300BF201 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " B300201CCI ='" & wB300201CCI & "' AND "
	SQL = SQL & " B300201CIA ='" & wB300201CIA & "' AND "	
	SQL = SQL & " B300201NFA ='" & wCLA002 & "' "
	SQL = SQL & " ORDER BY B300201ITE " 	
	'Response.Write SQL
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
    'rstQueryData = rstQuery.GetRows 
	wTipo = "D"
	wCLASS = "TDD"
	wCuenta = 0
	wTC03 = 0 
	wTC08 = 0
	wTC09 = 0
	DO WHILE NOT rstQuery.EOF 'and wCuenta < cint(Session("glRegistros"))
		
		
		
		wCL2 = trim(rstQuery.Fields("B300201NFA"))
		wDEL = trim(rstQuery.Fields("B300201DEL"))
		
		wC01 = TRIM(rstQuery.Fields("B300201CPR")) 
		wC02 = left(trim(rstQuery.Fields("B300201DEL")),35)
		wC03 = trim(rstQuery.Fields("B300201UDE"))
		wC05 = trim(rstQuery.Fields("B300201MAR"))
		wC04 = trim(rstQuery.Fields("B300201PLI"))
		wC07 = trim(rstQuery.Fields("B300201PFI"))
		'wPIM = trim(rstQuery.Fields("B300201PIM"))
		'wC08 = trim(rstQuery.Fields("B300201KIL"))
		wC09 = wC03 * wC07
		
		wC06 = trim(rstQuery.Fields("B300201DEP"))
		IF TRIM(wC06) <> "0" THEN: wC06 = wC06 & "+": ELSE: wC06 = "": END IF
		wC06 = wC06 & trim(rstQuery.Fields("B300201PRD"))
				
		IF isnull(wC03) then : wC03 = 0 :   end if	
		IF isnull(wC04) then : wC04 = 0 :   end if	
		
		
		IF isnull(wC07) then : wC07 = 0 :	end if	
		IF isnull(wC08) then : wC08 = 0 :	end if	
		IF isnull(wC09) then : wC09 = 0 :	end if			

		wTC03 = wTC03 + wC03
		wTC08 = wTC08 + wC08
		wTC09 = wTC09 + wC09


		wC03 = formatnumber(wC03,0)
		wC04 = formatnumber(wC04,2)

		
		wC07 = formatnumber(wC07,2)				
		wC08 = formatnumber(wC08,2)
		wC09 = formatnumber(wC09,2)


		
		wCuenta = wCuenta + 1
		
		wITE = wCuenta

		Mostrar_Linea
		rstQuery.MoveNext 
		
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	

	IF wCuenta > 0 then
		wTIURL = ""
		wCLASS = "TD1"
		wTipo = "T"		
		
		Response.write "</table>"
		
		Response.write "<table BORDER=""1"" width=""790"" align=""center""  bordercolor=""#FFFFFF"" cellspacing=""0"" cellpadding=""2"" > "
		
		wC04 = "Cantidad:"		
		wC09 = formatnumber(wTC03,0)
		Mostrar_Linea_Total			
				
		wC04 = "Sub - Total:"	
		wC09 = wTC09		
		wC09 = formatnumber(wC09,2)		
		Mostrar_Linea_Total	
		
		
	
		wBIM = (wTC09 * wPIM) / 100
		wC04 = "Impuesto (" & wPIM & " %):"	
		wC09 = wBIM		
		wC09 = formatnumber(wC09,2)		
		Mostrar_Linea_Total
		
		wC04 = "Total Factura:"	
		wC09 = wTC09 + wBIM		
		wC09 = formatnumber(wC09,2)		
		Mostrar_Linea_Total
	
	end if
		
%>
<%'Incluir Cuerpo del Reporte %>
<!--#include file="X001X131_C.ASP"-->

</table>
<%
wCLA001 = Request.QueryString("CAMC01")
wCLA002 = Request.QueryString("CAMC02")


%>


</body>

</html>