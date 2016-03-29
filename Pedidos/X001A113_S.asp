<%

wNOMTAB = TRIM(Request.QueryString("NOMTAB"))
wPARBUS = TRIM(Request.QueryString("PARBUS"))
wCTR = TRIM(Request.QueryString("CTR"))

Session("glError") = "N"

if wPARBUS <> "S" THEN
	Session("glBusqueda") = ""
END IF

wPAR = "NOMTAB=" & wNOMTAB

SELECT CASE wNOMTAB
    'Pedidos
	CASE "X300BQ100"
		wPAR = wPAR & "&TITULO=PQR'S No Procesadas" 
		wPAR = wPAR & "&STSPED=" & wCTR			
		wPAR = wPAR & "&URLACT=X001A114.ASP" 	
		'wPAR = wPAR & "&URLACT=../ASPX/C001E004.aspx" 	
		
	CASE "X300BQ100S"
		wPAR = wPAR & "&TITULO=PQR'S Procesadas" 
		wPAR = wPAR & "&STSPED=" & wCTR
		wPAR = wPAR & "&URLACT=X001A114.ASP" 	
		'wPAR = wPAR & "&URLACT=../ASPX/C001E004.aspx" 		
 
END SELECT

Session("glUrlRegresar") = "X001A113_S.ASP?NOMTAB=" & wNOMTAB
wURL = "X001A113_F.ASP?" & wPAR

Response.Redirect wURL

%>		
