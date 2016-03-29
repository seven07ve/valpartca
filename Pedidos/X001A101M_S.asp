<!--#include file="X001Y001M.PRC"-->

<%



wPARBUS = TRIM(Request.QueryString("PARBUS"))
wCLA001 = TRIM(Request.QueryString("CLA001"))
wCLA002 = TRIM(Request.QueryString("CLA002"))


wNOMCLI = TRIM(Request.QueryString("NOMCLI"))

wNOMCLI = BuscarClientePedido ( wCLA001, wCLA002 )
wNOMCLI = replace(wNOMCLI, chr(34), " ")
wNOMCLI = replace(wNOMCLI, "'", " ")


Session("glError") = "N"

If wPARBUS <> "S" THEN
	Session("glBusqueda") = ""
END IF

wPAR = "TITULO=Pedido " & wCLA002 & " de "  &  replace(wNOMCLI,"&", " ")  
wPAR = wPAR & "&CAMC01=" & wCLA001
wPAR = wPAR & "&CAMC02=" & wCLA002
wPAR = wPAR & "&URLACT=X001A101M_A.ASP" 		


wURL = "X001A101M_F.ASP?" & wPAR

 
'Response.write wURL
Response.Redirect wURL

%>		
