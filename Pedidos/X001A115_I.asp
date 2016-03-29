<%@ Language=VBScript %>
<% wSTSIMP = Request.QueryString("STSIMP") %>
<%
	 Datos_Compania wDEL, wURI			
%>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<title>PQR de <%=wDEL%></title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
</head>
<!--#include file="X001Y007.PRC"-->




	<body ALIGN="CENTER" vlink="#0000FF" onload="window.status='<%=Request.ServerVariables("URL")%>';window.print()" topmargin="10" leftmargin="10" rightmargin="0" >

	<p><img border="0" src="<%=wURI%>" ></p>

<%  

	wTIT = Request.QueryString("URLTIT")	
	wURLACT = TRIM(Request.QueryString("URLACT"))
	
	wCLA001 = Request.QueryString("CAMC01")
	wCLA002 = Request.QueryString("CAMC02")
	wCCI = Session("glCiaInternet")
	wCIA = Session("glCia")
	
	strCnn	= Application("XDTA300_ConnectionString")
	
    SQL = " SELECT E300001COD, E300001CTR, E300001CCL, E300001PUS, " 
	SQL = SQL & " E300001STS,  E300001FPR, A300050DEL, A300002RSO, "
	SQL = SQL & " E300001CRE, E300001OBS FROM X300EQ001 " 	
	SQL = SQL & " WHERE E300001COD = '" &  wCLA002 & "' AND "	
	SQL = SQL & " E300001CCI = '" & wCCI & "' "	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		wDCL = trim(rstQuery.Fields("A300002RSO"))
		wCCL = trim(rstQuery.Fields("E300001CCL"))
		wFPR = trim(rstQuery.Fields("E300001FPR"))
		wPUS = trim(rstQuery.Fields("E300001PUS"))
		wCTR = trim(rstQuery.Fields("A300050DEL"))
		wOBS = trim(rstQuery.Fields("E300001OBS"))
		wCRE = trim(rstQuery.Fields("E300001CRE"))
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	
	wFPR = right("0" & day(wFPR),2) & "-" & right("0" & month(wFPR),2) & "-" & right(year(wFPR),2)
	
	response.write "<p><table border=""0"" width=""95%""  cellspacing=""0"" cellpadding=""0"" align=""center"">" 
		response.write "<tr>" 			
			response.write "<td><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write "<b>PQR:</b> " & wCLA002				
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
				response.write "<b>Observación:</b> " & wOBS
			response.write "</td>" 
		response.write "</tr>" 			
		response.write "<tr>" 			
			response.write "<td><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write "<b>Generado por:</b> " & wPUS
			response.write "</td>" 
		response.write "</tr>" 			
		response.write "<tr>" 			
			response.write "<td><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write "<b>Tipo:</b> " & wCTR
			response.write "</td>" 
		response.write "</tr>" 			
		'response.write "<tr>" 			
		'	response.write "<td><font style=""font-family: Arial; font-size: 8pt"">" 
		'		response.write "<b>Comentario:</b> " & wCRE
		'	response.write "</td>" 
		'response.write "</tr>" 			
	response.write "</table></p>" 

	
		
	
	SQL = " SELECT E300002COD, E300002CPR, E300002DEL, E300002CAN, E300002TRE, "
	SQL = SQL & " E300002OBS, E300002LOT, E300002NFA,  E300002CGR, E300002COG  "
	SQL = SQL & " FROM X300EF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " E300002CCI ='" & wCCI & "' AND "
	SQL = SQL & " E300002CIA ='" & wCIA & "' AND "
	SQL = SQL & " E300002COD ='" & wCLA002 & "' "
	SQL = SQL & " ORDER BY E300002NFA " 	
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
	wPUS = ""
	response.write "<p><table border=""1"" width=""95%""  cellspacing=""0"" cellpadding=""0"" align=""center"">" 
	DO WHILE NOT rstQuery.EOF 'and wCuenta < cint(Session("glRegistros"))
		
		
		wCGR = TRIM(rstQuery.Fields("E300002CGR")) 
		wCOG = TRIM(rstQuery.Fields("E300002COG")) 
		wTUS = TRIM(rstQuery.Fields("E300002DEL")) 
		wLOT = TRIM(rstQuery.Fields("E300002LOT")) 
		wCPR = TRIM(rstQuery.Fields("E300002CPR")) 

		wC02 = trim(rstQuery.Fields("E300002DEL"))
		wCAN = trim(rstQuery.Fields("E300002CAN"))
		wC04 = trim(rstQuery.Fields("E300002TRE"))
		wNFA = trim(rstQuery.Fields("E300002NFA"))
		wOBS = trim(rstQuery.Fields("E300002OBS"))
		IF isnull(wC03) then : wC03 = 0 :   end if	
	
		wTC03 = wTC03 + wC03

		wC03 = formatnumber(wC03,0)
		
		If wCuenta = 0 Then
		
		response.write "<tr>" 
			
			response.write "<td width=""10%"" align=""center""><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write "<b>Item</b>"
			response.write "</td>" 
			response.write "<td width=""15%""><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write "<b>Grupo</b>"
			response.write "</td>" 
			response.write "<td align=""left"" width=""18%""><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write "<b>Codigo</b>"
			response.write "</td>" 			
			response.write "<td align=""left"" width=""30%""><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write "<b>Producto</b>"
			response.write "</td>" 		
			response.write "<td width=""30%"" align=""LEFT""><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write "<b>Observación</b>"
			response.write "</td>" 		
			
						
		response.write "</tr>" 

		End If 
		
		response.write "<tr>" 
			
			response.write "<td align=""center""><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write wNFA
			response.write "</td>" 
			response.write "<td><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write wCGR
		    response.write "</td>" 
			response.write "<td align=""center""><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write wCOG
			response.write "</td>" 			
			response.write "<td align=""left""><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write wCPR
				%><br>
			<table border="0" width="100%" cellpadding="0" cellspacing="0"   >
			<tr>
			<td width="33%"><font style="font-family: Arial; font-size: 8pt"><b>Cantidad:</b> <%= wCAN %></font> </td> 
			<td width="33%"><font style="font-family: Arial; font-size: 8pt"><b>Tiempo de Uso:</b> <%= wTUS %></font> </td> 			
			<td width="33%"><font style="font-family: Arial; font-size: 8pt"><b>Lote:</b> <%= wLOT %></font> </td>
			</tr> 
			</table>
			<%
			
			response.write "</td>" 			
			response.write "<td align=""LEFT""><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write wOBS
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
		
		'&nbsp;
	end if
	
		response.write "<tr>" 
			
			response.write "<td align=""center""><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write wCuenta
			response.write "</td>" 
			response.write "<td align=""right""><font style=""font-family: Arial; font-size: 10pt"">" 
				response.write "&nbsp;"
			response.write "</td>" 
			response.write "<td align=""center""><font style=""font-family: Arial; font-size: 10pt"">" 
				response.write "&nbsp;"
			response.write "</td>" 			
			response.write "<td align=""center""><font style=""font-family: Arial; font-size: 10pt"">" 
				response.write "&nbsp;"
			response.write "</td>" 			
			response.write "<td align=""right""><font style=""font-family: Arial; font-size: 8pt"">" 
				response.write "&nbsp;"
			response.write "</td>" 			
			'response.write "<td align=""center""><font style=""font-family: Arial; font-size: 8pt"">" 
			'	response.write "&nbsp;"
			'response.write "</td>" 
			'response.write "<td><font style=""font-family: Arial; font-size: 8pt"">" 
			'	response.write "&nbsp;"
			'response.write "</td>" 						
			
			
		response.write "</tr>" 
	
	response.write "</p></table>" 	
		
%>
  	
  	
  	



	<!--	
		<p align="center"><input type="button" onclick="javascript:window.print()" value="Imprimir" name="B3"></p>

  	-->
  	
  	


</body>



</html>


