<%@ Language=VBScript %>
<% wSTSIMP = Request.QueryString("STSIMP") %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Reclamos</title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<!--#include file="X001Z001.INC"-->
</head>


<style>

html{overflow-y:scroll} 

</style>
<% if wSTSIMP = "S" OR wSTSIMP = "E" THEN
	wcellpadding = "3"
	if wSTSIMP = "E" THEN 
		Response.ContentType = "application/vnd.ms-excel" 
		wcellpadding = "0"
	end if	
	wBorderColor ="#C0C0C0"  %>
	<body onload="window.status='<%=Request.ServerVariables("URL")%>'">
		<div align=center>

		<table BORDER="1" WIDTH="100%" cellspacing="0" cellpadding="<%=wcellpadding%>"
		  bordercolorlight="<%=wBorderColor%>" bordercolordark="<%=wBorderColor%>" bordercolor="<%=wBorderColor%>">
		  
<%	ELSE %>

<body ALIGN="CENTER" vlink="#0000FF" topmargin="0" rightmargin="0" leftmargin="17" bottommargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>">

	
	
	

		<!--
			WIDTH="750" Pantalla 800X600
		-->
		<%'=Session("glTamano")%>
		
		

		
                		<div align="center"  >
	<table border="0" height="100%" width="920" bgcolor="#FFFFFF" cellspacing="0"> <tr><td valign="top" >
	
	<FORM NAME="frmGral" METHOD="post" ACTION="X001A100_AS2.asp" target="main">

		<table BORDER="0" bordercolor="#CACACA" WIDTH="920" ALIGN=center cellpadding=5	cellspacing=0 > 
<%	END IF

	Function LastDayOfMonth(iMonth, iYear)
		NextMonth = DateAdd("m", 1, DateSerial(iYear, iMonth, "01"))
		LastDayOfMonth = Day(DateAdd("d", -1, NextMonth))
	End Function


	wTIT = Request.QueryString("URLTIT")	
	wURLACT = TRIM(Request.QueryString("URLACT"))
	wNOMTAB = Request.QueryString("NOMTAB")
	wSTSPED = Request.QueryString("STSPED")		

	wMES = Request.Form("MES") 
	IF LEN(TRIM(wMES)) = 0 THEN
		wMES = 0
	END IF

	'Mostrar Encabezado para impresion
	if wSTSIMP = "S" THEN
		'Mostrar Titulo
		Mostrar_Titulo
		'Mostrar Encabezado
		wTipo = "E"
		wCLASS = "TDS"
		wShowURL = "N"
		Mostrar_Linea
	   ELSE	
		wShowURL = "S"
	END IF
	
	'Mostrar Encabezado para impresion
    
     wMes_Actual = Right("00" & Month(Now()),2)
    wAno_Actual = Year(Now())
    
	wMes_Anterior = DateAdd("m", -1, Now())
	wAno_Anterior = Year(wMes_Anterior)
	wMes_Anterior = Right("00" & Month(wMes_Anterior),2)
	
	wMes_Tras_Anterior = DateAdd("m", -2, Now())
	wAno_Tras_Anterior = Year(wMes_Tras_Anterior)
	wMes_Tras_Anterior = Right("00" & Month(wMes_Tras_Anterior),2)
 
	'Response.write wMes_Tras_Anterior & "-" & wAno_Tras_Anterior & "<br>" 
	'Response.write wMes_Anterior & "-" & wAno_Anterior & "<br>"
	'Response.write wMes_Actual & "-" & wAno_Actual 
	
	IF wMES = "0" THEN
		wDiaFinal = LastDayOfMonth(wMes_Actual, wAno_Actual)
		wDiaFinal = Right("00" & wDiaFinal, 2)
		wFECHAI = wAno_Actual & "-" & wMes_Actual & "-01 00:00:00"
		wFECHAF = wAno_Actual & "-" & wMes_Actual & "-" & wDiaFinal & " 23:59:59"
	END IF
	IF wMES = "1" THEN
	 	wDiaFinal = LastDayOfMonth(wMes_Anterior, wAno_Anterior)
	 	wDiaFinal = Right("00" & wDiaFinal, 2)
	    wFECHAI = wAno_Anterior & "-" & wMes_Anterior & "-01 00:00:00"
		wFECHAF = wAno_Anterior & "-" & wMes_Anterior & "-" & wDiaFinal & " 23:59:59"
	END IF
	IF wMES = "2" THEN
	 	wDiaFinal = LastDayOfMonth(wMes_Tras_Anterior, wAno_Tras_Anterior)
	 	wDiaFinal = Right("00" & wDiaFinal, 2)
	    wFECHAI = wAno_Tras_Anterior & "-" & wMes_Tras_Anterior & "-01 00:00:00"
		wFECHAF = wAno_Tras_Anterior & "-" & wMes_Tras_Anterior & "-" & wDiaFinal & " 23:59:59"
	END IF
	IF wMES = "9" THEN
	 	wDiaFinal = LastDayOfMonth(wMes_Actual, wAno_Actual)
	 	wDiaFinal = Right("00" & wDiaFinal, 2)
	    wFECHAI = wAno_Tras_Anterior & "-" & wMes_Tras_Anterior & "-01 00:00:00"
		wFECHAF = wAno_Actual & "-" & wMes_Actual & "-" & wDiaFinal & " 23:59:59"
	END IF

	

	strCnn	= Application("XDTA300_ConnectionString")
	
		
	SQL = " SELECT E300001COD, E300001CTR, E300001CCL, " 
	SQL = SQL & " E300001STS,  E300001FPR, A300050DEL, A300002RSO "
	SQL = SQL & " FROM X300EQ001 " 	
	SQL = SQL & " WHERE "
	SQL = SQL & " E300001CCI ='" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " E300001CIA ='" & Session("glCia") & "' AND "
	SQL = SQL & " E300001STS <>'3' and E300001STS <>'9' and E300001CTR <>'1' "
	wWHERE = " AND "	
	if Session("glTipoUsuario") = "C" then
		SQL = SQL & wWHERE
		SQL = SQL & " E300001CCL = '" & Session("glUsuario") & "' "
	End If
	if Session("glTipoUsuario") = "V" or Session("glTipoUsuario") = "S" Then
		SQL = SQL & wWHERE
		SQL = SQL & " E300001CCL IN ( "
		SQL = SQL & " SELECT A300002CCL FROM X300AF002 WHERE "
		SQL = SQL & " A300002CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " A300002CVE = '" & Session("glCodVendedor") & "') "
	End If
	If len(trim(Session("glBusqueda"))) > 0 Then
		SQL = SQL & wWHERE
		SQL = SQL & " ((E300001COD LIKE '%" & ucase(Session("glBusqueda")) & "%') OR  "
		SQL = SQL & "  (E300001CCL LIKE '%" & ucase(Session("glBusqueda")) & "%'))  "
	end if	
	SQL = SQL & " ORDER BY E300001FPR DESC " 	
    
    'Response.Write SQL
	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	wTipo = "D"
	wCLASS = "TDD"
	wCuenta = 1
	wCnt = 0
	wTC04 = 0 
	wTC05 = 0
	wTC06 = 0
	DO WHILE NOT rstQuery.EOF 'and wCuenta < cint(Session("glRegistros"))

		wOBJ = right(("0000" & wCuenta),4)
		wNAMP = "P" & wOBJ
		wNAMC = "C" & wOBJ
		
		
		wC01 = trim(rstQuery.Fields("E300001COD"))		
		wC05 = trim(rstQuery.Fields("E300001CCL"))		
		wC02 = LEFT(TRIM(replace(trim(rstQuery.Fields("E300001CCL")) & "-" & trim(rstQuery.Fields("A300002RSO")),"&"," ")),55)
		wC02 = replace(wC02,"'"," ")
		wC03 = right("0" & day(rstQuery.Fields("E300001FPR")),2) & "-" & right("0" & month(rstQuery.Fields("E300001FPR")),2) & "-" & right(year(rstQuery.Fields("E300001FPR")),2)
		wC04 = trim(rstQuery.Fields("E300001CTR")) & "-" & trim(rstQuery.Fields("A300050DEL"))
	
		
	
		
		wSTS = trim(rstQuery.Fields("E300001STS"))			
		
		IF wSTS = "1" THEN
			wSTS = "Abierto"
		  ELSE
		  	wSTS = "Proceso"		
		END IF 
		
		
		'Armar URL
		wURL = wURLACT & "?CCL=" & wC05 & "&NRO=" & wC01 & "&CLU=" & Session("glTipoUsuario") & "&PUS=" & Session("glUsuario")
		wTIURL = "<A href=" & wURL & " target=""main""> "
		wTFURL = " </A>"




		Mostrar_Linea
		rstQuery.MoveNext 
		wCuenta = wCuenta + 1
		wCnt = wCnt + 1
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	

	wTDIURL = ""
	wTIURL = ""
	wTFURL = ""

	IF wCnt > 0 then
		wCLASS = "TD1"
		wTipo = "T"
		wC01 = wCnt
		wC02 = "<b>Totales</b>"		
		wC03 = "&nbsp;"
		'wC04 = wTC04
		'wC05 = wTC05
		'wC06 = wTC06	
		'wC04 = formatnumber(wC04,2)
		'wC05 = formatnumber(wC05,2)
		'wC06 = formatnumber(wC06,2)
		wC04 = "&nbsp;"
		wC05 = "&nbsp;"
		wC06 = "&nbsp;"
		wSTS = "&nbsp;"
		wCHK = "&nbsp;"
		wC07 = "&nbsp;"
		Mostrar_Linea	
	end if
		
%>
<%'Incluir Cuerpo del Reporte %>
<!--#include file="X001A104_C.ASP"-->
</table>
           
<!--		<div align="center">
<table>
<tr>
<td>
<p align="center" style="margin-top: 10px">
<font face="Tahoma" style="font-size: 10pt">*Para Actualizar o Eliminar Pedidos debe Seleccionar el Nro. de Pedido con el Mouse.
</font> </td> 
</tr> 
</table> -->
  		



</FORM>
</td></tr></table></div>
</body>
</html>

