<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Ventas por Zona</title>
</head>

<body>


<%

	strCnn	= Application("XDTA300_ConnectionString")

	SQL = " SELECT D300005FED, D300005FEH "
	SQL = SQL & "  FROM X300DF005 " 
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN		
		wD300005FED = rstQuery.Fields("D300005FED")
		wD300005FEH = rstQuery.Fields("D300005FEH")
		wD300005FED = right("0" & Day(wD300005FED),2) & "-" & right("0" & Month(wD300005FED),2) & "-" & Year(wD300005FED)
		wD300005FEH = right("0" & Day(wD300005FEH),2) & "-" & right("0" & Month(wD300005FEH),2) & "-" & Year(wD300005FEH)
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	
	wFECHA = right("0" & Day(Date),2) & "-" & right("0" & Month(Date),2) & "-" & Year(Date)	

%>


<p><img border="0" src="images/Logo2.gif" width="179" height="64"></p>


<p align="center" style="margin-top: 0; margin-bottom: 4px"><font face="Tahoma" size="2"><b>Periodo del: </b><%= wD300005FED %> <b>al:</b> <%= wD300005FEH %>

</p>

<p align="center" style="margin-top: 3px; margin-bottom: 3px"><b>Fecha del Reporte: </b><%= wFECHA %>

</p>


<%

	strCnn	= Application("XDTA300_ConnectionString")

	SQL = " SELECT SUM(D300005DEM)/1000 AS D300005DEM, SUM(D300005PRD)/1000 AS D300005PRD, SUM(D300005FAC)/1000 AS D300005FAC, "
	SQL = SQL & "  SUM(D300005INS)/1000 AS D300005INS, SUM(D300005PRE)/1000 AS D300005PRE, SUM(D300005FOR)/1000 AS D300005FOR, "
	SQL = SQL & "  D300005CON, D300005RET " 
	SQL = SQL & "  FROM X300DF005 " 
	SQL = SQL & "  GROUP BY D300005CON, D300005RET " 
	'SQL = SQL & " WHERE "
	'SQL = SQL & " Z300002DEC = '" &  Session("glCiaInternet") & "' AND "	
	'SQL = SQL & " Z300001PUS = '" &  Session("glUsuario") & "' "		
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		
		wD300005CON = cdbl(rstQuery.Fields("D300005CON"))
		wD300005RET = cdbl(rstQuery.Fields("D300005RET"))
		wD300005RET = FormatNumber(wD300005RET,2)
		wD300005DEM = cdbl(rstQuery.Fields("D300005DEM"))
		'wD300005DEM = FormatNumber(wD300005DEM/wD300005CON,2)
		wD300005DEM = FormatNumber(wD300005DEM,2)
		wD300005PRD = cdbl(rstQuery.Fields("D300005PRD"))
		wD300005FAC = cdbl(rstQuery.Fields("D300005FAC"))
		'wD300005FAC = FormatNumber(wD300005FAC/wD300005CON,2)
		wD300005FAC = FormatNumber(wD300005FAC,2)
		wD300005INS = cdbl(rstQuery.Fields("D300005INS"))			
		'wD300005INS = FormatNumber(wD300005INS,2)
		'wD300005INS = FormatNumber(wD300005INS/wD300005CON,2)
		wD300005INS = FormatNumber(wD300005INS,2)
		wDEMBO = FormatNumber(cdbl(wD300005DEM) + wD300005INS,2)	
		wD300005PRE = cdbl(rstQuery.Fields("D300005PRE"))
		'wD300005PRE = FormatNumber(wD300005PRE/wD300005CON,2)	
		wD300005PRE = FormatNumber(wD300005PRE,2)	
		wD300005FOR = cdbl(rstQuery.Fields("D300005FOR"))
		
		 wPPE = FormatNumber((wD300005DEM / wD300005PRE) * 100, 1)
		 wPDB = FormatNumber(((cdbl(wD300005DEM) + wD300005INS) / wD300005PRE) * 100, 1)
		 wPFB = FormatNumber(((cdbl(wD300005FAC) + wD300005INS) / wD300005PRE) * 100, 1)
		 wPFA = FormatNumber((wD300005FAC / wD300005PRE) * 100, 1)
		

	END IF
	rstQuery.Close 
	set rstQuery = nothing

	'SQL = " SELECT D300004UND, D300004UIB"
	'SQL = SQL & "  FROM X300DF004 " 
	'SQL = SQL & " WHERE "
	'SQL = SQL & " D300004FAM = '001' "	
	'Set rstQuery = Server.CreateObject("ADODB.Recordset")
    'rstQuery.Open sql , strCnn
	'IF NOT rstQuery.EOF THEN
		
	'	wD300004UND = cdbl(rstQuery.Fields("D300004UND"))
	'	wD300004UND = FormatNumber(wD300004UND,0)		
	'	wD300004UIB = cdbl(rstQuery.Fields("D300004UIB"))
	'	wD300004UIB = FormatNumber(wD300004UIB,0)		

	'END IF
	'rstQuery.Close 
	'set rstQuery = nothing

%>


<!--<table border="1" width="100%" style="border-width: 0px" cellspacing="1">
	<tr>
		<td style="border-style: none; border-width: medium" width="25%"><u><b>
		<font face="Tahoma" size="2">Ventas:</font></b></u></td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium" width="12%"></td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium" width="12%">&nbsp;</td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium" width="12%">&nbsp;</td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium" width="13%">&nbsp;</td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium" width="12%">&nbsp;</td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium" width="12%">&nbsp;</td>
	</tr>
	<tr>
		<td style="border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium" width="25%">&nbsp;</td>
		<td style="border-left-style: solid; border-left-width: 1px; border-top-style: solid; border-top-width: 1px" width="12%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<b><font face="Tahoma" size="2">Pedidos del Mes</font></b></td>
		<td style="border-top-style: solid; border-top-width: 1px" width="12%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<b><font face="Tahoma" size="2">Dem. + B/O</font></b></td>
		<td style="border-top-style: solid; border-top-width: 1px" width="12%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<b><font face="Tahoma" size="2">Facturado</font></b></td>
		<td style="border-top-style: solid; border-top-width: 1px" width="13%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<b><font face="Tahoma" size="2">Pedidos Retenidos</font></b></td>
		<td style="border-top-style: solid; border-top-width: 1px" width="12%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<b><font face="Tahoma" size="2">B/O Final</font></b></td>
		<td style="border-top-style: solid; border-top-width: 1px" align="center" bgcolor="#C0C0C0" width="12%" bordercolor="#000000">
		<b><font face="Tahoma" size="2">MYB</font></b></td>
	</tr>
	<tr>
		<td style="border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium" width="25%">&nbsp;</td>
		<td style="border-left-style: solid; border-left-width: 1px" width="12%" align="center" bordercolor="#000000"><font face="Tahoma" size="2"><%="$" & wD300005DEM%></font></td>
		<td width="12%" align="center" bordercolor="#000000"><font face="Tahoma" size="2"><%="$" & wDEMBO%></font></td>
		<td width="12%" align="center" bordercolor="#000000"><font face="Tahoma" size="2"><%="$" & wD300005FAC%></font></td>
		<td width="13%" align="center" bordercolor="#000000"><font face="Tahoma" size="2"><%="$" & wD300005RET%></font></td>
		<td width="12%" align="center" bordercolor="#000000"><font face="Tahoma" size="2"><%="$" & wD300005INS%></font></td>
		<td width="12%" align="center" bordercolor="#000000"><font face="Tahoma" size="2" color="#000099"><%="$" & wD300005PRE%></font></td>
	</tr>
</table>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;</p>
<table border="1" width="100%" style="border-width: 0px; font-family:Tahoma; font-size:10px" cellspacing="1">
	<tr>
		<td style="border-style: none; border-width: medium" width="26%"><u><b>
		<font face="Tahoma" size="2">% Cumplimiento del Presupuesto:</font></b></u></td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium;" width="25%">&nbsp;</td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium" width="25%">&nbsp;</td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium" width="25%">&nbsp;</td>
	</tr>
	<tr>
		<td style="border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium" width="26%">&nbsp;</td>
		<td style="border-left-style: solid; border-left-width: 1px; border-top-style: solid; border-top-width: 1px; width:25%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<b><font face="Tahoma" size="2">Pedidos</font></b></td>
		<td style="border-top-style: solid; border-top-width: 1px" width="25%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<b><font face="Tahoma" size="2">Pedidos + B/O</font></b></td>
		<td style="border-top-style: solid; border-top-width: 1px" width="25%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<b><font face="Tahoma" size="2">Facturado</font></b></td>
	</tr>
	<tr>
		<td style="border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium" width="26%">&nbsp;</td>
		<td style="border-left-style: solid; border-left-width: 1px; width:25%" align="center" bordercolor="#000000"><font face="Tahoma" size="2"><%=wPPE & "%"%></font></td>
		<td width="25%" align="center" bordercolor="#000000"><font face="Tahoma" size="2"><%=wPDB & "%"%></font></td>
		<td width="25%" align="center" bordercolor="#000000"><font face="Tahoma" size="2"><%=wPFA & "%"%></font></td>
	</tr>
</table>
<p style="margin-top: 0; margin-bottom: 0">&nbsp;</p>
<table border="1" width="100%" style="border-width: 0px" cellspacing="1">
	<tr>
		<td style="border-style: none; border-width: medium; font-family:Tahoma; font-size:10px" width="25%"><u><b>
		<font face="Tahoma" size="2">Unidades Amortiguadores:</font></b></u></td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium" width="37%">&nbsp;</td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium" width="37%">&nbsp;</td>
	</tr>
	<tr>
		<td style="border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium" width="25%">&nbsp;</td>
		<td style="border-left-style: solid; border-left-width: 1px; border-top-style: solid; border-top-width: 1px" width="37%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<b><font face="Tahoma" size="2">Facturado</font></b></td>
		<td style="border-top-style: solid; border-top-width: 1px" width="37%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<b><font face="Tahoma" size="2">B/O Final</font></b></td>
	</tr>
	<tr>
		<td style="border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium" width="25%">&nbsp;</td>
		<td style="border-left-style: solid; border-left-width: 1px" width="37%" bordercolor="#000000" align="center"><font face="Tahoma" size="2"><%=wD300004UND %></font></td>
		<td width="37%" bordercolor="#000000" align="center"><font face="Tahoma" size="2" ><%=wD300004UIB %></font></td>
	</tr>
</table>
-->

<p style="margin-top: 0; margin-bottom: 0">&nbsp;</p>
<table border="1" width="100%" style="border-width: 0px" cellspacing="1">
	<tr>
		<td style="border-style: none; border-width: medium" width="25%"><u><b>
		<font face="Tahoma" size="2">Detalle de Ventas por Zona:</font></b></u></td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium; width:10%" align="center">
		<font face="Tahoma" size="2"><b>MM U.S.$</b></font></td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium" width="10%" align="center">&nbsp;</td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium" width="10%" align="center">&nbsp;</td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium" width="10%" align="center">&nbsp;</td>
		<td style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium; background-color:#CCFFCC" width="30%" align="center" colspan="3">
		<b><font face="Tahoma" size="2">% Cumplimiento Objetivo</font></b></td>
	</tr>
	<tr>
		<td style="border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium" width="25%">&nbsp;</td>
		<td style="border-left-style: solid; border-left-width: 1px; border-top-style: solid; border-top-width: 1px; width:10%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<b><font face="Tahoma" size="2">Pedidos</font></b></td>
		<td style="border-top-style: solid; border-top-width: 1px" width="10%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<b><font face="Tahoma" size="2">Facturado</font></b></td>
		<td style="border-top-style: solid; border-top-width: 1px" width="10%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<b><font face="Tahoma" size="2">B/O Final</font></b></td>
		<td style="border-top-style: solid; border-top-width: 1px" width="10%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<b><font face="Tahoma" size="2">Objetivo</font></b></td>
		<td style="border-top-style: solid; border-top-width: 1px" width="10%" align="center" bgcolor="#C0C0C0" bordercolor="#000000">
		<b><font face="Tahoma" size="2">Pedidos</font></b></td>
		<td style="border-top-style: solid; border-top-width: 1px" align="center" bgcolor="#C0C0C0" width="10%" bordercolor="#000000">
		<b><font face="Tahoma" size="2">Facturado</font></b></td>
		<td style="border-top-style: solid; border-top-width: 1px" align="center" bgcolor="#C0C0C0" bordercolor="#000000" width="10%">
		<b><font face="Tahoma" size="2">Fact. + B/O</font></b></td>
	</tr>
	
	
	<%' ******************COMIENZO DETALLE************************ %>
	
	<%
	
	SQL = " SELECT A300021DES, SUM(D300005DEM)/1000 as D300005DEM, SUM(D300005PRD)/1000 as D300005PRD, SUM(D300005FAC)/1000 as D300005FAC, "
	SQL = SQL & "  SUM(D300005INS)/1000 as D300005INS, SUM(D300005PRE)/1000 as D300005PRE, SUM(D300005FOR)/1000 as D300005FOR, "
	SQL = SQL & "  SUM(D300005CON)/1000 as D300005CON, SUM(D300005RET)/1000 as D300005RET " 
	SQL = SQL & "  FROM X300DQ005_2 " 
	SQL = SQL & "  GROUP BY A300021DES " 	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	DO WHILE NOT rstQuery.EOF 
		
		wNUS = TRIM(rstQuery.Fields("A300021DES"))
		IF ISNULL(wNUS) THEN
			'wNUS = TRIM(rstQuery.Fields("D300005CVE"))
		END IF 
		 
		wDEM = FormatNumber(cdbl(rstQuery.Fields("D300005DEM")),1)
		wFAC = FormatNumber(cdbl(rstQuery.Fields("D300005FAC")),1)
		wINS = FormatNumber(cdbl(rstQuery.Fields("D300005INS")),1)
		wPRE = FormatNumber(cdbl(rstQuery.Fields("D300005PRE")),1)
		wPDEM = FormatNumber(((wDEM / wPRE) * 100) ,1) & "%"
		wPFAC = FormatNumber(((wFAC / wPRE) * 100) ,1) & "%"
		wPFBO = FormatNumber((((cdbl(wFAC)+ wINS) / wPRE) * 100) ,1) & "%"
		
		Response.write "<tr>"
			Response.write "<td style=""font-family: Tahoma; font-size: 8pt; border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium"" width=""25%"">"
				Response.write left(wNUS,38)
			Response.write "</td>"			
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; border-left-style: solid; border-left-width: 1px"" width=""88"" bordercolor=""#000000"" align=""right"">"
				Response.write wDEM
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt"" width=""88"" bordercolor=""#000000"" align=""right"">"
				Response.write wFAC
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt"" width=""94"" bordercolor=""#000000"" align=""right"">"
				Response.write wINS
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt"" width=""87"" bordercolor=""#000000"" align=""right"">"
				Response.write wPRE
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; background-color:#CCFFCC"" width=""110"" bordercolor=""#000000"" align=""right"">"
				Response.write wPDEM
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; background-color:#CCFFCC"" width=""108"" bordercolor=""#000000"" align=""right"">"
				Response.write wPFAC			
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; background-color:#CCFFCC"" bordercolor=""#000000"" align=""right"">"
				Response.write wPFBO
			Response.write "</td>"
		Response.write "</tr>"
	
	
		rstQuery.MoveNext 
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	Response.write "<tr>"
			Response.write "<td style=""font-family: Tahoma; font-size: 8pt; border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium"" width=""25%"" align=""left"">"
				Response.write "<b>Totales Ventas x Zona:</b>"
			Response.write "</td>"			
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; color: #0000FF; border-left-style: solid; border-left-width: 1px"" width=""88"" bordercolor=""#000000"" align=""right"">"
				Response.write wD300005DEM
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; color: #0000FF"" width=""88"" bordercolor=""#000000"" align=""right"">"
				Response.write wD300005FAC
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; color: #0000FF"" width=""94"" bordercolor=""#000000"" align=""right"">"
				Response.write wD300005INS
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
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; color: #0000FF; background-color:#CCFFCC"" bordercolor=""#000000"" align=""right"">"
				Response.write wPFB & "%"
			Response.write "</td>"
		Response.write "</tr>"

	
	%>
	
	<%' ************************FIN DETALLE************************ %>
	
	
	
</table>

<% 'END IF %>

<p align="center"><b>Nota: &quot;Este reporte es actualizado cada 6 horas por 
nuestros sistemas&quot; </b></p>


</body>

</html>