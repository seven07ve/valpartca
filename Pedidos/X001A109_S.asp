<!--#include file="X001Y001.PRC"-->

<%



wPARBUS = TRIM(Request.QueryString("PARBUS"))
wCLA001 = TRIM(Request.QueryString("CLA001"))
wCLA002 = TRIM(Request.QueryString("CLA002"))
wCLA003 = TRIM(Request.QueryString("CLA003"))
wMES = TRIM(Request.QueryString("MES"))


wNOMCLI = TRIM(Request.QueryString("NOMCLI"))

wNOMCLI = BuscarClientePago(wCLA002)
wNOMCLI = replace(wNOMCLI, chr(34), " ")
wNOMCLI = replace(wNOMCLI, "'", " ")


Session("glError") = "N"

If wPARBUS <> "S" THEN
	Session("glBusqueda") = ""
END IF

'IF wCLA003 = "0" THEN
'	wPAR = "TITULO=Pre-Recibo de Pago " & wCLA002 & " de "  &  wNOMCLI 
'ELSE
	wPAR = "TITULO=Comprobante de Pago " & wCLA002 & " de "  &  wNOMCLI 
'END IF 

wPAR = wPAR & "&CAMC01=" & wCLA001
wPAR = wPAR & "&CAMC02=" & wCLA002
wPAR = wPAR & "&CAMC03=" & wCLA003
wPAR = wPAR & "&MES=" & wMES
wPAR = wPAR & "&URLACT=X001A109_A.ASP" 		


wURL = "X001A109_F.ASP?" & wPAR

 

Response.Redirect wURL

%>		
