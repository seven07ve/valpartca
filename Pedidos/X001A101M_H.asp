<%@ Language=VBScript %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<title></title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
</head>


 
<!--#include file="X001Y001M.PRC"-->
    <body  style="text-align: center" topmargin="0" leftmargin="0" rightmargin="0"  bgcolor="<%=Request.Cookies("CAR")("Color1")%>" >
     

   
    
    <table border="1" align="center"   bordercolor="#FFFFFF" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" width="919"  style="padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px;">



		<%

		wTIT = Request.QueryString("URLTIT")
		wCLA001 = Request.QueryString("CAMC01")
		wCLA002 = Request.QueryString("CAMC02")
		
		IF ISNULL(wTIT) OR TRIM(wTIT) = "" THEN
			wNOMCLI = BuscarClientePedido ( wCLA001, wCLA002 )
			wNOMCLI = replace(wNOMCLI, chr(34), " ") 
			wTIT = "Pedido " & wCLA002 & " de "  &  replace(wNOMCLI,"&", " ")  
		END IF 
	
		Mostrar_Titulo
		wCLASS = "TDS"
		wShowURL = "N"
		Mostrar_Linea
		'Incluir Cuerpo del Reporte 
		%>
		<!--#include file="X001A101M_C.ASP"-->
	</table>
	  
</body>
</html>
