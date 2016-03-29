<%
	wProceso = TRIM(Request.Form("PROCESO"))

	Session("glMensajeError") = ""
	
	
	wCCL = trim(Request.QueryString("CLA001"))
	wCOD = trim(Request.QueryString("CLA002"))
	wCPR = trim(Request.QueryString("CLA003"))
	wNFA = trim(Request.QueryString("CLA004"))
	wSTSPED = trim(Request.QueryString("STSPED"))
	wCCI = Session("glCiaInternet")
	wCIA = Session("glCia")
	
	wTRE = TRIM(Request.Form("MOTIVO"))
	wCAN = TRIM(Request.Form("wCAN"))

	IF NOT ISNUMERIC(wCAN) OR wCAN = "0" THEN
		wURL = "X001A115_A.asp?CLA001=" & wB300101OPE & "&CLA002=" & wB300101NPE & "&CLA003=" & wB300101CPR 
		wURL = wURL & "&ERROR=" & "Ingrese un valor correcto en la Cantidad"
		Response.redirect wURL
	END IF
	
	wFECHA = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)
	
	
	strCnn	= Application("XDTA300_ConnectionString")
	
	IF wProceso = "Actualizar" or wProceso = "Eliminar" then
		if wProceso = "Eliminar" then
			SQL = "DELETE FROM X300EF002 " 
		   ELSE	
			SQL = "UPDATE X300EF002 SET " 
			SQL = SQL & " E300002TRE = '" & wTRE & "', "
			SQL = SQL & " E300002CAN = '" & wCAN & "', "
			SQL = SQL & " E300002FAC = '" & wFECHA & "'  "		
		END IF	
		SQL = SQL & " WHERE "		
		SQL = SQL & " E300002CCI ='" & wCCI & "' AND "
		SQL = SQL & " E300002CIA ='" & wCIA & "' AND "
		SQL = SQL & " E300002COD ='" & wCOD & "' AND "
		SQL = SQL & " E300002NFA ='" & wNFA & "' AND "
		SQL = SQL & " E300002CPR ='" & wCPR & "' "		
	END IF

	Set XDTA300 = Server.CreateObject("ADODB.Connection")
	XDTA300.Open strCnn
	'RESPONSE.WRITE SQL
	XDTA300.Execute SQL
	XDTA300.Close 
	SET XDTA300 = NOTHING
	
	'CalcularMontoPedido wB300101OPE, wB300101NPE
	
	wURL = "X001A115_S.ASP?CLA001=" & wCCL & "&CLA002=" & wCOD
	wURL = wURL & "&STSPED=" & wSTSPED
	Response.Redirect wURL

%><!--#include file="X001Y003.PRC"--><!--#include file="X001Y101.PRC"-->