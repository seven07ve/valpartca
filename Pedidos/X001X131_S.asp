<!--#include file="X001Y001.PRC"-->

<%



wPARBUS = TRIM(Request.QueryString("PARBUS"))
wCLA001 = TRIM(Request.QueryString("CLA001"))
wCLA002 = TRIM(Request.QueryString("CLA002"))


Session("glError") = "N"

if wPARBUS <> "S" THEN
	Session("glBusqueda") = ""
END IF

wPAR = "TITULO=Factura " & wCLA002 & " de "  &  wNOMCLI 
wPAR = wPAR & "&CAMC01=" & wCLA001
wPAR = wPAR & "&CAMC02=" & wCLA002
wPAR = wPAR & "&URLACT=X001X131_A.ASP" 		


wURL = "X001X131_F.ASP?" & wPAR

 

Response.Redirect wURL

%>		
