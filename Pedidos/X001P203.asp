<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Razones de Insatisfacción</title>
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
Razones de Insatisfacción
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
		
		
		'CONDICIONES DE PRECIO	
		SQL = "SELECT ISNULL(COUNT(P300100NPE),0) AS NPE FROM X300PF100 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " P300100CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300100CVE = '" & wCVE & "' AND "
		SQL = SQL & " P300100FPR >= '" & wFDE & " 00:00:00' AND "
		SQL = SQL & " P300100FPR <= '" & wFHA & " 23:59:59' AND "
		SQL = SQL & " P300100STS = '2' AND "
		SQL = SQL & " P300100INS = 'N' AND "
		SQL = SQL & " P300100RIN = '1' "
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
	    rstQuery2.Open sql , strCnn
		IF NOT rstQuery2.EOF THEN
			wDPP = TRIM(rstQuery2.Fields("NPE"))
		END IF
		rstQuery2.Close 
		set rstQuery2 = nothing
		
		'FALTA DE SEGUIMIENTO	
		SQL = "SELECT ISNULL(COUNT(P300100NPE),0) AS NPE FROM X300PF100 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " P300100CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300100CVE = '" & wCVE & "' AND "
		SQL = SQL & " P300100FPR >= '" & wFDE & " 00:00:00' AND "
		SQL = SQL & " P300100FPR <= '" & wFHA & " 23:59:59' AND "
		SQL = SQL & " P300100STS = '2' AND "
		SQL = SQL & " P300100INS = 'N' AND "
		SQL = SQL & " P300100RIN = '2' "
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
	    rstQuery2.Open sql , strCnn
		IF NOT rstQuery2.EOF THEN
			wDPR = TRIM(rstQuery2.Fields("NPE"))
		END IF
		rstQuery2.Close 
		set rstQuery2 = nothing
		
		'CONDICIONES DEL PRODUCTO	
		SQL = "SELECT ISNULL(COUNT(P300100NPE),0) AS NPE FROM X300PF100 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " P300100CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300100CVE = '" & wCVE & "' AND "
		SQL = SQL & " P300100FPR >= '" & wFDE & " 00:00:00' AND "
		SQL = SQL & " P300100FPR <= '" & wFHA & " 23:59:59' AND "
		SQL = SQL & " P300100STS = '2' AND "
		SQL = SQL & " P300100INS = 'N' AND "
		SQL = SQL & " P300100RIN = '3' "
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
	    rstQuery2.Open sql , strCnn
		IF NOT rstQuery2.EOF THEN
			wDGA = TRIM(rstQuery2.Fields("NPE"))
		END IF
		rstQuery2.Close 
		set rstQuery2 = nothing
		
		
		'CONDICIONES COMERCIALES	
		SQL = "SELECT ISNULL(COUNT(P300100NPE),0) AS NPE FROM X300PF100 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " P300100CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300100CVE = '" & wCVE & "' AND "
		SQL = SQL & " P300100FPR >= '" & wFDE & " 00:00:00' AND "
		SQL = SQL & " P300100FPR <= '" & wFHA & " 23:59:59' AND "
		SQL = SQL & " P300100STS = '2' AND "
		SQL = SQL & " P300100INS = 'N' AND "
		SQL = SQL & " P300100RIN = '4' "
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
	    rstQuery2.Open sql , strCnn
		IF NOT rstQuery2.EOF THEN
			wDMA = TRIM(rstQuery2.Fields("NPE"))
		END IF
		rstQuery2.Close 
		set rstQuery2 = nothing
		
		'INCUMPLIMIENTO EN LA ENTREGA	
		SQL = "SELECT ISNULL(COUNT(P300100NPE),0) AS NPE FROM X300PF100 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " P300100CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300100CVE = '" & wCVE & "' AND "
		SQL = SQL & " P300100FPR >= '" & wFDE & " 00:00:00' AND "
		SQL = SQL & " P300100FPR <= '" & wFHA & " 23:59:59' AND "
		SQL = SQL & " P300100STS = '2' AND "
		SQL = SQL & " P300100INS = 'N' AND "
		SQL = SQL & " P300100RIN = '5' "
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
	    rstQuery2.Open sql , strCnn
		IF NOT rstQuery2.EOF THEN
			wDSE = TRIM(rstQuery2.Fields("NPE"))
		END IF
		rstQuery2.Close 
		set rstQuery2 = nothing
		
		'TOTAL SI	
		SQL = "SELECT ISNULL(COUNT(P300100NPE),0) AS NPE FROM X300PF100 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " P300100CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300100CVE = '" & wCVE & "' AND "
		SQL = SQL & " P300100FPR >= '" & wFDE & " 00:00:00' AND "
		SQL = SQL & " P300100FPR <= '" & wFHA & " 23:59:59' AND "
		SQL = SQL & " P300100STS = '2' AND "
		SQL = SQL & " P300100INS = 'S' "
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
	    rstQuery2.Open sql , strCnn
		IF NOT rstQuery2.EOF THEN
			wINS = TRIM(rstQuery2.Fields("NPE"))
		END IF
		rstQuery2.Close 
		set rstQuery2 = nothing
		
		'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''


			
		
		Response.write "<tr>"
				Response.write "<td width=""25%"" rowspan=""2"">"
					Response.write "<font style=""font-family: arial; font-size: 10pt;"">" & wNOM & "</font>"
				Response.write "</td>"
				Response.write "<td width=""15%"" >"
					Response.write "<p align=""left""><font style=""font-family: arial; font-size: 10pt;""><b>SI # " & wINS & "</b></font>"
				Response.write "</td>"
				Response.write "<td width=""10%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""></font>"
				Response.write "</td>"
				Response.write "<td width=""10%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""></font>"
				Response.write "</td>"
				Response.write "<td width=""10%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""></font>"
				Response.write "</td>"
				Response.write "<td width=""9%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""></font>"
				Response.write "</td>"
				Response.write "<td width=""9%"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""></font>"
				Response.write "</td>"
			Response.write "</tr>"
			
			wTNO = cdbl(wDPP) + cdbl(wDPR) + cdbl(wDGA) + cdbl(wDMA) + cdbl(wDSE)
			Response.write "<tr>"
				Response.write "<td width=""15%"" >"
					Response.write "<p align=""left""><font style=""font-family: arial; font-size: 10pt;""><b>NO # " & wTNO & "</b></font>"
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
					Response.write "<p align=""left""><font style=""font-family: arial; font-size: 10pt;""><b>Se entrego producto a satisfacción</b></font>"
				Response.write "</td>"
				Response.write "<td width=""10%"" bgcolor=""silver"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""><b>Condiciones de Precio</b></font>"
				Response.write "</td>"
				Response.write "<td width=""10%"" bgcolor=""silver"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""><b>Falta de Seguimiento</b></font>"
				Response.write "</td>"
				Response.write "<td width=""10%"" bgcolor=""silver"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""><b>Condiciones del Producto</b></font>"
				Response.write "</td>"
				Response.write "<td width=""9%"" bgcolor=""silver"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""><b>Condiciones Comerciales</b></font>"
				Response.write "</td>"
				Response.write "<td width=""9%"" bgcolor=""silver"" >"
					Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""><b>Incumplimiento en la Entrega</b></font>"
				Response.write "</td>"
				
		Response.write "</tr>"
			
	End Sub 

%>
<input type="button" name="Imprimir" Value="Imprimir" onclick="window.print()"> 


</p>


</body>

</html>