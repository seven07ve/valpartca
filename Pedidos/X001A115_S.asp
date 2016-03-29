<!--#include file="X001Y001.PRC"-->

<%



wPARBUS = TRIM(Request.QueryString("PARBUS"))
wCLA001 = TRIM(Request.QueryString("CLA001"))
wCLA002 = TRIM(Request.QueryString("CLA002"))

wSTSPED = TRIM(Request.QueryString("STSPED"))

'response.write wSTSPED
wNOMCLI = TRIM(Request.QueryString("NOMCLI"))

wNOMCLI = BuscarClienteReclamo (wCLA001)
wNOMCLI = replace(wNOMCLI, chr(34), " ")

wNOMCLI = replace(wNOMCLI, "'", " ")



Session("glError") = "N"

If wPARBUS <> "S" THEN
	Session("glBusqueda") = ""
END IF

wPAR = "TITULO=Reclamo " & wCLA002 & " de "  &  wNOMCLI 

wPAR = wPAR & "&CAMC01=" & wCLA001
wPAR = wPAR & "&CAMC02=" & wCLA002
wPAR = wPAR & "&STSPED=" & wSTSPED
wPAR = wPAR & "&URLACT=X001A116_A.ASP" 		

'Response.write wPAR

wURL = "X001A115_F.ASP?" & wPAR

 
Response.Redirect wURL

%>		
