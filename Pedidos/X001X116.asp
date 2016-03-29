
<%@ Language=VBScript %>

<%

'Response.Expires = -1
'Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
'Response.CacheControl = "no-cache"

%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Ventas por Vendedor</title>
<!--#include file="X001Z001.INC"-->


</head>

<body>


<%
	Datos_Compania wDEL, wURI
	
	strCnn	= Application("XDTA300_ConnectionString")
	
	wCCI = Session("glCiaInternet")
	wCIA = Session("glCia")
	
	wCVE = trim(Request.QueryString("CVE"))
	wMES = Request.Form("MES")
	wMES2 = Request.Form("MES2")
	
	wMED = Request.Form("MED")
	wAND = Request.Form("AND")
	
	wVIS = Request.Form("VIS")
	
	wMEH = Request.Form("MEH")
	wANH = Request.Form("ANH")
	
	
	IF LEN(TRIM(wMED)) > 0 THEN
		wFDE = "01-" & wMED & "-" & wAND
		'RESPONSE.WRITE wMEH & "-" & wANH
		'RESPONSE.END
		wDiaFinal = LastDayOfMonth(wMEH, wANH)
		wDiaFinal = Right("00" & wDiaFinal, 2)
		wFHA = wDiaFinal & "-" & wMEH & "-" & wANH
	END IF 
	

	IF IsNull(wMES) Or wMES = "" Then
		wMES = TRIM(Request.QueryString("MES"))
	End If 
	
	IF IsNull(wFDE) Or wFDE = "" Then
		wFDE = TRIM(Request.QueryString("FDE"))
	End If 
	
	IF IsNull(wFHA) Or wFHA = "" Then
		wFHA = TRIM(Request.QueryString("FHA"))
	End If 
	
	IF IsNull(wVIS) Or wVIS = "" Then
		wVIS = TRIM(Request.QueryString("VIS"))
	End If 

	
	IF IsNull(wMES) Or wMES = "" Then
		wMES = Right("00" & Month(Now),2)
	End If 
	
	'response.write wFDE & "<br>" & wFHA
	
	Function LastDayOfMonth(iMonth, iYear)
		NextMonth = DateAdd("m", 1, DateSerial(iYear, iMonth, "01"))
		LastDayOfMonth = Day(DateAdd("d", -1, NextMonth))
	End Function

	wDia_Actual = Right("00" & day(Now()),2)
	wMes_Actual = wMES 'Right("00" & Month(Now()),2)
	
	If CInt(wMES) > Month(Now()) THEN
		wAno_Actual = (Year(Now()) - 1)
	Else
		wAno_Actual = Year(Now())
	End If

	
	wDia_Actual = left(wFDE,2)
	wMes_Actual = mid(wFDE,4,2)
	wAno_Actual = right(wFDE,4)	
	wFECHAI = wAno_Actual & "-" & wMes_Actual & "-" & wDia_Actual &" 00:00:00"
	
	wDia_Final = left(wFHA,2)
	wMes_Actual = mid(wFHA,4,2)
	wAno_Actual = right(wFHA,4)	
	wDiaFinal = LastDayOfMonth(wMes_Actual, wAno_Actual)
	wDiaFinal = Right("00" & wDiaFinal, 2)
	wFECHAF = wAno_Actual & "-" & wMes_Actual & "-" & wDia_Final & " 23:59:59"
	wFECHAF2 = wAno_Actual & "-" & wMes_Actual & "-" & wDiaFinal & " 23:59:59"
	
	'wFECHAI = wAno_Actual & "-" & wMes_Actual & "-01 00:00:00"
	'wFECHAF = wAno_Actual & "-" & wMes_Actual & "-" & wDiaFinal & " 23:59:59"

	wFED = wFECHAI 
	wFEH = wFECHAF
	wFEH2 = wFECHAF2
	
	'response.write wFECHAI & "<br>" & wFECHAF
	
	wTME = DateDiff("m",wFED,wFEH) 
	wTME = wTME + 1
	'Response.write wTME 


	
	IF LEN(TRIM(wCVE)) = 0 AND Session("glTipoUsuario") = "V" THEN
		wCVE = Session("glCodVendedor")
	END IF 

    SQL = " X300RX001 "
    SQL = SQL & "'" & wCCI & "', "
    SQL = SQL & "'" & wCIA & "' "
	Set XDTA300 = Server.CreateObject("ADODB.Connection")
	'XDTA300.Open strCnn
	'XDTA300.Execute SQL
	'XDTA300.Close 


	SQL = " SELECT Z300002FAR, Z300002FDE, Z300002FHA "
	SQL = SQL & "  FROM X300ZF002 " 
	SQL = SQL & "  WHERE "
	SQL = SQL & "  Z300002CCI = '" & wCCI & "'"
  	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN		
		wFAR = cdate(rstQuery.Fields("Z300002FAR"))
		wD300005FED = rstQuery.Fields("Z300002FDE")
		wD300005FEH = rstQuery.Fields("Z300002FHA")
		'wFED = Year(wD300005FED) & "-" & right("0" & Month(wD300005FED),2) & "-" & right("0" & Day(wD300005FED),2) & " 00:00:00"  
		'wFEH = Year(wD300005FEH) & "-" & right("0" & Month(wD300005FEH),2) & "-" & right("0" & Day(wD300005FEH),2) & " 23:59:59"
		'wD300005FED = right("0" & Day(wD300005FED),2) & "-" & right("0" & Month(wD300005FED),2) & "-" & Year(wD300005FED)
		'wD300005FEH = right("0" & Day(wD300005FEH),2) & "-" & right("0" & Month(wD300005FEH),2) & "-" & Year(wD300005FEH)
		wD300005FED = right("0" & Day(wFED),2) & "-" & right("0" & Month(wFED),2) & "-" & Year(wFED)
		wD300005FEH = right("0" & Day(wFEH),2) & "-" & right("0" & Month(wFEH),2) & "-" & Year(wFEH)
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	
	wFECHA = right("0" & Day(Date),2) & "-" & right("0" & Month(Date),2) & "-" & Year(Date)
	wFAR = right("0" & Day(wFAR),2) & "-" & right("0" & Month(wFAR),2) & "-" & Year(wFAR) & " "  & Timevalue(wFAR)	

%>


<p><img border="0" src="<%=wURI%>"></p>


<p align="center" style="margin-top: 0; margin-bottom: 4px"><font face="Tahoma" size="2"><b>Periodo del: </b><%= wD300005FED %> <b>al:</b> <%= wD300005FEH %>

</p>

<p align="center" style="margin-top: 3px; margin-bottom: 3px"><b>Fecha del Reporte: </b><%= wFECHA %>

</p>


<%

	SQL = " SELECT isnull(SUM(D300005FAC),0) AS D300005FAC, ISNULL(SUM(D300005PRE),1) AS D300005PRE, "
	SQL = SQL & "  isnull(SUM(D300005CON),0) AS D300005CON, isnull(SUM(D300005RET),0) AS D300005RET, "
	SQL = SQL & "  isnull(SUM(D300005PRD),0) AS NOTAS "

	SQL = SQL & "  FROM X300DF005 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " D300005CCI = '" & wCCI & "' AND "
	SQL = SQL & " D300005FED >= '" & wFED & "' AND "
	SQL = SQL & " D300005FEH <= '" & wFEH2 & "' "
	IF Session("glTipoUsuario") <> "S" THEN
		SQL = SQL & " AND D300005CVE in (select A300020CVE from X300AF020) "
	END IF 
	IF LEN(TRIM(wCVE)) > 0 AND wCVE <> "000" THEN
		SQL = SQL & " AND "
		SQL = SQL & " D300005CVE = '" & wCVE & "' "
	END IF 	
	IF Session("glTipoUsuario") = "S" THEN
		SQL = SQL & " AND D300005CVE IN "
		SQL = SQL & " ( SELECT A300002CVE FROM X300AQ002 "
		SQL = SQL & " WHERE Z300006PSU = '" & Session("glUsuario") & "' )"
	END IF 
	'RESPONSE.WRITE SQL 
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	'rstQuery.ConnectionTimeout = 180
    rstQuery.Open sql , strCnn    
	IF NOT rstQuery.EOF THEN
		
		wD300005CON = cdbl(rstQuery.Fields("D300005CON"))
		wD300005RET = cdbl(rstQuery.Fields("D300005RET"))
	
	
		wTCI = wD300005RET + CDBL(wD300005CON)
	
		wD300005FAC = cdbl(rstQuery.Fields("D300005FAC"))	
		wNOT = cdbl(rstQuery.Fields("NOTAS"))
		wD300005FAC = wD300005FAC - wNOT
		wD300005PRE = cdbl(rstQuery.Fields("D300005PRE"))
	
		IF wD300005PRE = 0 THEN
			wD300005PRE = 1
		END IF  
		
	
	'	
		IF wTCI = 0 THEN: wTCI = 1: END IF 
		IF wD300005PRE = 0 THEN: wD300005PRE = 1: END IF 
		
		wPPE = FormatNumber((wD300005RET / wTCI) * 100, 1)	
		wPFA = FormatNumber((wD300005FAC / wD300005PRE) * 100, 1)
	'	
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	
	IF wVIS = "P" THEN
		wD300005RET = wD300005RET / wTME
		wD300005CON = wD300005CON / wTME
		wD300005FAC = wD300005FAC / wTME
		wD300005PRE = wD300005PRE / wTME
	END IF 
		
	wD300005RET = FormatNumber(wD300005RET,0)
	wD300005CON = FormatNumber(wD300005CON,0)
	wD300005FAC = FormatNumber(wD300005FAC,2)
	wD300005PRE = FormatNumber(wD300005PRE,2)	

%>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;</p>


<p style="margin-top: 0; margin-bottom: 0">&nbsp;</p>
<table border="1" width="100%" style="border-width: 0px" cellspacing="1">
	<tr>
		<td style="border-style: none; border-width: medium" width="25%"><u><b>
		<font face="Tahoma" size="2">Detalle de Ventas por Vendedor:</font></b></u></td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium; width:10%" align="center">
		&nbsp;</td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium" width="10%" align="center">&nbsp;</td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium" width="10%" align="center">&nbsp;</td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium" width="10%" align="center">&nbsp;</td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium" width="10%" align="center">&nbsp;</td>
		<td style="border-left-width: none; border-right-width: none; border-top-width: none; background-color:#CCFFCC" width="30%" align="center" colspan="2" >
		<b><font face="Tahoma" size="2">% Cumplimiento Objetivo</font></b></td>
	</tr>
	<tr>
		<td style="border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium" width="25%">&nbsp;</td>
		<td style="border-left-style: solid; border-left-width: 1px; border-top-style: solid; border-top-width: 1px; width:10%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<font size="2"><b>Total Clientes</b></font></td>
		<td style="border-top-style: solid; border-top-width: 1px" width="10%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<font size="2"><b>Clientes Atendidos</b></font></td>
		<td style="border-top-style: solid; border-top-width: 1px" width="10%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<font size="2"><b>Clientes No Atendidos</b></font></td>
		<td style="border-top-style: solid; border-top-width: 1px" width="10%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<font size="2"><b>Facturado</b></font></td>
		<td style="border-top-style: solid; border-top-width: 1px" width="10%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<b><font face="Tahoma" size="2">Objetivo</font></b></td>
		<td style="border-top-style: solid; border-top-width: 1px" width="10%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<font size="2"><b>Clientes Atendidos</b></font></td>
		<td style="border-top-style: solid; border-top-width: 1px" align="center" bgcolor="#C0C0C0" width="10%" bordercolor="#000000">
		<b><font face="Tahoma" size="2">Facturado</font></b></td>
			</tr>
	
	
	<%' ******************COMIENZO DETALLE************************ %>
	
	<%
	
	SQL = " SELECT D300005CVE, A300020NOM, SUM(D300005FAC) AS D300005FAC, "
	SQL = SQL & "  SUM(D300005PRE) AS D300005PRE, SUM(D300005FOR) AS D300005FOR, D300005CVE, "
	SQL = SQL & "  SUM(D300005CON) AS D300005CON, SUM(D300005RET) AS D300005RET, isnull(SUM(D300005PRD),0) AS NOTAS, "
	
	'SQL = SQL & " (SELECT ISNULL(SUM(C300205STO),0) FROM X300CF205 "
	'SQL = SQL & "  WHERE  "
	'SQL = SQL & "  C300205FPR >= '" & wFED & "' AND "
	'SQL = SQL & "  C300205FPR <= '" & wFEH & "' AND "
	'SQL = SQL & "  C300205CVE = D300005CVE) AS NOTAS, "
	
	SQL = SQL & " (SUM(D300005FAC)-isnull(SUM(D300005PRD),0)) AS TOTAL "
	'SQL = SQL & " (D300005FAC-(SELECT ISNULL(SUM(C300205STO),0) FROM X300CF205 "
	'SQL = SQL & "  WHERE  "
	'SQL = SQL & "  C300205FPR >= '" & wFED & "' AND "
	'SQL = SQL & "  C300205FPR <= '" & wFEH2 & "' AND "
	'SQL = SQL & "  C300205CVE = D300005CVE)) AS TOTAL "
		
	SQL = SQL & "  FROM X300DQ005 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " D300005CCI = '" & wCCI & "' AND "
	SQL = SQL & " D300005FED >= '" & wFED & "' AND "
	SQL = SQL & " D300005FEH <= '" & wFEH2 & "' "
	IF LEN(TRIM(wCVE)) > 0 AND wCVE <> "000" THEN
		SQL = SQL & " AND "
		SQL = SQL & " D300005CVE = '" & wCVE & "' "
	END IF 	
	IF Session("glTipoUsuario") = "S" THEN
		SQL = SQL & " AND D300005CVE IN "
		SQL = SQL & " ( SELECT A300002CVE FROM X300AQ002 "
		SQL = SQL & " WHERE Z300006PSU = '" & Session("glUsuario") & "' )"
	END IF 
	SQL = SQL & " GROUP BY D300005CVE, A300020NOM "
	SQL = SQL & " ORDER BY 10 DESC " 	
	'response.write sql 
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	DO WHILE NOT rstQuery.EOF 
		
		wCVE2 = TRIM(rstQuery.Fields("D300005CVE"))
		wNUS = TRIM(rstQuery.Fields("A300020NOM"))
		IF ISNULL(wNUS) THEN
			wNUS = TRIM(rstQuery.Fields("D300005CVE"))
		END IF 
		
		wDEM = 0
		wINS = 0 
		

		wCAT = FormatNumber(cdbl(rstQuery.Fields("D300005RET")),0)
		wCNA = FormatNumber(cdbl(rstQuery.Fields("D300005CON")),0)	
		
		wNOT = cdbl(rstQuery.Fields("NOTAS"))
		wFAC = cdbl(rstQuery.Fields("D300005FAC"))
		'IF wFAC > 0 THEN
			wFAC = wFAC - wNOT
		'END IF 
		
		wPRE = cdbl(rstQuery.Fields("D300005PRE"))
		
		IF wVIS = "P" THEN
			wCAT = wCAT / wTME
			wCNA = wCNA / wTME
			wFAC = wFAC / wTME
			wPRE = wPRE / wTME
		END IF 		
		
		wPRE = FormatNumber(wPRE,1)
						
		
		wFAC = FormatNumber(wFAC,2)

		wTNOT = wTNOT + cdbl(wNOT)
		
		
		
		If wPRE = 0 Then
			wPRE = 1
		End If 
		
		wTCL = wCAT + CDBL(wCNA)
		IF wTCL = 0 THEN: wTCL = 1: END IF
		
		wTTCL = wTTCL + cdbl(wTCL)
		
		wPCAT = FormatNumber(((wCAT / wTCL) * 100) ,1) & "%"
		wPFAC = FormatNumber(((wFAC / wPRE) * 100) ,1) & "%"
		
		wURLD = "X001X116.ASP" & "?CVE=" & wCVE2 & "&FDE=" & wFDE & "&FHA=" & wFHA & "&VIS=" & wVIS
		'wURLD = "X001X116.ASP" & "?CVE=" & wCVE2 & "&MES=" & wMES
		'wURLP = "X001X175.ASP" & "?CVE=" & wCVE2 & "&MES=" & wMES
				
			
		Response.write "<tr>"
			Response.write "<td style=""font-family: Tahoma; font-size: 8pt; border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium"" width=""25%"">"
				IF (Session("glTipoUsuario") = "S" OR Session("glTipoUsuario") = "V" OR Session("glTipoUsuario") = "A" OR Session("glUsuario") = "VENTAS3") AND LEN(TRIM(wCVE)) > 0 THEN 
					wURLVC = "X001X177.ASP" & "?FDE=" & wFDE & "&FHA=" & wFHA & "&CVE=" & wCVE & "&VIS=" & wVIS
					'wURLVC = "X001X177.ASP" & "?MES=" & wMES & "&CVE=" & wCVE
					Response.write "<table border=0 style=""font-family: Tahoma; font-size: 8pt;"" width=""100%""><tr>" 
					Response.write "<td>"
					Response.write wNUS & " (" & wCVE2 & ")" 
					Response.write "</td>"
					Response.write "<td width=""70"" align=""center""><font color=""#0000FF"" onclick=javascript:window.open('" & wURLVC & "','_parent'); style=""CURSOR: pointer""><b>xCliente</b></font></td>"
					Response.write "</tr></table>"
					ELSE				
					IF LEN(TRIM(wCVE)) = 0 THEN
						Response.write "<font color=""#0000FF"" onclick=javascript:window.open('" & wURLD & "','_parent'); style=""CURSOR: pointer""><b>"
					END IF 
					Response.write wNUS & " (" & wCVE2 & ")" 
					Response.write "</b></font>"				
				END IF 


				'IF LEN(TRIM(wCVE)) = 0 THEN
				'	Response.write "<font color=""#0000FF"" onclick=javascript:window.open('" & wURLD & "','_parent'); style=""CURSOR: pointer""><b>"
				'END IF 
				'Response.write wNUS & " (" & wCVE2 & ")" 
				'Response.write "</b></font>"
			Response.write "</td>"			
			
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; border-left-style: solid; border-left-width: 1px"" width=""88"" bordercolor=""#000000"" align=""right"">"				
				Response.write FormatNumber(wTCL,0)					
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; border-left-style: solid; border-left-width: 1px"" width=""88"" bordercolor=""#000000"" align=""right"">"				
				Response.write FormatNumber(wCAT,0)					
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt"" width=""88"" bordercolor=""#000000"" align=""right"">"
				Response.write FormatNumber(wCNA,0)
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt"" width=""94"" bordercolor=""#000000"" align=""right"">"
				Response.write wFAC '& " / " & wNOT
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt"" width=""87"" bordercolor=""#000000"" align=""right"">"
				Response.write wPRE
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; background-color:#CCFFCC"" width=""110"" bordercolor=""#000000"" align=""right"">"
				Response.write wPCAT
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; background-color:#CCFFCC"" width=""108"" bordercolor=""#000000"" align=""right"">"
				Response.write wPFAC			
			Response.write "</td>"
		Response.write "</tr>"
	
	
		rstQuery.MoveNext 
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	IF LEN(TRIM(wCVE)) = 0 OR wCVE = "000" THEN
	
		Response.write "<tr>"
			Response.write "<td style=""font-family: Tahoma; font-size: 8pt; border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium"" width=""25%"" align=""left"">"
				IF Session("glTipoUsuario") = "A" OR Session("glUsuario") = "VENTAS3" THEN
					wURLD = "X001X116.ASP" & "?CVE=000" & "&FDE=" & wFDE & "&FHA=" & wFHA & "&VIS=" & wVIS
					'wURLD = "X001X116.ASP" & "?CVE=000" & "&MES=" & wMES
					Response.write "<b>Total Ventas x Vendedor: "
					Response.write "<font color=""#0000FF"" onclick=javascript:window.open('" & wURLD & "','_parent'); style=""CURSOR: pointer"">"
					Response.write " (Ver Compañia)</b>"
				  ELSE
					Response.write "<b>Total Ventas x Vendedor:</b>"
				END IF 
			Response.write "</td>"			
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; color: #0000FF; border-left-style: solid; border-left-width: 1px"" width=""88"" bordercolor=""#000000"" align=""right"">"
					Response.write FormatNumber(wTTCL,0)
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; color: #0000FF; border-left-style: solid; border-left-width: 1px"" width=""88"" bordercolor=""#000000"" align=""right"">"
					Response.write wD300005RET
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; color: #0000FF"" width=""88"" bordercolor=""#000000"" align=""right"">"
				Response.write wD300005CON
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; color: #0000FF"" width=""94"" bordercolor=""#000000"" align=""right"">"
				Response.write wD300005FAC
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; color: #0000FF"" width=""87"" bordercolor=""#000000"" align=""right"">"
				Response.write wD300005PRE
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; color: #0000FF; background-color:#CCFFCC"" width=""110"" bordercolor=""#000000"" align=""right"">"
				Response.write wPPE & "%"
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; color: #0000FF; background-color:#CCFFCC"" width=""108"" bordercolor=""#000000"" align=""right"">"
				Response.write wPFA	& "%"		
			Response.write "</td>"
		Response.write "</tr>"

	END IF 
	
	%>
	
	

	
	<%' ************************FIN DETALLE************************ %>
	
	
	
</table>


<%
'*****************************GRAFICA DE VENTAS***********************
 IF wTME > 1 THEN 

		SQL = " SELECT D300004FED, D300004FEH, "
		SQL = SQL & "  SUM(D300004UND) AS UVE, SUM(D300004FAC) AS MTO, ISNULL(SUM(D300004PRE), 0) AS UNI, "
		SQL = SQL & " (ISNULL(SUM(D300004PRE), 0)/count(*)) AS UNI2 "
		SQL = SQL & "  FROM X300DQ004 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " D300004CCI = '" & wCCI & "' AND "
		SQL = SQL & " D300004FED >= '" & wFED & "' AND "
		SQL = SQL & " D300004FEH <= '" & wFEH2 & "' "
		IF LEN(TRIM(wCVE)) > 0 AND wCVE <> "000" THEN
			SQL = SQL & " AND D300004CVE = '" & wCVE & "' "
		END IF 
		SQL = SQL & "  GROUP BY D300004FED, D300004FEH "
		SQL = SQL & "  ORDER BY D300004FED ASC " 	
		'response.write sql 
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
	    rstQuery.Open sql , strCnn
	    wTUVE = 0
		wTMNE = 0
		wTUNI = 0

		DO WHILE NOT rstQuery.EOF 
			wFEDG = trim(rstQuery.Fields("D300004FED"))
			wFEHG = trim(rstQuery.Fields("D300004FEH"))
			wUVEG = trim(rstQuery.Fields("UVE"))
			wMTOG = trim(rstQuery.Fields("MTO"))
			
			wFEDG = year(wFEDG) & "-" & Right("00" & month(wFEDG),2) & "-" & Right("00" & day(wFEDG),2) & " 00:00:00"
			wFEHG = year(wFEHG) & "-" & Right("00" & month(wFEHG),2) & "-" & Right("00" & day(wFEHG),2) & " 23:59:59"
			
			SQL = " SELECT SUM(D300005FAC) AS D300005FAC, "
			SQL = SQL & "  isnull(SUM(D300005PRE),0) AS D300005PRE, "
			SQL = SQL & "  isnull(SUM(D300005PRD),0) AS NOTAS, "
			SQL = SQL & "  isnull(SUM(D300005RET),0) AS D300005RET, "
			SQL = SQL & "  isnull(SUM(D300005CON),0) AS D300005CON "
			SQL = SQL & "  FROM X300DQ005 " 
			SQL = SQL & " WHERE "
			SQL = SQL & " D300005CCI = '" & wCCI & "' AND "
			SQL = SQL & " D300005FED >= '" & wFEDG & "' AND "
			SQL = SQL & " D300005FEH <= '" & wFEHG & "' "
			IF LEN(TRIM(wCVE)) > 0 AND wCVE <> "000" THEN
				SQL = SQL & " AND "
				SQL = SQL & " D300005CVE = '" & wCVE & "' "
			END IF 	
			IF Session("glTipoUsuario") = "S" THEN
				SQL = SQL & " AND D300005CVE IN "
				SQL = SQL & " ( SELECT A300002CVE FROM X300AQ002 "
				SQL = SQL & " WHERE Z300006PSU = '" & Session("glUsuario") & "' )"
			END IF 
			'SQL = SQL & " GROUP BY D300005CVE, A300020NOM "
			Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
	    	rstQuery2.Open sql , strCnn
			IF NOT rstQuery2.EOF THEN
		
				wNOTG = cdbl(rstQuery2.Fields("NOTAS"))
				wFACG = cdbl(rstQuery2.Fields("D300005FAC"))
				wMTOG = wFACG - wNOTG
				wPREG = cdbl(rstQuery2.Fields("D300005PRE"))
				wCATG = cdbl(rstQuery2.Fields("D300005RET"))
				wCNAG = cdbl(rstQuery2.Fields("D300005CON"))	
				
							
			END IF 
				rstQuery2.CLOSE
			SET rstQuery2 = NOTHING	
		
			wVAL = wVAL & ",['" & Right("00" & month(wFEDG),2) & "-" & year(wFEDG) & "',  " & Replace(Formatnumber(wMTOG,0),",","") & ", " & wPREG & "]"
			wVAL2 = wVAL2 & ",['" & Right("00" & month(wFEDG),2) & "-" & year(wFEDG) & "', " & wCATG+cdbl(wCNAG) & ",  " & Replace(Formatnumber(wCATG,0),",","") & ", " & wCNAG & "]"

			
			'Response.write wFED & "-" & wUVE & "-" & wMTO & "<br>"
			rstQuery.MoveNext 
		LOOP
		rstQuery.CLOSE
		SET rstQuery = NOTHING	

		'Response.write wTNOT

%>
<p align="center">
<table border="1" width="100%" >
<tr><td width="50%" >
 <div id="chart_div" style="width: 100%; height: 400px; align: center;" >
	</div>
	</td> 
	<td width="50%">
<div id="chart_div2" style="width: 100%; height: 400px; align: center;" >	
	</td>
	</tr> 
</table> 
</p> 
<% END IF %>


<%IF LEN(TRIM(wCVE)) > 0 THEN %>

	<p style="margin-top: 0; margin-bottom: 0">&nbsp;</p>
	<table border="1" width="100%" style="border-width: 0px" cellspacing="1">
	<tr>
		<td style="border-style: none; border-width: medium" width="25%"><u><b>
		<font face="Tahoma" size="2">Familia:</font></b></u></td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium; width:10%" align="center">		&nbsp;</td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium" width="10%" align="center">&nbsp;</td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium" width="10%" align="center">&nbsp;</td>
		<td style="border-left-width: none; border-right-width: none; border-top-width: none; background-color:#CCFFCC" width="15%" align="center" >
		<b><font face="Tahoma" size="2">% Cumplimiento Objetivo</font></b></td>
	</tr>
	<tr>
		<td style="border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium" width="35%">&nbsp;</td>
		<td style="border-left-style: solid; border-left-width: 1px; border-top-style: solid; border-top-width: 1px; width:10%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<font size="2"><b>Unid. Vendidas (l)</b></font></td>
		<td style="border-top-style: solid; border-top-width: 1px" width="10%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<font size="2"><b>Bolívares</b></font></td>
		<td style="border-top-style: solid; border-top-width: 1px" width="10%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<% IF (Session("glTipoUsuario") = "A" OR Session("glUsuario") = "VENTAS3") AND wCVE = "000" THEN%>
		<b><font face="Tahoma" size="2"> Objetivo (l)</font></b></td>
		<% ELSE %>
		<b><font face="Tahoma" size="2"> Objetivo (l)</font></b></td>
		<% END IF %>
		<td style="border-top-style: solid; border-top-width: 1px" width="10%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<font size="2"><b>Unidades Vendidas (l)</b></font></td>
		
			</tr>
			

	<%			
		SQL = " SELECT ISNULL(B300120DEC,'NO DISPONIBLE') AS B300120DEC, B300120NPS, "
		SQL = SQL & "  SUM(D300004UNA) AS UVE, SUM(D300004FAC) AS MTO, ISNULL(SUM(D300004PRE), 0) AS UNI, "
		SQL = SQL & " (ISNULL(SUM(D300004PRE), 0)/count(*)) AS UNI2, "
		SQL = SQL & " ISNULL((SELECT sum(D300004FOR) FROM X300DF004 WHERE D300004FAM = B300120NPS AND "
		SQL = SQL & " D300004FED >= '" & wFED & "' AND "
		SQL = SQL & " D300004FEH <= '" & wFEH & "' "
		SQL = SQL & " GROUP BY D300004FAM),0)  AS PRE "  
		SQL = SQL & "  FROM X300DQ004 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " D300004CCI = '" & wCCI & "' AND "
		SQL = SQL & " D300004FED >= '" & wFED & "' AND "
		SQL = SQL & " D300004FEH <= '" & wFEH2 & "' "
		IF wCVE <> "000" THEN
			SQL = SQL & " AND D300004CVE = '" & wCVE & "' "
		END IF 
		SQL = SQL & "  GROUP BY B300120DEC, B300120NPS "
		SQL = SQL & "  ORDER BY MTO DESC " 	
		'response.write sql 
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
	    rstQuery.Open sql , strCnn
	    wTUVE = 0
		wTMNE = 0
		wTUNI = 0

		DO WHILE NOT rstQuery.EOF 
		
			wDEC = TRIM(rstQuery.Fields("B300120DEC"))
			wNLP = TRIM(rstQuery.Fields("B300120NPS"))

			wUVE = cdbl(rstQuery.Fields("UVE"))
			
			wTUVE = wTUVE + CDBL(wUVE)
			wTMNE = wTMNE + CDBL(wMNE)
			wTUNI = wTUNI + CDBL(wUNI)
			
			wMNE = cdbl(rstQuery.Fields("MTO"))
			
			
			wUNI = cdbl(rstQuery.Fields("UNI"))
			
		
				
			
			IF (Session("glTipoUsuario") = "A" OR Session("glUsuario") = "VENTAS3") AND wCVE = "000" THEN
				'wUNI = cdbl(rstQuery.Fields("PRE"))			
			END IF 
			
			IF wVIS = "P" THEN
				wUVE = wUVE / wTME
				wMNE = wMNE / wTME
				wUNI = wUNI / wTME								
			END IF 	
			
			IF wUNI > 0 THEN
				wPOBJ = ((wUVE / wUNI) * 100)
				ELSE
				wPOBJ = "0"  
			END IF 
			
			IF wUVE > 0 THEN
				wVAL3 = wVAL3 & ",['" & wDEC & "', " & cdbl(wUVE) & ", " & cdbl(wUNI) & "]"
			END IF 

			Response.write "<tr>"
				Response.write "<td style=""font-family: Tahoma; font-size: 8pt; border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium"" width=""25%"">"
					IF (Session("glTipoUsuario") = "S" OR Session("glTipoUsuario") = "V" OR Session("glTipoUsuario") = "A" OR Session("glUsuario") = "VENTAS3") THEN 
					
						wURLF = "X001X179.ASP" & "?NLP=" & wNLP & "&FDE=" & wFDE & "&FHA=" & wFHA & "&VIS=" & wVIS & "&CVE=" & wCVE
						wURLD = "X001X174.ASP" & "?NLP=" & wNLP & "&FDE=" & wFDE & "&FHA=" & wFHA & "&VIS=" & wVIS
						wURLC = "X001X176.ASP" & "?NLP=" & wNLP & "&FDE=" & wFDE & "&FHA=" & wFHA & "&CVE=" & wCVE & "&VIS=" & wVIS
						wURLP = "X001X175.ASP" & "?NLP=" & wNLP & "&FDE=" & wFDE & "&FHA=" & wFHA & "&CVE=" & wCVE & "&VIS=" & wVIS
						wURLA = "X001X180.ASP" & "?NLP=" & wNLP & "&FDE=" & wFDE & "&FHA=" & wFHA & "&CVE=" & wCVE & "&VIS=" & wVIS
						
						'wURLD = "X001X174.ASP" & "?NLP=" & wNLP & "&MES=" & wMES
						'wURLC = "X001X176.ASP" & "?NLP=" & wNLP & "&MES=" & wMES & "&CVE=" & wCVE
						'wURLP = "X001X175.ASP" & "?NLP=" & wNLP & "&MES=" & wMES & "&CVE=" & wCVE
						Response.write "<table border=0 style=""font-family: Tahoma; font-size: 8pt;"" width=""100%""><tr>" 
						Response.write "<td>"
						IF wNLP = "0019" THEN
							Response.write "<font color=""#0000FF"" onclick=javascript:window.open('" & wURLA & "','_Blank','width=700,height=650'); style=""CURSOR: pointer"">" & wDEC & " (" & wNLP & ")" & " </b></font>"
							ELSE
							Response.write wDEC & " (" & wNLP & ")" 
						END IF 	
						Response.write "</td>"
						
						IF wTME > 1 THEN
							Response.write "<td width=""70"" align=""center""><font color=""#0000FF"" onclick=javascript:window.open('" & wURLF & "','_Blank','width=700,height=650'); style=""CURSOR: pointer""><img src=""images/icono_estadisticas.gif"" width=""20"" height=""20""></font></td>"						
						END IF 
						IF (Session("glTipoUsuario") = "A" OR Session("glUsuario") = "VENTAS3") AND wCVE = "000" THEN						
							Response.write "<td width=""70"" align=""center""><font color=""#0000FF"" onclick=javascript:window.open('" & wURLD & "','_parent'); style=""CURSOR: pointer""><b>xVendedor</b></font></td>"
						END IF 
						Response.write "<td width=""70"" align=""center""><font color=""#0000FF"" onclick=javascript:window.open('" & wURLC & "','_parent'); style=""CURSOR: pointer""><b>xCliente</b></font></td>"
						Response.write "<td width=""70"" align=""center""><font color=""#0000FF"" onclick=javascript:window.open('" & wURLP & "','_parent'); style=""CURSOR: pointer""><b>xProducto</b></font></td>"
						Response.write "</tr></table>"
					 ELSE
						Response.write wDEC & " (" & wNLP & ")"  
					END IF 
					
				Response.write "</td>"			
				Response.write "<td style=""font-family: Tahoma; font-size: 9pt; border-left-style: solid; border-left-width: 1px"" width=""78"" bordercolor=""#000000"" align=""right"">"
					'Response.write "<font color=""#0000FF"" onclick=javascript:window.open('" & wURLP & "','_parent'); style=""CURSOR: pointer""><b>"
					Response.write FormatNumber(wUVE,2)
					'Response.write "</b></font>"
				Response.write "</td>"
				Response.write "<td style=""font-family: Tahoma; font-size: 9pt""  width=""88"" bordercolor=""#000000"" align=""right"">"
					Response.write FormatNumber(wMNE,2)
				Response.write "</td>"
				Response.write "<td style=""font-family: Tahoma; font-size: 9pt"" width=""88"" bordercolor=""#000000"" align=""right"">"
					Response.write FormatNumber(wUNI,0)
				Response.write "</td>"
				Response.write "<td style=""font-family: Tahoma; font-size: 9pt; width=88; background-color:#CCFFCC""  bordercolor=""#000000"" align=""right"">"
					Response.write FormatNumber(wPOBJ,1) & "%"		
				Response.write "</td>"
			Response.write "</tr>"

	
			rstQuery.MoveNext 
		LOOP
		rstQuery.CLOSE
		SET rstQuery = NOTHING	
		
		wTUVE = wTUVE + wUVE
		wTMNE = wTMNE + wMNE
		wTUNI = wTUNI + wUNI
		
		IF wVIS = "P" THEN
			wTNOT = wTNOT / wTME
		END IF 

		
		IF wTUNI > 0 THEN
			wPOBJ = FormatNumber(((wTUVE / wTUNI) * 100) ,1) & "%"
		END IF 

		Response.write "<tr>"
			Response.write "<td style=""font-family: Tahoma; font-size: 8pt; border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium"" width=""25%"" align=""left"">"
				Response.write "<b>Total Ventas x Familia:</b>"
			Response.write "</td>"			
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; color: #0000FF; border-left-style: solid; border-left-width: 1px"" width=""88"" bordercolor=""#000000"" align=""right"">"
				Response.write  FormatNumber(wTUVE,2)
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; color: #0000FF"" width=""88"" bordercolor=""#000000"" align=""right"">"
				Response.write  FormatNumber(wTMNE-wTNOT,2)
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; color: #0000FF"" width=""94"" bordercolor=""#000000"" align=""right"">"
				Response.write  FormatNumber(wTUNI,1)
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; color: #0000FF; background-color:#CCFFCC"" width=""80"" bordercolor=""#000000"" align=""right"">"
				Response.write  wPOBJ & "%"		
			Response.write "</td>"
		Response.write "</tr>"

	
			
%>
</table> 

<% IF (Session("glTipoUsuario") = "V" OR LEN(TRIM(wCVE)) > 0) AND wCVE <> "000" THEN %>
<table border="0" width="100%" cellpadding="0" cellspacing="0"  >
	<td width="100%">
<div id="chart_div3" style="width: 100%; height: 580px; align: center;" >	
	</td>
	</tr> 
</table> 
<% END IF %>

<br><br>


<% IF Session("glTipoUsuario") <> "V" THEN %>
<p align="center"  >
<INPUT type='button' value='Regresar' id=button1 name=button1 OnClick='javascript:history.back()'>
</p> 

<% END IF %>

<% END IF %>


<br><br>

<p align="center" style="margin-top: 3px; margin-bottom: 3px"><b>Fecha Actualización Datos del Reporte: </b><%= wFAR %>

</p>

<br><br>



<!--#include file="X001X116EC.ASP"-->

 <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Mes-Año', 'Facturado', 'Objetivo']
          <%=wVAL%> 
          /*['01-2013',  1000,      400],
          ['02-2013',  1170,      460],
          ['03-2013',  660,       1120],
          ['04-2013',  1030,      540]*/
        ]);
        
        var options = {
          title: 'Ventas',
          left: '200',
          width: '80%',
          height: '400',
          trigger: 'selection' 
          //selectionMode: 'multiple',
	    // Trigger tooltips on selections.
	    //tooltip: { trigger: 'selection' }
	    // Group selections by x-value.
	    //aggregationTarget: 'category'
          //chartArea:{left:20,top:0,width:"100%",height:"75%"}
          //width: '1024'
        };
        
        var data2 = google.visualization.arrayToDataTable([
          ['Mes-Año', 'Total', 'Atendidos', 'No Atendidos']
          <%=wVAL2%> 
          /*,['2004', 500, 1000,      400],
          ['2005', 400, 1170,      460],
          ['2006', 300, 660,       1120],
          ['2007', 600, 1030,      540]*/
          
        ]);
        
        var options2 = {
          title: 'Clientes',
          left: '200',
          width: '80%',
          height: '400',
          trigger: 'selection'
           
          //selectionMode: 'multiple',
	    // Trigger tooltips on selections.
	    //tooltip: { trigger: 'selection' }
	    // Group selections by x-value.
	    //aggregationTarget: 'category'
          //chartArea:{left:20,top:0,width:"100%",height:"75%"}
          //width: '1024'
        };
        
        
        var data3 = google.visualization.arrayToDataTable([
          ['Familia', 'Unidades', 'Minimo']
          <%=wVAL3%> 
          /*,['2004', 500, 1000,      400],
          ['2005', 400, 1170,      460],
          ['2006', 300, 660,       1120],
          ['2007', 600, 1030,      540]*/
          
        ]);
        
        var options3 = {
          title: 'Venta en Unidades x Familia',
          //isStacked: true,
          left: '10',
          width: '100%',
          height: '580',
          trigger: 'selection',
          hAxis: {title: 'Familias', textStyle: {fontSize: '10'} , titleTextStyle: {color: 'Blue'}},
          //vAxis: {maxValue: 2000, viewWindow: {max: 2000}}
          vAxis: {maxValue: 1000, viewWindow: {max: 1000}}
          
        
          //hAxis.textStyle.fontSize: '10'
          //hAxis.textStyle: {fontSize: '10'} 
          //hAxis.textStyle: 
          //selectionMode: 'multiple',
	    // Trigger tooltips on selections.
	    //tooltip: { trigger: 'selection' }
	    // Group selections by x-value.
	    //aggregationTarget: 'category'
          //chartArea:{left:20,top:0,width:"100%",height:"75%"}
          //width: '1024'
        };

        var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
        chart.draw(data, options);
		
		var chart2 = new google.visualization.LineChart(document.getElementById('chart_div2'));
        chart2.draw(data2, options2);
        
        var chart3 = new google.visualization.ColumnChart(document.getElementById('chart_div3'));
        chart3.draw(data3, options3);

      }
    </script>
 <!--#include file="X001Y007.PRC"-->
 
</body>

</html>