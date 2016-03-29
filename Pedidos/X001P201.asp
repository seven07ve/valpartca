<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Informe Fuerza de Ventas</title>
</head>
<!--#include file="X001Z001.INC"-->

<body>


<%
	strCnn	= Application("XDTA300_ConnectionString")

	wVEN = Request.Form("VENDEDOR") 
	wMES = TRIM(Request.Form("MES"))
	wANO = TRIM(Request.Form("ANO"))
	
	
	wFDE = "01-" & wMES & "-" & wANO
	wDiaFinal = LastDayOfMonth(wMES, wANO)
	wDiaFinal = Right("00" & wDiaFinal, 2)
	wFHA = wDiaFinal & "-" & wMES & "-" & wANO
	
	Function LastDayOfMonth(iMonth, iYear)
		NextMonth = DateAdd("m", 1, DateSerial(iYear, iMonth, "01"))
		LastDayOfMonth = Day(DateAdd("d", -1, NextMonth))
	End Function

	'response.write wFDE & " - " & wFHA
	
	'BUSCA ERP COMPAÑIA INTERNET
	SQL = "SELECT Z300002ERP FROM X300ZF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300002CCI = '" & Session("glCiaInternet") & "'"
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		wERP = TRIM(rstQuery.Fields("Z300002ERP"))
	END IF
	rstQuery.Close 
	set rstQuery = nothing

	
	
	
	wFECHA = right("0" & Day(Date),2) & "-" & right("0" & Month(Date),2) & "-" & Year(Date)	

%>


<!--<p><img border="0" src="images/Logo2.gif" width="179" height="64"></p>-->
<p align="left" style="margin-top: 0; margin-bottom: 8px"><font face="Arial" size="3"><b>
Fuerza de Ventas
</b></font></p>
<p align="right" style="margin-top: 3px; margin-bottom: 3px"><font face="Arial" size="2"><b>Fecha del Reporte: </b><%= wFECHA %>
</font> 
</p>

<p align="center" style="margin-top: 0; margin-bottom: 4px"><font face="Arial" size="2"><b>Periodo del </b><%=wFDE%><b> al </b> <%=wFHA%></font> </p>




<p style="margin-top: 0; margin-bottom: 0">&nbsp;</p>
<table border="1" width="100%" style="border-width: 1px" cellspacing="0" cellpadding="4">
	
	
	<%' ******************COMIENZO DETALLE************************ %>
	
	<%
	

	
	SQL = " SELECT A300020CVE, A300020NOM "
	SQL = SQL & " FROM X300AF020 "
	SQL = SQL & " WHERE "
	SQL = SQL & " A300020CCI = '" & Session("glCiaInternet") &  "'"
	IF wVEN <> "000" THEN
		SQL = SQL & " AND A300020CVE ='" & wVEN & "'" 		
	END IF 
	IF wPIN = "on" THEN	
		SQL = SQL & " AND A300003CIN > 0 " 	
	END IF 
	SQL = SQL & " ORDER BY A300020CVE " 
	'response.write SQL
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
    wFAM = 0
  	wCuenta = 0
	DO WHILE NOT rstQuery.EOF 
		
		wCVE = TRIM(rstQuery.Fields("A300020CVE"))
		wNOM = TRIM(rstQuery.Fields("A300020NOM"))
		
		IF wCuenta = 0 THEN 
			Imprimir_Encabezado
		END IF 
		
		wOVE = 1
		SQL = "SELECT ISNULL(D300007PRE,0) AS D300007PRE FROM X300DF007 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " D300007CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " D300007CVE = '" & wCVE & "' AND "
		SQL = SQL & " D300007FEI >= '" & wFDE & " 00:00:00' AND "
		SQL = SQL & " D300007FEF <= '" & wFHA & " 23:59:59' "
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
	    rstQuery2.Open sql , strCnn
		IF NOT rstQuery2.EOF THEN
			wOVE = TRIM(rstQuery2.Fields("D300007PRE"))
		END IF
		rstQuery2.Close 
		set rstQuery2 = nothing
		
			
		SQL = "SELECT ISNULL(SUM(P300100MNE),0) AS OPO FROM X300PF100 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " P300100CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300100CVE = '" & wCVE & "' AND "
		SQL = SQL & " P300100FPR >= '" & wFDE & " 00:00:00' AND "
		SQL = SQL & " P300100FPR <= '" & wFHA & " 23:59:59' "
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
	    rstQuery2.Open sql , strCnn
		IF NOT rstQuery2.EOF THEN
			wOPO = TRIM(rstQuery2.Fields("OPO"))
		END IF
		rstQuery2.Close 
		set rstQuery2 = nothing
		
		'POR LOS MOMENTOS SE EXTRAE DE LA TABLA BACKORDERS FALTA DEFINIR SI SE EXTRAE DE LA TABLA ESTADISTICA DE VENTAS
		SQL = "SELECT ISNULL(SUM(B300102PRE),0) AS BCK FROM X300BF102 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " B300102CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " B300102CVE = '" & wCVE & "' "
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
	    rstQuery2.Open sql , strCnn
		IF NOT rstQuery2.EOF THEN
			wBCK = TRIM(rstQuery2.Fields("BCK"))
		END IF
		rstQuery2.Close 
		set rstQuery2 = nothing
		
		'DEFINIR SI SE EXTRAE DE LA TABLA ESTADISTICA DE VENTAS O DE LA TABLA FACTURA
		wVTA = 0 
		
		
		'PDC ES LAS VENTAS MAS LAS OPORTUNIDADES DEL MES
		wPDC = wVTA  + CDBL(wOPO)
		
		wPCU = (wPDC / wOVE) * 100
		
		SQL = "SELECT ISNULL(COUNT(P300100NPE),0) AS NOD, ISNULL(SUM(P300100MNE),0) AS MOD " 
		SQL = SQL & " FROM X300PF100 WHERE "
		SQL = SQL & " P300100CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300100CVE = '" & wCVE & "' AND "
		SQL = SQL & " P300100FPR >= '" & wFDE & " 00:00:00' AND "
		SQL = SQL & " P300100FPR <= '" & wFHA & " 23:59:59' AND "
		SQL = SQL & " P300100STS = '9' "
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
	    rstQuery2.Open sql , strCnn
		IF NOT rstQuery2.EOF THEN
			wNOD = TRIM(rstQuery2.Fields("NOD"))
			wMOD = TRIM(rstQuery2.Fields("MOD"))
		END IF
		rstQuery2.Close 
		set rstQuery2 = nothing
		
		
		'% RECAUDO
		SQL = "SELECT ISNULL(COUNT(P300100NPE),0) AS REC FROM X300PF100 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " P300100CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300100CVE = '" & wCVE & "' AND "
		SQL = SQL & " P300100FPR >= '" & wFDE & " 00:00:00' AND "
		SQL = SQL & " P300100FPR <= '" & wFHA & " 23:59:59' AND "
		SQL = SQL & " P300100NPE IN (SELECT P300103NPE FROM X300PF103) "  
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
	    rstQuery2.Open sql , strCnn
		IF NOT rstQuery2.EOF THEN
			wREC = TRIM(rstQuery2.Fields("REC"))
		END IF
		rstQuery2.Close 
		set rstQuery2 = nothing
		
		'NUMERO DE OPORTUNIDADES DISTINTAS A DESCALIFICADAS
		SQL = "SELECT ISNULL(COUNT(P300100NPE),0) AS NOP FROM X300PF100 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " P300100CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300100CVE = '" & wCVE & "' AND "
		SQL = SQL & " P300100FPR >= '" & wFDE & " 00:00:00' AND "
		SQL = SQL & " P300100FPR <= '" & wFHA & " 23:59:59' AND "
		SQL = SQL & " P300100STS <> '9' "
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
	    rstQuery2.Open sql , strCnn
		IF NOT rstQuery2.EOF THEN
			wNOP = TRIM(rstQuery2.Fields("NOP"))
		END IF
		rstQuery2.Close 
		set rstQuery2 = nothing
		
		wPRE = (wREC / wNOP)*100
		
		''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		
		'TOTAL OPORTUNIDADES DEL MES
		SQL = "SELECT ISNULL(COUNT(P300100NPE),0) AS OPT FROM X300PF100 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " P300100CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300100CVE = '" & wCVE & "' AND "
		SQL = SQL & " P300100FPR >= '" & wFDE & " 00:00:00' AND "
		SQL = SQL & " P300100FPR <= '" & wFHA & " 23:59:59' "
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
	    rstQuery2.Open sql , strCnn
		IF NOT rstQuery2.EOF THEN
			wTOP = TRIM(rstQuery2.Fields("OPT"))
		END IF
		rstQuery2.Close 
		set rstQuery2 = nothing
		
		'OPORTUNIDADES CERRADAS
		SQL = "SELECT ISNULL(COUNT(P300100NPE),0) AS OPC FROM X300PF100 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " P300100CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300100CVE = '" & wCVE & "' AND "
		SQL = SQL & " P300100FPR >= '" & wFDE & " 00:00:00' AND "
		SQL = SQL & " P300100FPR <= '" & wFHA & " 23:59:59' AND "
		SQL = SQL & " P300100STS = '2' "
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
	    rstQuery2.Open sql , strCnn
		IF NOT rstQuery2.EOF THEN
			wOPC = TRIM(rstQuery2.Fields("OPC"))
		END IF
		rstQuery2.Close 
		set rstQuery2 = nothing
		
		'CONVERSION
		'response.write wOPC & "<br>"
		'response.write wtop & "<br>"
		wCON = (wOPC / wTOP) * 100
		
		'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''


		

		
		
			
			Response.write "<tr>"
				Response.write "<td width=""20%"" >"
					Response.write "<font style=""font-family: arial; font-size: 10pt;"">" & wNOM & "</font>"
				Response.write "</td>"
				Response.write "<td width=""6%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wOVE,0) & "</b></font>"
				Response.write "</td>"
				Response.write "<td width=""6%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wPDC,0) & "</font>"
				Response.write "</td>"
				Response.write "<td width=""6%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wPCU,0) & "</font>"
				Response.write "</td>"
				Response.write "<td width=""6%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wOPO,0) & "</font>"
				Response.write "</td>"
				Response.write "<td width=""8%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wBCK,0) & "</font>"
				Response.write "</td>"
				Response.write "<td width=""8%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wVTA,0) & "</font>"
				Response.write "</td>"
				Response.write "<td width=""8%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wCON,0) & "</font>"
				Response.write "</td>"
				Response.write "<td width=""8%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wNOD,0) & "</font>"
				Response.write "</td>"
				Response.write "<td width=""8%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wMOD,0) & "</font>"
				Response.write "</td>"
				Response.write "<td width=""8%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""><b># Entregas Pendientes</b></font>"
				Response.write "</td>"
				Response.write "<td width=""8%""  >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wPRE,0) & "</font>"
				Response.write "</td>"
			Response.write "</tr>"

	
		wCuenta = wCuenta + 1
		rstQuery.MoveNext 
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
		
	%>
	
	<%' ************************FIN DETALLE************************ %>
	
	
	
</table>

<p align="center" style="margin-top: 10px">

<% 'END IF %>


<% Sub Imprimir_Encabezado()
		
	Response.write "<tr>"
				Response.write "<td width=""20%"" bgcolor=""silver"" >"
					Response.write "<font style=""font-family: arial; font-size: 10pt;""><b>Asesor</b></font>"
				Response.write "</td>"
				Response.write "<td width=""6%"" bgcolor=""silver"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""><b>Presupuesto</b></font>"
				Response.write "</td>"
				Response.write "<td width=""6%"" bgcolor=""silver"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""><b>PDC</b></font>"
				Response.write "</td>"
				Response.write "<td width=""6%"" bgcolor=""silver"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""><b>% Cumpl.</b></font>"
				Response.write "</td>"
				Response.write "<td width=""6%"" bgcolor=""silver"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""><b>Monto Oportunidades</b></font>"
				Response.write "</td>"
				Response.write "<td width=""8%"" bgcolor=""silver"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""><b>Monto Backorders</b></font>"
				Response.write "</td>"
				Response.write "<td width=""8%"" bgcolor=""silver"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""><b>Monto Ventas</b></font>"
				Response.write "</td>"
				Response.write "<td width=""8%""  bgcolor=""silver"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""><b>% Conversión</b></font>"
				Response.write "</td>"
				Response.write "<td width=""8%"" bgcolor=""silver"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""><b># OP Descalificadas</b></font>"
				Response.write "</td>"
				Response.write "<td width=""8%"" bgcolor=""silver"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""><b>Monto OP Descalificadas</b></font>"
				Response.write "</td>"
				Response.write "<td width=""8%"" bgcolor=""silver"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""><b># Entregas Pendientes</b></font>"
				Response.write "</td>"
				Response.write "<td width=""8%"" bgcolor=""silver"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""><b>% Recaudo</b></font>"
				Response.write "</td>"
		Response.write "</tr>"
			
	End Sub 

%>
<input type="button" name="Imprimir" Value="Imprimir" onclick="window.print()"> 


</p>


</body>

</html>