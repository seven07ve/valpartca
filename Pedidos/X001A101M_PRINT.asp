<%@ Language=VBScript %>
<% wSTSIMP = Request.QueryString("STSIMP") %>
<%
	 Datos_Compania wDEL, wURI			
%>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<title>Pedido Movil de <%=wDEL%></title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
</head>
<!--#include file="X001Y007.PRC"-->




	<body ALIGN="CENTER" vlink="#0000FF" onload="window.status='<%=Request.ServerVariables("URL")%>'" topmargin="10" leftmargin="10" rightmargin="0" >

	<p><img border="0" src="<%=wURI%>"></p>

<%  

	wTIT = Request.QueryString("URLTIT")	
	wURLACT = TRIM(Request.QueryString("URLACT"))
	IF ISNULL(wURLACT) OR TRIM(wURLACT) = "" THEN
		wURLACT = "X001A101M_A.ASP"
	END IF 

	wCLA001 = Request.QueryString("CAMC01")
	wCLA002 = Request.QueryString("CAMC02")
	wB300101CCI = Session("glCiaInternet")
	wB300101CIA = Session("glCia")
	
	strCnn	= Application("XDTA201_ConnectionString")
	
	strCnn2	= Application("XDTA300_ConnectionString")

	
	SQL = "SELECT Z300002ERP FROM X300ZF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300002CCI = '" & Session("glCiaInternet") & "' "
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn2
	if NOT rstQuery.EOF then
		wERP = trim(rstQuery.Fields("Z300002ERP"))
	end if
	rstQuery.CLOSE
	SET rstQuery = NOTHING	

	
    SQL = "SELECT B201100CCL, B201100CPE FROM X201BF100 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " B201100CCI = '" &  wB300101CCI & "' AND "	
	SQL = SQL & " B201100OPE = '" &  wCLA001 & "' AND "	
	SQL = SQL & " B201100NPE = '" &  wCLA002 & "' "		    
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		'wSPP = trim(rstQuery.Fields("B200100SPP"))
		wCCL = trim(rstQuery.Fields("B201100CCL"))
		wCPE = trim(rstQuery.Fields("B201100CPE"))
		'wNER = trim(rstQuery.Fields("B201100NER"))
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	
	SQL = "SELECT A201002RSO, A201002PPP FROM X201AF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " A201002CCI = '" &  wB300101CCI & "' AND "	
	SQL = SQL & " A201002CCL = '" &  wCCL & "'"	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn

	IF NOT rstQuery.EOF THEN
		wDCL = trim(rstQuery.Fields("A201002RSO"))
		wPPP = 0 'trim(rstQuery.Fields("A201002PPP"))
		Session("glPPP") = wPPP
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	
	response.write "<p><table border=""0"" width=""100%""  cellspacing=""0"" cellpadding=""0"">" 
		response.write "<tr>" 			
			response.write "<td><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write "<b>Pedido:</b> " & wCLA001 & "-" & wCLA002
			response.write "</td>" 
		response.write "</tr>" 			
		response.write "<tr>" 			
			response.write "<td><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write "<b>Cliente:</b> " & wCCL & " - " & wDCL
			response.write "</td>" 
		response.write "</tr>" 	
		response.write "<tr>" 			
			response.write "<td><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write "<b>Comentario:</b> " & wCPE
			response.write "</td>" 
		response.write "</tr>" 		
	'			response.write "<tr>" 			
	'		response.write "<td><font style=""font-family: Arial; font-size: 8pt"">" 
	'			response.write "<b>Nro. de Pedido " & wERP & ":</b> " & wNER
	'		response.write "</td>" 
	'	response.write "</tr>" 		
	response.write "</table></p>" 

		
	
	SQL = " SELECT B201101CPR, A201003DEL, B201101UVE, B201101PUN, "
	SQL = SQL & " B201101KIL, B201101MNE, B201101OPE, B201101NPE," 
	SQL = SQL & " B201101PPR, B201101BPR, B201101PIM, A201003MAR, " 
	SQL = SQL & " A201003REF " 
	SQL = SQL & " FROM X201BQ101 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " B201101CCI ='" & wB300101CCI & "' AND "
	SQL = SQL & " B201101CIA ='" & wB300101CIA & "' AND "
	SQL = SQL & " B201101OPE ='" & wCLA001 & "' AND "
	SQL = SQL & " B201101NPE ='" & wCLA002 & "' "	
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
	response.write "<p><table border=""1"" width=""100%""  cellspacing=""0"" cellpadding=""0"">" 
	DO WHILE NOT rstQuery.EOF 'and wCuenta < cint(Session("glRegistros"))
		
		
		
		wCL1 = trim(rstQuery.Fields("B201101OPE"))
		wCL2 = trim(rstQuery.Fields("B201101NPE"))
		wDEL = trim(rstQuery.Fields("A201003DEL"))
		
		wC01 = TRIM(rstQuery.Fields("B201101CPR")) 
		wC01_1 = REPLACE(TRIM(rstQuery.Fields("B201101CPR"))," ","@") 
		wC02 = left(trim(rstQuery.Fields("A201003DEL")),40)
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
  	
  	
  	



		
		<p align="center"><input type="button" onclick="javascript:window.print()" value="Imprimir" name="B3"></p>

  	
  	
  	


</body>



</html>


