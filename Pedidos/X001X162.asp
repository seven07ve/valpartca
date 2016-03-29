<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Pagos Realizados en la Web</title>

<script language="Javascript">


function OpenBrWindow(theURL,winName,features, myWidth, myHeight, isCenter) { //v3.0
	if(window.screen)if(isCenter)if(isCenter=="true"){
		var myLeft = (screen.width-myWidth)/2;
		var myTop = (screen.height-myHeight)/2;
		features+=(features!='')?',':'';
		features+=',left='+myLeft+',top='+myTop;
	}
	window.open(theURL,winName,features+((features!='')?',':'')+'width='+myWidth+',height='+myHeight);
}


</script>


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
<table border="0" width="919" style="border-width: 0px" cellspacing="1" align="center"  >
<tr><td>
<p align="left" style="margin-top: 0; margin-bottom: 8px"><font face="Arial" size="2"><b>Pagos Realizados en la Web</b></p>
<p align="center" style="margin-top: 3px; margin-bottom: 3px"><b>Fecha Desde: </b>  <%= wFDEI %> &nbsp;&nbsp;<b>Hasta:</b> <%= wFHAI %> </p> 
<p align="right" style="margin-top: 3px; margin-bottom: 3px"><b>Fecha del Reporte: </b><%= wFECHA %></p>
</td></tr></table>




<p style="margin-top: 0; margin-bottom: 0">&nbsp;</p>
<table border="0" width="919" style="border-width: 0px" cellspacing="1" align="center"  >
	
	
	
	
	
	<%' ******************COMIENZO DETALLE************************ %>
	
	<%
	strCnn	= Application("XDTA300_ConnectionString")
	SQL = "SELECT "
	SQL = SQL & " C300001NDC, C300001CCL, A300002RSO, C300001FAC, " 
	SQL = SQL & " C300001MCO, C300001STS, C300001NRC, C300001PUS  "
	SQL = SQL & " FROM X300CQ001 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " C300001CCI ='" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " C300001CIA ='" & Session("glCia") & "' AND "
	SQL = SQL & " C300001SPP ='1'  AND"		
	SQL = SQL & " C300001FAC >= '" & wFDE & "' AND "
	SQL = SQL & " C300001FAC <= '" & wFHA & "' "
	wWHERE = " AND "	
	if Session("glTipoUsuario") = "C" then
		SQL = SQL & wWHERE
		SQL = SQL & " C300001CCL = '" & Session("glUsuario") & "' "
	end if
	if Session("glTipoUsuario") = "V" then
		SQL = SQL & wWHERE
		SQL = SQL & " A300002CVE = '" & Session("glCodVendedor") & "' "
	end if
	if len(trim(Session("glBusqueda"))) > 0 then
		SQL = SQL & wWHERE
		SQL = SQL & " ((C300001CCL LIKE '%" & ucase(Session("glBusqueda")) & "%') OR  "
		SQL = SQL & "  (A300002RSO LIKE '%" & ucase(Session("glBusqueda")) & "%'))  "
	end if		
	SQL = SQL & " ORDER BY C300001FAC DESC " 	
	
	
	'Response.write SQL
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
    wCVE = 0
    wCuenta = 0
    wTCuenta = 0
    Imprimir_Encabezado
    DO WHILE NOT rstQuery.EOF 
		
		wNDC = TRIM(rstQuery.Fields("C300001NDC"))
		wCCL = TRIM(rstQuery.Fields("C300001CCL"))
		wRSO = TRIM(rstQuery.Fields("A300002RSO"))
		wFUA = TRIM(rstQuery.Fields("C300001FAC"))
		wMCO = TRIM(rstQuery.Fields("C300001MCO"))
		wPUS = TRIM(rstQuery.Fields("C300001PUS"))
	
		wURL = "javascript:OpenBrWindow('X001A110.asp?CLA001=" & wNDC & "','Imprimir','menubar=0,resizable=0,location=0,status=0,scrollbars=1,directories=0,width=750,height=700','750','700','true')" 
		
		wRCO = "Imprimir"
		
		wDIA_FED = Day(wFUA)
        If Len(Trim(wDIA_FED)) = "1" Then: wDIA_FED = "0" & wDIA_FED: End If
        wMES_FED = Month(wFUA)
        If Len(Trim(wMES_FED)) = "1" Then: wMES_FED = "0" & wMES_FED: End If
        wANO_FED = Year(wFUA)
        wFUA = wDIA_FED & "/" & wMES_FED & "/" & wANO_FED 

		
		Response.write "<tr>"
			Response.write "<td style=""font-family: arial; font-size: 10pt;"" >"
				Response.write wNDC
			Response.write "</td>"			
			Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""left"" >"
				Response.write wCCL & " - " & left(wRSO,40)
			Response.write "</td>"
			Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""left"" >"
				Response.write wPUS
			Response.write "</td>"
			Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""center"" >"
				Response.write wFUA
			Response.write "</td>"			
			Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""right"" >"
				Response.write FormatNumber(wMCO,2)
			Response.write "</td>"
			Response.write "<td style=""font-family: arial; font-size: 10pt;"" align=""center"" >"
				Response.write "<font color=""blue"" onclick=" & wURL & " style=""CURSOR: pointer"">" & wRCO
			Response.write "</td>"		
		Response.write "</tr>"
		
		
		wCuenta = wCuenta + 1
		wTVIS = wTVIS + cdbl(wMCO)
	
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
				Response.write "<td style=""border-style: none; border-width: medium"" width=""8%""><u>"
					Response.write "<font style=""font-family: arial; font-size: 10pt;""><b>Nro.</b></font></u>"
				Response.write "</td>"
				Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""40%"" align=""left"">"
					Response.write "<p align=""left""><u><font style=""font-family: arial; font-size: 10pt;""><b>Cliente</b></font></u>"
				Response.write "</td>"
				Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""12%"" align=""left"">"
					Response.write "<p align=""left""><u><font style=""font-family: arial; font-size: 10pt;""><b>Generado por</b></font></u>"
				Response.write "</td>"
				Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""10%"" align=""center"">"
					Response.write "<p align=""center""><u><font style=""font-family: arial; font-size: 10pt;""><b>Fecha</b></font></u>"
				Response.write "</td>"				
				Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""15%"" align=""right"">"
					Response.write "<p align=""right""><u><font style=""font-family: arial; font-size: 10pt;""><b>Monto</b></font></u>"
				Response.write "</td>"
				Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" width=""10%"" align=""center"">"
					Response.write "<p align=""center""><u><font style=""font-family: arial; font-size: 10pt;""><b>Recibo</b></font></u>"
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
				Response.write "<font style=""font-family: arial;"" size=""2""><b><u>Total:</u></b></font>" 
			Response.write "</td>" 
			Response.write "<td align=""left"" >"
				Response.write "<font style=""font-family: arial;"" size=""2""><b>Pagos " & wTCuenta & "</b></font>" 
			Response.write "</td>"
			Response.write "<td align=""left"" >"
				Response.write "<font size=""2"">&nbsp;</font>" 
			Response.write "</td>" 
			Response.write "<td align=""left"" >"
				Response.write "<font size=""2"">&nbsp;</font>" 
			Response.write "</td>"  
			Response.write "<td align=""right"" >"
				Response.write "<font style=""font-family: arial;"" size=""2""><b>" & FormatNumber(wTVIS,2) & "</b></font>" 
			Response.write "</td>"  
			Response.write "<td align=""center"" >"
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
<input type="button" name="Regresar" Value="Regresar" onclick="window.history.back()"> 

</p>


</body>

</html>