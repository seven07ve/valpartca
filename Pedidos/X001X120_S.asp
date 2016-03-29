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
	CASE "X300BQ102"
		wPAR = wPAR & "&TITULO=Backorders" 
		wPAR = wPAR & "&CAMC01=B300102CPR" 
		wPAR = wPAR & "&CAMC02=A300003REF" 		
		wPAR = wPAR & "&CAMC03=A300003DEL" 
		wPAR = wPAR & "&CAMC04=B300102NPE" 
		wPAR = wPAR & "&CAMC05=B300102BCK" 
		wPAR = wPAR & "&CAMC06=B300102FEC" 
		wPAR = wPAR & "&URLACT=X001X102.ASP" 		
END SELECT

	'if Session("glCiaInternet") <> "" then
	'	response.redirect "default.asp"
	'  else
	  wURL = "X001X120_F.ASP?" & wPAR	
	'end if  	


Response.Redirect wURL

%>		
