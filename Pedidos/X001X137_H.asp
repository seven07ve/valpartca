<%@ Language=VBScript %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<title></title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
</head>
<!-- <body topmargin="2" leftmargin="5">
    <table BORDER="0" WIDTH="580" >
-->
<body  align="center" style="text-align: center" topmargin="0" leftmargin="0" rightmargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>">

	<div align="center"  >
	<table border="0" height="100%" width="779" bgcolor="#FFFFFF" cellspacing="0"  > <tr><td valign="top" >


    <table align="center" border= "1" cellpadding="3" bordercolor="#CACACA" height="55" cellspacing="0" bgcolor="#ffffff" WIDTH="919"  style="padding-left: 2px; padding-right: 2px; padding-top: 2px; padding-bottom: 2px;">
		<%
		wTIT = Request.QueryString("URLTIT")		
		wNOMTAB = Request.QueryString("NOMTAB")		
		Mostrar_Titulo
		wCLASS = "TDS"
		wShowURL = "N"
		Mostrar_Linea
		'Incluir Cuerpo del Reporte 
		%>
		<!--#include file="X001X137_C.ASP"-->
	</table>

</td></tr></table></div>

</body>
</html>
