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
	CASE "X300CQ204"
		wPAR = wPAR & "&TITULO=Estado de Cuenta" 
		wPAR = wPAR & "&CAMC01=C300204CCL" 
		wPAR = wPAR & "&CAMC02=C300204NFA" 		
		wPAR = wPAR & "&CAMC03=A300002RSO" 
		wPAR = wPAR & "&CAMC04=C300204TDO" 
		wPAR = wPAR & "&CAMC05=C300204STO" 
		wPAR = wPAR & "&CAMC06=C300204FPR" 
		wPAR = wPAR & "&URLACT=X001X102.ASP"  		
END SELECT

	'if Session("glCiaInternet") <> "" then
	'	response.redirect "default.asp"
	'  else
	  wURL = "X001X128_F.ASP?" & wPAR	
	'end if  	


Response.Redirect wURL

%>		
