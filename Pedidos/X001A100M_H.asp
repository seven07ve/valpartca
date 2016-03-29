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
<body  align="center" style="text-align: center" topmargin="0" leftmargin="0" rightmargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>"  >
    
    
   
    
      <table border="0" cellspacing="0" cellpadding="0" width="919" height="38" align="center"   >
        <tr>
                <td height="40" >
              <table align="center" border= "1" bordercolor="#0066CC" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" WIDTH="100%"  style="padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px;">
		<%
		wTIT = Request.QueryString("URLTIT")		
		Mostrar_Titulo
		wCLASS = "TDS"
		wShowURL = "N"
		Mostrar_Linea 
		'Incluir Cuerpo del Reporte 
		%>
		<!--#include file="X001A100M_C.ASP"-->
	</table>
         
</body>
</html>
