<%

wNOMTAB = TRIM(Request.QueryString("NOMTAB"))
wPARBUS = TRIM(Request.QueryString("PARBUS"))
wCLA001 = TRIM(Request.QueryString("CLA001"))
wCLA002 = TRIM(Request.QueryString("CLA002"))
wCLA003 = TRIM(Request.QueryString("CLA003"))


Session("glError") = "N"

if wPARBUS <> "S" THEN
	Session("glBusqueda") = ""
END IF

wPAR = "NOMTAB=" & wNOMTAB

		wPAR = wPAR & "&TITULO=" & wCLA002 & "-" & wCLA003
		wPAR = wPAR & "&CLA001=" & wCLA001
		wPAR = wPAR & "&CLA002=" & wCLA002
		wPAR = wPAR & "&URLACT=X001X123_A.ASP" 		


	'if Session("glCiaInternet") <> "" then
	'	response.redirect "default.asp"
	'  else
	  wURL = "X001X123_F.ASP?" & wPAR	
	'end if  	


Response.Redirect wURL

%>		
