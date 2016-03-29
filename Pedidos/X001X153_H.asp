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

function enviar(){

parent.frames["main1"].enviar(); 


}

</script> 

<!--
<body topmargin="2" leftmargin="5">
    <table BORDER="0" WIDTH="580" >
-->
<%'=Session("glTamano")%>
<body  align="center" style="text-align: center" topmargin="0" leftmargin="0" rightmargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>"  >
    
    
    
    
     
              <table align="center" border= "1"   bordercolor="#ffffff" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" width="919"  style="padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px;">
		<%
		wTIT = Request.QueryString("URLTIT")	
		wSTSPED = Request.QueryString("STSPED")		
	
		Mostrar_Titulo
		wCLASS = "TDS"
		wShowURL = "N"
		Mostrar_Linea 
		'Incluir Cuerpo del Reporte 
		%>
		<!--#include file="X001X153_C.ASP"-->
	</table>
              
    
   
</body>
</html>
