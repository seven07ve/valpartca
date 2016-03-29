<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Visitas Registradas en la Web</title>
</head>

<body>


<%

	wFDE = Request.Form("FDE") 
	wFHA = Request.Form("FHA") 

	wFDEI = LEFT(TRIM(wFDE),2) & "-" & MID(TRIM(wFDE),4,2) & "-" & RIGHT(TRIM(wFDE),4) 
	wFHAI = LEFT(TRIM(wFHA),2) & "-" & MID(TRIM(wFHA),4,2) & "-" &  RIGHT(TRIM(wFHA),4) 
	
	wFDE = RIGHT(TRIM(wFDE),4) & "-" & MID(TRIM(wFDE),4,2) & "-" & LEFT(TRIM(wFDE),2) & " " & "00:00:00"
	wFHA = RIGHT(TRIM(wFHA),4) & "-" & MID(TRIM(wFHA),4,2) & "-" & LEFT(TRIM(wFHA),2) & " " & "23:59:59"
	
	
	wFECHA = right("0" & Day(Date),2) & "-" & right("0" & Month(Date),2) & "-" & Year(Date)	

%>


<!--<p><img border="0" src="images/Logo2.gif" width="179" height="64"></p>-->

<p align="left" style="margin-top: 0; margin-bottom: 8px"><font face="Arial" size="2"><b>Visitas Registradas en la Web</b></p>
<p align="center" style="margin-top: 3px; margin-bottom: 3px"><b>Fecha Desde: </b>  <%= wFDEI %> &nbsp;&nbsp;<b>Hasta:</b> <%= wFHAI %> </p> 
<p align="right" style="margin-top: 3px; margin-bottom: 3px"><b>Fecha del Reporte: </b><%= wFECHA %></p>





<p style="margin-top: 0; margin-bottom: 0">&nbsp;</p>
<table border="0" width="100%" style="border-width: 0px" cellspacing="1">
	
	
	
	
	
	<%' ******************COMIENZO DETALLE************************ %>
	
	<%
	strCnn	= Application("XDTA300_ConnectionString")
	SQL = " SELECT Z300008PUS, Z300001NUS, Z300001EML, Z300001STS, " 
	SQL = SQL & " MAX(Z300008FEC) AS Z300001FUA,  SUM(Z300008VIS) AS Z300001VIS "
	SQL = SQL & " FROM X300ZF001, X300ZF008 " 	
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300001CCI = '" & Session("glCiaInternet") & "' AND " 
	SQL = SQL & " Z300001CCI = Z300008CCI AND " 
	SQL = SQL & " Z300008FEC >= '" & wFDE & "' AND "
	SQL = SQL & " Z300008FEC <= '" & wFHA & "' AND "
	SQL = SQL & " Z300008ACC = '1' AND "
    SQL = SQL & " Z300001PUS = Z300008PUS "
	SQL = SQL & " GROUP BY Z300008PUS, Z300001NUS, Z300001EML, Z300001STS "
	SQL = SQL & " ORDER BY Z300008PUS "
	'Response.write SQL
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
    wCVE = 0
    wCuenta = 0
    wTCuenta = 0
    Imprimir_Encabezado
    DO WHILE NOT rstQuery.EOF 
		
		wPUS = TRIM(rstQuery.Fields("Z300008PUS"))
		wNUS = TRIM(rstQuery.Fields("Z300001NUS"))
		wNOM = TRIM(rstQuery.Fields("Z300001NUS"))
		wSTS = TRIM(rstQuery.Fields("Z300001STS"))
		wVIS = TRIM(rstQuery.Fields("Z300001VIS"))
		wEML = TRIM(rstQuery.Fields("Z300001EML"))
	
		IF wSTS = "1" THEN
			wSTS = "Activo"
		   ELSE
			wSTS = "Inactivo"
		END IF 
		wFUA = rstQuery.Fields("Z300001FUA")
		
		IF wEML = "." OR ISNULL(wEML) = True THEN
			wEML = "-----------"
		END IF
		
		IF ISNULL(wNIC) = true THEN
			wNIC = "-----------"
		END IF
		
		wDIA_FED = Day(wFUA)
        If Len(Trim(wDIA_FED)) = "1" Then: wDIA_FED = "0" & wDIA_FED: End If
        wMES_FED = Month(wFUA)
        If Len(Trim(wMES_FED)) = "1" Then: wMES_FED = "0" & wMES_FED: End If
        wANO_FED = Year(wFUA)
        wFUA = wDIA_FED & "/" & wMES_FED & "/" & wANO_FED & "  " & TimeValue(wFUA)

		IF wVIS = "0" THEN			
			wFUA = "------------"	
		END IF 
		
		Response.write "<tr>"
			Response.write "<td style=""font-family: arial; font-size: 10pt;"" width=""10%"">"
				Response.write wPUS
			Response.write "</td>"			
			Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""left"" width=""40%"">"
				Response.write wNUS
			Response.write "</td>"
			Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""center"" width=""5%"">"
				Response.write wSTS
			Response.write "</td>"
			Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""left"" width=""20%"">"
				Response.write wEML
			Response.write "</td>"
			'Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""left"" width=""10%"">"
			'	Response.write wNIC
			'Response.write "</td>"
			Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""left"" width=""10%"">"
				Response.write wFUA
			Response.write "</td>"
			Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""center"" width=""5%"">"
				Response.write wVIS
			Response.write "</td>"		
		Response.write "</tr>"
		
		
		wCuenta = wCuenta + 1
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
					Response.write "<font style=""font-family: arial; font-size: 10pt;""><b>Usuario</b></font></u>"
				Response.write "</td>"
				Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""35%"" align=""left"">"
					Response.write "<p align=""left""><u><font style=""font-family: arial; font-size: 10pt;""><b>Nombre</b></font></u>"
				Response.write "</td>"
				Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""5%"" align=""center"">"
					Response.write "<p align=""center""><u><font style=""font-family: arial; font-size: 10pt;""><b>Estatus</b></font></u>"
				Response.write "</td>"
				Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""20%"" align=""center"">"
					Response.write "<p align=""left""><u><font style=""font-family: arial; font-size: 10pt;""><b>Correo</b></font></u>"
				Response.write "</td>"
				'Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""10%"" align=""center"">"
				'	Response.write "<p align=""left""><u><font style=""font-family: arial; font-size: 10pt;""><b>Nick Chat</b></font></u>"
				'Response.write "</td>"
				
				Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""15%"" align=""left"">"
					Response.write "<p align=""left""><u><font style=""font-family: arial; font-size: 10pt;""><b>Ultimo Acceso</b></font></u>"
				Response.write "</td>"
				Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""10%"" align=""center"">"
					Response.write "<p align=""center""><u><font style=""font-family: arial; font-size: 10pt;""><b>Visitas</b></font></u>"
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
				Response.write "<font size=""2""><b>Usuarios " & wTCuenta & "</b></font>" 
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
				Response.write "<font size=""2""><b>Visitas " & wTVIS & "</b></font>" 
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