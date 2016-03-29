<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Lista de Precios por Linea</title>
</head>
<!--#include file="X001Z001.INC"-->

<body>


<%
	strCnn	= Application("XDTA300_ConnectionString")

	wFAMILIA = Request.Form("LINEA")
	wNLP = Request.Form("SUBLINEA") 
	wPIN = TRIM(Request.Form("PIN"))
	
    SQL = "SELECT A300003NFA FROM X300AF003 WHERE "
    SQL = SQL & " A300003CCI = '" & Session("glCiaInternet") &  "'"
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	'response.write sql
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		wLPR = TRIM(rstQuery.Fields("A300003NFA"))
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	
	'response.write wLPR 
	
	'BUSCA ERP COMPAÑIA INTERNET
	SQL = "SELECT Z300002ERP FROM X300ZF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300002CCI = '" & Session("glCiaInternet") & "'"
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		wERP = TRIM(rstQuery.Fields("Z300002ERP"))
	END IF
	rstQuery.Close 
	set rstQuery = nothing

	
	
	
	wFECHA = right("0" & Day(Date),2) & "-" & right("0" & Month(Date),2) & "-" & Year(Date)	

%>


<!--<p><img border="0" src="images/Logo2.gif" width="179" height="64"></p>-->
<p align="left" style="margin-top: 0; margin-bottom: 8px"><font face="Arial" size="3"><b>
<% IF wERP = "SAP" THEN %>
Lista de Precios por Línea
<% ELSE %>
Lista de Precios por Línea 
<% END IF %>
</b></p>
<p align="left" style="margin-top: 0; margin-bottom: 4px"><font face="Arial" size="2"><b></p>

<p align="right" style="margin-top: 3px; margin-bottom: 3px"><b>Fecha del Reporte: </b><%= wFECHA %>

</p>





<p style="margin-top: 0; margin-bottom: 0">&nbsp;</p>
<table border="0" width="100%" style="border-width: 0px" cellspacing="1">
	
	
	<%' ******************COMIENZO DETALLE************************ %>
	
	<%
	
	'BUSCA PORCENTAJE DE PRONTO PAGO
	'SQL = "SELECT MAX(A300002PPP) AS A300002PPP FROM X300AF002 " 
	'Set rstQuery = Server.CreateObject("ADODB.Recordset")
    'rstQuery.Open sql , strCnn
	'IF NOT rstQuery.EOF THEN
		 wPPP = 0' cdbl(rstQuery.Fields("A300002PPP"))
	'END IF
	'rstQuery.Close 
	'set rstQuery = nothing

	
	SQL = " SELECT A300003CPR, A300003DEL, A300003CIN, A300003STS, A300003PUA, A300003CIN, " 
	SQL = SQL & " A300003MAR, A300003NPS, B300120DEC, A300003REF, A300003PIM "
	SQL = SQL & " FROM X300AQ003 "
	SQL = SQL & " WHERE "
	SQL = SQL & " A300003CCI = '" & Session("glCiaInternet") &  "'"
	IF wFAMILIA <> "000" THEN
		SQL = SQL & " AND A300003TPR ='" & wFAMILIA & "'" 		
	END IF 
	'IF wNLP <> "000" THEN
		'SQL = SQL & " AND A300003NLP ='" & wNLP & "'" 		
	'END IF 
	IF wPIN = "on" OR Session("glTipoUsuario") = "V" THEN	
		SQL = SQL & " AND A300003CIN > 0 " 	
	END IF 
	IF Session("glMostrarTodasFamilias") = "0" THEN
		SQL = SQL & " AND A300003TPR IN "
		SQL = SQL & " (SELECT B300123FAM FROM X300BF123 " 																		
		SQL = SQL & " WHERE "
		SQL = SQL & " B300123CCI = '" & trim(Session("glCiaInternet")) & "' AND "
		SQL = SQL & " B300123CCL = '" & trim(Session("glUsuario")) & "') "
	END IF  
	'SQL = SQL & " ORDER BY B300120DEC, A300003CPR " 
	SQL = SQL & " ORDER BY B300120DEC, A300003CPR " 
	'response.write SQL
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
    wFAM = 0
  	wCuenta = 0
	DO WHILE NOT rstQuery.EOF 
		
		wCPR = TRIM(rstQuery.Fields("A300003CPR"))
		wREF = TRIM(rstQuery.Fields("A300003REF"))
		wDEL = TRIM(rstQuery.Fields("A300003DEL"))
		wCIN = TRIM(rstQuery.Fields("A300003CIN"))
		wPUA = cdbl(rstQuery.Fields("A300003PUA"))
		wPIM = cdbl(rstQuery.Fields("A300003PIM"))
		wNPS = TRIM(rstQuery.Fields("A300003NPS"))
		wDEC = TRIM(rstQuery.Fields("B300120DEC"))
		
		IF CDBL(wCIN) > 0 AND (Session("glTipoUsuario") = "C" OR Session("glTipoUsuario") = "CP") THEN 
			
			wCIN = "<b>DISP</b>"
		
		END IF 

		wPUA = wPUA - (wPUA * wPPP) / 100
		
   		IF Session("glAplicarIva") <> "0" Then
			wPUA = wPUA * (1 + wPIM / 100)
		END IF 	
		'wPUAF = round((wPUA/1000),2)  
		wPUA = formatnumber(wPUA,2)
		'wPUAF = formatnumber(wPUAF,2)
				 
		'wPRE = FormatNumber(cdbl(rstQuery.Fields("D300005PRE")),1)
		
		
		wNPS = wNPS & " - " & wDEC  
		
		'IF wCuenta = 0 Then
		'	Imprimir_Encabezado()
		'End If 

		IF wFAM <> TRIM(rstQuery.Fields("A300003NPS")) THEN 
		
			Imprimir_Encabezado()
							
			wFAM = TRIM(rstQuery.Fields("A300003NPS"))	
					
		END IF

			
		Response.write "<tr>"
			Response.write "<td style=""font-family: arial; font-size: 11pt;"" width=""13%"">"
				Response.write wCPR
			Response.write "</td>"			
			Response.write "<td style=""font-family: arial; font-size: 11pt;"" align=""left"" width=""15%"">"
				Response.write wREF
			Response.write "</td>"
			Response.write "<td style=""font-family: arial; font-size: 11pt;"" width=""48%"" align=""left"">"
				Response.write wDEL
			Response.write "</td>"
			Response.write "<td style=""font-family: arial; font-size: 11pt;"" width=""16%"" align=""right"">"
				Response.write wPUA 
			Response.write "</td>"
			'Response.write "<td style=""font-family: arial; font-size: 11pt;"" width=""16%"" align=""right"">"
			'	Response.write wPUAF 
			'Response.write "</td>"
			IF Session("glTipoUsuario") <> "V" THEN
				Response.write "<td style=""font-family: arial; font-size: 11pt;"" width=""10%"" align=""center"">"
					Response.write wCIN
				Response.write "</td>"			
			END IF 
		Response.write "</tr>"
	
		wCuenta = wCuenta + 1
		rstQuery.MoveNext 
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
		
	%>
	
	<%' ************************FIN DETALLE************************ %>
	
	
	
</table>

<p align="center" style="margin-top: 10px">

<% 'END IF %>


<% Sub Imprimir_Encabezado()
		
		Response.write 	"<tr>"
			Response.write "<td colspan=""5"" align=""left"" >"
					Response.write "<font size=""2""><b>Linea: " & wNPS & "</b></font>" 
				Response.write "</td>" 
		Response.write  "</tr>" 
		Response.write "<tr>"
				Response.write "<td style=""border-style: none; border-width: medium"" width=""10%""><u>"
					Response.write "<font style=""font-family: arial; font-size: 10pt;""><b>Producto</b></font></u>"
				Response.write "</td>"
				Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" align=""left"">"
					Response.write "<p align=""left""><u><font style=""font-family: arial; font-size: 10pt;""><b>Homologo</b></font></u>"
				Response.write "</td>"
				Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" align=""left"">"
					Response.write "<p align=""left""><u><font style=""font-family: arial; font-size: 10pt;""><b>Descripción</b></font></u>"
				Response.write "</td>"
				Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" align=""left"">"
				IF Session("glAplicarIva") = "0" Then	
					Response.write "<p align=""right""><u><font style=""font-family: arial; font-size: 10pt;""><b>Precio Neto sin IVA</b></font></u>"
				ELSE
					Response.write "<p align=""right""><u><font style=""font-family: arial; font-size: 10pt;""><b>Precio Neto con IVA</b></font></u>"
				END IF 
				Response.write "</td>"
				IF Session("glTipoUsuario") <> "V" THEN
					Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" align=""center"">"
						Response.write "<p align=""center""><u><font style=""font-family: arial; font-size: 10pt;""><b>Existencia</b></font></u>"
					Response.write "</td>"
				END IF
				'Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" align=""right"">"
				'	Response.write "<p align=""center""><u><font style=""font-family: arial; font-size: 10pt;""><b>Ultimo Acceso</b></font></u>"
				'Response.write "</td>"
				'Response.write "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium"" align=""center"">"
				'	Response.write "<p align=""center""><u><font style=""font-family: arial; font-size: 10pt;""><b>Visitas</b></font></u>"
				'Response.write "</td>"
		Response.write "</tr>"
			
	End Sub 

%>
<input type="button" name="Imprimir" Value="Imprimir" onclick="window.print()"> 


</p>


</body>

</html>