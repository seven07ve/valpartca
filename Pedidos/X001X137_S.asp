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
		
		IF wNOMTAB = "X300ZF006" THEN 
			wPAR = wPAR & "&TITULO=Usuarios Supervisados de " & wCLA002 & "-" & Replace(wCLA003, "%20", " ")
			wPAR = wPAR & "&CLA001=" & wCLA001
			wPAR = wPAR & "&CLA002=" & wCLA002			
			wPAR = wPAR & "&URLACT=X001X139.ASP" 		
		 ELSE
			wPAR = wPAR & "&TITULO=" & wCLA002 & "-" & Replace(wCLA003, "%20", " ")
			wPAR = wPAR & "&CLA001=" & wCLA001
			wPAR = wPAR & "&CLA002=" & wCLA002
			wPAR = wPAR & "&URLACT=X001X137_A.ASP"
		END IF 
		
	'if Session("glCiaInternet") <> "" then
	'	response.redirect "default.asp"
	'  else
	  wURL = "X001X137_F.ASP?" & wPAR	
	'end if  	


Response.Redirect wURL

%>		
