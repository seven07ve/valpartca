<%@ Language=VBScript %>
<% Response.Expires = 0 %>
<% Response.AddHeader "PRAGMA", "NO-CACHE" %>

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
<!--#include file="X001Y001.PRC"-->

<body  align="center" style="text-align: center" topmargin="0" leftmargin="0" rightmargin="0" bgcolor="#000000">
    <table border="2" align="center" bordercolor="#0066CC" bgcolor="#FE9900" width="790"  style="padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; ">


		<%

	
		wCLA001 = Request.QueryString("CAMC01")
		wCLA002 = Request.QueryString("CAMC02")
		
		
		
		strCnn	= Application("XDTA300_ConnectionString")
	    SQL = "SELECT A300002RSO FROM X300BQ200 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " B300200CCL = '" &  wCLA001 & "' AND "	
		SQL = SQL & " B300200NFA = '" &  wCLA002 & "' "	
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
    	rstQuery.Open sql , strCnn
		IF NOT rstQuery.EOF THEN
			wNOMCLI = trim(rstQuery.Fields("A300002RSO"))
		END IF
		rstQuery.Close 
		set rstQuery = nothing
		
		wTIT = "Factura " & wCLA002 & " de "  &  replace(wNOMCLI,"&", " ") 
		
		Mostrar_Titulo
		wCLASS = "TDS"
		wShowURL = "N"
		
		
		
		Mostrar_Linea
		'Incluir Cuerpo del Reporte 
		%>
		<!--#include file="X001X131_C.ASP"-->
	</table>
	

</body>
</html>
