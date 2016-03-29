<%@ Language=VBScript %>
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
    
    
    
    
     
        <table align="center" border= "1" cellpadding="3" bordercolor="#CACACA" height="55" cellspacing="0" bgcolor="#ffffff" WIDTH="919"  style="padding-left: 2px; padding-right: 2px; padding-top: 2px; padding-bottom: 2px;">
		<%
		wTIT = Request.QueryString("URLTIT")	
		wSTSPED = Request.QueryString("STSPED")		
	
		Mostrar_Titulo
		wCLASS = "TDS"
		wShowURL = "N"
		Mostrar_Linea 
		'Incluir Cuerpo del Reporte 
		%>
		<!--#include file="X001A108_C.ASP"-->
	</table>
              
    
   
</body>
</html>
