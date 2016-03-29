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

parent.frames["main1"].Procesar(); 


}

</script> 

<!--
<body topmargin="2" leftmargin="5">
    <table BORDER="0" WIDTH="580" >
-->
<!--#include file="X001Y001.PRC"-->
    <body  style="text-align: center" topmargin="0" leftmargin="0" rightmargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>" >
     

   
    
 
    <table align="center" border= "1" cellpadding="3" bordercolor="#CACACA" height="38" cellspacing="0" bgcolor="#ffffff" WIDTH="919"  style="padding-left: 2px; padding-right: 2px; padding-top: 2px; padding-bottom: 2px;">



		<%

		wTIT = Request.QueryString("URLTIT")
		wCLA001 = Request.QueryString("CAMC01")
		wCLA002 = Request.QueryString("CAMC02")
		
		IF ISNULL(wTIT) OR TRIM(wTIT) = "" THEN
			wNOMCLI = BuscarClientePago(wCLA002 )
			wNOMCLI = replace(wNOMCLI, chr(34), " ") 
			wTIT = "Pedido " & wCLA002 & " de "  &  replace(wNOMCLI,"&", " ")  
		END IF 
		
		strCnn	= Application("XDTA300_ConnectionString")
	    SQL = "SELECT C300001SPP FROM X300CF001 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " C300001NDC = '" &  wCLA002 & "' "	
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
    	rstQuery.Open sql , strCnn
		IF NOT rstQuery.EOF THEN
			wSPP = trim(rstQuery.Fields("C300001SPP"))
		END IF
		rstQuery.Close 
		set rstQuery = nothing
	
		Mostrar_Titulo
		wCLASS = "TDS"
		wShowURL = "N"
		'Mostrar_Linea
		'Incluir Cuerpo del Reporte 
		%>
		<!--#include file="X001A109_C.ASP"-->
	</table>
	   
</body>
</html>
