
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
<title>Ventas por Vendedor y por Cliente</title>
<!--#include file="X001Z001.INC"-->
</head>

<body>


<%
	Datos_Compania wDEL, wURI
	
	strCnn	= Application("XDTA300_ConnectionString")
	
	wCCI = Session("glCiaInternet")
	wCIA = Session("glCia")
	
	
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
	wDiaFinal = LastDayOfMonth(wMes_Actual, wAno_Actual)
	wDiaFinal = Right("00" & wDiaFinal, 2)
	wFECHAF = wAno_Actual & "-" & wMes_Actual & "-" & wDia_Final & " 23:59:59"
	wFECHAF2 = wAno_Actual & "-" & wMes_Actual & "-" & wDiaFinal & " 23:59:59"
	
	wFED = wFECHAI 
	wFEH = wFECHAF 
	wFEH2 = wFECHAF2 
	
	wTME = DateDiff("m",wFED,wFEH) 
	wTME = wTME + 1
	
	SQL = " SELECT isnull(SUM(D300005FAC),0) AS D300005FAC, ISNULL(SUM(D300005PRE),1) AS D300005PRE, "
	SQL = SQL & "  isnull(SUM(D300005CON),0) AS D300005CON, isnull(SUM(D300005RET),0) AS D300005RET, "
	SQL = SQL & "  isnull(SUM(D300005PRD),0) AS NOTAS "
	SQL = SQL & "  FROM X300DF005 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " D300005CCI = '" & wCCI & "' AND "
	SQL = SQL & " D300005FED >= '" & wFED & "' AND "
	SQL = SQL & " D300005FEH <= '" & wFEH2 & "' AND "
	SQL = SQL & " D300005CVE = '" & wCVE & "' "
	'RESPONSE.WRITE SQL 
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
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
	
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	

	SQL = " SELECT A300020NOM "
	SQL = SQL & " FROM X300AF020 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " A300020CCI = '" & wCCI & "' AND " 
	SQL = SQL & " A300020CVE = '" & wCVE & "'" 
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN		
		wNOM = TRIM(rstQuery.Fields("A300020NOM"))
	END IF
	rstQuery.Close 
	set rstQuery = nothing

	
	SQL = " SELECT Z300002FAR, Z300002FDE, Z300002FHA "
	SQL = SQL & "  FROM X300ZF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300002CCI = '" & wCCI & "' "
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
		<td colspan="3" valign="bottom" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-bottom-style: none; border-bottom-width: medium; width:10%" align="CENTER">
&nbsp;
		</td>
	</tr>	
	<tr>
		<td colspan="3" height="5"   style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium; width:10%" align="CENTER">
			<font face="Tahoma" size="2"><b><% =wNOM %></b> </font> 
		</td>
	</tr>

	<tr>
		<td style="border-style: none; border-width: medium" width="25%"><u>
		<font size="2"><b>Cliente</b></font><b><font face="Tahoma" size="2"></font></b></u></td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium; width:10%" align="center">		&nbsp;</td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium" width="10%" align="center">&nbsp;</td>
	</tr>
	<tr>
		<td style="border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium" width="40%">&nbsp;</td>
		<td style="border-left-style: solid; border-left-width: 1px; border-top-style: solid; border-top-width: 1px; width:20%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<font size="2" face="Tahoma"><b>Items Vendidos</b></font></td>
		<td style="border-top-style: solid; border-top-width: 1px" width="20%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<font size="2"><b>Bolívares</b></font></td>
		
			</tr>
			

	<%			
		SQL = " SELECT B300200CCL, A300002RSO, "
		SQL = SQL & " ISNULL(SUM(B300201UPE), 0) AS UVE, "

		SQL = SQL & " (SELECT isnull(sum(B300200MNE),0) "
		SQL = SQL & " FROM  X300BF200 b WHERE "
		SQL = SQL & " b.B300200CVE <> '01' AND "
		SQL = SQL & " b.B300200CVE = '" & wCVE & "' AND "
		SQL = SQL & " B300200FEC >= '" & wFED & "' AND "
		SQL = SQL & " B300200FEC <= '" & wFEH & "' "
		SQL = SQL & " AND b.B300200CCL = a.B300200CCL) AS MNE, "
		SQL = SQL & " count(DISTINCT B300201CPR) as ITE "
		SQL = SQL & " FROM X300BF201, X300BQ200 a" 
		SQL = SQL & " WHERE "
		SQL = SQL & " a.B300200CCI = '" & wCCI & "' AND "
		SQL = SQL & " a.B300200NFA = B300201NFA AND "
		SQL = SQL & " a.B300200CVE <> '01' AND "
		IF wCVE <> "000" THEN
			SQL = SQL & " a.B300200CVE = '" & wCVE & "' AND "
		END IF 
		SQL = SQL & " B300201FAC >= '" & wFED & "' AND "
		SQL = SQL & " B300201FAC <= '" & wFEH & "' "
		'SQL = SQL & " AND A.B300200CCL = '02709' "
		SQL = SQL & " GROUP BY a.B300200CCL, a.A300002RSO "
		SQL = SQL & " ORDER BY ITE DESC " 	
		'response.write sql 
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
	    rstQuery.Open sql , strCnn
	    wTUVE = 0
		wTMNE = 0
		wTUNI = 0
		wCuenta = 0
		DO WHILE NOT rstQuery.EOF 
		
			wCCL = TRIM(rstQuery.Fields("B300200CCL"))
			wRSO = TRIM(rstQuery.Fields("A300002RSO"))
			
			wUVE = cdbl(rstQuery.Fields("UVE"))
			
			wMNE = cdbl(rstQuery.Fields("MNE"))
			
			IF wVIS = "P" THEN
				wMNE = wMNE / wTME
			END IF 
			
			
			wFDESDE = wFED
			wFHASTA = wFED
			wTITE = ""
			
			For wMES = 0 to wTME - 1
	
				wMes_Actual = Month(wFHASTA)
				wAno_Actual = YEAR(wFHASTA)
				'Response.write wMes_Actual & " - " & wAno_Actual & "<br>"
				wDiaFinal = LastDayOfMonth(wMes_Actual, wAno_Actual)
				'Response.write wDiaFinal & "<br>"
		
				wFDESDE = YEAR(wFDESDE) & "-" & Right("00" & Month(wFDESDE),2) & "-" & Right("00" & Day(wFDESDE),2) & " 00:00:00"
				wFHASTA = YEAR(wFHASTA) & "-" & Right("00" & Month(wFHASTA),2) & "-" & Right("00" & wDiaFinal,2) & " 23:59:59"
	
		
				SQL = " SELECT "
				SQL = SQL & " count(DISTINCT B300201CPR) as ITE "
				SQL = SQL & " FROM X300BF201, X300BF200 " 
				SQL = SQL & " WHERE "
				SQL = SQL & " B300200CCI = '" & wCCI & "' AND "
				SQL = SQL & " B300200NFA = B300201NFA AND "
				SQL = SQL & " B300200CVE <> '01' AND "
				SQL = SQL & " B300200CCL = '" & wCCL & "' AND "
				IF wCVE <> "000" THEN
					SQL = SQL & " B300200CVE = '" & wCVE & "' AND "
				END IF 
				SQL = SQL & " B300201FAC >= '" & wFDESDE & "' AND "
				SQL = SQL & " B300201FAC <= '" & wFHASTA & "' "
				'response.write sql 
				Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
			    rstQuery2.Open sql , strCnn	  
			    wITE = 0  
			    				    
				DO WHILE NOT rstQuery2.EOF 
					
					IF wTME > 1 THEN
						wITE = Right("000" & cdbl(rstQuery2.Fields("ITE")), 3)
						ELSE
						wITE = cdbl(rstQuery2.Fields("ITE"))
					END IF 		
					wTOT = wTOT + CDBL(wITE)
					'Response.write wITE & "<br>"					
					IF LEN(TRIM(wTITE)) = 0 THEN
						wTITE = wITE 
						wTTOT = wTOT 
						ELSE
						wTITE = wTITE & " - " & wITE 
						wTTOT = wTTOT & " - " & wTOT 
					END IF  
					

					rstQuery2.MoveNext 
				LOOP
				rstQuery2.CLOSE
				SET rstQuery2 = NOTHING	
				
		
				'Response.write wFDESDE & " - " & wFHASTA & "<br>"
				wFDESDE = DateAdd("m", 1, wFDESDE)
				wFHASTA = DateAdd("m", 1, wFHASTA)
		
			Next
			
			wITE = cdbl(rstQuery.Fields("ITE"))

			
		
			Response.write "<tr>"
				Response.write "<td style=""font-family: Tahoma; font-size: 8pt; border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium"" width=""25%"">"
					
					wURLVCP = "X001X178.ASP" & "?FDE=" & wFDE & "&FHA=" & wFHA & "&CVE=" & wCVE & "&CCL=" & wCCL & "&VIS=" & wVIS
					'wURLVCP = "X001X178.ASP" & "?MES=" & wMES & "&CVE=" & wCVE & "&CCL=" & wCCL
					Response.write "<table border=0 style=""font-family: Tahoma; font-size: 8pt;"" width=""100%""><tr>" 
					Response.write "<td>"
					Response.write wCCL & " - " & wRSO
					Response.write "</td>"
					Response.write "<td width=""120"" align=""center""><font color=""#0000FF"" onclick=javascript:window.open('" & wURLVCP & "','_parent'); style=""CURSOR: pointer""><b>xProducto</b></font></td>"
					Response.write "</tr></table>"
					 
				Response.write "</td>"			
				Response.write "<td style=""font-family: Tahoma; font-size: 9pt; border-left-style: solid; border-left-width: 1px"" width=""88"" bordercolor=""#000000"" align=""right"">"
					Response.write wTITE ' & " / " & FormatNumber(wITE,0)
				Response.write "</td>"
				Response.write "<td style=""font-family: Tahoma; font-size: 9pt""  width=""88"" bordercolor=""#000000"" align=""right"">"
					Response.write FormatNumber(wMNE,2)
				Response.write "</td>"
			Response.write "</tr>"

			wTUVE = wTUVE + CDBL(wITE)
			wTMNE = wTMNE + CDBL(wMNE)
			wCuenta = wCuenta + 1
	
			rstQuery.MoveNext 
		LOOP
		rstQuery.CLOSE
		SET rstQuery = NOTHING	
		
		
		wTMNE = wD300005FAC
		IF wVIS = "P" THEN
			wTMNE = wTMNE / wTME
		END IF 
		
		Response.write "<tr>"
			Response.write "<td style=""font-family: Tahoma; font-size: 8pt; border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium"" width=""25%"" align=""left"">"
				Response.write "<b>Total (" & wCuenta & "):</b>"
			Response.write "</td>"			
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; color: #0000FF; border-left-style: solid; border-left-width: 1px"" width=""88"" bordercolor=""#000000"" align=""right"">"
				Response.write wTUVE 
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