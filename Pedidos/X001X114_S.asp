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

 'Maestro de Usuarios
	CASE "X300ZF001"
		wPAR = wPAR & "&TITULO=Maestro de Usuarios" 
		wPAR = wPAR & "&CAMC01=Z300001PUS" 
		wPAR = wPAR & "&CAMC02=Z300001NUS" 
		wPAR = wPAR & "&CAMC03=Z300001STS" 
		wPAR = wPAR & "&CAMC04=Z300001PPC" 
		wPAR = wPAR & "&URLACT=X001X103.ASP" 		

END SELECT

	'if Session("glCiaInternet") <> "" then
	'	response.redirect "default.asp"
	'  else
	  wURL = "X001X114_F.ASP?" & wPAR	
	'end if  	


Response.Redirect wURL

%>		
