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
	CASE "X300BQ100"
		wPAR = wPAR & "&TITULO=Sugerencias y Reclamos Pendientes" 
		wPAR = wPAR & "&STSPED=0" 		
		wPAR = wPAR & "&URLACT=../ASPX/C001E004.aspx" 	
 
END SELECT

Session("glUrlRegresar") = "X001A100_S.ASP?NOMTAB=" & wNOMTAB
wURL = "X001A104_F.ASP?" & wPAR

Response.Redirect wURL

%>		
