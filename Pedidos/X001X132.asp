<%@ Language=VBScript %>
<% wSTSIMP = Request.QueryString("STSIMP") 
wIMP = Request.QueryString("IMP")

%>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<title>Pre-Despachos</title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<style type="text/css">

html{overflow-y:scroll} 


</style> 

<!--#include file="X001Z001.INC"-->
</head>
<% if wSTSIMP = "S" OR wSTSIMP = "E" THEN
	wcellpadding = "3"
	if wSTSIMP = "E" THEN 
		Response.ContentType = "application/vnd.ms-excel" 
		wcellpadding = "0"
	end if	
	wBorderColor ="#C0C0C0"  %>
	<body onload="window.status='<%=Request.ServerVariables("URL")%>'" style="text-align: center">
	<p align="left"  ><img border="0" src="images/Logo2.gif" ></p>

		<div align=center>
		<table BORDER="1" WIDTH="100%" cellspacing="0" cellpadding="<%=wcellpadding%>"
		  bordercolorlight="<%=wBorderColor%>" bordercolordark="<%=wBorderColor%>" bordercolor="<%=wBorderColor%>">
<%	ELSE %>
	<body topmargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>" bottommargin="0" leftmargin="17" rightmargin="0" vlink="#0000FF" onload="window.status='<%=Request.ServerVariables("URL")%>'" style="text-align: center" scroll="yes">
		
		<table border="0" align="center" width="919" height="100%" bgcolor="#ffffff" cellpadding="0" cellspacing="0">
		<tr>
		<td valign="top"  > 
		<table BORDER="1" WIDTH="919" cellpadding="6" cellspacing="0" bordercolor="#FFFFFF" align="center" >
<%	END IF

	Function LastDayOfMonth(iMonth, iYear)
		NextMonth = DateAdd("m", 1, DateSerial(iYear, iMonth, "01"))
		LastDayOfMonth = Day(DateAdd("d", -1, NextMonth))
	End Function

	wTIT = Request.QueryString("URLTIT")	
	wURLACT = TRIM(Request.QueryString("URLACT"))	
	wIMP = TRIM(Request.QueryString("IMP"))		
	wCVE = TRIM(Request.QueryString("CVE"))		
	wPAR = TRIM(Request.QueryString("PAR"))		
	
	wNOMTAB = "X300BQ204"
	wPAR = wPAR & "&CAMC01=B300205NFA" 
	wCAMC01 = "B300205CCL"
	wCAMC02 = "B300205NFA" 
	wCAMC03 = "A300002RSO" 
	wCAMC04 = "B300205NPE"	
	wCAMC05 = "B300205CPR"	
	wCAMC06 = "B300205UPE"	
	wCAMC07 = "A300003DEL"	
		
	wFAM = Request.Form("FAMILIA") 
	wPAR = Request.Form("PAR") 
	
	
	IF wIMP = "S" THEN
	    wFAM = Session("glFamilia")
	    wDES = Session("glDescripcion")
	  	Mostrar_Titulo
		'Mostrar Encabezado
		wTipo = "E"
		wCLASS = "TDS"
		wShowURL = "N"
		Mostrar_Linea
	  ELSE
		Session("glFamilia") = wFAM
		Session("glDescripcion") = wDES
		wShowURL = "S"
	END IF 	

		
	'Mostrar Encabezado para impresion
	if wSTSIMP = "S" THEN
		'Mostrar Titulo
		'Mostrar_Titulo
		'Mostrar Encabezado
		'wTipo = "E"
		'wCLASS = "TDS"
		'wShowURL = "N"
		'Mostrar_Linea
	   ELSE	
		wShowURL = "S"
	END IF
	
	'Mostrar Encabezado para impresion
    
	
	wCAMXXX = left(wCAMC01,7) 
	
	
	wMes_Actual = Right("00" & Month(Now()),2)
    wAno_Actual = Year(Now())
    
	wMes_Anterior = DateAdd("m", -1, Now())
	wAno_Anterior = Year(wMes_Anterior)
	wMes_Anterior = Right("00" & Month(wMes_Anterior),2)
	
	wDiaFinal = LastDayOfMonth(wMes_Actual, wAno_Actual)
	wDiaFinal = Right("00" & wDiaFinal, 2)
	
	wFECHAI = wAno_Anterior & "-" & wMes_Anterior & "-01 00:00:00"
	wFECHAF = wAno_Actual & "-" & wMes_Actual & "-" & wDiaFinal & " 23:59:59"
	
	'Response.write wFECHAI & "<BR>" & wFECHAF
	
	strCnn	= Application("XDTA300_ConnectionString")
	
	
	'response.write "Vendedor: " & wCVE


	SQL = "SELECT " & wCAMC01 & ", " & wCAMC02 
	SQL = SQL & ", " & wCAMC03 & ", " & wCAMC04 
	SQL = SQL & ", " & wCAMC05 & ", " & wCAMC06 
	SQL = SQL & ", " & wCAMC07 
	
	SQL = SQL & " FROM " &  wNOMTAB 		
	SQL = SQL & " WHERE "
	SQL = SQL & wCAMXXX & "CCI ='" & Session("glCiaInternet") & "'  "
	SQL = SQL & " AND " & wCAMXXX & "CIA ='" & Session("glCia") & "' "
	'SQL = SQL & " AND B300200FPR >='" & wFECHAI & "'"
	'SQL = SQL & " AND B300200FPR <='" & wFECHAF & "'"
	If len(trim(wCVE)) > 0  AND wCVE <> "000" Then
		SQL = SQL & " AND B300205CVE ='" & wCVE & "' "
	End If
	If len(trim(wFAM)) > 0 and wFAM <> "000" and wFAM <> "999" then
		SQL = SQL & " AND B300205CCL ='" & wFAM & "' "
	End if 
	If Session("glTipoUsuario") = "C" OR Session("glTipoUsuario") = "CP" Then
		SQL = SQL & " AND B300205CCL ='" & Session("glUsuario") & "' "
	End if 
	If Session("glTipoUsuario") = "V" Then
		SQL = SQL & " AND B300205CVE ='" & Session("glCodVendedor") & "' "
	End If
	If len(trim(wPAR)) > 0 then
		SQL = SQL & " AND "
		SQL = SQL & " (( B300205CCL LIKE '%" & ucase(wPAR) & "%') OR  "
		SQL = SQL & "  ( B300205NFA LIKE '%" & ucase(wPAR) & "%') OR  "
		SQL = SQL & "  ( B300205CPR LIKE '%" & ucase(wPAR) & "%') OR  "
		SQL = SQL & "  ( A300002RSO LIKE '%" & ucase(wPAR) & "%'))  "
	End If 				
	SQL = SQL & " ORDER BY B300205CCL, B300205CPR " 
	
	'Response.Write SQL	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	
    rstQuery.Open sql , strCnn
	wTipo = "D"
	wCLASS = "TDD"
	wCLASS2 = "TDD2"

	wCuenta = 0
	wTCuenta = 0 
	wTC08 = 0
	wTC09 = 0
	wTC10 = 0
	wCS08 = 0
	wTTC08 = 0
	wTTC09 = 0
	wTTC10 = 0
	wTTC08 = 0
	wCCL = "0"
	wC10 = 0 
	wTSVE = 0
	wTSNV = 0
	wTDPR = 0
	
	
	wCL1 = "0"
	wCL2 = "0"
	
	DO WHILE NOT rstQuery.EOF and (len(trim(wFAM)) > 0 or Session("glTipoUsuario") = "C") 
		
		If wCL1 <> trim(rstQuery.Fields(0)) or wCL2 <> trim(rstQuery.Fields(1)) Then
		
			IF wCL1 <> "0" or wCL2 <> "0" Then
				
				wCLASS = "TD1"		
				wTipo = "T"
				wOCO = "&nbsp;"
				wC01 = wCuenta2
				wC02 = "<b>Total</b>"		
				wC03 = "&nbsp;"
				wSTS = "&nbsp;"
				wC04 = wTC04
				wC05 = wTC05
				wC06 = wTC06			
				wC04 = formatnumber(wC04,0)
				wC05 = "&nbsp;" 'formatnumber(wC05,2)
				wC06 = formatnumber(wC06,2)
				wC07 = "&nbsp;"
				Mostrar_Linea
				
				wCuenta2 = 0
				wTC04 = 0
				wTC05 = 0
				wTC06 = 0	
				
			End If
		
			wCL1 = trim(rstQuery.Fields(0))
			wCL2 = trim(rstQuery.Fields(1)) 
			
			wRSO = trim(rstQuery.Fields(2)) 
			
			Response.write "<tr><td colspan=4 bgcolor=""#FFFFF""><font face=""Tahoma"" size=""2""><b>"
				'Response.write "PREDESPACHO: " & wCL2 & "<br>"
				Response.write "CLIENTE: " & wCL1 & " - " & wRSO				
			Response.write "</font></td></tr>"
			
		End If
			
		

		wC01 = trim(rstQuery.Fields(3))
		wC02 = trim(rstQuery.Fields(4)) 
		wC03 = trim(rstQuery.Fields(6)) 
		wC04 = trim(rstQuery.Fields(5)) 	
		wC05 = 0 'trim(rstQuery.Fields(5))	
		wC06 = 0 'trim(rstQuery.Fields(6))
		'wSTS = trim(rstQuery.Fields(7))
		'wFRC = cdate(rstQuery.Fields(8))
		'wCSE = trim(rstQuery.Fields(9))	
		wC07 = "Ver Detalle"

		
		
		IF wCSE = "0" THEN
			wSTS = "<font color=""black""><b>Emisión</b></font>"
		END IF
		
		wTC04 = wTC04 + cdbl(wC04)
		wTC05 = wTC05 + cdbl(wC05)
		wTC06 = wTC06 + cdbl(wC06)
		
		wURL = "X001X130_A.asp?CLA001=" & wC01 
				
		wTDURL = "<font color=""#0000FF"" onclick=window.open('" & wURL & "','main'); style=""CURSOR: pointer""><b>"
		
		wURLD = "X001X130I.ASP" & "?PAR=0000000ABABABACACACAGAGAGAFAFAFCARVICA101111110101010101"
		'wURLD = "http://server.insystech.net:8081/pedidos/X001X130I.ASP" & "?PAR=0000000ABABABACACACAGAGAGAFAFAFCARVICA101111110101010101"
		wURLD = wURLD & "000001010101000000000SDAADDDADSFWFWWFEFWCWWF000001111111111CAR001010101"
		wURLD = wURLD & "000001010101000000000SDAADDDADSFWFWWFEFWCWWF000001111111111CAR001010101"
		wURLD = wURLD & "01DWD141111455888CLA001=" & wCL1 & "&CLA002=" & wCL2 				
		wTDIURL = "<font color=""#0000FF"" onclick=window.open('" & wURLD & "','_blank','toolbar=0,location=0,directories=0,resizable=1'); style=""CURSOR: pointer""><b>"
		
		wTFURL = " </b></font>"
		
		IF wSTSIMP <> "E" THEN 
			wC04 = formatnumber(wC04,0)
			wC05 = formatnumber(wC05,2)
			wC06 = formatnumber(wC06,2)		
		 ELSE
		 	wTDIURL = ""
		    wC04 = Replace(wC04, ".", ",")
			wC05 = Replace(wC05, ".", ",")
			wC06 = Replace(wC06, ".", ",")		
		END IF 
		
		'wC03 = right("0" & Day(wC03),2) & "-" & right("0" & Month(wC03),2) & "-" & Year(wC03)	
		
	

	

		wCLASS = "TDD"
		wCLASS2 = "TDD2"

		IF wFAM <> "000" THEN
			Mostrar_Linea
		END IF
		rstQuery.MoveNext 
		wCuenta = wCuenta + 1
		wCuenta2 = wCuenta2 + 1
		wTCuenta = wTCuenta + 1	
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	

	wTDURL = ""
	wTIURL = ""
	wTFURL = ""


	IF wCuenta > 0 then

		wCLASS = "TD1"		
		wTipo = "T"
		wOCO = "&nbsp;"
		wC01 = wCuenta2
		wC02 = "<b>Total</b>"		
		wC03 = "&nbsp;"
		wSTS = "&nbsp;"
		wC04 = wTC04
		wC05 = wTC05
		wC06 = wTC06			
		wC04 = formatnumber(wC04,0)
		wC05 = "&nbsp;" 'formatnumber(wC05,2)
		wC06 = formatnumber(wC06,2)
		wC07 = "&nbsp;"
		Mostrar_Linea	
		
	end if
	


%>
<%'Incluir Cuerpo del Reporte %>
<!--#include file="X001X132_C.ASP"-->
</table>
</td> 
</tr> 
</table> 

<% IF wIMP = "S" THEN %>

    <br>
	  <input type="button" name="Imprimir" Value="Imprimir" onclick="window.print()"> 
  	  <input type="button" name="Cerrar" Value="Cerrar" onclick="window.close()"> 
<% END IF%>

</body>
</html>