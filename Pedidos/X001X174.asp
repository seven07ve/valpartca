
<%@ Language=VBScript %>

<%

'Response.Expires = -1
'Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"

%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Unidades Vendidas por Vendedor y por Familia</title>
<!--#include file="X001Z001.INC"-->
</head>

<body>


<%
	Datos_Compania wDEL, wURI
	
	strCnn	= Application("XDTA300_ConnectionString")
	
	wCCI = Session("glCiaInternet")
	wCIA = Session("glCia")
	
	wNLP = trim(Request.QueryString("NLP"))
	wVIS = trim(Request.QueryString("VIS"))
	wCVE = trim(Request.QueryString("CVE"))
	wMES = Request.Form("MES")
	wFDE = Request.Form("FDE")
	wFHA = Request.Form("FHA")

	IF IsNull(wMES) Or wMES = "" Then
		wMES = TRIM(Request.QueryString("MES"))
	End If 
	
	IF IsNull(wMES) Or wMES = "" Then
		wMES = Right("00" & Month(Now),2)
	End If 
	
	IF IsNull(wFDE) Or wFDE = "" Then
		wFDE = TRIM(Request.QueryString("FDE"))
	End If 
	
	IF IsNull(wFHA) Or wFHA = "" Then
		wFHA = TRIM(Request.QueryString("FHA"))
	End If

	
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

	'wDiaFinal = LastDayOfMonth(wMes_Actual, wAno_Actual)
	'wDiaFinal = Right("00" & wDiaFinal, 2)
	'wFECHAI = wAno_Actual & "-" & wMes_Actual & "-01 00:00:00"
	'wFECHAF = wAno_Actual & "-" & wMes_Actual & "-" & wDiaFinal & " 23:59:59"

	wDia_Actual = left(wFDE,2)
	wMes_Actual = mid(wFDE,4,2)
	wAno_Actual = right(wFDE,4)	
	wFECHAI = wAno_Actual & "-" & wMes_Actual & "-" & wDia_Actual &" 00:00:00"
	
	wDia_Final = left(wFHA,2)
	wMes_Actual = mid(wFHA,4,2)
	wAno_Actual = right(wFHA,4)	
	wFECHAF = wAno_Actual & "-" & wMes_Actual & "-" & wDia_Final & " 23:59:59"
	

	wFED = wFECHAI 
	wFEH = wFECHAF 
	
	wTME = DateDiff("m",wFED,wFEH) 
	wTME = wTME + 1

	SQL = " SELECT B300120DEC "
	SQL = SQL & " FROM X300BF120 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " B300120CCI = '" & Session("glCiaInternet") & "' AND " 
	SQL = SQL & " B300120NPS = '" & wNLP & "'" 
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN		
		wDEC = TRIM(rstQuery.Fields("B300120DEC"))
	END IF
	rstQuery.Close 
	set rstQuery = nothing


	SQL = " SELECT Z300002FAR, Z300002FDE, Z300002FHA "
	SQL = SQL & "  FROM X300ZF002 "
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300002CCI = '" & Session("glCiaInternet") & "' " 
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

	SQL = " SELECT SUM(D300005FAC) AS D300005FAC, ISNULL(SUM(D300005PRE),1) AS D300005PRE, "
	SQL = SQL & "  SUM(D300005CON) AS D300005CON, SUM(D300005RET) AS D300005RET " 
	SQL = SQL & "  FROM X300DF005 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " D300005CCI = '" & Session("glCiaInternet") & "' AND " 
	SQL = SQL & " D300005FED >= '" & wFED & "' AND "
	SQL = SQL & " D300005FEH <= '" & wFEH & "' "
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
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		
		wD300005CON = cdbl(rstQuery.Fields("D300005CON"))
		wD300005RET = cdbl(rstQuery.Fields("D300005RET"))
	
		

	
		wTCI = wD300005RET + CDBL(wD300005CON)
	
		wD300005FAC = cdbl(rstQuery.Fields("D300005FAC"))	
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

	wD300005RET = FormatNumber(wD300005RET,0)
	wD300005CON = FormatNumber(wD300005CON,0)
	wD300005FAC = FormatNumber(wD300005FAC,2)
	wD300005PRE = FormatNumber(wD300005PRE,2)	

%>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;</p>






	<p style="margin-top: 0; margin-bottom: 0">&nbsp;</p>
	<table border="1" width="100%" style="border-width: 0px" cellspacing="1">
		<td colspan="3"  style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium; width:10%" align="CENTER">
		<font face="Tahoma" size="2"><b><% =wNLP & " - " & wDEC %></b> </font> 
		</td>

	</tr>
	<tr>
		<td style="border-style: none; border-width: medium" width="25%"><u>
		<font size="2"><b>Vendedor</b></font><b><font face="Tahoma" size="2"></font></b></u></td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium; width:10%" align="center">		&nbsp;</td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium" width="10%" align="center">&nbsp;</td>
	</tr>
	<tr>
		<td style="border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium" width="25%">&nbsp;</td>
		<td style="border-left-style: solid; border-left-width: 1px; border-top-style: solid; border-top-width: 1px; width:20%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<font size="2"><b>Unidades Vendidas (l)</b></font></td>
		<td style="border-top-style: solid; border-top-width: 1px" width="20%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<font size="2"><b>Bolívares</b></font></td>
		
			</tr>
			

	<%			
		SQL = " SELECT ISNULL(A300020NOM,'NO DISPONIBLE') AS A300020NOM, B300120NPS, "
		SQL = SQL & "  SUM(D300004UNA) AS UVE, SUM(D300004FAC) AS MTO, ISNULL(SUM(D300004PRE), 0) AS UNI, "
		SQL = SQL & " D300004CVE "
		SQL = SQL & "  FROM X300DQ004 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " D300004CCI = '" & Session("glCiaInternet") & "' AND " 
		SQL = SQL & " D300004FED >= '" & wFED & "' AND "
		SQL = SQL & " D300004FEH <= '" & wFEH & "' "
		SQL = SQL & " AND B300120NPS = '" & wNLP & "' "
		SQL = SQL & "  GROUP BY D300004CVE, A300020NOM, B300120NPS  "
		SQL = SQL & "  ORDER BY UVE DESC " 	
		'response.write sql 
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
	    rstQuery.Open sql , strCnn
	    wTUVE = 0
		wTMNE = 0
		wTUNI = 0

		DO WHILE NOT rstQuery.EOF 
		
			wDEC = TRIM(rstQuery.Fields("A300020NOM"))
			wNLP = TRIM(rstQuery.Fields("D300004CVE"))

			wUVE = cdbl(rstQuery.Fields("UVE"))
			wMNE = cdbl(rstQuery.Fields("MTO"))
			IF wVIS = "P" THEN
				wMNE = wMNE / wTME
				wUVE = wUVE / wTME	
			END IF 
		
			wTUVE = wTUVE + CDBL(wUVE)
			wTMNE = wTMNE + CDBL(wMNE)
			wTUNI = wTUNI + CDBL(wUNI)
			
			
			
			
			wUNI = cdbl(rstQuery.Fields("UNI"))
			
			
			IF (Session("glTipoUsuario") = "A" OR Session("glUsuario") = "VENTAS3") AND wCVE = "000" THEN
				wUNI = 0 'cdbl(rstQuery.Fields("UNI2"))
			END IF 
			
			IF wUNI > 0 THEN
				wPOBJ = ((wUVE / wUNI) * 100)
				ELSE
				wPOBJ = "0"  
			END IF 


			Response.write "<tr>"
				Response.write "<td style=""font-family: Tahoma; font-size: 8pt; border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium"" width=""25%"">"
					IF (Session("glTipoUsuario") = "A" OR Session("glUsuario") = "VENTAS3") AND wCVE = "000" THEN
						wURLD = "X001X152.ASP" & "?NLP=" & wNLP
						Response.write "<font color=""#0000FF"" onclick=javascript:window.open('" & wURLD & "','_parent'); style=""CURSOR: pointer""><b>"
					END IF 
					Response.write wDEC & " (" & wNLP & ")" 
				Response.write "</td>"			
				Response.write "<td style=""font-family: Tahoma; font-size: 9pt; border-left-style: solid; border-left-width: 1px"" width=""88"" bordercolor=""#000000"" align=""right"">"
					Response.write FormatNumber(wUVE,2)
				Response.write "</td>"
				Response.write "<td style=""font-family: Tahoma; font-size: 9pt""  width=""88"" bordercolor=""#000000"" align=""right"">"
					Response.write FormatNumber(wMNE,2)
				Response.write "</td>"
			Response.write "</tr>"

	
			rstQuery.MoveNext 
		LOOP
		rstQuery.CLOSE
		SET rstQuery = NOTHING	
		
		'wTUVE = wTUVE + wUVE
		'wTMNE = wTMNE + wMNE
		'wTUNI = wTUNI + wUNI

		
		IF wTUNI > 0 THEN
			wPOBJ = FormatNumber(((wTUVE / wTUNI) * 100) ,1) & "%"
		END IF 

		Response.write "<tr>"
			Response.write "<td style=""font-family: Tahoma; font-size: 8pt; border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium"" width=""25%"" align=""left"">"
				Response.write "<b>Total Ventas:</b>"
			Response.write "</td>"			
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; color: #0000FF; border-left-style: solid; border-left-width: 1px"" width=""88"" bordercolor=""#000000"" align=""right"">"
				Response.write  FormatNumber(wTUVE,2)
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; color: #0000FF"" width=""88"" bordercolor=""#000000"" align=""right"">"
				Response.write  FormatNumber(wTMNE,2)
			Response.write "</td>"
			
		Response.write "</tr>"

	
			
%>
</table> 



<br><br>

<p align="center"  >
<INPUT type='button' value='Regresar' id=button1 name=button1 OnClick='javascript:history.back()'>
</p> 





<br><br>

<p align="center" style="margin-top: 3px; margin-bottom: 3px"><b>Fecha Actualización Datos del Reporte: </b><%= wFAR %>

</p>

<br><br>
 <!--#include file="X001Y007.PRC"-->
</body>

</html>