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
<style type="text/css" >
html{overflow-y:scroll} 
</style>

<!--#include file="X001Z001.INC"-->
</head>


<script language="vbscript">

Sub Procesar()

	Dim wMsg,wMsg2 
	wMsg = Msgbox("¿Desea Procesar Pedido?", vbQuestion+vbOKCancel, "Pedidos Carvica")
	If wMsg = 1 Then
	   document.FrmProcesar.submit() 
	  Else
	   wMsg2 = Msgbox("Recuerde que para que el Pedido sea Facturado debe Procesarlo",vbInformation, "Pedidos Carvica")  
	End If 

End Sub 

</script> 


<!--#include file="X001Y001.PRC"-->

<% if wSTSIMP = "S"  THEN
	wcellpadding = "3"
	wBorderColor ="#C0C0C0"  %>
	<body onload="window.status='<%=Request.ServerVariables("URL")%>'" ALIGN="CENTER">
		<div align=center>

		<table BORDER="1" WIDTH="100%" cellspacing="0" cellpadding="<%=wcellpadding%>"
		  bordercolorlight="<%=wBorderColor%>" bordercolordark="<%=wBorderColor%>" bordercolor="<%=wBorderColor%>" align="center" >
		  
<%	ELSE %>
	<body ALIGN="CENTER" bgcolor="<%=Request.Cookies("CAR")("Color1")%>"   vlink="#0000FF" onload="window.status='<%=Request.ServerVariables("URL")%>'" topmargin="0" leftmargin="18" rightmargin="0" >
		 
<%  

	wTIT = Request.QueryString("URLTIT")	
	wURLACT = TRIM(Request.QueryString("URLACT"))
	IF ISNULL(wURLACT) OR TRIM(wURLACT) = "" THEN
		wURLACT = "X001A101_A.ASP"
	END IF 

	wCLA001 = Request.QueryString("CAMC01")
	wCLA002 = Request.QueryString("CAMC02")
	wB300101CCI = Session("glCiaInternet")
	wB300101CIA = Session("glCia")
	
	IF ISNULL(wTIT) OR TRIM(wTIT) = "" THEN
		wNOMCLI = BuscarClientePedido ( wCLA001, wCLA002 )
		wNOMCLI = replace(wNOMCLI, chr(34), " ") 
		wNOMCLI = replace(wNOMCLI, "'", " ") 
		wTIT = "Pedido " & wCLA002 & " de "  &  wNOMCLI & "A"
	END IF 

	strCnn	= Application("XDTA201_ConnectionString")
	
    SQL = "SELECT B200100SPP, B200100MNE FROM X200BF100H " 
	SQL = SQL & " WHERE "
	SQL = SQL & " B200100OPE = '" &  wCLA001 & "' AND "	
	SQL = SQL & " B200100NPE = '" &  wCLA002 & "' "	
'RESPONSE.WRITE SQL
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
  '  	rstQuery.Open sql , strCnn
'	IF NOT rstQuery.EOF THEN
'		wSPP = trim(rstQuery.Fields("B200100SPP"))
'		wMNE = trim(rstQuery.Fields("B200100MNE"))
'	END IF
'	rstQuery.Close 
'	set rstQuery = nothing


IF wSPP = "0" THEN	
%>	 
	<p style="margin-top: 18px; margin-bottom: 15px">&nbsp;&nbsp;&nbsp; </p>
<%ELSE%>	
	<p style="margin-top: -10px; margin-bottom: -10px">&nbsp;&nbsp;&nbsp; </p>
<%END IF %>		
		
		<table BORDER="1" width="919" align="center"  cellspacing="0" bordercolor="#FFFFFF"  cellpadding="5" > 
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


	
	'BUSCA PORCENTAJE DE PRONTO PAGO
	SQL = "SELECT A201002PPP FROM X201AF002 " 
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		wPPP = 0 'trim(rstQuery.Fields("A201002PPP"))
		'Session("glPPP") = wPPP
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	
	
	SQL = "SELECT B201101CPR, A201003DEL, B201101UVE, B201101PUN, "
	SQL = SQL & " B201101KIL, B201101MNE, B201101OPE, B201101NPE," 
	SQL = SQL & " B201101PPR, B201101BPR, B201101PIM, A201003MAR, " 
	SQL = SQL & " A201003REF " 
	SQL = SQL & " FROM X201BQ101 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " B201101CCI ='" & wB300101CCI & "' AND "
	SQL = SQL & " B201101CIA ='" & wB300101CIA & "' AND "
	SQL = SQL & " B201101OPE ='" & wCLA001 & "' AND "
	SQL = SQL & " B201101NPE ='" & wCLA002 & "' "
	if len(trim(Session("glBusqueda"))) > 0 then
		SQL = SQL & " AND "
		SQL = SQL & " ((B201101CPR LIKE '%" & ucase(Session("glBusqueda")) & "%') OR  "
		SQL = SQL & "  (A201003DEL LIKE '%" & ucase(Session("glBusqueda")) & "%'))  "
	end if	
	SQL = SQL & " ORDER BY B201101FAC DESC " 	
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
		
		
		
		wCL1 = trim(rstQuery.Fields("B201101OPE"))
		wCL2 = trim(rstQuery.Fields("B201101NPE"))
		wDEL = trim(rstQuery.Fields("A201003DEL"))
		
		wC01 = TRIM(rstQuery.Fields("B201101CPR")) 
		wC01_1 = REPLACE(TRIM(rstQuery.Fields("B201101CPR"))," ","@") 
		wC02 = left(trim(rstQuery.Fields("A201003DEL")),35)
		wC03 = trim(rstQuery.Fields("B201101UVE"))
		wC04 = trim(rstQuery.Fields("B201101PUN"))
		wC05 = trim(rstQuery.Fields("A201003MAR"))
		wC06 = left(trim(rstQuery.Fields("A201003REF")),10)		
		wPIM = trim(rstQuery.Fields("B201101PIM"))
		wC08 = trim(rstQuery.Fields("B201101KIL"))
		wC09 = trim(rstQuery.Fields("B201101MNE"))
		
		wPPP = CDbl(wPPP)     
	    wC04 = wC04 - ((wC04 * wPPP) / 100)
	    wC07 = wPIM	    
	    wFIV = 1 + (wPIM / 100)	    
	    IF wFIV > 1 THEN
	        wUIVA = Round(wC04 * wFIV, 2)	        
	       ELSE 
	        wUIVA = wC04
        END IF 
        
        wC09 = (wUIVA * wC03)

				
		IF isnull(wC03) then : wC03 = 0 :   end if	
		IF isnull(wC04) then : wC04 = 0 :   end if	
		
		
		IF isnull(wC07) then : wC07 = 0 :	end if	
		IF isnull(wC08) then : wC08 = 0 :	end if	
		IF isnull(wC09) then : wC09 = 0 :	end if			

		wTC03 = wTC03 + wC03
		wTC08 = wTC08 + wC08
		wTC09 = wTC09 + wC09


		wC04F = round((wC04 /1000),2)
		wC09F = round((wC09 /1000),2)

		wC03 = formatnumber(wC03,0)
		wC04 = formatnumber(wC04,2)
		wC04F = formatnumber(wC04F,2)
		
		wC07 = formatnumber(wC07,2)				
		wC08 = formatnumber(wC08,2)
		wC09 = formatnumber(wC09,2)
		wC09F = formatnumber(wC09F,2)

		
		'wC09 = wC09 & "&nbsp;<img src=""images/delete.gif"">"

		'Armar URL
		'IF wURLACT = "X000A001_S.ASP" THEN
		'	wURL = wURLACT & "?NOMTAB=X002BQ101" 
		'	ELSE
		wURL = wURLACT & "?CLA001=" & wCLA001 & "&CLA002=" & wCLA002 & "&CLA003=" & wC01_1
		'END IF	
		IF wSPP = "0" THEN
			wTIURL = "<A href=" & wURL & " target=""main""> "
			wTFURL = " </A>"
		END IF




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
		wC04F = "&nbsp;"

		wC05 = "&nbsp;"
		wC06 = "&nbsp;"		
		wC07 = "&nbsp;"		
		wC08 = wTC08
		wC09 = wTC09	
		wC09F = round((wTC09/1000),2)
		wC03 = formatnumber(wC03,0)
		wC08 = formatnumber(wC08,2)
		wC09 = formatnumber(wC09,2)
		wC09F = formatnumber(wC09F,2)
		Mostrar_Linea	
		'&nbsp;
	end if
		
%>
<%'Incluir Cuerpo del Reporte %>
<!--#include file="X001A101M_C.ASP"-->
</table>


</body>


</html>