<%

wNOMTAB = TRIM(Request.QueryString("NOMTAB"))
wPARBUS = TRIM(Request.QueryString("PARBUS"))

Session("glError") = "N"

if wPARBUS <> "S" THEN
	Session("glBusqueda") = ""
END IF

wPAR = "NOMTAB=" & wNOMTAB

SELECT CASE wNOMTAB
    'Pedidos
	CASE "X300ZF050"
		wPAR = wPAR & "&TITULO=Noticias de Carvica" 
		wPAR = wPAR & "&STSPED=1" 		
		wPAR = wPAR & "&URLACT=X010Z300A.ASP" 	
	 
END SELECT

Session("glUrlRegresar") = "X010Z300.ASP?NOMTAB=" & wNOMTAB
wURL = "X010Z300F.ASP"

Response.Redirect wURL

%>		
