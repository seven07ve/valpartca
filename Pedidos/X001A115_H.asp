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

	if (confirm('¿Desea Procesar El PQR?')) {
		// Respuesta afirmativa...
		//document.frmGral.cmdProcesar.disabled=true; 
		document.getElementById('cmdProcesar').disabled = true;
		parent.frames["main1"].Procesar(); //document.FrmProcesar.submit(); 
	}
	else{
		alert('Recuerde que para que el PQR sea Analizado debe Procesarlo');
		//document.cmdProcesar.disabled = false;
		//document.getElementById('cmdProcesar').disabled = false;
	}


}



</script> 

<!--#include file="X001Y001.PRC"-->
    <body  style="text-align: center" topmargin="0" leftmargin="0" rightmargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>" >
     

   
    
 
    <table border="1" align="center" height="55" bordercolor="#ffffff" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" width="919"  style="padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px;">



		<%

		wTIT = Request.QueryString("URLTIT")
		wCLA001 = Request.QueryString("CAMC01")
		wCLA002 = Request.QueryString("CAMC02")
		
		IF ISNULL(wTIT) OR TRIM(wTIT) = "" THEN
			wNOMCLI = BuscarClienteReclamo (wCLA001)
			wNOMCLI = replace(wNOMCLI, chr(34), " ") 
			wNOMCLI = replace(wNOMCLI, chr(146), " ") 
			wTIT = "Reclamo " & wCLA002 & " de "  &  replace(wNOMCLI,"&", " ")  
		END IF 
		
		strCnn	= Application("XDTA300_ConnectionString")
	    SQL = "SELECT E300001SPP FROM X300EF001 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " E300001CCI = '" &  Session("glCiaInternet") & "' AND "	
		SQL = SQL & " E300001CCL = '" &  wCLA001 & "' AND "	
		SQL = SQL & " E300001COD = '" &  wCLA002 & "' "	
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
    	rstQuery.Open sql , strCnn
		IF NOT rstQuery.EOF THEN
			wSPP = trim(rstQuery.Fields("E300001SPP"))
		END IF
		rstQuery.Close 
		set rstQuery = nothing
	
		Mostrar_Titulo
		wCLASS = "TDS"
		wShowURL = "N"
		Mostrar_Linea
		'Incluir Cuerpo del Reporte 
		%>
		<!--#include file="X001A115_C.ASP"-->
	</table>
	   
</body>
</html>
