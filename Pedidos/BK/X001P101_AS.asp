<%
	wProceso = TRIM(Request.Form("PROCESO"))

	Session("glMensajeError") = ""
	
	wB300101OPE = trim(Request.QueryString("CLA001"))
	wB300101NPE = trim(Request.QueryString("CLA002"))
	wB300101CPR = trim(Request.QueryString("CLA003"))
	wB300101CCI = Session("glCiaInternet")
	wB300101CIA = Session("glCia")
	
	wB300101UVE = TRIM(Request.Form("wCAN"))

	IF NOT ISNUMERIC(wB300101UVE) OR wB300101UVE = "0" THEN
		wURL = "X001A101_A.asp?CLA001=" & wB300101OPE & "&CLA002=" & wB300101NPE & "&CLA003=" & wB300101CPR 
		wURL = wURL & "&ERROR=" & "Ingrese un valor correcto en la Cantidad"
		Response.redirect wURL
	END IF
	
	wFECHA = DAY(DATE) & "-" & MONTH(DATE) & "-" & YEAR(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)
	
	
	strCnn	= Application("XDTA300_ConnectionString")
	
	IF wProceso = "Actualizar" or wProceso = "Eliminar" then
		if wProceso = "Eliminar" then
			SQL = "DELETE FROM X300BF101 " 
		   ELSE	
			SQL = "UPDATE X300BF101 SET " 
			SQL = SQL & " B300101UVE = '" & wB300101UVE & "', "
			SQL = SQL & " B300101FAC = '" & wFECHA & "'  "		
		END IF	
		SQL = SQL & " WHERE "		
		SQL = SQL & " B300101CCI ='" & wB300101CCI & "' AND "
		SQL = SQL & " B300101CIA ='" & wB300101CIA & "' AND "
		SQL = SQL & " B300101OPE ='" & wB300101OPE & "' AND "
		SQL = SQL & " B300101NPE ='" & wB300101NPE & "' AND "
		SQL = SQL & " B300101CPR ='" & wB300101CPR & "' "		
	END IF

	Set XDTA300 = Server.CreateObject("ADODB.Connection")
	XDTA300.Open strCnn
	'RESPONSE.WRITE SQL
	XDTA300.Execute SQL
	XDTA300.Close 
	SET XDTA300 = NOTHING
	
	CalcularMontoPedido wB300101OPE, wB300101NPE
	
	wURL = "X001P101_S.ASP?CLA001=" & wB300101OPE & "&CLA002=" & wB300101NPE
	Response.Redirect wURL

%><!--#include file="X001Y003.PRC"--><!--#include file="X001P100.PRC"-->