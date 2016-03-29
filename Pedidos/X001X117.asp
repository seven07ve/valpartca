<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Ventas por Familia</title>
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

	SQL = " SELECT SUM(D300004DEM/1000) AS D300004DEM, SUM(D300004PRD/1000) AS D300004PRD, SUM(D300004FAC/1000) AS D300004FAC, "
	SQL = SQL & "  SUM(D300004INS/1000) AS D300004INS, SUM(D300004PRE/1000) AS D300004PRE, SUM(D300004FOR/1000) AS D300004FOR "
	SQL = SQL & "  FROM X300DQ004 " 		
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN 
		
		'wD300004CON = cdbl(rstQuery.Fields("D300004CON"))
		'wD300004RET = cdbl(rstQuery.Fields("D300004RET"))		
		wD300004DEM = cdbl(rstQuery.Fields("D300004DEM"))
		wD300004PRD = cdbl(rstQuery.Fields("D300004PRD"))
		wD300004FAC = cdbl(rstQuery.Fields("D300004FAC"))
		wD300004INS = cdbl(rstQuery.Fields("D300004INS"))
		wD300004PRE = cdbl(rstQuery.Fields("D300004PRE"))
		wD300004FOR = cdbl(rstQuery.Fields("D300004FOR"))
		
		wD300004RET = FormatNumber(wD300004RET,2)
  		wD300004DEM = FormatNumber(wD300004DEM,2)
  		wD300004FAC = FormatNumber(wD300004FAC,2)
		wD300004INS = FormatNumber(wD300004INS,2)
		wDEMBO = FormatNumber(cdbl(wD300004DEM) + wD300004INS,2)	
		wD300004PRE = FormatNumber(wD300004PRE,2)	
		
		wPPE = FormatNumber((wD300004DEM / wD300004PRE) * 100, 1)
		wPDB = FormatNumber(((cdbl(wD300004DEM) + wD300004INS) / wD300004PRE) * 100, 1)	
		wPFB = FormatNumber(((cdbl(wD300004FAC) + wD300004INS) / wD300004PRE) * 100, 1)	
		wPFA = FormatNumber((wD300004FAC / wD300004PRE) * 100, 1)	


	END IF
	rstQuery.Close 
	set rstQuery = nothing

	SQL = " SELECT D300004UND, D300004UIB"
	SQL = SQL & "  FROM X300DF004 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " D300004FAM = '001' "	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		
		wD300004UND = cdbl(rstQuery.Fields("D300004UND"))
		wD300004UND = FormatNumber(wD300004UND,0)		
		wD300004UIB = cdbl(rstQuery.Fields("D300004UIB"))
		wD300004UIB = FormatNumber(wD300004UIB,0)		

	END IF
	rstQuery.Close 
	set rstQuery = nothing

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
		<td style="border-left-style: solid; border-left-width: 1px" width="12%" align="center" bordercolor="#000000"><font face="Tahoma" size="2"><%="$" & wD300004DEM%></font></td>
		<td width="12%" align="center" bordercolor="#000000"><font face="Tahoma" size="2"><%="$" & wDEMBO%></font></td>
		<td width="12%" align="center" bordercolor="#000000"><font face="Tahoma" size="2"><%="$" & wD300004FAC%></font></td>
		<td width="13%" align="center" bordercolor="#000000"><font face="Tahoma" size="2"><%="$" & wD300004RET%></font></td>
		<td width="12%" align="center" bordercolor="#000000"><font face="Tahoma" size="2"><%="$" & wD300004INS%></font></td>
		<td width="12%" align="center" bordercolor="#000000"><font face="Tahoma" size="2" color="#000099"><%="$" & wD300004PRE%></font></td>
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
<!--
	<tr>
		<td style="border-style: none; border-width: medium" width="25%"><u><b>
		<font face="Tahoma" size="2">Detalle de Ventas por Familia:</font></b></u></td>
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
	</tr>-->
	
	
	<%' ******************COMIENZO DETALLE************************ %>
	
	<%
	
	SQL = " SELECT B300121DEC, D300004DEM/1000 as D300004DEM, D300004PRD/1000 as D300004PRD, D300004FAC/1000 as D300004FAC, "
	SQL = SQL & "  D300004INS/1000 as D300004INS, D300004PRE/1000 as D300004PRE, D300004FOR/1000 as D300004FOR, B300121ORG, "
	SQL = SQL & "  D300004CON, D300004RET " 
	SQL = SQL & "  FROM X300DQ004 " 
	SQL = SQL & "  ORDER BY B300121ORG, B300121DEC " 
	'SQL = SQL & "  GROUP BY D300004CON, D300004RET " 	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
    wORG = "0"
    wORG3 = "0"
    wTDEM = 0
    wTFAC = 0
    wTINS = 0
    wTPRE = 0
    wTPDEM = 0
    wTPFAC = 0
    wTPFBO = 0
	DO WHILE NOT rstQuery.EOF 
		
		wNUS = TRIM(rstQuery.Fields("B300121DEC"))		
		wDEM = FormatNumber(cdbl(rstQuery.Fields("D300004DEM")),1)
		wFAC = FormatNumber(cdbl(rstQuery.Fields("D300004FAC")),1)
		wINS = FormatNumber(cdbl(rstQuery.Fields("D300004INS")),1)
		wPRE = FormatNumber(cdbl(rstQuery.Fields("D300004PRE")),1)
		
		IF wPRE > 0 THEN
			wPDEM = FormatNumber(((wDEM / wPRE) * 100) ,1) & "%"		
			wPFAC = FormatNumber(((wFAC / wPRE) * 100) ,1) & "%"
			wPFBO = FormatNumber((((cdbl(wFAC)+ wINS) / wPRE) * 100) ,1) & "%"
		  ELSE
		    wPDEM = 0
			wPFAC = 0
			wPFBO = 0
		END IF 
		
		
		IF wORG <> TRIM(rstQuery.Fields("B300121ORG")) THEN		 
			
			wORG2 = TRIM(rstQuery.Fields("B300121ORG"))			

			IF wORG2 = "IMP" THEN
   			   wORG2 = "Productos Importados"
			  ELSE
	   		   wORG2 = "Productos Nacionales"
			END IF 
						
			wORG = TRIM(rstQuery.Fields("B300121ORG"))	
			
			IF wORG3 <> TRIM(rstQuery.Fields("B300121ORG")) THEN
				IF wORG3 <> wORG AND wORG3 <> "0" THEN					
					wORG4 = "Productos Importados"
					Imprimir_SubTotales()
					wTDEM = 0
					wTFAC = 0
					wTINS = 0
					wTPRE = 0
				END IF	   	  	
			   wORG3 = TRIM(rstQuery.Fields("B300121ORG"))				
			END IF 			
			
			
			Response.write "<tr>"
			Response.write "<td style=""border-style: none; border-width: medium"" width=""25%""><u><b>	</td>"
			Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium; width:10%"" align=""center""><font face=""Tahoma"" size=""2"">"
				Response.write "<b>MM U.S.$</b>"			
			Response.write "</font></td>"
			Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""10%"" align=""center"">&nbsp</td>"
			Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""10%"" align=""center"">&nbsp;</td>"
			Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""10%"" align=""center"">&nbsp;</td>"
			Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium; background-color:#CCFFCC"" width=""30%"" align=""center"" colspan=""3"">"
				Response.write "<b><font face=""Tahoma"" size=""2"">% Cumplimiento Objetivo</font></b></td>"
			Response.write "</tr>"
			
			Response.write "<tr>"
			Response.write "<td style=""font-family: Tahoma; font-size: 10pt; border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium"" width=""25%"">"
				Response.write "<B>" & wORG2 & "</B>"
			Response.write "</td>"			
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; border-left-style: solid; border-left-width: 1px""  width=""10%"" bgcolor=""#C0C0C0"" bordercolor=""#000000"" align=""center"">"
				Response.write "<B>Pedidos</B>"
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt"" width=""10%"" bordercolor=""#000000"" bgcolor=""#C0C0C0"" align=""center"">"
				Response.write "<B>Facturado</B>"
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt"" width=""10%"" bordercolor=""#000000"" bgcolor=""#C0C0C0"" align=""center"">"
				Response.write "<B>B/O Final</B>"
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt"" width=""10%"" bordercolor=""#000000"" bgcolor=""#C0C0C0"" align=""center"">"
				Response.write "<B>Objetivo</B>"
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt"" width=""10%"" bordercolor=""#000000"" bgcolor=""#C0C0C0"" align=""center"">"
				Response.write "<B>Pedidos</B>"
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt"" width=""10%"" bordercolor=""#000000"" bgcolor=""#C0C0C0"" align=""center"">"
				Response.write "<B>Facturado</B>"
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt"" width=""10%"" bordercolor=""#000000"" bgcolor=""#C0C0C0"" align=""center"">"
				Response.write "<B>Fact. + B/O</B>"
			Response.write "</td>"
		Response.write "</tr>"											
				  				
		
		END IF 	
			
		
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
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; background-color:#CCFFCC"" bordercolor=""#000000;"" align=""right"">"
				Response.write wPFBO
			Response.write "</td>"
		Response.write "</tr>"
		
		
		wTDEM = wTDEM + wDEM
		wTFAC = wTFAC + wFAC
		wTINS = wTINS + wINS
		wTPRE = wTPRE + wPRE
		IF wTPRE <> 0 THEN
			wTPDEM = FormatNumber(((wTDEM / wTPRE) * 100) ,1) & "%"
			wTPFAC = FormatNumber(((wTFAC / wTPRE) * 100) ,1) & "%"
			wTPFBO = FormatNumber((((cdbl(wTFAC)+ wTINS) / wTPRE) * 100) ,1) & "%"
		  ELSE
		    wTPDEM = "0%"
		    wTPFAC = "0%"
		    wTPFBO = "0%"
		END IF
	
		rstQuery.MoveNext 
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	wORG4 = "Productos Nacionales"
	Imprimir_SubTotales()
	
	Sub Imprimir_SubTotales()
		
		Response.write "<tr>"
						Response.write "<td style=""font-family: Tahoma; font-size: 9pt; border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium"" width=""25%"">"
							Response.write "<b>Total " & wORG4 & ":</B>"
						Response.write "</td>"			
						Response.write "<td style=""font-family: Tahoma; font-size: 9pt; border-left-style: solid; border-left-width: 1px"" width=""88"" bordercolor=""#000000"" align=""right"">"
							Response.write (FormatNumber(wTDEM,1))
						Response.write "</td>"
						Response.write "<td style=""font-family: Tahoma; font-size: 9pt"" width=""88"" bordercolor=""#000000"" align=""right"">"
							Response.write (FormatNumber(wTFAC,1))
						Response.write "</td>"
						Response.write "<td style=""font-family: Tahoma; font-size: 9pt"" width=""94"" bordercolor=""#000000"" align=""right"">"
							Response.write(FormatNumber(wTINS, 1))
						Response.write "</td>"
						Response.write "<td style=""font-family: Tahoma; font-size: 9pt"" width=""87"" bordercolor=""#000000"" align=""right"">"
							Response.write (FormatNumber(wTPRE,1))
						Response.write "</td>"
						Response.write "<td style=""font-family: Tahoma; font-size: 9pt; background-color:#CCFFCC"" width=""110"" bordercolor=""#000000"" align=""right"">"
							Response.write wTPDEM
						Response.write "</td>"
						Response.write "<td style=""font-family: Tahoma; font-size: 9pt; background-color:#CCFFCC"" width=""108"" bordercolor=""#000000"" align=""right"">"
							Response.write wTPFAC			
						Response.write "</td>"
						Response.write "<td style=""font-family: Tahoma; font-size: 9pt; background-color:#CCFFCC"" bordercolor=""#000000;"" align=""right"">"
							Response.write wTPFBO
						Response.write "</td>"
					Response.write "</tr>"
					Response.write "<tr>"
						Response.write "<td style=""font-family: Tahoma; font-size: 8pt; border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium"" width=""25%"">"

						Response.write "</td>"			
						Response.write "<td style=""font-family: Tahoma; font-size: 9pt; border-left-style: solid; border-left-width: 1px"" width=""88"" bordercolor=""#000000"" align=""right"">"

						Response.write "</td>"
						Response.write "<td style=""font-family: Tahoma; font-size: 9pt"" width=""88"" bordercolor=""#000000"" align=""right"">"

						Response.write "</td>"
						Response.write "<td style=""font-family: Tahoma; font-size: 9pt"" width=""94"" bordercolor=""#000000"" align=""right"">"

						Response.write "</td>"
						Response.write "<td style=""font-family: Tahoma; font-size: 9pt"" width=""87"" bordercolor=""#000000"" align=""right"">"

						Response.write "</td>"
						Response.write "<td style=""font-family: Tahoma; font-size: 9pt; background-color:#FFFFFF"" width=""110"" bordercolor=""#FFFFFF"" align=""right"">"

						Response.write "</td>"
						Response.write "<td style=""font-family: Tahoma; font-size: 9pt; background-color:#FFFFFF"" width=""108"" bordercolor=""#FFFFFF"" align=""right"">"

						Response.write "</td>"
						Response.write "<td style=""font-family: Tahoma; font-size: 9pt; background-color:#FFFFFF"" bordercolor=""#FFFFFF"" align=""right"">"
							Response.write "&nbsp;"
						Response.write "</td>"
					Response.write "</tr>"		
					'Response.write "</table>"						
					'Response.write "<br>"	
					'Response.write "<table border=""1"" width=""100%"" style=""border-width: 0px"" cellspacing=""1"">"
	
	End Sub
	
	 Response.write "<tr>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; border-left-style: none; border-left-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium"" width=""25%"" align=""left"">"
				Response.write "<b>Total Carvica:</b>"
			Response.write "</td>"			
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; color: #0000FF; border-left-style: solid; border-left-width: 1px"" width=""10%"" bordercolor=""#000000"" align=""right"">"
				Response.write wD300004DEM
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; color: #0000FF"" width=""10%"" bordercolor=""#000000"" align=""right"">"
				Response.write wD300004FAC
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; color: #0000FF"" width=""10%"" bordercolor=""#000000"" align=""right"">"
				Response.write wD300004INS
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; color: #0000FF"" width=""10%"" bordercolor=""#000000"" align=""right"">"
				Response.write wD300004PRE
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; color: #0000FF; background-color:#CCFFCC"" width=""10%"" bordercolor=""#000000"" align=""right"">"
				Response.write wPPE & "%"
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; color: #0000FF; background-color:#CCFFCC"" width=""10%"" bordercolor=""#000000"" align=""right"">"
				Response.write wPFA	& "%"		
			Response.write "</td>"
			Response.write "<td style=""font-family: Tahoma; font-size: 9pt; color: #0000FF; width=""10%"" background-color:#CCFFCC"" bordercolor=""#000000"" align=""right"">"
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