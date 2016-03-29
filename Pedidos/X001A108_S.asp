<%

wNOMTAB = TRIM(Request.QueryString("NOMTAB"))
wPARBUS = TRIM(Request.QueryString("PARBUS"))
wMES = TRIM(Request.QueryString("MES"))

Session("glError") = "N"

if wPARBUS <> "S" THEN
	Session("glBusqueda") = ""
END IF

wPAR = "NOMTAB=" & wNOMTAB

SELECT CASE wNOMTAB
    'Pedidos
	CASE "X300CQ001"
		wPAR = wPAR & "&TITULO=Pagos por Procesar" 
		wPAR = wPAR & "&STSPED=0" 		
		wPAR = wPAR & "&URLACT=X001A108_A.ASP" 	


	CASE "X300CQ001H"
		wPAR = "NOMTAB=X300CQ001" 
		wPAR = wPAR & "&TITULO=Pagos Procesados" 
		wPAR = wPAR & "&STSPED=1" 		
		wPAR = wPAR & "&MES=" & wMES 		
		wPAR = wPAR & "&URLACT=X001A108_A.ASP" 		
 
END SELECT

Session("glUrlRegresar") = "X001A108_S.ASP?NOMTAB=" & wNOMTAB
wURL = "X001A108_F.ASP?" & wPAR

Response.Redirect wURL

%>		
