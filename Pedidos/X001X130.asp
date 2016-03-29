<%@ Language=VBScript %>
<% wSTSIMP = Request.QueryString("STSIMP") 
wIMP = Request.QueryString("IMP")

 Datos_Compania wDEL, wURI			

%>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<title>Facturas</title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<style type="text/css">
	HTML {
     overflow-y : scroll ;
	}
</style>

<!--#include file="X001Z001.INC"-->
<!--#include file="X001Y007.PRC"-->
</head>
<% if wSTSIMP = "S" OR wSTSIMP = "E" THEN
	wcellpadding = "3"
	if wSTSIMP = "E" THEN 
		Response.ContentType = "application/vnd.ms-excel" 
		wcellpadding = "0"
	end if	
	wBorderColor ="#C0C0C0"  %>
	<body onload="window.status='<%=Request.ServerVariables("URL")%>'" style="text-align: center">
	<p align="left"  ><img border="0" src="<%=wURI%>" ></p>

		<div align=center>
		<table BORDER="1" WIDTH="100%" cellspacing="0" cellpadding="<%=wcellpadding%>"
		  bordercolorlight="<%=wBorderColor%>" bordercolordark="<%=wBorderColor%>" bordercolor="<%=wBorderColor%>">
<%	ELSE %>
	<body topmargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>" leftmargin="17" rightmargin="0" bottommargin="0" vlink="#0000FF" onload="window.status='<%=Request.ServerVariables("URL")%>'" style="text-align: center">
		
		<table border="0" align="center" width="919" height="100%" bgcolor="#ffffff" cellpadding="0" cellspacing="0">
		<tr>
		<td valign="top"  > 

		
		<table BORDER="0" WIDTH="919" cellpadding="6" cellspacing="1" bordercolor="#FFFFFF" align="center" >
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
	
	wNOMTAB = "X300BQ200"
	wPAR = wPAR & "&CAMC01=B300200NFA" 
	wCAMC01 = "B300200CCL"
	wCAMC02 = "B300200NFA" 
	wCAMC03 = "A300002RSO" 
	wCAMC04 = "B300200FEC"	
	wCAMC05 = "B300200MNE"	
	wCAMC06 = "B300200BIV"	
	wCAMC07 = "B300200MTO"	
		
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
	
	wFECHAI = wAno_Anterior & "-" & wMes_Anterior & "-" &  "01 00:00:00"
	wFECHAF = wAno_Actual & "-" & wMes_Actual & "-" & wDiaFinal & " 23:59:59"
	
	'Response.write wFECHAI & "<BR>" & wFECHAF
	
	strCnn	= Application("XDTA300_ConnectionString")
	
	
	'BUSCA ERP COMPA�IA INTERNET
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

	
	
	'response.write "Vendedor: " & wCVE


	SQL = "SELECT " & wCAMC01 & ", " & wCAMC02 
	SQL = SQL & ", " & wCAMC03 & ", " & wCAMC04 
	SQL = SQL & ", " & wCAMC05 & ", " & wCAMC06 
	SQL = SQL & ", " & wCAMC07 & ", B300200STS "
	SQL = SQL & ", B300200FRC, B300200OCO " 
	SQL = SQL & " FROM " &  wNOMTAB 		
	SQL = SQL & " WHERE "
	SQL = SQL & wCAMXXX & "CCI ='" & Session("glCiaInternet") & "'  "
	SQL = SQL & " AND " & wCAMXXX & "CIA ='" & Session("glCia") & "' "
	SQL = SQL & " AND B300200FEC >='" & wFECHAI & "'"
	SQL = SQL & " AND B300200FEC <='" & wFECHAF & "'"
	If len(trim(wCVE)) > 0  AND wCVE <> "000" Then
		SQL = SQL & " AND B300200CVE ='" & wCVE & "' "
	End If
	If len(trim(wFAM)) > 0 and wFAM <> "000" and wFAM <> "999" then
		SQL = SQL & " AND B300200CCL ='" & wFAM & "' "
	End if 
	If Session("glTipoUsuario") = "C" OR Session("glTipoUsuario") = "CP" Then
		SQL = SQL & " AND B300200CCL ='" & Session("glUsuario") & "' "
	End if 
	If Session("glTipoUsuario") = "V" Then
		SQL = SQL & " AND B300200CVE ='" & Session("glCodVendedor") & "' "
	End If
	If len(trim(wPAR)) > 0 then
		SQL = SQL & " AND "
		SQL = SQL & " (( B300200CCL LIKE '%" & ucase(wPAR) & "%') OR  "
		SQL = SQL & "  ( B300200NFA LIKE '%" & ucase(wPAR) & "%') OR  "
		SQL = SQL & "  ( A300002RSO LIKE '%" & ucase(wPAR) & "%'))  "
	End If 				
	SQL = SQL & " ORDER BY B300200NFA DESC " 
	
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
	DO WHILE NOT rstQuery.EOF and (len(trim(wFAM)) > 0 or Session("glTipoUsuario") = "C") 
		

		wCL1 = trim(rstQuery.Fields(0))
		wCL2 = trim(rstQuery.Fields(1)) 

		wC01 = trim(rstQuery.Fields(1))
		wC02 = trim(rstQuery.Fields(0)) & " - " & trim(rstQuery.Fields(2))
		wC03 = cdate(rstQuery.Fields(3))
		wC04 = trim(rstQuery.Fields(4))	
		wC05 = trim(rstQuery.Fields(5))	
		wC06 = trim(rstQuery.Fields(6))
		wSTS = trim(rstQuery.Fields(7))
		'wFRC = cdate(rstQuery.Fields(8))
		wCSE = trim(rstQuery.Fields(9))	
		wC07 = "Ver Items"

		IF wFRC < wC03 Then    
			wSTS = "<font color=""black""><b>Transito</b></font>"
  		 Else
			wSTS = "<font color=""Green""><b>Recibido</b></font>"
		END IF 		
		
		IF wCSE = "0" THEN
			wSTS = "<font color=""black""><b>Emisi�n</b></font>"
		END IF
		
		'wTC04 = wTC04 + cdbl(wC04)
		'wTC05 = wTC05 + cdbl(wC05)
		'wTC06 = wTC06 + cdbl(wC06)
		
		wURL = "X001X130_A.asp?CLA001=" & wC01 
				
		wTDURL = "<font color=""#000000""><b>"
		
		'wURLD = "X001X131_S.ASP" & "?CLA001=" & wCL1 & "&CLA002=" & wCL2 

		IF wERP = "ASW" THEN
			wURLD = "X001X130I.ASP" & "?PAR=0000000ABABABACACACAGAGAGAFAFAF101111110101010101"
		'ELSE
			'wURLD = "X001X130I_2.ASP" & "?PAR=0000000ABABABACACACAGAGAGAFAFAF101111110101010101"
		END IF 
		wURLD = wURLD & "000001010101000000000SDAADDDADSFWFWWFEFWCWWF000001111111111CAR001010101"
		wURLD = wURLD & "000001010101000000000SDAADDDADSFWFWWFEFWCWWF000001111111111CAR001010101"
		wURLD = wURLD & "01DWD141111455888CLA001=" & wCL1 & "&CLA002=" & wCL2 				
		wTDIURL = "<font color=""#0000FF"" onclick=window.open('" & wURLD & "','_blank','toolbar=0,location=0,directories=0,resizable=1'); style=""CURSOR: pointer""><b>"
		'wTDIURL = "<font color=""#0000FF"" onclick=""alert('En Construcci�n');"" style=""CURSOR: pointer""><b>"
		
		wTFURL = " </b></font>"
		
		IF wSTSIMP <> "E" THEN 
			'wC04 = formatnumber(wC04,2)
			'wC05 = formatnumber(wC05,2)
			'wC06 = formatnumber(wC06,2)		
		 ELSE
		 	wTDIURL = ""
		    wC04 = Replace(wC04, ".", ",")
			wC05 = Replace(wC05, ".", ",")
			wC06 = Replace(wC06, ".", ",")		
		END IF 
		
		wC03 = right("0" & Day(wC03),2) & "-" & right("0" & Month(wC03),2) & "-" & Year(wC03)	
		
	

	

		wCLASS = "TDD"
		wCLASS2 = "TDD2"

		IF wFAM <> "000" THEN
			Mostrar_Linea
		END IF
		rstQuery.MoveNext 
		wCuenta = wCuenta + 1
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
		wC01 = wCuenta 
		wC02 = "<b>Totales</b>"		
		wC03 = "&nbsp;"
		wSTS = "&nbsp;"
		wC04 = wTC04
		wC05 = wTC05
		wC06 = wTC06			
		wC04 = formatnumber(wC04,2)
		wC05 = "&nbsp;" 'formatnumber(wC05,2)
		wC06 = formatnumber(wC06,2)
		wC07 = "&nbsp;"
		Mostrar_Linea	
		
	end if
	


%>
<%'Incluir Cuerpo del Reporte %>
<!--#include file="X001X130_C.ASP"-->
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