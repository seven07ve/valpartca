<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%

wNOMTAB = TRIM(Request.QueryString("NOMTAB"))
wPARBUS = TRIM(Request.QueryString("PARBUS"))

Session("glError") = "N"

if wPARBUS <> "S" THEN
	Session("glBusqueda") = ""
END IF

wPAR = "NOMTAB=" & wNOMTAB

wPAR = "NOMTAB=X300BQ100" 
wPAR = wPAR & "&TITULO=Configuraci�n de L�neas" 
wPAR = wPAR & "&STSPED=1" 		
wPAR = wPAR & "&URLACT=X001X153_A.ASP" 		
 

wURL = "X001X153_F.ASP?" & wPAR

Response.Redirect wURL

%>		
