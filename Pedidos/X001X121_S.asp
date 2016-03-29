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
	CASE "X300AQ002_002"
		wPAR = wPAR & "&TITULO=Clientes" 
		wPAR = wPAR & "&CAMC01=B300102CPR" 
		wPAR = wPAR & "&CAMC02=A300003REF" 		
		wPAR = wPAR & "&CAMC03=A300003DEL" 	
		wPAR = wPAR & "&URLACT=X001X102.ASP" 		
END SELECT

	'if Session("glCiaInternet") <> "" then
	'	response.redirect "default.asp"
	'  else
	  wURL = "X001X121_F.ASP?" & wPAR	
	'end if  	


Response.Redirect wURL

%>		
