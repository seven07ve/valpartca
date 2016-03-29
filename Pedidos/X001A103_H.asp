<%@ Language=VBScript %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 6.0">
<title></title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
</head>
<!--
<body topmargin="2" leftmargin="5">
    <table BORDER="0" WIDTH="580" >
-->

    <body  align="center" style="text-align: center" topmargin="0" leftmargin="0" rightmargin="0">
    <table  bordercolor="#0066CC" bgcolor="#FE9900" width="790"  style="padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; border-left-style:inset; border-left-width:3px; border-right-style:inset; border-right-width:3px; border-bottom-style:inset; border-bottom-width:3px">


		<%

		wTIT = Request.QueryString("URLTIT")		
		Mostrar_Titulo
		wCLASS = "TDS"
		wShowURL = "N"
		Mostrar_Linea
		'Incluir Cuerpo del Reporte 
		%>
		<!--#include file="X001A103_C.ASP"-->
	</table>
</body>
</html>
