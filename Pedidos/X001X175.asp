
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
	
	wCVE = trim(Request.QueryString("CVE"))
	wVIS = trim(Request.QueryString("VIS"))
	wMES = Request.Form("MES")
	wFDE = Request.Form("FDE")
	wFHA = Request.Form("FHA")

	IF IsNull(wMES) Or wMES = "" Then
		wMES = TRIM(Request.QueryString("MES"))
	End If 
	
	IF IsNull(wFDE) Or wFDE = "" Then
		wFDE = TRIM(Request.QueryString("FDE"))
	End If 
	
	IF IsNull(wFHA) Or wFHA = "" Then
		wFHA = TRIM(Request.QueryString("FHA"))
	End If 
	
	IF IsNull(wMES) Or wMES = "" Then
		wMES = Right("00" & Month(Now),2)
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

	SQL = " SELECT A300020NOM "
	SQL = SQL & " FROM X300AF020 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " A300020CCI = '" & Session("glCiaInternet") & "' AND " 
	SQL = SQL & " A300020CVE = '" & wCVE & "'" 
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN		
		wNOM = TRIM(rstQuery.Fields("A300020NOM"))
	END IF
	rstQuery.Close 
	set rstQuery = nothing

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
	SQL = SQL & "  FROM X300ZF002 WHERE " 
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

	
wNOM = wCVE & " - " & wNOM

IF wCVE = "000" THEN
	wNOM = "TODOS LOS VENDEDORES"
END IF 	

%>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;</p>






	<p style="margin-top: 0; margin-bottom: 0">&nbsp;</p>
	<table border="1" width="100%" style="border-width: 0px" cellspacing="1">
	<tr>
		<td colspan="2"  style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-bottom-style: none; border-bottom-width: medium; width:10%" align="CENTER">
		<font face="Tahoma" size="2"><b><% =wNOM %></b> </font> 
		</td>
	</tr>	
	<tr>
		<td colspan="2"  style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium; width:10%" align="CENTER">
		<font face="Tahoma" size="2"><b><% =wNLP & " - " & wDEC %></b> </font> 
		</td>
	</tr>
	<tr>
		<td style="border-style: none; border-width: medium" width="25%"><u>
		<font size="2"><b>Producto</b></font><b><font face="Tahoma" size="2"></font></b></u></td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium; width:10%" align="center">		&nbsp;</td>
		<!--<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium" width="10%" align="center">&nbsp;</td>-->
	</tr>
	<tr>
		<td style="border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium" width="60%">&nbsp;</td>
		<td style="border-left-style: solid; border-left-width: 1px; border-top-style: solid; border-top-width: 1px; width:40%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<font size="2"><b>Unidades Vendidas (l)</b></font></td>
		<!--<td style="border-top-style: solid; border-top-width: 1px" width="20%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<font size="2"><b>Bolívares</b></font></td>-->
		
			</tr>
			

	<%			
		SQL = " SELECT B300201CPR, B300201DEL, B300201APL, "
		SQL = SQL & " ISNULL(SUM(B300201UPE*B300201UNR), 0) AS UVE "
		SQL = SQL & " FROM X300BF201, X300BF200 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " B300200CCI = '" & Session("glCiaInternet") & "' AND " 
		SQL = SQL & " B300200NFA = B300201NFA AND "
		SQL = SQL & " B300200CVE <> '01' AND "
		IF wCVE <> "000" THEN
			SQL = SQL & " B300200CVE = '" & wCVE & "' AND "
		END IF 
		SQL = SQL & " B300201FAC >= '" & wFED & "' AND "
		SQL = SQL & " B300201FAC <= '" & wFEH & "' "
		SQL = SQL & " AND B300201NPS = '" & wNLP & "' "
		SQL = SQL & " GROUP BY B300201CPR, B300201DEL, B300201APL "
		SQL = SQL & " ORDER BY UVE DESC " 	
		'response.write sql 
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
	    rstQuery.Open sql , strCnn
	    wTUVE = 0
		wTMNE = 0
		wTUNI = 0
		wCuenta = 0
		DO WHILE NOT rstQuery.EOF 
		
			wCPR = TRIM(rstQuery.Fields("B300201CPR"))
			wDEL = TRIM(rstQuery.Fields("B300201DEL"))
			wAPL = TRIM(rstQuery.Fields("B300201APL"))

			wUVE = cdbl(rstQuery.Fields("UVE"))
			
			IF wVIS = "P" THEN
				wUVE = wUVE / wTME 
			END IF 
			Response.write "<tr>"
				Response.write "<td style=""font-family: Tahoma; font-size: 8pt; border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium"" width=""25%"">"
					Response.write wCPR & " - " & wDEL & " " & wAPL
				Response.write "</td>"			
				Response.write "<td style=""font-family: Tahoma; font-size: 9pt; border-left-style: solid; border-left-width: 1px"" width=""88"" bordercolor=""#000000"" align=""right"">"
					Response.write FormatNumber(wUVE,2)
				Response.write "</td>"
				'Response.write "<td style=""font-family: Tahoma; font-size: 9pt""  width=""88"" bordercolor=""#000000"" align=""right"">"
				'	Response.write FormatNumber(wMNE,2)
				'Response.write "</td>"
			Response.write "</tr>"

			wTUVE = wTUVE + CDBL(wUVE)
			wCuenta = wCuenta + 1
	
			rstQuery.MoveNext 
		LOOP
		rstQuery.CLOSE
		SET rstQuery = NOTHING	
		
		

		
		
		Response.write "<tr>"
			Response.write "<td style=""font-family: Tahoma; font-size: 8pt; border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium"" width=""25%"" align=""left"">"
				Response.write "<b>Total (" & wCuenta & "):</b>"
			Response.write "</td>"			
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; color: #0000FF; border-left-style: solid; border-left-width: 1px"" width=""88"" bordercolor=""#000000"" align=""right"">"
				Response.write  FormatNumber(wTUVE,2)
			Response.write "</td>"
			'Response.write "<td style=""font-family: Tahoma; font-size: 9pt; color: #0000FF"" width=""88"" bordercolor=""#000000"" align=""right"">"
			'	Response.write  FormatNumber(wTMNE,2)
			'Response.write "</td>"
			
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