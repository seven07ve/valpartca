<%@ Language=VBScript %>
<%

'Response.Expires = -1
'Response.Expiresabsolute = Now() - 1
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
<!--#include file="X001Z001.INC"-->
<style type="text/css">
	html{overflow-y:scroll} 
</style>

</head>
<% if wSTSIMP = "S" OR wSTSIMP = "E" THEN
	wcellpadding = "3"
	if wSTSIMP = "E" THEN 
		Response.ContentType = "application/vnd.ms-excel" 
		wcellpadding = "0"
	end if	
	wBorderColor ="#C0C0C0"  %>
	<body onload="window.status='<%=Request.ServerVariables("URL")%>'" >
		<div align=center>

		<table BORDER="1" WIDTH="100%" cellspacing="0" cellpadding="<%=wcellpadding%>"
		  bordercolorlight="<%=wBorderColor%>" bordercolordark="<%=wBorderColor%>" bordercolor="<%=wBorderColor%>">
		  
<%	ELSE %>


<body bgcolor="<%=Request.Cookies("CAR")("Color1")%>" ALIGN="CENTER" vlink="#0000FF" topmargin="0" rightmargin="0" leftmargin="17">

<script language="JavaScript" >

/*function margen() {	*/
	var width=window.screen.width, height=window.screen.height;	
	
	/*Verifica Resolusion de Pantalla
	if ((width=='800') && (height=='600')){
		document.write('<body ALIGN="CENTER" vlink="#0000FF" topmargin="0" rightmargin="0" leftmargin="18">') 
	}*/
	
	

//}


  function enviar() {

	if (confirm('�Desea Eliminar los Pedidos Seleccionados?')) {
	   document.frmGral.submit();   
	}
}


</SCRIPT>

	<style type="text/css">


html{overflow-y:scroll} 
	
body {margin-right: 0px;}


</style> 

	
	

		<!--
			WIDTH="750" Pantalla 800X600
		-->
		<%'=Session("glTamano")%>
		
		

		
	<table border="0" height="100%" width="919" align="center" bgcolor="#ffffff" cellpadding="0" cellspacing="0"   ><tr><td valign="top" align="center" >




<%    

	wSTSPED = Request.QueryString("STSPED")		
	
'IF wSTSPED = "0" THEN	 %>	 
	<!--<p style="margin-top: 8px; margin-bottom: 3px">&nbsp;&nbsp;&nbsp; </p>-->
<%'ELSE%>	
	<p style="margin-top: -10px; margin-bottom: -8px">&nbsp;&nbsp;&nbsp; </p>
<%'END IF %>		

     	
		<table BORDER="0" WIDTH="919" ALIGN="center" bordercolor="#FFFFFF" cellspacing="1"  cellpadding="2"  style="padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px;" > 
<FORM NAME="frmGral" METHOD="post" ACTION="X001A100_AS2.asp" target="main">
<%	END IF

	Function LastDayOfMonth(iMonth, iYear)
		NextMonth = DateAdd("m", 1, DateSerial(iYear, iMonth, "01"))
		LastDayOfMonth = Day(DateAdd("d", -1, NextMonth))
	End Function

	wTIT = Request.QueryString("URLTIT")	
	wURLACT = TRIM(Request.QueryString("URLACT"))
	wNOMTAB = Request.QueryString("NOMTAB")

	wMES = Request.Form("MES") 
	IF LEN(TRIM(wMES)) = 0 THEN
		wMES = 0
	END IF
	'response.write wMES

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
		'wFECHAI = wAno_Actual & "-" & wMes_Actual & "-01 00:00:00"
		'wFECHAF = wAno_Actual & "-" & wMes_Actual & "-" & wDiaFinal & " 23:59:59"
		wFECHAI = wAno_Actual & "-" & wMes_Actual & "-" & "01 00:00:00"
		wFECHAF = wAno_Actual & "-" & wMes_Actual & "-" & wDiaFinal & " 23:59:59"
	END IF
	IF wMES = "1" THEN
	 	wDiaFinal = LastDayOfMonth(wMes_Anterior, wAno_Anterior)
	 	wDiaFinal = Right("00" & wDiaFinal, 2)
	    'wFECHAI = wAno_Anterior & "-" & wMes_Anterior & "-01 00:00:00"
		'wFECHAF = wAno_Anterior & "-" & wMes_Anterior & "-" & wDiaFinal & " 23:59:59"
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
	
	'response.write wDiaFinal 
	

	strCnn	= Application("XDTA300_ConnectionString")
	
		
	SQL = "SELECT "
	SQL = SQL & " B300100NPE, WPEDIDO, WCLIENTE, B300100FAC, B300100OPE, B300100STS, " 
	SQL = SQL & " A300002PPP, B300100TUV, B300100MNE, B300100BIV, B300100NER "
	SQL = SQL & " FROM " & wNOMTAB
	SQL = SQL & " WHERE "
	SQL = SQL & " B300100CCI ='" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " B300100CIA ='" & Session("glCia") & "' AND "
	SQL = SQL & " B300100SPP ='" & wSTSPED & "'  "		
	IF wSTSPED = "1" THEN
		IF Session("glTipoUsuario") = "C" THEN
			SQL = SQL & " and DATEDIFF(day, B300100FAC, Getdate()) <= 120 "
		ELSE
			SQL = SQL & " AND "
			SQL = SQL & " B300100FAC >= '" & wFECHAI & "' AND "
			SQL = SQL & " B300100FAC <= '" & wFECHAF & "' "
		END IF 
	END IF 
	wWHERE = " AND "	
	if Session("glTipoUsuario") = "C" then
		SQL = SQL & wWHERE
		SQL = SQL & " B300100CCL = '" & Session("glUsuario") & "' "
	end if
	if Session("glTipoUsuario") = "V" then
		SQL = SQL & wWHERE
		SQL = SQL & " B300100CVE = '" & Session("glCodVendedor") & "' "
	end if
	if len(trim(Session("glBusqueda"))) > 0 then
		SQL = SQL & wWHERE
		SQL = SQL & " ((WPEDIDO LIKE '%" & ucase(Session("glBusqueda")) & "%') OR  "
		SQL = SQL & "  (WCLIENTE LIKE '%" & ucase(Session("glBusqueda")) & "%'))  "
	end if	
	SQL = SQL & " GROUP BY B300100NPE, WPEDIDO, WCLIENTE, B300100FAC, B300100OPE, B300100NER, " 	
	SQL = SQL & " B300100NPE, A300002PPP, B300100TUV, B300100MNE, B300100BIV, B300100STS   " 	
	SQL = SQL & " ORDER BY B300100NPE DESC " 	
    
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

	
		IF (Session("glTipoUsuario") = "A" or Session("glTipoUsuario") = "G") and wSTSPED = "0" THEN

			wCHK = "<INPUT TYPE=CHECKBOX NAME=NO>"

		END IF
		
		IF wCuenta = 1 THEN
			wC01 = "&nbsp;"
			wC02 = "&nbsp;"
			wC03 = "&nbsp;"
			wC04 = "&nbsp;"
			wSTS = "&nbsp;"
			wC06 = "&nbsp;"
			wC07 = "&nbsp;"
			wC08 = "&nbsp;"
			wC09 = "&nbsp;"
			
			'Mostrar_Linea
			
			IF Session("glTipoUsuario") <> "A" and Session("glTipoUsuario") <> "G" and wSTSPED = "0" THEN
				'Mostrar_Linea
			END IF
			
			IF wSTSPED = "1" THEN
				'Mostrar_Linea
			
			END IF
			
		
		END IF
		

		wOBJ = right(("0000" & wCuenta),4)
		wNAMP = "P" & wOBJ
		wNAMC = "C" & wOBJ
		
		wCL1 = trim(rstQuery.Fields("B300100OPE"))
		wCL2 = trim(rstQuery.Fields("B300100NPE"))
		
		wNER = trim(rstQuery.Fields("B300100NER"))
		
		IF LEN(TRIM(wNER)) = 0 OR ISNULL(wNER) THEN
			wNER = "&nbsp;"
		END IF
		
		'IF wSTSPED = "0" THEN
			wC01 = trim(rstQuery.Fields("B300100NPE"))		
		 ' ELSE 
		'	wC01 = "101121" & cdbl(rstQuery.Fields("B300100NPE"))		
		'END IF
		wC02 = LEFT(TRIM(replace(trim(rstQuery.Fields("WCLIENTE")),"&"," ")),50)
		wC02 = replace(wC02,"'"," ")
		wC03 = right("0" & day(rstQuery.Fields("B300100FAC")),2) & "-" & right("0" & month(rstQuery.Fields("B300100FAC")),2) & "-" & right(year(rstQuery.Fields("B300100FAC")),2)
		wC04 = trim(rstQuery.Fields("B300100TUV"))		
		wC06 = cdbl(rstQuery.Fields("B300100MNE"))
		wC08 = cdbl(rstQuery.Fields("B300100BIV"))		
		IF Session("glAplicarIva") = "0" Then
			wC09 = wC06 
			wC08 = 0
		  ELSE
			wC09 = wC06 + cdbl(wC08)		
		END IF 
		wPPP = trim(rstQuery.Fields("A300002PPP"))		
		wSTS = trim(rstQuery.Fields("B300100STS"))			
		
		IF wSTS = "1" THEN
			wSTS = "Pen."
		  ELSE
		  	wSTS = "Com."		
		END IF 
		
		IF ISNULL(wC04) THEN
		    wC04 = "0"
	    END IF 
	    
   	    IF ISNULL(wC06) THEN
		    wC06 = "0"
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
		wTC09 = wTC09 + wC09
		
		wC04 = formatnumber(wC04,0)
		wC05 = formatnumber(wC05,2)
		wC06 = formatnumber(wC06,2)
		wC09 = formatnumber(wC09,2)
		wCHK = "<INPUT TYPE=CHECKBOX NAME=" & wNAMC & ">"

		'Armar URL
		'wURLACT & 
		wURL = "X001A100_A.ASP?CLA001=" & wCL1 & "&CLA002=" & wCL2
		wURLD = "X001A101_S.ASP" & "?CLA001=" & wCL1 & "&CLA002=" & wCL2 & "&STSPED=" & wSTSPED 
		wTDIURL = "<A href=" & wURLD & " target=""_parent""> "
		wTIURL = "<A href=" & wURL & " target=""main""> "
		wTFURL = " </A>"

		response.write "<INPUT NAME=" & wNAMP & " size=15 value=" & wCL2 & " TYPE=Hidden>"	

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
		wNER = "&nbsp;"
		wC08 = "&nbsp;"
		wC04 = wTC04
		wC05 = wTC05
		wC06 = wTC06	 
		wC09 = wTC09  '"&nbsp;"
		wC04 = formatnumber(wC04,0)
		wC05 = formatnumber(wC05,2)
		wC06 = formatnumber(wC06,2)
		wC09 = formatnumber(wC09,2)
		wSTS = "&nbsp;"
		wCHK = "&nbsp;"
		wC07 = "&nbsp;"
		Mostrar_Linea	
	end if
		
%>
<%'Incluir Cuerpo del Reporte %>
<!--#include file="X001A100_C.ASP"-->
<INPUT TYPE="Hidden" NAME="CUENTA" value="<%=wCuenta%>">   
</FORM>

</table>

 
<% 

IF (Session("glTipoUsuario") = "A" or Session("glTipoUsuario") = "G") and wSTSPED = "0" THEN

	wTABLA = "<table align='center'  BORDER='0' bgcolor='#e9e9e9' WIDTH='919' height='30'><TR><td><p align='center' style='margin-top: 0px; margin-left: -2px'>&nbsp;<input TYPE='button' NAME='Submit' onclick='enviar();' value='X' name='B1' style='font-family: Tahoma; font-size: 9pt; font-weight: bold; width: 23; height: 20'></p></TD><td><p align='center' style='margin-top: 0px'><font face='Tahoma' style='font-size: 8pt'><b>*Para Actualizar o Eliminar un Pedido debe Seleccionarlo en la Columna N&#250;mero con el Mouse.</b></font><font face='Tahoma' style='font-size: 8pt'></font> </td> </TR></table>"

ELSE
	
	
	wTABLA = "<table align='center'  BORDER='0' bgcolor='#e9e9e9' WIDTH='919' height='30'><TR><td><p align='left' style='margin-top: 0px'><font face='Tahoma' style='font-size: 8pt'><b>*Para Actualizar o Eliminar un Pedido debe Seleccionarlo en la Columna Numero con el Mouse.</b></font><font face='Tahoma' style='font-size: 8pt'></font> </td> </TR></table>"

END IF


IF wSTSPED = "0" THEN %>
<script language="JavaScript" type="text/javascript" >
//var text="<table width='105' border='0' cellpadding='0' cellspacing='0' bordercolor='white'><tr><td><font size='1' face='Arial, Helvetica, sans-serif'>&nbsp;<strong><INPUT TYPE='button' NAME='send' onclick='document.frmGral.submit()' VALUE='Agregar o Actualizar' tabindex='2' style='font-family: Tahoma; font-size: 10pt'></strong></font></td></tr></table>"



var text="<%=wTABLA%>"
 
//document.write("<div align='center' id='FlyOnOff'  border='3' style='position:absolute; visibility:show; width:10px; height:10px; z-index:2; left: 19px; top: 0px;'>"+text+"</div>");
horz=".pixelLeft";
vert=".pixelTop";
docStyle="";
styleDoc=".style";
innerW="document.body.clientWidth";
innerH="document.body.clientHeight";
offsetX="document.body.scrollLeft";
offsetY="document.body.scrollTop";
function checkLocation() {
	objectXY="FlyOnOff";
	var availableX=eval(innerW);
	var availableY=eval(innerH);
	var currentX=eval(offsetX);
	var currentY=eval(offsetY);	
	var left;
	var width=window.screen.width, height=window.screen.height;	

	left=220;
	//Verifica Resolusion de Pantalla
	if ((width=='800') && (height=='600')){
		left=20;
	}//else{
	if ((width=='1024') && (height=='768')){
		left=120;
	}
	if ((width=='1024') && (height=='600')){
		left=120;
	}
	if ((width=='1280') && (height=='720')){
		left=243;
	}
	if ((width=='1280') && (height=='800')){
		left=243;
	}
	if ((width=='1366') && (height=='768')){
		left=222;
	}
	

	x=left+currentX;
	y=0+currentY;
	eval(docStyle + objectXY + styleDoc + horz + "=" + x);
	eval(docStyle + objectXY + styleDoc + vert + "=" + y);
}
//setInterval('checkLocation()', 5);
</script>
<% END IF %>
 
</td>
</tr>	
</table>
</body> 
</html>

