<%
	wProceso = TRIM(Request.Form("PROCESO"))
	'response.write wproceso
	'response.end
	
	strCnn	= Application("XDTA300_ConnectionString")


	Session("glMensajeError") = ""
	
	wCLA001 = trim(Request.QueryString("CLA001"))
	wP300101NPE = trim(Request.QueryString("CLA002"))
	wP300101CPR = trim(Request.QueryString("CLA004"))
	wP300101ITE = trim(Request.QueryString("CLA003"))
	wP300101CCI = Session("glCiaInternet")
	wP300101CIA = Session("glCia")
	wP300101OPE = Session("glCodVendedor")
	
	wP300101UVE = TRIM(Request.Form("CAN"))
	
	IF Session("glTipoUsuario") <> "V" THEN
		wP300101PPR = TRIM(Request.Form("txPPR"))
		ELSE
		wP300101PPR = TRIM(Request.Form("ddlPPR"))
	END IF 
	
	SQL = "SELECT Z300002PMD, Z300002PGE  " 
	SQL = SQL & " FROM X300ZF002 WHERE "
	SQL = SQL & " Z300002CCI = '" & Session("glCiaInternet") & "' "
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		wPMD = trim(rstQuery.Fields("Z300002PMD"))
		wPGE = trim(rstQuery.Fields("Z300002PGE"))	
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	
	IF wPGE = wP300101CPR THEN
		wP300101PUN = TRIM(Request.Form("txPUN"))
		wP300101DEL = Replace(TRIM(Request.Form("txDEL")),"'","")
	END IF 

	IF NOT ISNUMERIC(wP300101UVE) OR wP300101UVE = "0" THEN
		wURL = "X001P101_A.asp?CLA001=" & wCLA001 & "&CLA002=" & wB300101NPE & "&CLA004=" & wP300101CPR & "&CLA003=" & wP300101ITE 
		wURL = wURL & "&ERROR=" & "Ingrese un valor correcto en la Cantidad"
		Response.redirect wURL
	END IF
	
	wFECHA = DAY(DATE) & "-" & MONTH(DATE) & "-" & YEAR(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)
	
	
	
	IF wProceso = "Guardar" or wProceso = "Eliminar" then
		if wProceso = "Eliminar" then
			SQL = "DELETE FROM X300PF101 " 
		   ELSE	
			SQL = "UPDATE X300PF101 SET " 
			SQL = SQL & " P300101PUS = '" & Session("glUsuario")  & "', "
			SQL = SQL & " P300101PPR = '" & wP300101PPR & "', "
			SQL = SQL & " P300101UVE = '" & wP300101UVE & "', "
			IF wPGE = wP300101CPR THEN
				SQL = SQL & " P300101PUN = '" & wP300101PUN & "', "
				SQL = SQL & " P300101DEL = '" & wP300101DEL & "', "
			END IF 
			SQL = SQL & " P300101FAC = '" & wFECHA & "'  "		
		END IF	
		SQL = SQL & " WHERE "		
		SQL = SQL & " P300101CCI ='" & wP300101CCI & "' AND "
		SQL = SQL & " P300101NPE ='" & wP300101NPE & "' AND "
		SQL = SQL & " P300101ITE ='" & wP300101ITE & "' AND "
		SQL = SQL & " P300101CPR ='" & wP300101CPR & "' "		
	END IF

	Set XDTA300 = Server.CreateObject("ADODB.Connection")
	XDTA300.Open strCnn
	'RESPONSE.WRITE SQL
	'RESPONSE.END
	XDTA300.Execute SQL
	XDTA300.Close 
	SET XDTA300 = NOTHING
	
	
	
	SQL = " X300PX001 "
	SQL = SQL & "'" & wP300101CCI & "', "
    SQL = SQL & "'01', "
    SQL = SQL & "'" & wP300101OPE & "', "
    SQL = SQL & "'" & wP300101NPE & "' "
	Set XDTA300 = Server.CreateObject("ADODB.Connection")
	XDTA300.Open strCnn
	XDTA300.Execute SQL
	XDTA300.Close 

	wURL = 	Session("glUrlBuscar")
	wURL = "X001P101.ASP?CLA001=" & wCLA001 & "&CLA002=" & wP300101NPE 	
	Response.Redirect wURL

%>