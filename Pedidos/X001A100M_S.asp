<%

wNOMTAB = TRIM(Request.QueryString("NOMTAB"))
wPARBUS = TRIM(Request.QueryString("PARBUS"))

Session("glError") = "N"

if wPARBUS <> "S" THEN
	Session("glBusqueda") = ""
END IF

wPAR = "NOMTAB=" & wNOMTAB

'SELECT CASE wNOMTAB
    'Pedidos
	'CASE "X300BQ100"
		wPAR = wPAR & "&TITULO=Pedidos Procesados Movil" 
		wPAR = wPAR & "&STSPED=0" 		
		wPAR = wPAR & "&URLACT=X001A100_AM.ASP" 	


	'CASE "X300BQ100H"
		'wPAR = "NOMTAB=X300BQ100" 
		'wPAR = wPAR & "&TITULO=Pedidos Procesados" 
		'wPAR = wPAR & "&STSPED=1" 		
		'wPAR = wPAR & "&URLACT=X001A100_A.ASP" 		
 
'END SELECT

Session("glUrlRegresar") = "X001A100M_S.ASP?NOMTAB=" & wNOMTAB
wURL = "X001A100M_F.ASP?" & wPAR

Response.Redirect wURL

%>		
