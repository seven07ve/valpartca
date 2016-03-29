<%

wNOMTAB = TRIM(Request.QueryString("NOMTAB"))
wPARBUS = TRIM(Request.QueryString("PARBUS"))
wCLA001 = TRIM(Request.QueryString("CLA001"))


Session("glError") = "N"

if wPARBUS <> "S" THEN
	Session("glBusqueda") = ""
END IF

wPAR = "NOMTAB=" & wNOMTAB

SELECT CASE wNOMTAB
 'Maestro de Productos
	CASE "X300BQ200"
		wPAR = wPAR & "&TITULO=Facturado (En Transito o Recibido)" 
		wPAR = wPAR & "&URLACT=X001X130_A.ASP"  		
END SELECT

	'if Session("glCiaInternet") <> "" then
	'	response.redirect "default.asp"
	'  else
	  wURL = "X001X130_F.ASP?" & wPAR	
	'end if  	


Response.Redirect wURL

%>		
