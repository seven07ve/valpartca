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
<title>Familias</title>
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

<style type="text/css">


html{overflow-y:scroll} 
	
body {margin-right: 0px;}


</style> 

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

	//if (confirm('�Desea Eliminar los Pedidos Seleccionados?')) {
	   document.frmGral.submit();   
	//}
}


</SCRIPT>

	
	
	

		<!--
			WIDTH="750" Pantalla 800X600
		-->
		<%'=Session("glTamano")%>
		
		

		
		<table border="0" height="100%" width="919" align="center" bgcolor="#ffffff" cellpadding="0" cellspacing="0"   ><tr><td valign="top"  >
		 


<FORM NAME="frmGral" METHOD="post" ACTION="X001X153_A.asp" target="main">

<%    

	wSTSPED = Request.QueryString("STSPED")		
	
IF wSTSPED = "0" THEN	 %>	 
	<p style="margin-top: 8px; margin-bottom: 3px">&nbsp;&nbsp;&nbsp; </p>
<%ELSE%>	
	<p style="margin-top: -10px; margin-bottom: -8px">&nbsp;&nbsp;&nbsp; </p>
<%END IF %>		

     	
		<table BORDER="1" WIDTH="919" ALIGN="center" bordercolor="#FFFFFF" cellspacing="0"  cellpadding="2"  style="padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px;" > 
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
    
   	
	'response.write wDiaFinal 

	strCnn	= Application("XDTA300_ConnectionString")
	
		
	SQL = "SELECT "
	SQL = SQL & " B300120NPS, B300120DEC " 
	SQL = SQL & " FROM X300BF120 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " B300120CCI ='" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " B300120CIA ='" & Session("glCia") & "' "	
	SQL = SQL & " ORDER BY B300120DEC ASC " 	
    
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

	
		wCHK = "<INPUT TYPE=CHECKBOX NAME=NO>"
		wOBJ = right(("0000" & wCuenta),4)
		wNAMP = "P" & wOBJ
		wNAMC = "C" & wOBJ
		wNAMM = "M" & wOBJ
		
		wCL1 = trim(rstQuery.Fields("B300120NPS"))
		wC01 = trim(rstQuery.Fields("B300120NPS"))		
		wC02 = TRIM(replace(trim(rstQuery.Fields("B300120DEC")),"&"," "))
		wC02 = replace(wC02,"'"," ")
		
		wC03 = "&nbsp;"
		wC04 = "&nbsp;"

		wSTS2 = "9"

		SQL = "SELECT "
		SQL = SQL & " B300125STS " 
		SQL = SQL & " FROM X300BF125 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " B300125CCI ='" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " B300125CIA ='" & Session("glCia") & "' AND "
		SQL = SQL & " B300125NLP ='" & TRIM(wC01) & "'"
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
		rstQuery2.Open sql , strCnn
		if NOT rstQuery2.EOF then
			wSTS2 = trim(rstQuery2.Fields("B300125STS"))
		end if
		rstQuery2.CLOSE
		SET rstQuery2 = NOTHING	
		
		wC03 = "&nbsp;"
		
		wMAR2 = ""

		wSEL1 = ""
		wSEL2 = ""
		wSEL3 = ""
		wSEL4 = ""

		SELECT CASE wSTS2
			CASE "0"
				wSEL2 = " selected"
			CASE "2"
				wSEL3 = " selected"
			CASE "3"
				wSEL4 = " selected"
			CASE ELSE
			wSEL1 = " selected"
		END SELECT 


		SQL = "SELECT "
		SQL = SQL & " B300128NLP " 
		SQL = SQL & " FROM X300BF128 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " B300128CCI ='" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " B300128CIA ='" & Session("glCia") & "' AND "
		SQL = SQL & " B300128NLP ='" & wC01 & "'"
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
		rstQuery2.Open sql , strCnn
		if NOT rstQuery2.EOF then
			wMAR2 = " checked"
		end if
		rstQuery2.CLOSE
		SET rstQuery2 = NOTHING	

		
		
		wCHK = "<INPUT TYPE=CHECKBOX NAME=" & wNAMC & wMAR & ">"
		wCHK2 = "<INPUT TYPE=CHECKBOX NAME=" & wNAMM & wMAR2 & ">"

		wSTS =	"<select size=""1"" name=" & wNAMC & " style=""font-size:10px; width:230px"">"
		wSTS = wSTS & "<option value=""9""" & wSEL1 & "></option>"
		wSTS = wSTS & "<option value=""0""" & wSEL2 & ">SOLO PRODUCTOS CON EXISTENCIAS</option>"
		wSTS = wSTS & "<option value=""2""" & wSEL3 & ">MOSTRAR ""CP"" PARA PRODUCTOS SIN EXISTENCIA</option>"
		wSTS = wSTS & "<option value=""3""" & wSEL4 & ">MOSTRAR ""POR RECIBIR"" PARA PRODUCTOS SIN EXISTENCIA</option>"
		wSTS = wSTS & " </select>"
		


		'Armar URL
		'wURLACT & 
		wURL = "X001A100_A.ASP?CLA001=" & wCL1 & "&CLA002=" & wCL2
		wURLD = "X001A101_S.ASP" & "?CLA001=" & wCL1 & "&CLA002=" & wCL2 & "&STSPED=" & wSTSPED 
		'wTDIURL = "<A href=" & wURLD & " target=""_parent""> "
		'wTIURL = "<A href=" & wURL & " target=""main""> "
		'wTFURL = " </A>"

		response.write "<INPUT NAME=" & wNAMP & " size=15 value=" & wCL1 & " TYPE=Hidden>"	

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
		wC04 = "&nbsp;"
		wCHK = "&nbsp;"
		wC07 = "&nbsp;"
		wCHK2 = "&nbsp;"
		wSTS = "&nbsp;"
		Mostrar_Linea	
	end if
		
%>
<%'Incluir Cuerpo del Reporte %>
<!--#include file="X001X153_C.ASP"-->
</table>
           

  		
<% 

IF (Session("glTipoUsuario") = "A" or Session("glTipoUsuario") = "G") and wSTSPED = "0" THEN

	wTABLA = "<table align='center'  BORDER='0' bgcolor='#e9e9e9' WIDTH='919' height='30'><TR><td><p align='left' style='margin-top: 0px; margin-left: -2px'>&nbsp;<input TYPE='button' NAME='Submit' onclick='enviar();' value='X' name='B1' style='font-family: Tahoma; font-size: 9pt; font-weight: bold; width: 23; height: 20'></p></TD><td><p align='center' style='margin-top: 0px'><font face='Tahoma' style='font-size: 8pt'><b>*Para Actualizar o Eliminar un Pedido debe Seleccionarlo en la Columna &quot;N�mero&quot; con el Mouse.</b></font><font face='Tahoma' style='font-size: 8pt'></font> </td> </TR></table>"

ELSE
	
	
	wTABLA = "<table align='center'  BORDER='0' bgcolor='#e9e9e9' WIDTH='919' height='30'><TR><td><p align='center' style='margin-top: 0px'><font face='Tahoma' style='font-size: 8pt'><b>*Para Actualizar o Eliminar un Pedido debe Seleccionarlo en la Columna &quot;N�mero&quot; con el Mouse.</b></font><font face='Tahoma' style='font-size: 8pt'></font> </td> </TR></table>"

END IF


IF wSTSPED = "0" THEN %>
<script language="JavaScript">
//var text="<table width='105' border='0' cellpadding='0' cellspacing='0' bordercolor='white'><tr><td><font size='1' face='Arial, Helvetica, sans-serif'>&nbsp;<strong><INPUT TYPE='button' NAME='send' onclick='document.frmGral.submit()' VALUE='Agregar o Actualizar' tabindex='2' style='font-family: Tahoma; font-size: 10pt'></strong></font></td></tr></table>"



var text="<%=wTABLA%>"
 
document.write("<div align='center' id='FlyOnOff'  border='3' style='position:absolute; visibility:show; width:10px; height:10px; z-index:2; left: 19px; top: 0px;'>"+text+"</div>");
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
setInterval('checkLocation()', 5);
</script>
<% END IF %>
<INPUT TYPE="Hidden" NAME="CUENTA" value="<%=wCuenta%>">    

</FORM>
</td>
</tr>
</table>
</body>
</html>

