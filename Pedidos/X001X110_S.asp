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
 'Maestro de Clientes
	CASE "X300ZF001"

		wPAR = wPAR & "&TITULO=Maestro de Usuarios" 
		wPAR = wPAR & "&CAMC01=" & Session("glCiaInternet")
		wPAR = wPAR & "&URLACT=X001X103.ASP" 		
END SELECT		

 

wURL = "X001X110_F.ASP?" & wPAR	

Response.Redirect wURL

%>		
