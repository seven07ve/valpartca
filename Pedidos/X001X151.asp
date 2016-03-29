<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Reclamos y Sugerencias Registradas en la Web</title>
</head>

<body>


<%

	wCCL = Request.Form("CLIENTE") 
	wCTR = Request.Form("MOTIVO")
	wSTS = Request.Form("ESTATUS")  
	
	wFDE = Request.Form("FDE") 
	wFHA = Request.Form("FHA") 

	wFDEI = LEFT(TRIM(wFDE),2) & "-" & MID(TRIM(wFDE),4,2) & "-" & RIGHT(TRIM(wFDE),4) 
	wFHAI = LEFT(TRIM(wFHA),2) & "-" & MID(TRIM(wFHA),4,2) & "-" &  RIGHT(TRIM(wFHA),4) 
	
	wFDE = RIGHT(TRIM(wFDE),4) & "-" & MID(TRIM(wFDE),4,2) & "-" & LEFT(TRIM(wFDE),2) & " " & "00:00:00"
	wFHA = RIGHT(TRIM(wFHA),4) & "-" & MID(TRIM(wFHA),4,2) & "-" & LEFT(TRIM(wFHA),2) & " " & "23:59:59"
	
	
	wFECHA = right("0" & Day(Date),2) & "-" & right("0" & Month(Date),2) & "-" & Year(Date)	

%>




<p align="left" style="margin-top: 0; margin-bottom: 8px"><font face="Arial" size="3"><b>Reclamos y Sugerencias Registradas en la Web</b></p>
<p align="center" style="margin-top: 3px; margin-bottom: 3px"><b>Fecha Desde: </b>  <%= wFDEI %> &nbsp;&nbsp;<b>Hasta:</b> <%= wFHAI %> </p> 
<p align="right" style="margin-top: 3px; margin-bottom: 3px"><b>Fecha del Reporte: </b><%= wFECHA %></p>





<p style="margin-top: 0; margin-bottom: 0">&nbsp;</p>
<table border="0" width="100%" style="border-width: 0px" cellspacing="1">
	
	
	<%' ******************COMIENZO DETALLE************************ %>
	
	<%
	strCnn	= Application("XDTA300_ConnectionString")
	SQL = " SELECT E300001COD, E300001CTR, E300001CCL, E300001OBS, " 
	SQL = SQL & "  E300001STS, E300001FPR, A300050DEL, A300002RSO, "
	SQL = SQL & "  E300002NFA, E300002CPR, E300002CAN, E300002TRE, "
	SQL = SQL & " E300002OBS "
	SQL = SQL & " FROM X300EF001, X300AF050, X300AF002, X300EF002" 	
	SQL = SQL & " WHERE "
	SQL = SQL & " E300001FPR >= '" & wFDE & "' AND "
	SQL = SQL & " E300001FPR <= '" & wFHA & "' AND "    
	SQL = SQL & " E300001CTR = A300050CTR AND "    
	SQL = SQL & " E300001COD = E300002COD AND "    
	SQL = SQL & " E300001CCL = A300002CCL "    
	IF wCCL <> "000" THEN
		SQL = SQL & " AND E300001CCL = '" & wCCL & "' "    
	END IF 
	IF wCTR <> "000" THEN
		SQL = SQL & " AND E300001CTR = '" & wCTR & "' "    
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
		'wOBS = TRIM(rstQuery.Fields("E300001OBS"))
		wSTS = TRIM(rstQuery.Fields("E300001STS"))
		wNFA = TRIM(rstQuery.Fields("E300002NFA"))
		wCPR = TRIM(rstQuery.Fields("E300002CPR"))
		wCAN = TRIM(rstQuery.Fields("E300002CAN"))
		wTRE = TRIM(rstQuery.Fields("E300002TRE"))
		wOBS = TRIM(rstQuery.Fields("E300002OBS"))
		
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

		IF wCOD_2 <> TRIM(rstQuery.Fields("E300001COD")) THEN

			Response.write "<tr>"
			Response.write "<td colspan=""5""><hr></td>"
			Response.write "</tr>"
		
			Response.write "<tr>"
				Response.write "<td style=""font-family: arial; font-size: 10pt;"" width=""10%"">"
					Response.write wCOD
				Response.write "</td>"			
				Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""left"" width=""15%"">"
					Response.write wDEL
				Response.write "</td>"
				Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""left"" width=""20%"">"
					Response.write wCCL
				Response.write "</td>"
				'Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""left"" width=""30%"">"
				'	Response.write wOBS
				'Response.write "</td>"			
				Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""left"" width=""15%"">"
					Response.write wFPR
				Response.write "</td>"
				Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""center"" width=""10%"">"
					Response.write wSTS
				Response.write "</td>"		
			Response.write "</tr>"
			
					
			Response.write "<tr>"
			Response.write "<td colspan=""5""><hr></td>"
			Response.write "</tr>"
			
			Response.write "<tr>"
			Response.write "<td colspan=""5"">"
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
				Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""left"" width=""45%"">"
					Response.write "<b>Observación</b>"
				Response.write "</td>"		
			Response.write "</tr>"
			Response.write "</table>" 
			Response.write "</td>"		
			Response.write "</tr>"
		
		
			wCOD_2 = TRIM(rstQuery.Fields("E300001COD"))
			
			wCuenta2 = 1
			wCuenta = wCuenta + 1

		END IF
		
		
		
			Response.write "<tr>"
				Response.write "<td colspan=""5"">"
				Response.write "<table border=""0"" width=""100%"" style=""border-width: 0px"" cellspacing=""1"">"
				Response.write "<tr>"
				Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""center"" width=""5%"">"
					Response.write wCuenta2
				Response.write "</td>"			
				Response.write "<td style=""font-family: arial; font-size: 10pt;"" width=""15%"">"
					Response.write wNFA
				Response.write "</td>"			
				Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""left"" width=""15%"">"
					Response.write wCPR
				Response.write "</td>"
				Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""left"" width=""10%"">"
					Response.write wCAN
				Response.write "</td>"
				Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""left"" width=""10%"">"
					Response.write wTRE
				Response.write "</td>"
				Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""left"" width=""45%"">"
					Response.write wOBS
				Response.write "</td>"		
			Response.write "</tr>"
			Response.write "</table>" 
			Response.write "</td>"		
			Response.write "</tr>"


		
		
		'wCuenta = wCuenta + 1
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
				Response.write "<td style=""border-style: none; border-width: medium"" width=""10%""><u>"
					Response.write "<font style=""font-family: arial; font-size: 10pt;""><b>Nro.</b></font></u>"
				Response.write "</td>"
				Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""15%"" align=""left"">"
					Response.write "<p align=""left""><u><font style=""font-family: arial; font-size: 10pt;""><b>Tipo</b></font></u>"
				Response.write "</td>"
				Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""40%"" align=""left"">"
					Response.write "<p align=""left""><u><font style=""font-family: arial; font-size: 10pt;""><b>Cliente</b></font></u>"
				Response.write "</td>"
				'Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""30%"" align=""left"">"
				'	Response.write "<p align=""left""><u><font style=""font-family: arial; font-size: 10pt;""><b>Observación</b></font></u>"
				'Response.write "</td>"
				Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""15%"" align=""left"">"
					Response.write "<p align=""left""><u><font style=""font-family: arial; font-size: 10pt;""><b>Fecha</b></font></u>"
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
			Response.write "<td colspan=""4""  align=""left"" >"
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
				Response.write "<font size=""2""><b>Registros " & wTCuenta & "</b></font>" 
			Response.write "</td>"
			Response.write "<td align=""left"" >"
				Response.write "<font size=""2"">&nbsp;</font>" 
			Response.write "</td>" 
			'Response.write "<td align=""left"" >"
			'	Response.write "<font size=""2"">&nbsp;</font>" 
			'Response.write "</td>"  
			Response.write "<td align=""left"" >"
				Response.write "<font size=""2"">&nbsp;</font>" 
			Response.write "</td>"  
			Response.write "<td align=""center"" >"
				'Response.write "<font size=""2""><b>Requerimientos " & wTVIS & "</b></font>" 
			Response.write "</td>"  
		Response.write  "</tr>" 
		
		Response.write 	"<tr>"
			Response.write "<td colspan=""4""  align=""left"" >"
				Response.write "<font size=""2"">&nbsp;</font>" 
			Response.write "</td>" 
		Response.write  "</tr>" 	

	End Sub 	
		
	%>
	
	<%' ************************FIN DETALLE************************ %>
	
	
	
</table>

<p align="center" style="margin-top: 10px">

<% 'END IF %>


<input type="button" name="Imprimir" Value="Imprimir" onclick="window.print()"> 


</p>


</body>

</html>
