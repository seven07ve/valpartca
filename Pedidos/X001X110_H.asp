<%@ Language=VBScript %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 4.0">
<title></title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
</head>
<!-- <body topmargin="2" leftmargin="5">
    <table BORDER="0" WIDTH="580" >
-->
<body  >
    <table BORDER="0" WIDTH="<%=Session("glTamano")%>" >
		<%
		wTIT = Request.QueryString("URLTIT")		
		wNOMTAB = Request.QueryString("NOMTAB")		
		Mostrar_Titulo
		wCLASS = "TDS"
		wShowURL = "N"
		Mostrar_Linea
		'Incluir Cuerpo del Reporte 
		%>
		<!--#include file="X001X110_C.ASP"-->
	</table>
</body>
</html>
