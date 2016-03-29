<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Clientes Registrados en la Web por Vendedor</title>
</head>

<body>


<%

	wVENDEDOR = Request.Form("VENDEDOR") 
	
	wFECHA = right("0" & Day(Date),2) & "-" & right("0" & Month(Date),2) & "-" & Year(Date)	

%>


<!--<p><img border="0" src="images/Logo2.gif" width="179" height="64"></p>-->

<p align="left" style="margin-top: 0; margin-bottom: 8px"><font face="Arial" size="3"><b>Clientes Registrados en la Web por Vendedor</b></p>

<p align="right" style="margin-top: 3px; margin-bottom: 3px"><b>Fecha del Reporte: </b><%= wFECHA %>

</p>





<p style="margin-top: 0; margin-bottom: 0">&nbsp;</p>
<table border="0" width="100%" style="border-width: 0px" cellspacing="1">
	
	
	
	
	
	<%' ******************COMIENZO DETALLE************************ %>
	
	<%
	strCnn	= Application("XDTA300_ConnectionString")
	SQL = " SELECT Z300001PUS, Z300001NUS, Z300001CVE, A300020NOM, A300020RSO, " 
	SQL = SQL & "  Z300001VIS, Z300001FUA, Z300001STS, Z300001EML, Z300001NIC "
	SQL = SQL & "  FROM X300ZQ002 "
	SQL = SQL & " WHERE Z300001CCI = '" & Session("glCiaInternet") & "'"
	IF wVENDEDOR <> "000" THEN
		SQL = SQL & " AND Z300001CVE = '" & wVENDEDOR & "'"
	  ELSE
		SQL = SQL & " ORDER BY Z300001PUS "'"
	END IF
	
	'response.write SQL
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
    wCVE = 0
    wCuenta = 0
    wTCuenta = 0
    IF wVENDEDOR = "000" THEN
    	wVEN = "TODOS" 
		Imprimir_Encabezado()
	END IF
	DO WHILE NOT rstQuery.EOF 
		
		wPUS = TRIM(rstQuery.Fields("Z300001PUS"))
		wNUS = TRIM(rstQuery.Fields("Z300001NUS"))
		wCVE2 = TRIM(rstQuery.Fields("Z300001CVE"))
		wNOM = TRIM(rstQuery.Fields("A300020NOM"))
		wRSO = TRIM(rstQuery.Fields("A300020RSO"))
		wVIS = TRIM(rstQuery.Fields("Z300001VIS"))
		wSTS = TRIM(rstQuery.Fields("Z300001STS"))
		wEML = TRIM(rstQuery.Fields("Z300001EML"))
		wNIC = TRIM(rstQuery.Fields("Z300001NIC"))
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
        wFUA = wDIA_FED & "/" & wMES_FED & "/" & wANO_FED '& "  " & TimeValue(wFUA)

		IF wVIS = "0" THEN			
			wFUA = "------------"	
		END IF 
		

		wVEN = wNOM & " (" & wRSO & ")" 

		IF wCVE <> TRIM(rstQuery.Fields("Z300001CVE")) THEN 
		
			IF wCVE <> "0" THEN
			
				IF wVENDEDOR <> "000" THEN	
					Imprimir_Sub_Totales()
				END IF
								
			END IF									
						
			IF wVENDEDOR <> "000" THEN
				Imprimir_Encabezado()
			END IF
			
			wCVE = TRIM(rstQuery.Fields("Z300001CVE"))	
			wTCuenta = wTCuenta + wCuenta
			wCuenta = 0
					
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
				'Response.write wNIC
			'Response.write "</td>"
			Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""center"" width=""10%"">"
				Response.write wFUA
			Response.write "</td>"
			Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""center"" width=""5%"">"
				Response.write wVIS
			Response.write "</td>"		
		Response.write "</tr>"
		
		
		wCuenta = wCuenta + 1
	
		rstQuery.MoveNext 
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING
	
	IF wCuenta > 0 AND wVENDEDOR <> "000" Then		
		Imprimir_Sub_Totales()
	End IF
	
	IF wTCuenta > 0 Then
		wTCuenta = wTCuenta + wCuenta
		Imprimir_Totales()
	End IF
	
	
	
	Sub Imprimir_Encabezado()
		
		Response.write 	"<tr>"
			Response.write "<td colspan=""5"" align=""left"" >"
					Response.write "<font size=""2""><b>VENDEDOR: " & wVEN & "</b></font>" 
				Response.write "</td>" 
		Response.write  "</tr>" 
		Response.write "<tr>"
				Response.write "<td style=""border-style: none; border-width: medium"" width=""10%""><u>"
					Response.write "<font style=""font-family: arial; font-size: 10pt;""><b>Código</b></font></u>"
				Response.write "</td>"
				Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""40%"" align=""left"">"
					Response.write "<p align=""left""><u><font style=""font-family: arial; font-size: 10pt;""><b>Nombre</b></font></u>"
				Response.write "</td>"
				Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""5%"" align=""center"">"
					Response.write "<p align=""center""><u><font style=""font-family: arial; font-size: 10pt;""><b>Estatus</b></font></u>"
				Response.write "</td>"
				Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""20%"" align=""center"">"
					Response.write "<p align=""left""><u><font style=""font-family: arial; font-size: 10pt;""><b>Correo</b></font></u>"
				Response.write "</td>"
				'Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""10%"" align=""center"">"
					'Response.write "<p align=""left""><u><font style=""font-family: arial; font-size: 10pt;""><b>Nick Chat</b></font></u>"
				'Response.write "</td>"
				Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""10%"" align=""left"">"
					Response.write "<p align=""center""><u><font style=""font-family: arial; font-size: 10pt;""><b>Ultimo Acceso</b></font></u>"
				Response.write "</td>"
				Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""5%"" align=""center"">"
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
				Response.write "<font size=""2"">" & wCuenta & "</font>" 
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
				Response.write "<font size=""3""><b><u>Total Clientes:</u></b></font>" 
			Response.write "</td>" 
			Response.write "<td align=""left"" >"
				Response.write "<font size=""3"">" & wTCuenta & "</font>" 
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
		
	%>
	
	<%' ************************FIN DETALLE************************ %>
	
	
	
</table>

<p align="center" style="margin-top: 10px">

<% 'END IF %>


<input type="button" name="Imprimir" Value="Imprimir" onclick="window.print()"> 


</p>


</body>

</html>