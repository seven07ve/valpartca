<%@ Language=VBScript %>
<%

Response.Expires = -1
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"

%>
<% wSTSIMP = Request.QueryString("STSIMP") %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<title>PEDIDOS</title>
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
	<body onload="window.status='<%=Request.ServerVariables("URL")%>'">
		<div align=center>

		<table BORDER="1" WIDTH="100%" cellspacing="0" cellpadding="<%=wcellpadding%>"
		  bordercolorlight="<%=wBorderColor%>" bordercolordark="<%=wBorderColor%>" bordercolor="<%=wBorderColor%>">
		  
<%	ELSE %>

<script language="JavaScript1.2" >

/*function margen() {	*/
	var width=window.screen.width, height=window.screen.height;	
	
	//Verifica Resolusion de Pantalla
	if ((width=='800') && (height=='600')){
		document.write('<body ALIGN="CENTER" vlink="#0000FF" topmargin="0" rightmargin="0" leftmargin="0"  bgcolor="<%=Request.Cookies("CAR")("Color1")%>">') 
	}else{
        document.write('<body ALIGN="CENTER" vlink="#0000FF" topmargin="0" rightmargin="0" leftmargin="18"  bgcolor="<%=Request.Cookies("CAR")("Color1")%>">') 
	}

//}

</SCRIPT>

	
	
	

		<!--
			WIDTH="750" Pantalla 800X600
		-->
		<%'=Session("glTamano")%>
		
		

		
	                	
		<table BORDER="1" width="919" ALIGN=center  bordercolor="#FFFFFF"  cellspacing="0" cellpadding="5"  > 
<%	END IF

	wTIT = Request.QueryString("URLTIT")	
	wURLACT = TRIM(Request.QueryString("URLACT"))		

	Function LastDayOfMonth(iMonth, iYear)
		NextMonth = DateAdd("m", 1, DateSerial(iYear, iMonth, "01"))
		LastDayOfMonth = Day(DateAdd("d", -1, NextMonth))
	End Function


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
    
	wNOMTAB = Request.QueryString("NOMTAB")
	wSTSPED = Request.QueryString("STSPED")
	
	wMES = Request.Form("MES") 
	IF LEN(TRIM(wMES)) = 0 THEN
		wMES = 0
	END IF
	
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
		wFECHAI = wAno_Actual & "-" & wMes_Actual & "-" & "01 00:00:00"
		wFECHAF = wAno_Actual & "-" & wMes_Actual & "-" & wDiaFinal & " 23:59:59"
	END IF
	IF wMES = "1" THEN
	 	wDiaFinal = LastDayOfMonth(wMes_Anterior, wAno_Anterior)
	 	wDiaFinal = Right("00" & wDiaFinal, 2)
	    wFECHAI = wAno_Anterior & "-" & wMes_Anterior & "-" & "01 00:00:00"
		wFECHAF = wAno_Anterior & "-" & wMes_Anterior & "-" & wDiaFinal & " 23:59:59"
	END IF
	IF wMES = "2" THEN
	 	wDiaFinal = LastDayOfMonth(wMes_Tras_Anterior, wAno_Tras_Anterior)
	 	wDiaFinal = Right("00" & wDiaFinal, 2)
	    wFECHAI = wAno_Tras_Anterior & "-" & wMes_Tras_Anterior & "-" & "01 00:00:00"
		wFECHAF = wAno_Tras_Anterior & "-" & wMes_Tras_Anterior & "-" & wDiaFinal & " 23:59:59"
	END IF
	IF wMES = "9" THEN
	 	wDiaFinal = LastDayOfMonth(wMes_Actual, wAno_Actual)
	 	wDiaFinal = Right("00" & wDiaFinal, 2)
	    wFECHAI = wAno_Tras_Anterior & "-" & wMes_Tras_Anterior & "-" & "01 00:00:00"
		wFECHAF = wAno_Actual & "-" & wMes_Actual & "-" & wDiaFinal & " 23:59:59"
	END IF

	strCnn	= Application("XDTA201_ConnectionString")    
    SQL = "SELECT (RTRIM(B201100OPE) + '-' + B201100NPE) AS WPEDIDO, B201100OPE, B201100NPE, B201100CCL, "
    SQL = SQL & " B201100FPR, B201100KIL, B201100TUV, (B201100MNE + B201100BIV) AS WNETOIVA, A201002RSO, "
    SQL = SQL & " B201100STS FROM X201BF100 LEFT OUTER JOIN X201AF002 ON "
    SQL = SQL & " B201100CCI = A201002CCI AND "
    SQL = SQL & " B201100CIA = A201002CIA AND "
    SQL = SQL & " B201100CCL = A201002CCL  "
    SQL = SQL & " WHERE "
    SQL = SQL & " B201100CCI = '" & Session("glCiaInternet") & "' AND "
    'SQL = SQL & " B200100INT = '0' AND "
    'SQL = SQL & " (DATEDIFF(day, B200100FPR, getdate()) < 30) AND "
    SQL = SQL & " ( B201100STS = '1' OR "
    SQL = SQL & " B201100STS = '2' ) AND  "
    SQL = SQL & " B201100FPR >= '" & wFECHAI & "' AND "
	SQL = SQL & " B201100FPR <= '" & wFECHAF & "' "
    wWHERE = " AND "	
    if Session("glTipoUsuario") = "V" then
		SQL = SQL & wWHERE
		SQL = SQL & " B201100CVE = '" & Session("glCodVendedor") & "' "
	end if
    if len(trim(Session("glBusqueda"))) > 0 then
		SQL = SQL & wWHERE
		SQL = SQL & " ((B201100NPE LIKE '%" & ucase(Session("glBusqueda")) & "%') OR  "
		SQL = SQL & "  (B201100OPE LIKE '%" & ucase(Session("glBusqueda")) & "%') OR  "
		SQL = SQL & "  (B201100CCL LIKE '%" & ucase(Session("glBusqueda")) & "%') OR  "
		SQL = SQL & "  (A201002RSO LIKE '%" & ucase(Session("glBusqueda")) & "%'))    "
	end if	

    'SQL = SQL & " GROUP BY B201100OPE, B201100NPE, B201100CCL, B201100FPR, "
    'SQL = SQL & " B201100KIL, B201100TUV, B201100MNE,B201100BIV, A201002RSO, B201100STS "
    SQL = SQL & " ORDER BY B201100FPR DESC"
	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	wTipo = "D"
	wCLASS = "TDD"
	'wCuenta = 0
	wTC04 = 0 
	wTC05 = 0
	wTC06 = 0
	'response.write Session("glTipoUsuario")
	DO WHILE NOT rstQuery.EOF 'and wCuenta < cint(Session("glRegistros"))

		
		wCL1 = trim(rstQuery.Fields("B201100OPE"))
		wCL2 = trim(rstQuery.Fields("B201100NPE"))
		wCCL = trim(rstQuery.Fields("B201100CCL"))
		wSTS = trim(rstQuery.Fields("B201100STS"))
		wRSO = trim(rstQuery.Fields("A201002RSO"))
		

		wC01 = trim(rstQuery.Fields("WPEDIDO"))		
		'wC01 = wCL1 & cdbl(rstQuery.Fields("B201100NPE"))		
	
		IF NOT ISNULL(wRSO) THEN
			wRSO = LEFT(TRIM(replace(wRSO,"&"," ")),52)
		ELSE
			wRSO = " "
		END IF		
		
		IF LEN(TRIM(wNER)) = 0 OR ISNULL(wNER) THEN
			wNER = "&nbsp;"
		END IF

		
		wC02 = wCCL & " - " & wRSO
		wC02 = replace(wC02,"'"," ")
		wC03 = right("0" & day(rstQuery.Fields("B201100FPR")),2) & "-" & right("0" & month(rstQuery.Fields("B201100FPR")),2) & "-" & right(year(rstQuery.Fields("B201100FPR")),2)
		wC04 = trim(rstQuery.Fields("B201100TUV"))
		
		wC06 = trim(rstQuery.Fields("WNETOIVA"))
		
		'wPPP = trim(rstQuery.Fields("A300002PPP"))			
		
		'wPPP = CDbl(wPPP)     
	    'wC06 = wC06 - ((wC06 * wPPP) / 100)
	    
	    IF ISNULL(wC04) THEN
		    wC04 = "0"
	    END IF 
	    
   	    IF ISNULL(wC06) THEN
		    wC06 = "0"
	    END IF 
		
		IF wSTS = "1" THEN
			wSTS = "Sin Comunicar"
		  ELSE
		  	wSTS = "Comunicado"		
		END IF 


		wC07 = "Ver Item"		
		IF isnull(wC04) then
			wC04 = 0
		end if	
		IF isnull(wC05) then
			wC05 = 0
		end if	
		IF isnull(wC06) then
			wC06 = 0
		end if	
		wTC04 = wTC04 + wC04
		wTC05 = wTC05 + wC05
		wTC06 = wTC06 + wC06

		wC06F = round((wC06/1000),2)  
		wC04 = formatnumber(wC04,0)
		wC05 = formatnumber(wC05,2)
		wC06 = formatnumber(wC06,2)
		wC06F = formatnumber(wC06F,2)


		'Armar URL
		wURL = wURLACT & "?CLA001=" & wCL1 & "&CLA002=" & wCL2
		wURLD = "X001A101M_S.ASP" & "?CLA001=" & wCL1 & "&CLA002=" & wCL2 
		wTDIURL = "<A href=" & wURLD & " target=""_parent""> "
		wTIURL = "<A href=" & wURL & " target=""main""> "
		wTFURL = " </A>"

		Mostrar_Linea
		rstQuery.MoveNext 
		wCuenta = wCuenta + 1
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	

	wTDIURL = ""
	wTIURL = ""
	wTFURL = ""

	IF wCuenta > 0 then
		wCLASS = "TD1"
		wTipo = "T"
		wC01 = wCuenta
		wC02 = "<b>Totales</b>"		
		wC03 = "&nbsp;"
		wSTS = "&nbsp;"
		wNER = "&nbsp;"
		wC04 = wTC04
		wC05 = wTC05
		wC06 = wTC06	
		wC06F = round((wTC06/1000),2) 
		wC04 = formatnumber(wC04,0)
		wC05 = formatnumber(wC05,2)
		wC06 = formatnumber(wC06,2)
		wC06F = formatnumber(wC06F,2)

		wC07 = "&nbsp;"
		Mostrar_Linea	
	end if
		
%>
<%'Incluir Cuerpo del Reporte %>
<!--#include file="X001A100M_C.ASP"-->
</table>
           

  		</div>

 



</body>
</html>

