<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Oportunidades Descalificadas</title>
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
Oportunidades Descalificadas
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
		
		SQL = "SELECT D300007PRE FROM X300DF007 " 
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
		
		
		'PRECIO	
		SQL = "SELECT ISNULL(COUNT(P300100NPE),0) AS NPE, ISNULL(SUM(P300100MNE),0) AS MNE FROM X300PF100, X300PF102 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " P300100CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300100CVE = '" & wCVE & "' AND "
		SQL = SQL & " P300100FPR >= '" & wFDE & " 00:00:00' AND "
		SQL = SQL & " P300100FPR <= '" & wFHA & " 23:59:59' AND "
		SQL = SQL & " P300100CCI = P300102CCI AND "
		SQL = SQL & " P300100NPE = P300102NPE AND "
		SQL = SQL & " P300100STS = '9' AND "
		SQL = SQL & " P300102DEO = '1' "
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
	    rstQuery2.Open sql , strCnn
		IF NOT rstQuery2.EOF THEN
			wDPP = TRIM(rstQuery2.Fields("NPE"))
			wMPP = TRIM(rstQuery2.Fields("MNE"))
		END IF
		rstQuery2.Close 
		set rstQuery2 = nothing
		
		'PRODUCTO	
		SQL = "SELECT ISNULL(COUNT(P300100NPE),0) AS NPE, ISNULL(SUM(P300100MNE),0) AS MNE  FROM X300PF100, X300PF102 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " P300100CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300100CVE = '" & wCVE & "' AND "
		SQL = SQL & " P300100FPR >= '" & wFDE & " 00:00:00' AND "
		SQL = SQL & " P300100FPR <= '" & wFHA & " 23:59:59' AND "
		SQL = SQL & " P300100CCI = P300102CCI AND "
		SQL = SQL & " P300100NPE = P300102NPE AND "
		SQL = SQL & " P300100STS = '9' AND "
		SQL = SQL & " P300102DEO = '2' "
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
	    rstQuery2.Open sql , strCnn
		IF NOT rstQuery2.EOF THEN
			wDPR = TRIM(rstQuery2.Fields("NPE"))
			wMPR = TRIM(rstQuery2.Fields("MNE"))
		END IF
		rstQuery2.Close 
		set rstQuery2 = nothing
		
		'GARANTIA	
		SQL = "SELECT ISNULL(COUNT(P300100NPE),0) AS NPE, ISNULL(SUM(P300100MNE),0) AS MNE  FROM X300PF100, X300PF102 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " P300100CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300100CVE = '" & wCVE & "' AND "
		SQL = SQL & " P300100FPR >= '" & wFDE & " 00:00:00' AND "
		SQL = SQL & " P300100FPR <= '" & wFHA & " 23:59:59' AND "
		SQL = SQL & " P300100CCI = P300102CCI AND "
		SQL = SQL & " P300100NPE = P300102NPE AND "
		SQL = SQL & " P300100STS = '9' AND "
		SQL = SQL & " P300102DEO = '3' "
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
	    rstQuery2.Open sql , strCnn
		IF NOT rstQuery2.EOF THEN
			wDGA = TRIM(rstQuery2.Fields("NPE"))
			wMGA = TRIM(rstQuery2.Fields("MNE"))
		END IF
		rstQuery2.Close 
		set rstQuery2 = nothing
		
		
		'MANTENIMIENTO	
		SQL = "SELECT ISNULL(COUNT(P300100NPE),0) AS NPE, ISNULL(SUM(P300100MNE),0) AS MNE  FROM X300PF100, X300PF102 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " P300100CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300100CVE = '" & wCVE & "' AND "
		SQL = SQL & " P300100FPR >= '" & wFDE & " 00:00:00' AND "
		SQL = SQL & " P300100FPR <= '" & wFHA & " 23:59:59' AND "
		SQL = SQL & " P300100CCI = P300102CCI AND "
		SQL = SQL & " P300100NPE = P300102NPE AND "
		SQL = SQL & " P300100STS = '9' AND "
		SQL = SQL & " P300102DEO = '4' "
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
	    rstQuery2.Open sql , strCnn
		IF NOT rstQuery2.EOF THEN
			wDMA = TRIM(rstQuery2.Fields("NPE"))
			wMMA = TRIM(rstQuery2.Fields("MNE"))
		END IF
		rstQuery2.Close 
		set rstQuery2 = nothing
		
		'SERVICIO	
		SQL = "SELECT ISNULL(COUNT(P300100NPE),0) AS NPE, ISNULL(SUM(P300100MNE),0) AS MNE  FROM X300PF100, X300PF102 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " P300100CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300100CVE = '" & wCVE & "' AND "
		SQL = SQL & " P300100FPR >= '" & wFDE & " 00:00:00' AND "
		SQL = SQL & " P300100FPR <= '" & wFHA & " 23:59:59' AND "
		SQL = SQL & " P300100CCI = P300102CCI AND "
		SQL = SQL & " P300100NPE = P300102NPE AND "
		SQL = SQL & " P300100STS = '9' AND "
		SQL = SQL & " P300102DEO = '5' "
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
	    rstQuery2.Open sql , strCnn
		IF NOT rstQuery2.EOF THEN
			wDSE = TRIM(rstQuery2.Fields("NPE"))
			wMSE = TRIM(rstQuery2.Fields("MNE"))
		END IF
		rstQuery2.Close 
		set rstQuery2 = nothing
		
		'FALTA DE SEGUIMIENTO	
		SQL = "SELECT ISNULL(COUNT(P300100NPE),0) AS NPE, ISNULL(SUM(P300100MNE),0) AS MNE  FROM X300PF100, X300PF102 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " P300100CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300100CVE = '" & wCVE & "' AND "
		SQL = SQL & " P300100FPR >= '" & wFDE & " 00:00:00' AND "
		SQL = SQL & " P300100FPR <= '" & wFHA & " 23:59:59' AND "
		SQL = SQL & " P300100CCI = P300102CCI AND "
		SQL = SQL & " P300100NPE = P300102NPE AND "
		SQL = SQL & " P300100STS = '9' AND "
		SQL = SQL & " P300102DEO = '6' "
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
	    rstQuery2.Open sql , strCnn
		IF NOT rstQuery2.EOF THEN
			wDFS = TRIM(rstQuery2.Fields("NPE"))
			wMFS = TRIM(rstQuery2.Fields("MNE"))
		END IF
		rstQuery2.Close 
		set rstQuery2 = nothing
		
		'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''


			
		
			
			Response.write "<tr>"
				Response.write "<td width=""25%"" rowspan=""2"">"
					Response.write "<font style=""font-family: arial; font-size: 10pt;"">" & wNOM & "</font>"
				Response.write "</td>"
				Response.write "<td width=""15%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""><b>Cantidad</b></font>"
				Response.write "</td>"
				Response.write "<td width=""10%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wDPP,0) & "</font>"
				Response.write "</td>"
				Response.write "<td width=""10%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wDPR,0) & "</font>"
				Response.write "</td>"
				Response.write "<td width=""10%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wDGA,0) & "</font>"
				Response.write "</td>"
				Response.write "<td width=""9%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wDMA,0) & "</font>"
				Response.write "</td>"
				Response.write "<td width=""9%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wDSE,0) & "</font>"
				Response.write "</td>"
				Response.write "<td width=""12%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wDFS,0) & "</font>"
				Response.write "</td>"
			Response.write "</tr>"
			
			Response.write "<tr>"
				'Response.write "<td width=""25%"" >"
				'	Response.write "<font style=""font-family: arial; font-size: 10pt;"">" & wNOM & "</font>"
				'Response.write "</td>"
				Response.write "<td width=""15%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""><b>Valor</b></font>"
				Response.write "</td>"
				Response.write "<td width=""10%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wMPP,0) & "</font>"
				Response.write "</td>"
				Response.write "<td width=""10%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wMPR,0) & "</font>"
				Response.write "</td>"
				Response.write "<td width=""10%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wMGA,0) & "</font>"
				Response.write "</td>"
				Response.write "<td width=""9%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wMMA,0) & "</font>"
				Response.write "</td>"
				Response.write "<td width=""9%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wMSE,0) & "</font>"
				Response.write "</td>"
				Response.write "<td width=""12%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wMFS,0) & "</font>"
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
				Response.write "<td width=""25%"" bgcolor=""silver"" >"
					Response.write "<font style=""font-family: arial; font-size: 10pt;""><b>Asesor</b></font>"
				Response.write "</td>"
				Response.write "<td width=""15%"" bgcolor=""silver"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""><b>Cierre de las Oportunidades</b></font>"
				Response.write "</td>"
				Response.write "<td width=""10%"" bgcolor=""silver"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""><b>Precio</b></font>"
				Response.write "</td>"
				Response.write "<td width=""10%"" bgcolor=""silver"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""><b>Producto</b></font>"
				Response.write "</td>"
				Response.write "<td width=""10%"" bgcolor=""silver"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""><b>Garantia</b></font>"
				Response.write "</td>"
				Response.write "<td width=""9%"" bgcolor=""silver"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""><b>Mantenimiento</b></font>"
				Response.write "</td>"
				Response.write "<td width=""9%"" bgcolor=""silver"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""><b>Servicio</b></font>"
				Response.write "</td>"
				Response.write "<td width=""12%""  bgcolor=""silver"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""><b>Falta de Seguimiento</b></font>"
				Response.write "</td>"
				
		Response.write "</tr>"
			
	End Sub 

%>
<input type="button" name="Imprimir" Value="Imprimir" onclick="window.print()"> 


</p>


</body>

</html>