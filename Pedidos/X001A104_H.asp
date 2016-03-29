<%@ Language=VBScript %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<title></title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
</head>
<!--
<body topmargin="2" leftmargin="5">
    <table BORDER="0" WIDTH="580" >
-->
<%'=Session("glTamano")%>
<body  align="center" style="text-align: center" topmargin="0" leftmargin="0" rightmargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>">
    
    
  <div align="center"  >
	<table border="0" height="100%" width="921" bgcolor="#FFFFFF" cellspacing="0"  > <tr><td valign="top" >


              <table align="center" border= "1" cellpadding="4"  bordercolor="<%=Request.Cookies("CAR")("Color1")%>" cellspacing="0" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" WIDTH="100%"  style="padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px;">
		<%
		wTIT = Request.QueryString("URLTIT")		
		Mostrar_Titulo
		wCLASS = "TDS"
		wShowURL = "N"
		Mostrar_Linea 
		'Incluir Cuerpo del Reporte 
		%>
		<!--#include file="X001A104_C.ASP"-->
	</table>
       </td></tr></table></div>
    
   
</body>
</html>
