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

wPAR = wPAR & "&TITULO= Configuración de Grupos de Codigo a Visualizar en la Creación de PQR"
wPAR = wPAR & "&CLA001=" & wCLA001
wPAR = wPAR & "&CLA002=" & wCLA002
wPAR = wPAR & "&URLACT=X001X136_A.ASP" 		


wURL = "X001X136_F.ASP?" & wPAR	


Response.Redirect wURL

%>		
