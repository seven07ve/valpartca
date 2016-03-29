
<%@ Language=VBScript %>
<%

Response.Expires = -1
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"

%>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<title></title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
</head>

<script language="javascript">

function Procesar(){

	//document.cmdProcesar.disabled = true;
	//document.getElementById('cmdProcesar').disabled = true;

	if (confirm('¿Desea Procesar Oportunidad?')) {
		// Respuesta afirmativa...
		document.getElementById('cmdProcesar').disabled = true;
		parent.frames["main1"].Procesar(); //document.FrmProcesar.submit(); 
	}
	else{
		/7alert('Recuerde que para que el Pedido sea Facturado debe Procesarlo');
		//document.cmdProcesar.disabled = false;
		//document.getElementById('cmdProcesar').disabled = false;
	}


}



</script> 

<!--
<body topmargin="2" leftmargin="5">
    <table BORDER="0" WIDTH="580" >
-->
<!--#include file="X001Y001.PRC"-->
    <body  style="text-align: center" topmargin="0" leftmargin="0" rightmargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>" >
     

   
    
 
    <table border="1" align="center" height="55" bordercolor="#ffffff" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" width="919"  style="padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px;">



		<%

		wTIT = Request.QueryString("URLTIT")
		wCLA001 = Request.QueryString("CAMC01")
		wCLA002 = Request.QueryString("CAMC02")
		
		strCnn	= Application("XDTA300_ConnectionString")
	    SQL = "SELECT B300100SPP, B300100MNE, B300100CCL FROM X300BF100 " 
		SQL = SQL & " WHERE "
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
		
		IF ISNULL(wTIT) OR TRIM(wTIT) = "" THEN
			wNOMCLI = BuscarClientePedido ( wCLA001, wCLA002 )
			wNOMCLI = replace(wNOMCLI, chr(34), " ") 
			wNOMCLI = replace(wNOMCLI, chr(146), " ") 
			wNOMCLI = replace(wNOMCLI, chr(35), " ") 
			wTIT = "Pedido " & wCLA002 & " de ("  & wCCL & " - " & replace(wNOMCLI,"&", " ")  & ")"
		END IF 
		
	
	
		Mostrar_Titulo
		wCLASS = "TDS"
		wShowURL = "N"
		Mostrar_Linea
		'Incluir Cuerpo del Reporte 
		%>
		<!--#include file="X001A101_C.ASP"-->
	</table>
	   
</body>
</html>
