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
		wPAR = wPAR & "&TITULO=Pedidos en Preparación" 
		wPAR = wPAR & "&URLACT=X001X132_A.ASP"  		
END SELECT

	'if Session("glCiaInternet") <> "" then
	'	response.redirect "default.asp"
	'  else
	  wURL = "X001X132_F.ASP?" & wPAR	
	'end if  	


Response.Redirect wURL

%>		
