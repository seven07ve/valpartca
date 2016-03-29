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
<style type="text/css" >
html{overflow-y:scroll} 
</style>

<!--#include file="X001Z001.INC"-->
</head>


<script language="Javascript">


function Procesar() {

	
	//if (confirm('�Desea Procesar Pedido?')) {
		// Respuesta afirmativa...
		//alert('Ok');
		document.FrmProcesar.submit(); 
		//alert('Ok');
	//}
	//else{
	//	alert('Recuerde que para que el Pedido sea Facturado debe Procesarlo');
		
	//}
	
}

</script> 

<style type="text/css">


html{overflow-y:scroll} 
	
body {margin-right: 0px;}


</style> 


<!--#include file="X001Y001.PRC"-->

<% if wSTSIMP = "S"  THEN
	wcellpadding = "3"
	wBorderColor ="#C0C0C0"  %>
	<body onload="window.status='<%=Request.ServerVariables("URL")%>'" ALIGN="CENTER">
		<div align=center>

		<table BORDER="1" WIDTH="100%" cellspacing="0" cellpadding="<%=wcellpadding%>"
		  bordercolorlight="<%=wBorderColor%>" bordercolordark="<%=wBorderColor%>" bordercolor="<%=wBorderColor%>" align="center" >
		  
<%	ELSE %>
	<body bgcolor="<%=Request.Cookies("CAR")("Color1")%>" ALIGN="CENTER" vlink="#0000FF" scroll="yes"  onload="window.status='<%=Request.ServerVariables("URL")%>'" topmargin="0" leftmargin="18" rightmargin="0" >

				
<%  

	wTIT = Request.QueryString("URLTIT")	
	wURLACT = TRIM(Request.QueryString("URLACT"))
	IF ISNULL(wURLACT) OR TRIM(wURLACT) = "" THEN
		wURLACT = "X001A101_A.ASP"
	END IF 

	wCLA001 = Request.QueryString("CAMC01")
	wCLA002 = Request.QueryString("CAMC02")
	wB300101CCI = Session("glCiaInternet")
	wB300101CIA = Session("glCia")
	
	
	strCnn	= Application("XDTA300_ConnectionString")
	
    SQL = "SELECT B300100SPP, B300100MNE, B300100CCL " 
	SQL = SQL & " FROM X300BF100 WHERE "
	SQL = SQL & " B300100OPE = '" &  wCLA001 & "' AND "	
	SQL = SQL & " B300100NPE = '" &  wCLA002 & "' "	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		wSPP = trim(rstQuery.Fields("B300100SPP"))
		wMNE = trim(rstQuery.Fields("B300100MNE"))
		wCCL = trim(rstQuery.Fields("B300100CCL"))
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	
	SQL = "SELECT Z300002ERP FROM X300ZF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300002CCI = '" & Session("glCiaInternet") & "' "
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	if NOT rstQuery.EOF then
		wERP = trim(rstQuery.Fields("Z300002ERP"))
	end if
	rstQuery.CLOSE
	SET rstQuery = NOTHING	


	
	IF ISNULL(wTIT) OR TRIM(wTIT) = "" THEN
		wNOMCLI = BuscarClientePedido ( wCLA001, wCLA002 )
		wNOMCLI = replace(wNOMCLI, chr(34), " ") 
		wNOMCLI = replace(wNOMCLI, "'", " ") 
		wTIT = "Pedido " & wCLA002 & " de ("  & wCCL & " - " & replace(wNOMCLI,"&", " ")  & ")"
	END IF 



IF wSPP = "0" THEN	
%>	 
	<!--<p style="margin-top: 8px; margin-bottom: 15px">&nbsp;&nbsp;&nbsp; </p>-->
<%ELSE%>	
<!--	<p style="margin-top: -10px; margin-bottom: -10px">&nbsp;&nbsp;&nbsp; </p>-->
<%END IF %>		
		
		<table BORDER="0" width="919" align="center"  bordercolor="#FFFFFF" cellspacing="0" cellpadding="0" height="100%" bgcolor="#ffffff"   > 
		<tr><td valign="top"  >
		<table BORDER="0" width="919" align="center"  bordercolor="#FFFFFF" cellspacing="1" cellpadding="5"   > 
<%	END IF


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


	
	'BUSCA PORCENTAJE DE PRONTO PAGO
	'SQL = "SELECT A300002PPP FROM X300AQ004 " 
	'SQL = SQL & " WHERE "
	'SQL = SQL & " B300100OPE = '" &  wCLA001 & "' AND "	
	'SQL = SQL & " B300100NPE = '" &  wCLA002 & "' "	
	'Set rstQuery = Server.CreateObject("ADODB.Recordset")
    'rstQuery.Open sql , strCnn
	'IF NOT rstQuery.EOF THEN
		wPPP = 0 ' trim(rstQuery.Fields("A300002PPP"))
		Session("glPPP") = wPPP
	'END IF
	'rstQuery.Close 
	'set rstQuery = nothing
	
	
	
	'SQL = "SELECT WPEDIDO, WCLIENTE, WNETO, "
	SQL = " SELECT B300101CPR, A300003DEL, B300101UVE, B300101PUN, "
	SQL = SQL & " B300101KIL, B300101MNE, B300101OPE, B300101NPE," 
	SQL = SQL & " B300101PPR, B300101BPR, B300101PIM, A300003MAR, " 
	'SQL = SQL & " A300003REF " 
	IF wERP = "SAP" THEN
		SQL = SQL & " A300003REF "
	ELSE
		SQL = SQL & " (SELECT A300015HOM FROM X300AF015 WHERE "
		SQL = SQL & " A300015CCL = '" & wCCL & "' AND "
		SQL = SQL & " A300015CPR = B300101CPR AND "
		SQL = SQL & " A300015CCI = B300101CCI) AS A300003REF "
	END IF 
	SQL = SQL & " FROM X300BQ101 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " B300101CCI ='" & wB300101CCI & "' AND "
	SQL = SQL & " B300101CIA ='" & wB300101CIA & "' AND "
	SQL = SQL & " B300101OPE ='" & wCLA001 & "' AND "
	SQL = SQL & " B300101NPE ='" & wCLA002 & "' "
	if len(trim(Session("glBusqueda"))) > 0 then
		SQL = SQL & " AND "
		SQL = SQL & " ((B300101CPR LIKE '%" & ucase(Session("glBusqueda")) & "%') OR  "
		SQL = SQL & "  (A300003DEL LIKE '%" & ucase(Session("glBusqueda")) & "%'))  "
	end if	
	SQL = SQL & " ORDER BY B300101CPR ASC " 	
	'Response.Write SQL
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
    'rstQueryData = rstQuery.GetRows 
	wTipo = "D"
	wCLASS = "TDD"
	wCuenta = 0
	wTC03 = 0 
	wTC08 = 0
	wTC09 = 0
	DO WHILE NOT rstQuery.EOF 'and wCuenta < cint(Session("glRegistros"))
		
		
		
		wCL1 = trim(rstQuery.Fields("B300101OPE"))
		wCL2 = trim(rstQuery.Fields("B300101NPE"))
		wDEL = trim(rstQuery.Fields("A300003DEL"))
		
		wC01 = TRIM(rstQuery.Fields("B300101CPR")) 
		wC01_1 = REPLACE(TRIM(rstQuery.Fields("B300101CPR"))," ","@") 
		wC02 = trim(rstQuery.Fields("A300003DEL"))
		wC03 = trim(rstQuery.Fields("B300101UVE"))
		wC04 = trim(rstQuery.Fields("B300101PUN"))
		wC05 = trim(rstQuery.Fields("A300003MAR"))
		IF LEN(TRIM(wC05)) = 0 OR ISNULL(wC05) THEN
			wC05 = "&nbsp;"
		END IF 
		wC06 = left(trim(rstQuery.Fields("A300003REF")),6)	
		IF LEN(TRIM(wC06)) = 0 OR ISNULL(wC06) THEN 
			wC06 = "&nbsp;"
		END IF 	
		wPIM = trim(rstQuery.Fields("B300101PIM"))
		wC08 = trim(rstQuery.Fields("B300101KIL"))
		wC09 = trim(rstQuery.Fields("B300101MNE"))
		wPPR = cdbl(rstQuery.Fields("B300101PPR"))
		
		wPPP = CDbl(wPPP)     
	    wC04 = wC04 - ((wC04 * wPPP) / 100)
	    'APLICA DESCUENTO POR FAMILIA
	    wC04 = wC04 - ((wC04 * wPPR) / 100)
	    wC07 = wPIM	    
	    wFIV = 1 + (wPIM / 100)	    
	    IF wFIV > 1 THEN
	    	IF Session("glAplicarIva") = "0" Then
	    		wUIVA = wC04
	       	  ELSE
	        	wUIVA = Round(wC04 * wFIV, 2)	     
	        END IF    
	       ELSE 
	        wUIVA = wC04
        END IF 
        
        wC09 = (wUIVA * wC03)

				
		IF isnull(wC03) then : wC03 = 0 :   end if	
		IF isnull(wC04) then : wC04 = 0 :   end if	
		
		
		IF isnull(wC07) then : wC07 = 0 :	end if	
		IF isnull(wC08) then : wC08 = 0 :	end if	
		IF isnull(wC09) then : wC09 = 0 :	end if			

		wTC03 = wTC03 + wC03
		wTC08 = wTC08 + wC08
		wTC09 = wTC09 + wC09


		wC04F = round((wC04 /1000),2)
		wC09F = round((wC09 /1000),2)

		wC03 = formatnumber(wC03,0)
		wC04 = formatnumber(wC04,2)
		wC04F = formatnumber(wC04F,2)
		
		wC07 = formatnumber(wC07,2)				
		wC08 = formatnumber(wC08,2)
		wC09 = formatnumber(wC09,2)
		wC09F = formatnumber(wC09F,2)

		
		'wC09 = wC09 & "&nbsp;<img src=""images/delete.gif"">"

		'Armar URL
		'IF wURLACT = "X000A001_S.ASP" THEN
		'	wURL = wURLACT & "?NOMTAB=X002BQ101" 
		'	ELSE
		wURL = wURLACT & "?CLA001=" & wCLA001 & "&CLA002=" & wCLA002 & "&CLA003=" & wC01_1
		'END IF	
		IF wSPP = "0" THEN
			wTIURL = "<A href=" & wURL & " target=""main""> "
			wTFURL = " </A>"
		END IF




		Mostrar_Linea
		rstQuery.MoveNext 
		wCuenta = wCuenta + 1
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	

	IF wCuenta > 0 then
		wTIURL = ""
		wCLASS = "TD1"
		wTipo = "T"
		wC01 = wCuenta
		wC02 = "Totales"		
		wC03 = wTC03
		wC04 = "&nbsp;"
		wC04F = "&nbsp;"

		wC05 = "&nbsp;"
		wC06 = "&nbsp;"		
		wC07 = "&nbsp;"		
		wC08 = wTC08
		wC09 = wTC09	
		wC09F = round((wTC09/1000),2)
		wC03 = formatnumber(wC03,0)
		wC08 = formatnumber(wC08,2)
		wC09 = formatnumber(wC09,2)
		wC09F = formatnumber(wC09F,2)
		Mostrar_Linea	
		'&nbsp;
	end if
		
%>
<%'Incluir Cuerpo del Reporte %>
<!--#include file="X001A101_C.ASP"-->
</table> 

<form action="X001A101PR.asp?CLA001=<%=wCLA001%>&CLA002=<%=wCLA002%>" target="main" name="FrmProcesar" method="post">

</form> 

</td></tr>

</table>
  
<%
wCLA001 = Request.QueryString("CAMC01")
wCLA002 = Request.QueryString("CAMC02")


%>

</body>

<% IF wCuenta > 0 Then %>
<script language="JavaScript">
//var text="<table width='105' border='0' cellpadding='0' cellspacing='0' bordercolor='white'><tr><td><font size='1' face='Arial, Helvetica, sans-serif'>&nbsp;<strong><INPUT TYPE='button' NAME='send' onclick='document.frmGral.submit()' VALUE='Agregar o Actualizar' tabindex='2' style='font-family: Tahoma; font-size: 10pt'></strong></font></td></tr></table>"
var text="<table align='center'  BORDER='0' bgcolor='#e9e9e9' WIDTH='919' >";
text=text+"<TR><td colspan=2><p align='Left' style='margin-top: 0px'><font face='Tahoma' style='font-size: 8pt'><b>*Para Actualizar o Eliminar un Producto debe Seleccionar en la Columna &quot;Item&quot; el Nro. de Parte con el Mouse.</b></font><font face='Tahoma' style='font-size: 8pt'></font> </td> </TR>";
if ("<%=wSPP%>"=='0'&&"<%=wMNE%>">'0'){
   text=text+"<TR><td><p align='Left' style='margin-top: 0px'><font face='Tahoma' style='font-size: 8pt'><b>*Recuerde que para Culminar el Pedido y Enviarlo a Carvica debe Pulsar El Bot�n &quot;Procesar&quot;</b></font><font face='Tahoma' style='font-size: 8pt'></font></td></TR>";
}
text=text+"</table>"

<% IF wSPP = "0" THEN %> 
	//document.write("<div id='FlyOnOff'  border='3' style='position:absolute; visibility:show; width:10px; height:10px; z-index:2; left: 16px; top: 0px;'>"+text+"</div>");
<% END IF %>

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
		left=19;
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
	//alert(width +'--'+ height);
	if ((width=='1366') && (height=='768')){
		left=223;
	}
	
	x=left+currentX;
	y=0+currentY;
	eval(docStyle + objectXY + styleDoc + horz + "=" + x);
	eval(docStyle + objectXY + styleDoc + vert + "=" + y);
}
//setInterval('checkLocation()', 5);
</script>

<% END IF %></html>