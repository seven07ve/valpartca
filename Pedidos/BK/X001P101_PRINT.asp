<%@ Language=VBScript %>
<% wSTSIMP = Request.QueryString("STSIMP") %>

<!--#include file="X001Z001.INC"-->


<%
	 Datos_Compania wDEL, wURI			
%>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<title>Pedido Web de <%=wDEL%></title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
</head>

 <!--#include file="X001Y007.PRC"-->


	<body ALIGN="CENTER" vlink="#0000FF" onload="window.status='<%=Request.ServerVariables("URL")%>';window.print()" topmargin="10" leftmargin="10" rightmargin="0" >

	<p><img border="0" src="<%=wURI%>"></p>

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
	
	strCnn	= Application("XDTA300_ConnectionString")
	
	
	SQL = "SELECT Z300002ERP FROM X300ZF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300002CCI = '" & Session("glCiaInternet") & "' "
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	if NOT rstQuery.EOF then
		wERP = trim(rstQuery.Fields("Z300002ERP"))
	end if
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	

	
    SQL = "SELECT B300100CCL, B300100SPP, B300100CPE, B300100FPR, B300100NER "
	SQL = SQL & " FROM X300BF100 WHERE "
	SQL = SQL & " B300100CCI = '" &  wB300101CCI & "' AND "	
	SQL = SQL & " B300100OPE = '" &  wCLA001 & "' AND "	
	SQL = SQL & " B300100NPE = '" &  wCLA002 & "' "	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		wSPP = trim(rstQuery.Fields("B300100SPP"))
		wCCL = trim(rstQuery.Fields("B300100CCL"))
		wCPE = trim(rstQuery.Fields("B300100CPE"))
		wFPR = trim(rstQuery.Fields("B300100FPR"))
		wNER = trim(rstQuery.Fields("B300100NER"))
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	
	SQL = "SELECT A300002RSO FROM X300AF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " A300002CCI = '" &  wB300101CCI & "' AND "	
	SQL = SQL & " A300002CCL = '" &  wCCL & "'"	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		wDCL = trim(rstQuery.Fields("A300002RSO"))
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	
	response.write "<p><table border=""0"" width=""100%""  cellspacing=""0"" cellpadding=""0"">" 
		response.write "<tr>" 			
			response.write "<td><font style=""font-family: Arial; font-size: 8pt"">" 
				IF wSPP = "0" THEN
					response.write "<b>Pedido:</b> " & wCLA002
				 ELSE
					response.write "<b>Pedido:</b> " & wCLA002
				END IF
			response.write "</td>" 
		response.write "</tr>" 			
		response.write "<tr>" 			
			response.write "<td><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write "<b>Cliente:</b> " & wCCL & " - " & wDCL
			response.write "</td>" 
		response.write "</tr>" 		
		response.write "<tr>" 			
			response.write "<td><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write "<b>Fecha:</b> " & wFPR
			response.write "</td>" 
		response.write "</tr>" 		
				response.write "<tr>" 			
			response.write "<td><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write "<b>Comentario:</b> " & wCPE
			response.write "</td>" 
		response.write "</tr>" 		
				response.write "<tr>" 			
			response.write "<td><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write "<b>Nro. de Pedido " & wERP & ":</b> " & wNER
			response.write "</td>" 
		response.write "</tr>" 			
	response.write "</table></p>" 

	
	'BUSCA PORCENTAJE DE PRONTO PAGO
	'SQL = "SELECT A300002PPP FROM X300AQ004 " 
	'SQL = SQL & " WHERE "
	'SQL = SQL & " A300002CCI = '" &  wB300101CCI & "' AND "	
	'SQL = SQL & " B300100OPE = '" &  wCLA001 & "' AND "	
	'SQL = SQL & " B300100NPE = '" &  wCLA002 & "' "	
	'Set rstQuery = Server.CreateObject("ADODB.Recordset")
    'rstQuery.Open sql , strCnn
	'IF NOT rstQuery.EOF THEN
		wPPP = 0 'trim(rstQuery.Fields("A300002PPP"))
	'	Session("glPPP") = wPPP
	'END IF
	'rstQuery.Close 
	'set rstQuery = nothing
	
	
	SQL = " SELECT B300101CPR, A300003DEL, B300101UVE, B300101PUN, "
	SQL = SQL & " B300101KIL, B300101MNE, B300101OPE, B300101NPE," 
	SQL = SQL & " B300101PPR, B300101BPR, B300101PIM, A300003MAR, " 
	IF wERP = "SAP" THEN
		SQL = SQL & " A300003REF "
	ELSE
		SQL = SQL & " (SELECT A300015HOM FROM X300AF015 WHERE "
		SQL = SQL & " A300015CCL = '" & wCCL & "' AND "
		SQL = SQL & " A300015CPR = B300101CPR AND "
		SQL = SQL & " A300015CCI = B300101CCI) AS A300003REF "
	END IF 
	SQL = SQL & " FROM X300BQ101 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " B300101CCI ='" & wB300101CCI & "' AND "
	SQL = SQL & " B300101CIA ='" & wB300101CIA & "' AND "
	SQL = SQL & " B300101OPE ='" & wCLA001 & "' AND "
	SQL = SQL & " B300101NPE ='" & wCLA002 & "' "	
	SQL = SQL & " ORDER BY B300101FAC DESC " 	
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
	response.write "<p><table border=""1"" width=""100%""  cellspacing=""0"" cellpadding=""0"">" 
	DO WHILE NOT rstQuery.EOF 'and wCuenta < cint(Session("glRegistros"))
		
		
		
		wCL1 = trim(rstQuery.Fields("B300101OPE"))
		wCL2 = trim(rstQuery.Fields("B300101NPE"))
		wDEL = trim(rstQuery.Fields("A300003DEL"))
		
		wC01 = TRIM(rstQuery.Fields("B300101CPR")) 
		wC01_1 = REPLACE(TRIM(rstQuery.Fields("B300101CPR"))," ","@") 
		wC02 = left(trim(rstQuery.Fields("A300003DEL")),40)
		wC03 = trim(rstQuery.Fields("B300101UVE"))
		wC04 = trim(rstQuery.Fields("B300101PUN"))
		wC05 = trim(rstQuery.Fields("A300003MAR"))
		IF LEN(TRIM(wC05)) = 0 OR ISNULL(wC05) THEN
			wC05 = "&nbsp;"
		END IF 
		wC06 = left(trim(rstQuery.Fields("A300003REF")),10)		
		wPIM = trim(rstQuery.Fields("B300101PIM"))
		wC08 = trim(rstQuery.Fields("B300101KIL"))
		wC09 = trim(rstQuery.Fields("B300101MNE"))
		wPPR = CDBL(rstQuery.Fields("B300101PPR"))
		
		wPPP = CDbl(wPPP)     
	    wC04 = wC04 - ((wC04 * wPPP) / 100)
	    'APLICA DESCUENTO POR FAMILIA
	    wC04 = wC04 - ((wC04 * wPPR) / 100)
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

		wC03 = formatnumber(wC03,2)
		wC04 = formatnumber(wC04,2)
		
		
		wC07 = formatnumber(wC07,2)				
		wC08 = formatnumber(wC08,2)
		wC09 = formatnumber(wC09,2)
		
		If wCuenta = 0 Then
		
		response.write "<tr>" 
			
			response.write "<td><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write "<b>Item</b>"
			response.write "</td>" 
			response.write "<td><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write "<b>Descripción</b>"
			response.write "</td>" 
			response.write "<td align=""center""><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write "<b>Cant</b>"
			response.write "</td>" 			
			response.write "<td align=""right""><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write "<b>Precio</b>"
			response.write "</td>" 			
			response.write "<td align=""center""><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write "<b>Marca</b>"
			response.write "</td>" 
			response.write "<td><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write "<b>Homologo</b>"
			response.write "</td>" 						
			response.write "<td align=""right""><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write "<b>Neto+Imp</b>"
			response.write "</td>" 
			
			
		response.write "</tr>" 

		End If 
		
		response.write "<tr>" 
			
			response.write "<td><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write wC01
			response.write "</td>" 
			response.write "<td><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write wC02
			response.write "</td>" 
			response.write "<td align=""center""><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write wC03
			response.write "</td>" 			
			response.write "<td align=""right""><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write wC04
			response.write "</td>" 			
			response.write "<td align=""center""><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write wC05
			response.write "</td>" 
			response.write "<td><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write wC06
			response.write "</td>" 						
			response.write "<td align=""right""><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write wC09
			response.write "</td>" 
			
			
		response.write "</tr>" 
		
		

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
		wC08 = wTC08
		wC09 = wTC09	
		wC03 = formatnumber(wC03,2)
		wC08 = formatnumber(wC08,2)
		wC09 = formatnumber(wC09,2)

		'&nbsp;
	end if
	
		response.write "<tr>" 
			
			response.write "<td><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write "&nbsp;"
			response.write "</td>" 
			response.write "<td align=""right""><font style=""font-family: Arial; font-size: 10pt"">" 
				response.write "<b>Totales:</b>"
			response.write "</td>" 
			response.write "<td align=""center""><font style=""font-family: Arial; font-size: 10pt"">" 
				response.write wC03
			response.write "</td>" 			
			response.write "<td align=""right""><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write "&nbsp;"
			response.write "</td>" 			
			response.write "<td align=""center""><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write "&nbsp;"
			response.write "</td>" 
			response.write "<td><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write "&nbsp;"
			response.write "</td>" 						
			response.write "<td align=""right""><font style=""font-family: Arial; font-size: 10pt"">" 
				response.write wC09
			response.write "</td>" 
			
			
		response.write "</tr>" 
	
	response.write "</p></table>" 	
		
%>
  	
  	
  	



	<!--	
		<p align="center"><input type="button" onclick="javascript:window.print()" value="Imprimir" name="B3"></p>

  	-->
  	
  	


</body>



</html>


