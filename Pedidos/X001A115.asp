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
<title>Reclamos</title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<style type="text/css" >
html{overflow-y:scroll} 
</style>

<!--#include file="X001Z001.INC"-->
</head>


<script language="Javascript">


function Procesar() {

	
	//if (confirm('¿Desea Procesar Pedido?')) {
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


<!--#include file="X001Y001.PRC"-->

<% if wSTSIMP = "S"  THEN
	wcellpadding = "3"
	wBorderColor ="#C0C0C0"  %>
	<body onload="window.status='<%=Request.ServerVariables("URL")%>'" ALIGN="CENTER">
		<div align=center>

		<table BORDER="1" WIDTH="100%" cellspacing="0" cellpadding="<%=wcellpadding%>"
		  bordercolorlight="<%=wBorderColor%>" bordercolordark="<%=wBorderColor%>" bordercolor="<%=wBorderColor%>" align="center" >
		  
<%	ELSE %>
	<body bgcolor="<%=Request.Cookies("CAR")("Color1")%>" ALIGN="CENTER" vlink="#0000FF" scroll="yes"  onload="window.status='<%=Request.ServerVariables("URL")%>'" topmargin="0" leftmargin="18" rightmargin="0" bottommargin="0" >

				
<%  

	wTIT = Request.QueryString("URLTIT")	
	wSTSPED = Request.QueryString("STSPED")	
	wURLACT = TRIM(Request.QueryString("URLACT"))
	IF ISNULL(wURLACT) OR TRIM(wURLACT) = "" THEN
		wURLACT = "X001A115_A.ASP"
	END IF 

	wCLA001 = Request.QueryString("CAMC01")
	wCLA002 = Request.QueryString("CAMC02")
	wB300101CCI = Session("glCiaInternet")
	wB300101CIA = Session("glCia")
	
	IF ISNULL(wTIT) OR TRIM(wTIT) = "" THEN
		wNOMCLI = BuscarClientePedido ( wCLA001, wCLA002 )
		wNOMCLI = replace(wNOMCLI, chr(34), " ") 
		wNOMCLI = replace(wNOMCLI, "'", " ") 
		wTIT = "Pedido " & wCLA002 & " de "  &  wNOMCLI & "A"
	END IF 

	strCnn	= Application("XDTA300_ConnectionString")
	
    SQL = "SELECT E300001SPP, E300001CTR, E300001NFA FROM X300EF001 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " E300001CCL = '" &  wCLA001 & "' AND "	
	SQL = SQL & " E300001COD = '" &  wCLA002 & "' "	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		wSPP = trim(rstQuery.Fields("E300001SPP"))
		wNFA = trim(rstQuery.Fields("E300001NFA"))
		wCTR = trim(rstQuery.Fields("E300001CTR"))
	END IF
	rstQuery.Close 
	set rstQuery = nothing


%>		
		<table BORDER="0" width="919" align="center"  bordercolor="#FFFFFF" cellspacing="0" cellpadding="0" height="100%" bgcolor="#ffffff"   > 
		<tr><td valign="top"  >
		<table BORDER="1" width="919" align="center"  bordercolor="#FFFFFF" cellspacing="0" cellpadding="5"   > 
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


	
	
	
	
	'SQL = "SELECT WPEDIDO, WCLIENTE, WNETO, "
	SQL = " SELECT E300002COD, E300002CPR, E300002CGR, E300002CAN, E300002COG, "
	SQL = SQL & " E300002OBS, E300002NFA " 
	SQL = SQL & " FROM X300EF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " E300002CCI ='" & wB300101CCI & "' AND "
	SQL = SQL & " E300002CIA ='" & wB300101CIA & "' AND "
	SQL = SQL & " E300002COD ='" & wCLA002 & "' "
	if len(trim(Session("glBusqueda"))) > 0 then
		SQL = SQL & " AND "
		SQL = SQL & " ((E300002CPR LIKE '%" & ucase(Session("glBusqueda")) & "%') OR  "
		SQL = SQL & "  (E300002DEL LIKE '%" & ucase(Session("glBusqueda")) & "%'))  "
	end if	
	SQL = SQL & " ORDER BY E300002NFA ASC " 	
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
		
		
		
	
		wC01 = TRIM(rstQuery.Fields("E300002NFA")) 

		wC02 = trim(rstQuery.Fields("E300002CGR"))
		wC03 = trim(rstQuery.Fields("E300002COG"))
		wC04 = trim(rstQuery.Fields("E300002CPR"))
		wC05 = trim(rstQuery.Fields("E300002CAN"))
		

				
		IF isnull(wC03) then : wC03 = 0 :   end if	
	
		'wTC03 = wTC03 + wC03

		'wC03 = formatnumber(wC03,0)

		'Armar URL
		'IF wURLACT = "X000A001_S.ASP" THEN
		'	wURL = wURLACT & "?NOMTAB=X002BQ101" 
		'	ELSE
		wURL = wURLACT & "?CLA001=" & wCLA001 & "&CLA002=" & wCLA002 & "&CLA003=" & wC01 & "&CLA004=" & wC04
		wURL = wURL & "&STSPED=" & wSTSPED
		'END IF	
		IF wSPP = "0" or Session("glTipoUsuario") = "A" THEN
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
		wC03 = "&nbsp;" 'wTC03
		wC04 = "&nbsp;"
		wC05 = "&nbsp;"
		
		'wC03 = formatnumber(wC03,0)
		
		Mostrar_Linea	
		'&nbsp;
		
		else
			
			IF wCTR = "2" THEN 
		
				wURLB = "X001Z101_F.ASP?URLTIT=" & wURLTIT	
				wURLB = wURLB & "&CLA001=" & wCLA001
				wURLB = wURLB & "&CLA002=" & wCLA002 	
				wURLB = wURLB & "&CLA003=" & wNFA	
				wURLB = wURLB & "&STSPED=" & wSTSPED  
				wURLB = wURLB & "&URLD=" & "X001A103BS.ASP"  
			
				'Response.Redirect wURLB
				'Response.Write wURLB
				%>
				
				<script language="javascript">
					window.open('<%=wURLB%>','main');
				</script>
				
				<%
				
			END IF 

	end if
	
	
		
%>
<%'Incluir Cuerpo del Reporte %>
<!--#include file="X001A115_C.ASP"-->
</table> 
<form action="X001A115PR.asp?CLA001=<%=wCLA001%>&CLA002=<%=wCLA002%>" target="main" name="FrmProcesar" method="post">
</form> 

</td></tr>
</table>
		
<%
wCLA001 = Request.QueryString("CAMC01")
wCLA002 = Request.QueryString("CAMC02")


%>


</body>

</html>