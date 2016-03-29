<!--#include file="X001Y002.PRC"-->
<%

wNOMTAB = TRIM(Request.QueryString("NOMTAB"))
wPARBUS = TRIM(Request.QueryString("PARBUS"))
wCLA001 = TRIM(Request.QueryString("CLA001"))

wDESLIS = BuscarListaPrecio ( wCLA001 )

Session("glError") = "N"

if wPARBUS <> "S" THEN
	Session("glBusqueda") = ""
END IF

wPAR = "NOMTAB=" & wNOMTAB

SELECT CASE wNOMTAB

 'Detalle de Lista de Precios
	CASE "X300AQ018"
		wPAR = wPAR & "&TITULO=Detalle de " & wDESLIS
		wPAR = wPAR & "&CAMC01=A300019CPR" 
		wPAR = wPAR & "&CAMC02=A300003DEL" 
		wPAR = wPAR & "&CAMC03=A300019PUA" 
		wPAR = wPAR & "&CAMC04=A300019STS" 
		wPAR = wPAR & "&CAMC07=" & wCLA001
		wPAR = wPAR & "&URLACT=X001X107.ASP" 		

 
END SELECT

wURL = "X001X105_F.ASP?" & wPAR

Response.Redirect wURL

%>		
