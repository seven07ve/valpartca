<%@ Language=VBScript %>

<%

Response.Expires = -1
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"

%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Informe Consolidado</title>
</head>
<!--#include file="X001Z001.INC"-->
 <!--#include file="X001Y007.PRC"-->
<body>


<%
	Datos_Compania wDEL, wURI	
	strCnn	= Application("XDTA300_ConnectionString")

	wVEN = Request.Form("VENDEDOR") 
	wMES = TRIM(Request.Form("MES"))
	wANO = TRIM(Request.Form("ANO"))
	
	Select Case wMES
		Case "01"
			wNME = "Enero"
		Case "02"
			wNME = "Febrero"
		Case "03"
			wNME = "Marzo"
		Case "04"
			wNME = "Abril"
		Case "05"
			wNME = "Mayo"
		Case "06"
			wNME = "Junio"
		Case "07"
			wNME = "Julio"
		Case "08"
			wNME = "Agosto"
		Case "09"
			wNME = "Septiembre"	
		Case "10"
			wNME = "Octubre"
		Case "11"
			wNME = "Noviembre"
		Case "12"
			wNME = "Diciembre"			
	End Select 
	
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
<table border="0" width="100%"><tr><td>
<p align="left" style="margin-top: 0; margin-bottom: 8px"><font face="Arial" size="4"><b>
Informe Consolidado &lt;a&gt; SALES PRO
</b></font></p></td><td align="right">
<img src="<%=wURI%>" alt="<%= wDEL%>" width="300" border="0">
</td></tr></table>
<!--<p align="right" style="margin-top: 3px; margin-bottom: 3px"><font face="Arial" size="2"><b>Fecha del Reporte: </b><%= wFECHA %>
</font> 
</p>-->
<hr>
<!--
<p align="center" style="margin-top: 0; margin-bottom: 4px"><font face="Arial" size="2"><b>Periodo del </b><%=wFDE%><b> al </b> <%=wFHA%></font> </p>
-->



	
	
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
			'Imprimir_Encabezado
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
		SQL = "SELECT ISNULL(COUNT(P300100NPE),0) AS NOP,  ISNULL(SUM(P300100COP),0) AS COP FROM X300PF100 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " P300100CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300100CVE = '" & wCVE & "' AND "
		SQL = SQL & " P300100FPR >= '" & wFDE & " 00:00:00' AND "
		SQL = SQL & " P300100FPR <= '" & wFHA & " 23:59:59' AND "
		SQL = SQL & " P300100STS <> '9' "
		response.write sql 
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
	    rstQuery2.Open sql , strCnn
		IF NOT rstQuery2.EOF THEN
			wNOP = TRIM(rstQuery2.Fields("NOP"))
			wCOP = TRIM(rstQuery2.Fields("COP"))
		END IF
		rstQuery2.Close 
		set rstQuery2 = nothing
		
		wPRE = (wREC / wNOP)*100
		response.write wCOP & "-" & wNOP
		wPCO = wCOP / wNOP
		
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


		

		
		
			
			'Response.write "<tr>"
			'	Response.write "<td width=""20%"" >"
			'		Response.write "<font style=""font-family: arial; font-size: 10pt;"">" & wNOM & "</font>"
			'	Response.write "</td>"
			'	Response.write "<td width=""6%"" >"
			'		Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wOVE,0) & "</b></font>"
			'	Response.write "</td>"
			'	Response.write "<td width=""6%"" >"
			'		Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wPDC,0) & "</font>"
			'	Response.write "</td>"
			'	Response.write "<td width=""6%"" >"
			'		Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wPCU,0) & "</font>"
			'	Response.write "</td>"
			'	Response.write "<td width=""6%"" >"
			'		Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wOPO,0) & "</font>"
			'	Response.write "</td>"
			'	Response.write "<td width=""8%"" >"
			'		Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wBCK,0) & "</font>"
			'	Response.write "</td>"
			'	Response.write "<td width=""8%"" >"
			'		Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wVTA,0) & "</font>"
			'	Response.write "</td>"
			'	Response.write "<td width=""8%"" >"
			'		Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wCON,0) & "</font>"
			'	Response.write "</td>"
			'	Response.write "<td width=""8%"" >"
			'		Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wNOD,0) & "</font>"
			'	Response.write "</td>"
			'	Response.write "<td width=""8%"" >"
			'		Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wMOD,0) & "</font>"
			'	Response.write "</td>"
			'	Response.write "<td width=""8%"" >"
			'		Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;""><b># Entregas Pendientes</b></font>"
			'	Response.write "</td>"
			'	Response.write "<td width=""8%""  >"
			'		Response.write "<p align=""right""><font style=""font-family: arial; font-size: 10pt;"">" & FormatNumber(wPRE,0) & "</font>"
			'	Response.write "</td>"
			'Response.write "</tr>"

	
		wCuenta = wCuenta + 1
		rstQuery.MoveNext 
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
		
	%>
	
	<%' ************************FIN DETALLE************************ %>
	
<p style="margin-top: 0; margin-bottom: 0">&nbsp;</p>
<table border="0" width="100%" style="border-width: 1px" cellspacing="0" cellpadding="4">
<tr>
<td width="50%" align="left">

<table>
<tr>
<td width="50%" align="left">
<b>Nombre</b> <i><%=wNOM%></i> 
</td>
</tr>

<tr>
<td width="50%" align="center">
<img src="images/Mapa_Regionales.png" border="0" usemap="#CUMPLIMIENTO" width="400" alt="Regionales">
</Td>
</tr>
</table>

</td>

<td width="50%" rowspan="2">
	<table border="2" width="100%" cellpadding="8">
	<tr>
	<td width="30%">Mes</td><td><%=wNME%></td> 
	</tr>
	
	<tr>
	<td>Linea</td><td><%=wDEL%></td> 
	</tr>
	
	<tr>
	<td>Ppto Mes</td><td><%=FormatNumber(wOVE,2)%></td> 
	</tr>	
	</table>
	<br>
	<table border="2" width="100%" cellpadding="8">
	<tr>
	<td width="25%">PDC</td> 
	<td width="25%"><%=FormatNumber(wPDC,2)%></td>
	<td width="25%">Cumplimiento Ppto</td>
	<td width="25%"><b><%=FormatNumber(wPCU,0)%>%</b></td>
	</tr>
	
	<tr>
	<td>Ventas</td> 
	<td><%=FormatNumber(wVTA,2)%></td>
	<td>Oportunidades</td>
	<td><%=FormatNumber(wOPO,2)%></td>
	</tr>
	
	<tr>	
	<td>&nbsp;</td> 
	<td>&nbsp;</td>
	<td>Backorders</td>
	<td><%=FormatNumber(wBCK,2)%></td>
	</tr>
	<tr>
	<td>&nbsp;</td> 
	<td>&nbsp;</td>
	<td>Calif. Op del mes</td>
	<td><%=FormatNumber(wPCO,1)%></td>
	</tr>
	</table>
	
 	
 	<br>
	<table border="2" width="100%" cellpadding="8">
	<tr>
	<td>Tasa de Conversión<td> 
	<td></td>
	<td><i>Oportunidades/Ventas</i></td>
	<td></td>
	</tr>
	
	<tr>
	<td>Oportunidades Abiertas<td> 
	<td></td>
	<td><i>Oportunidades totales del mes</i></td>
	<td></td>
	</tr>
	
	<tr>	
	<td>Tareas vencidas<td> 
	<td></td>
	<td><i>Hacer click para ver el detalle</i></td>
	<td></td>
	</tr>
	
	<tr>
	<td>OP Descalificadas<td> 
	<td></td>
	<td>Valor OP descalificadas</td>
	<td></td>
	</tr>
	
	<tr>
	<td>Ventas<td> 
	<td></td>
	<td></td>
	<td></td>
	</tr>
	</table>


</td>	
</tr>
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
<!--<input type="button" name="Imprimir" Value="Imprimir" onclick="window.print()"> -->


</p>


</body>

</html>