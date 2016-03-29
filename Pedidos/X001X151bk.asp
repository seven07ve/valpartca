<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Reclamos Registrados en la Web</title>
</head>

<body>


<%

	wCCL = Request.Form("CLIENTE") 
	wCTR = Request.Form("MOTIVO")
	wSTS = Request.Form("ESTATUS")  
	
	wCCL2 = Request.Form("CLIENTE") 
	wCTR2 = Request.Form("MOTIVO")
	wSTS2 = Request.Form("ESTATUS")  
	
	wTRE = Request.Form("TRE")  
	
	wFDE = Request.Form("FDE") 
	wFHA = Request.Form("FHA") 

	wFDEI = LEFT(TRIM(wFDE),2) & "-" & MID(TRIM(wFDE),4,2) & "-" & RIGHT(TRIM(wFDE),4) 
	wFHAI = LEFT(TRIM(wFHA),2) & "-" & MID(TRIM(wFHA),4,2) & "-" &  RIGHT(TRIM(wFHA),4) 
	
	wFDE = LEFT(TRIM(wFDE),2) & "-" & MID(TRIM(wFDE),4,2) & "-" & RIGHT(TRIM(wFDE),4) & " " & "00:00:00"
	wFHA = LEFT(TRIM(wFHA),2) & "-" & MID(TRIM(wFHA),4,2) & "-" & RIGHT(TRIM(wFHA),4) & " " & "23:59:59"
	
	
	wFECHA = right("0" & Day(Date),2) & "-" & right("0" & Month(Date),2) & "-" & Year(Date)	

%>




<p align="left" style="margin-top: 0; margin-bottom: 8px"><font face="Arial" size="3"><b>Reclamos Registrados en la Web</b></p>
<p align="center" style="margin-top: 3px; margin-bottom: 3px"><b>Fecha Desde: </b>  <%= wFDEI %> &nbsp;&nbsp;<b>Hasta:</b> <%= wFHAI %> </p> 
<p align="right" style="margin-top: 3px; margin-bottom: 3px"><b>Fecha del Reporte: </b><%= wFECHA %></p>





<p style="margin-top: 0; margin-bottom: 0">&nbsp;</p>
<table border="0" width="100%" style="border-width: 0px" cellspacing="0">
	
	
	<%' ******************COMIENZO DETALLE************************ %>
	
	<%
	'response.write wCTR
	strCnn	= Application("XDTA300_ConnectionString")
	SQL = "SELECT E300001COD, E300001CTR, E300001CCL, E300001CRE, " 
	SQL = SQL & " E300001STS, E300001FPR, A300050DEL, A300002RSO, "
	SQL = SQL & " E300002NFA, E300002CPR, E300002CAN, E300002TRE, "
	SQL = SQL & " E300001OBS, B300201PUS, E300001FDE "
	SQL = SQL & " FROM X300EF001, X300AF050, X300AF002, X300EF002, X300BF201 " 	
	SQL = SQL & " WHERE "
	SQL = SQL & " E300001CCI = '" & Session("glCiaInternet") & "' AND "    
	IF wCTR = "2" THEN
		SQL = SQL & " E300001FDE >= '" & wFDE & "' AND "
		SQL = SQL & " E300001FDE <= '" & wFHA & "' AND "    
	ELSE
		SQL = SQL & " E300001FPR >= '" & wFDE & "' AND "
		SQL = SQL & " E300001FPR <= '" & wFHA & "' AND "    
	END IF 
	SQL = SQL & " E300001CTR = A300050CTR AND "    
	SQL = SQL & " E300001COD = E300002COD AND "
	SQL = SQL & " E300002NFA = B300201NFA AND "
	SQL = SQL & " E300002CPR = B300201CPR AND "    
	SQL = SQL & " E300001CCL = A300002CCL "    
	IF wCCL <> "000" THEN
		SQL = SQL & " AND E300001CCL = '" & wCCL & "' "    
	END IF 
	IF wCTR <> "000" THEN
		SQL = SQL & " AND E300001CTR = '" & wCTR & "' "    
	END IF 
	IF wTRE <> "000" THEN
		SQL = SQL & " AND E300002TRE = '" & wTRE & "' "    
	END IF 
	IF wSTS <> "0" THEN
		SQL = SQL & " AND E300001STS = '" & wSTS & "' "    
	END IF 
	SQL = SQL & " ORDER BY E300001COD "
	'Response.write SQL
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
    wCVE = 0
    wCuenta = 0
    wTCuenta = 0
    wCOD_2 = 0
    Imprimir_Encabezado
    DO WHILE NOT rstQuery.EOF 
		
		wCOD = TRIM(rstQuery.Fields("E300001COD"))
		wCTR = TRIM(rstQuery.Fields("E300001CTR"))
		wDEL = TRIM(rstQuery.Fields("A300050DEL"))
		wCCL = TRIM(rstQuery.Fields("E300001CCL"))
		wRSO = TRIM(rstQuery.Fields("A300002RSO"))
		wOBS = TRIM(rstQuery.Fields("E300001OBS"))
		wSTS = TRIM(rstQuery.Fields("E300001STS"))
		wNFA = TRIM(rstQuery.Fields("E300002NFA"))
		wCPR = TRIM(rstQuery.Fields("E300002CPR"))
		wCAN = TRIM(rstQuery.Fields("E300002CAN"))
		wTRE = TRIM(rstQuery.Fields("E300002TRE"))
		wCRE = TRIM(rstQuery.Fields("E300001CRE"))
		wPUS = TRIM(rstQuery.Fields("B300201PUS"))
		wE300001FDE = TRIM(rstQuery.Fields("E300001FDE"))
		
		wCCL = wCCL & "-" & wRSO
	
		SELECT CASE wSTS 
			CASE "1"
				wSTS = "ABIERTO"
			CASE "2"
				wSTS = "PROCESO"	
		    CASE "3"
				wSTS = "CERRADO"
			CASE "9"
				wSTS = "ELIMINADO"
		END SELECT
		wFPR = rstQuery.Fields("E300001FPR")
		
		
		wDIA_FED = Day(wFPR)
        If Len(Trim(wDIA_FED)) = "1" Then: wDIA_FED = "0" & wDIA_FED: End If
        wMES_FED = Month(wFPR)
        If Len(Trim(wMES_FED)) = "1" Then: wMES_FED = "0" & wMES_FED: End If
        wANO_FED = Year(wFPR)
        wFPR = wDIA_FED & "/" & wMES_FED & "/" & wANO_FED & "  " & TimeValue(wFPR)
        
        
        
        IF wCTR = "2" THEN
	        wDIA_FED = Day(wE300001FDE)
	        If Len(Trim(wDIA_FED)) = "1" Then: wDIA_FED = "0" & wDIA_FED: End If
	        wMES_FED = Month(wE300001FDE)
	        If Len(Trim(wMES_FED)) = "1" Then: wMES_FED = "0" & wMES_FED: End If
	        wANO_FED = Year(wE300001FDE)
	        wE300001FDE = wDIA_FED & "/" & wMES_FED & "/" & wANO_FED 
		END IF 

		IF wCOD_2 <> TRIM(rstQuery.Fields("E300001COD")) THEN
			
			IF wCOD_2 <> 0 THEN
				'Response.write "<br>"
				Imprimir_Encabezado()
			END IF 

			Response.write "<tr>"
			Response.write "<td colspan=""6""><hr></td>"
			Response.write "</tr>"
		
			Response.write "<tr>"
				Response.write "<td style=""font-family: arial; font-size: 10pt;"" width=""10%"" bgcolor=""#C0C0C0"" height=""25"">"
					Response.write wCOD
				Response.write "</td>"			
				Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""left"" width=""15%"" bgcolor=""#C0C0C0"">"
					Response.write wDEL
				Response.write "</td>"
				Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""left"" width=""20%"" bgcolor=""#C0C0C0"">"
					Response.write wCCL
				Response.write "</td>"
				Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""left"" width=""30%"" bgcolor=""#C0C0C0"">"
					Response.write wCRE & " "
				Response.write "</td>"			
				Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""left"" width=""15%"" bgcolor=""#C0C0C0"">"
					Response.write wFPR
				Response.write "</td>"
				Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""center"" width=""10%"" bgcolor=""#C0C0C0"">"
					Response.write wSTS
				Response.write "</td>"		
			Response.write "</tr>"
			Response.write "<tr>"
				
				 
			Response.write "<td height=""30"" colspan=""4"" style=""font-family: arial; font-size: 10pt;""  bgcolor=""#C0C0C0"">"
			Response.write "<b>Observaciones:</b> " & wOBS 
			Response.write "</td>"	
				
			Response.write "<td height=""30"" colspan=""2"" style=""font-family: arial; font-size: 10pt;"" bgcolor=""#C0C0C0"">"
			IF wCTR = "2" THEN				
				Response.write "<b>Fecha Devolución:</b> " & wE300001FDE 
			END IF
			Response.write "</td>"	

			Response.write "</tr>"		
			Response.write "<tr>"
			Response.write "<td colspan=""6""><hr></td>"
			Response.write "</tr>"
			
			Response.write "<tr>"
			Response.write "<td colspan=""6"" width=""100%"">"
			
			Response.write "<table border=""0"" width=""100%"" style=""border-width: 0px"" cellspacing=""0"">"
			Response.write "<tr>"
			
				Response.write "<td style=""font-family: arial; font-size: 12pt;"" align=""center"" width=""5%"">"
					Response.write "<b>#</b>"
				Response.write "</td>"			
			
				Response.write "<td style=""font-family: arial; font-size: 10pt;"" width=""15%"">"
					Response.write "<b>Factura</b>"
				Response.write "</td>"			

				Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""left"" width=""15%"">"
					Response.write "<b>Producto</b>"
				Response.write "</td>"

				Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""left"" width=""10%"">"
					Response.write "<b>Cantidad</b>"
				Response.write "</td>"

				Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""left"" width=""10%"">"
					Response.write "<b>Motivo</b>"
				Response.write "</td>"

				'Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""left"" width=""45%"">"
				'	Response.write "&nbsp;"
				'Response.write "</td>"		
			Response.write "</tr>"
			Response.write "</table>" 
			
			Response.write "</td>"		
			Response.write "</tr>"
		
		
			wCOD_2 = TRIM(rstQuery.Fields("E300001COD"))
			
			wCuenta2 = 1
			wCuenta = wCuenta + 1

		END IF
		
		
		
			Response.write "<tr>"
				Response.write "<td colspan=""6"">"
				Response.write "<table border=""0"" width=""100%"" style=""border-width: 0px"" cellspacing=""1"">"
				Response.write "<tr>"
				Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""center"" width=""5%"">"
					Response.write wCuenta2
				Response.write "</td>"			
				Response.write "<td style=""font-family: arial; font-size: 10pt;"" width=""15%"">"
					Response.write wNFA
				Response.write "</td>"			
				Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""left"" width=""15%"">"
					Response.write wCPR & "    - <b>Embalado por: </b>" & wPUS
				Response.write "</td>"
				Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""left"" width=""10%"">"
					Response.write wCAN
				Response.write "</td>"
				Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""left"" width=""10%"">"
					Response.write wTRE
				Response.write "</td>"
				'Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""left"" width=""45%"">"
					'Response.write wCRE
				'Response.write "</td>"		
			Response.write "</tr>"
			Response.write "</table>" 
			Response.write "</td>"		
			Response.write "</tr>"


		
		
		
		wCuenta2 = wCuenta2 + 1
		wTVIS = wTVIS + cdbl(wVIS)
	
		rstQuery.MoveNext 
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING
	

	IF wCuenta > 0 Then
		wTCuenta = wTCuenta + wCuenta
		Imprimir_Totales()
	End IF
	
	
	
	Sub Imprimir_Encabezado()
		Response.write "<tr>"
			Response.write "<td colspan=""5"" height=""25""></td>"
		Response.write "</tr>"
		Response.write "<tr>"
				Response.write "<td style=""border-style: none; border-width: medium"" width=""10%""><u>"
					Response.write "<font style=""font-family: arial; font-size: 10pt;""><b>Nro.</b></font></u>"
				Response.write "</td>"
				Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""15%"" align=""left"">"
					Response.write "<p align=""left""><u><font style=""font-family: arial; font-size: 10pt;""><b>Tipo</b></font></u>"
				Response.write "</td>"
				Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""20%"" align=""left"">"
					Response.write "<p align=""left""><u><font style=""font-family: arial; font-size: 10pt;""><b>Cliente</b></font></u>"
				Response.write "</td>"
				Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""30%"" align=""left"">"
					Response.write "<p align=""left""><u><font style=""font-family: arial; font-size: 10pt;""><b>Comentario de Solución</b></font></u>"
				Response.write "</td>"
				Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""15%"" align=""left"">"
					Response.write "<p align=""left""><u><font style=""font-family: arial; font-size: 10pt;""><b>Fecha Web</b></font></u>"
				Response.write "</td>"
				Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""10%"" align=""center"">"
					Response.write "<p align=""center""><u><font style=""font-family: arial; font-size: 10pt;""><b>Estatus</b></font></u>"
				Response.write "</td>"
		Response.write "</tr>"
			
	End Sub 

	Sub Imprimir_Sub_Totales()
		
		Response.write 	"<tr>"
			Response.write "<td align=""left"" >"
				Response.write "<font size=""2""><b><u>Sub-Total:</u></b></font>" 
			Response.write "</td>" 
			Response.write "<td align=""left"" >"
				Response.write "<font size=""2"">Usuarios: " & wCuenta & "</font>" 
			Response.write "</td>"
			Response.write "<td align=""left"" >"
				Response.write "<font size=""2"">&nbsp;</font>" 
			Response.write "</td>" 
			Response.write "<td align=""left"" >"
				Response.write "<font size=""2"">&nbsp;</font>" 
			Response.write "</td>"  
		Response.write  "</tr>" 
		
		Response.write 	"<tr>"
			Response.write "<td colspan=""5""  align=""left"" >"
				Response.write "<font size=""2"">&nbsp;</font>" 
			Response.write "</td>" 
		Response.write  "</tr>" 	

	End Sub 
	
	Sub Imprimir_Totales()
		
		Response.write 	"<tr>"
			Response.write "<td align=""left"" >"
				Response.write "<font size=""2""><b><u>Total:</u></b></font>" 
			Response.write "</td>" 
			Response.write "<td align=""left"" >"
				Response.write "<font size=""2""><b>Reclamos " & wTCuenta & "</b></font>" 
			Response.write "</td>"
			Response.write "<td align=""left"" >"
				Response.write "<font size=""2"">&nbsp;</font>" 
			Response.write "</td>" 
			Response.write "<td align=""left"" >"
				Response.write "<font size=""2"">&nbsp;</font>" 
			Response.write "</td>"  
			Response.write "<td align=""left"" >"
				Response.write "<font size=""2"">&nbsp;</font>" 
			Response.write "</td>"  
			Response.write "<td align=""center"" >"
				'Response.write "<font size=""2""><b>Requerimientos " & wTVIS & "</b></font>" 
				Response.write "<font size=""2"">&nbsp;</font>" 
			Response.write "</td>"  
		Response.write  "</tr>" 
		
		Response.write 	"<tr>"
			Response.write "<td colspan=""6""  align=""left"" >"
				Response.write "<font size=""2"">&nbsp;</font>" 
			Response.write "</td>" 
		Response.write  "</tr>" 	

	End Sub 	
		
	%>
	
	<%' ************************FIN DETALLE************************ %>
	
	
	
</table>

<p align="center" style="margin-top: 10px">

<% 'END IF %>

<% 

'IF wCTR2 <> "000" THEN 

	wVAL1 = 0: wVAL2 = 0: wVAL3 = 0: wVAL4 = 0
	wVAL5 = 0: wVAL6 = 0: wVAL7 = 0: wVAL8 = 0
	wVAL9 = 0

	SQL = " SELECT E300002TRE, Count(DISTINCT E300001COD) as wCUENTA " 	
	SQL = SQL & " FROM X300EF001, X300EF002" 	
	SQL = SQL & " WHERE "
	IF wCTR = "2" THEN
		SQL = SQL & " E300001FDE >= '" & wFDE & "' AND "
		SQL = SQL & " E300001FDE <= '" & wFHA & "' AND "    
	ELSE
		SQL = SQL & " E300001FPR >= '" & wFDE & "' AND "
		SQL = SQL & " E300001FPR <= '" & wFHA & "' AND "    
	END IF 
	SQL = SQL & " E300001COD = E300002COD "    
	'SQL = SQL & " E300002TRE = '" & wTRE & "' "    
	IF wCCL2 <> "000" THEN
		SQL = SQL & " AND E300001CCL = '" & wCCL2 & "' "    
	END IF 
	IF wCTR2 <> "000" THEN
		SQL = SQL & " AND E300001CTR = '" & wCTR2 & "' "    
	END IF 		
	IF wSTS2 <> "0" THEN
		SQL = SQL & " AND E300001STS = '" & wSTS2 & "' "    
	END IF 	
	SQL = SQL & " GROUP BY E300002TRE "
	'response.write sql
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	Do While NOT rstQuery.EOF 
		
		wE300002TRE = TRIM(rstQuery.Fields("E300002TRE"))
		wCuenta = TRIM(rstQuery.Fields("wCUENTA"))
		
		IF wE300002TRE = "Defecto de Parte" Then
			wVAL1 = wCuenta
			wVAL1_P = FormatNumber((wCuenta/wTCuenta)*100,1) & "%" 
		End if
		
		IF wE300002TRE = "Backorders" Then
			wVAL2 = wCuenta
			wVAL2_P = FormatNumber((wCuenta/wTCuenta)*100,1) & "%" 
		End if 
		
		IF wE300002TRE = "Error del Vendedor" Then
			wVAL3 = wCuenta
			wVAL3_P = FormatNumber((wCuenta/wTCuenta)*100,1) & "%" 
		End if
		
		IF wE300002TRE = "Precio" Then
			wVAL4 = wCuenta
			wVAL4_P = FormatNumber((wCuenta/wTCuenta)*100,1) & "%" 
		End if 
		
		IF wE300002TRE = "Error del Cliente" Then
			wVAL5 = wCuenta
			wVAL5_P = FormatNumber((wCuenta/wTCuenta)*100,1) & "%" 
		End if 
		
		IF wE300002TRE = "Error en Ventas" Then
			wVAL6 = wCuenta
			wVAL6_P = FormatNumber((wCuenta/wTCuenta)*100,1) & "%" 
		End if 
		
		IF wE300002TRE = "Faltante" Then
			wVAL7 = wCuenta
			wVAL7_P = FormatNumber((wCuenta/wTCuenta)*100,1) & "%" 
		End if 
		
		IF wE300002TRE = "Sobrante" Then
			wVAL8 = wCuenta
			wVAL8_P = FormatNumber((wCuenta/wTCuenta)*100,1) & "%" 
		End if 
		
		IF wE300002TRE = "Faltante y Sobrante" Then
			wVAL9 = wCuenta
			wVAL9_P = FormatNumber((wCuenta/wTCuenta)*100,1) & "%" 
		End if 
		
		'Response.write wE300002TRE & " - " & wCuenta & "<br>" 
		
		rstQuery.MoveNext 	
	Loop
	rstQuery.CLOSE
	SET rstQuery = NOTHING
	



%>

    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Motivos', 'Cantidad'],
          ['Defecto de Parte <%=wVAL1 & " (" & wVAL1_P & ")"%>',     <%=wVAL1%>],
          ['Backorders <%=wVAL2 & " (" & wVAL2_P & ")"%>',     <%=wVAL2%>],
          ['Error del Vendedor <%=wVAL3 & " (" & wVAL3_P & ")"%>',      <%=wVAL3%>],
          ['Precio <%=wVAL4 & " (" & wVAL4_P & ")"%>',  <%=wVAL4%>],
          ['Error del Cliente <%=wVAL5 & " (" & wVAL5_P & ")"%>', <%=wVAL5%>],
          ['Error en Ventas <%=wVAL6 & " (" & wVAL6_P & ")"%>',    <%=wVAL6%>],
          ['Faltante <%=wVAL7 & " (" & wVAL7_P & ")"%>',    <%=wVAL7%>],
          ['Sobrante <%=wVAL8 & " (" & wVAL8_P & ")"%>',    <%=wVAL8%>],
          ['Faltante y Sobrante <%=wVAL9 & " (" & wVAL9_P & ")"%>',    <%=wVAL9%>]
         
        ]);

        var options = {
          height: 450,
          legend:'left',
          is3D: true,
          title: 'Motivos en Reclamos'          
        };

        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>

<table align="center"  >
<tr>
<td align="center" >
<div id="chart_div" style="border:2px solid #808080; width: 1100px; height: 450px" ></div>
</td> </tr> 
</table> 
<% 'END IF %>
<br>
<table align="center" >
<tr>
		<td colspan="2" height="44" >
		
		<b>Reclamos Tipo Defecto de Parte por Familia</b> </td> 
		
		</tr>
<tr>
		<td>
		<b><font size="2">Familia
		</font></b>
		</td>
		<!--<td align="right">
		<b><font size="2">Reclamos
		</font></b>
		</td>-->
		<td align="right">
		<b><font size="2">Piezas
		</font></b>
		</td>
		</tr>
	<%
	
	SQL = " SELECT ISNULL(B300121DEC, 'OTRA') AS FAMILIA,  count(DISTINCT E300001COD) as RECLAMOS, " 	
	SQL = SQL & " SUM(E300002CAN) AS PIEZAS FROM X300EQ003 WHERE "
	IF wCTR = "2" THEN
		SQL = SQL & " E300001FDE >= '" & wFDE & "' AND "
		SQL = SQL & " E300001FDE <= '" & wFHA & "'"    
	ELSE
		SQL = SQL & " E300001FPR >= '" & wFDE & "' AND "
		SQL = SQL & " E300001FPR <= '" & wFHA & "'"    
	END IF 
	'SQL = SQL & " E300001FPR >= '" & wFDE & "' AND "
	'SQL = SQL & " E300001FPR <= '" & wFHA & "' "    	
	SQL = SQL & " GROUP BY B300121DEC "
	SQL = SQL & " ORDER BY 3 DESC "
	'response.write sql
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
    wTREC = 0
    wTCAN = 0
	Do While NOT rstQuery.EOF 
	
		wFAM = TRIM(rstQuery.Fields("FAMILIA"))
		wREC = TRIM(rstQuery.Fields("RECLAMOS"))
		wCAN = TRIM(rstQuery.Fields("PIEZAS"))
		
		%>
		
		
		<tr>		
		<td>
		<%=wFAM%>
		</td>
		<!--<td align="right" >
		<%=wREC%>
		</td>-->
		<td align="right" >
		<%=wCAN%>
		</td>
		</tr>
		
		
		<%
		
		wTREC = wTREC + wREC
		wTCAN = wTCAN + wCAN
	
	rstQuery.MoveNext 	
	Loop
	rstQuery.CLOSE
	SET rstQuery = NOTHING

%>

	<tr>		
		<td align="right">
		<b>Totales:</b> 
		</td>
		<!--<td align="right" >
		<b><%=wTREC%></b> 
		</td>-->
		<td align="right" >
		<b><%=wTCAN%></b> 
		</td>
		</tr>


</table>
 <br>
 <br>
<input type="button" name="Imprimir" Value="Imprimir" onclick="window.print()"> 


</p>


</body>

</html>