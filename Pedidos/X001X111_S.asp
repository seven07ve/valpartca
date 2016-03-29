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

SELECT CASE wNOMTAB

	'Gerentes - Supervisor
	CASE "X300ZQ005"
		wPAR = wPAR & "&TITULO=Relación de Supervisores del Gerente (" & wCLA003 & ") "
		wPAR = wPAR & "&CAMC01=" & wCLA001
		wPAR = wPAR & "&CAMC02=" & wCLA002
		wPAR = wPAR & "&URLACT=X001X112.ASP" 		
	'Supervisor - Vendedor
	CASE "X300ZQ006"
		wPAR = wPAR & "&TITULO=Relación de Vendedores del Supervisor (" & wCLA003 & ") "
		wPAR = wPAR & "&CAMC01=" & wCLA001
		wPAR = wPAR & "&CAMC02=" & wCLA002
		wPAR = wPAR & "&URLACT=X001X113.ASP" 		

 
END SELECT

wURL = "X001X111_F.ASP?" & wPAR	

wPAR1 = "NOMTAB=" & wNOMTAB 
wPAR1 = wPAR1 & "&CLA001=" & wCLA001
wPAR1 = wPAR1 & "&CLA002=" & wCLA002
wPAR1 = wPAR1 & "&CLA003=" & wCLA003

Session("glUrlBuscarDetalle") = "X001X111_S.ASP?" &  wPAR1
Session("glUrlBuscar01") = "X001X111_S.ASP?" &  wPAR1

Response.Redirect wURL

%>		
