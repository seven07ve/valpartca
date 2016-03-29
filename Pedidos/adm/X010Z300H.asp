


<%@ Language=VBScript %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<title></title>
<link rel=stylesheet type="text/css" href="../X001Z900.CSS">
</head>
<%'=Session("glTamano")%>
<body  align="center" style="text-align: center" topmargin="0" leftmargin="0" rightmargin="0">
    <table align="center"   bordercolor="<%=Request.Cookies("CAR")("Color1")%>" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" BORDER="1" WIDTH="760"  style="border-style: inset; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
		<%
		
		Mostrar_Titulo
		wCLASS = "TDS"
		wShowURL = "N"
		Mostrar_Linea
		'Incluir Cuerpo del Reporte 
		%>
		<!--#include file="X010Z300C.ASP"-->
	</table>
</body>
</html>
