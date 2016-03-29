<%

	wCuenta = clng(TRIM(Request.Form("CUENTA")))
	strCnn	= Application("XDTA300_ConnectionString")

	wIND = 1

    DO WHILE wIND < wCuenta

		wOBJ = right(("0000" & wIND),4)
		wNAMP = "P" & wOBJ
		wNAMC = "C" & wOBJ

		wNPE = TRIM(Request.Form(wNAMP))
		wSTS = TRIM(Request.Form(wNAMC))
		
		If wSTS = "on" Then 
		
			Set XDTA300 = Server.CreateObject("ADODB.Connection")
			XDTA300.Open strCnn
			
			SQL = "DELETE FROM X300BF101  " 
			SQL = SQL & " WHERE "		
			SQL = SQL & " B300101CCI = '" & Session("glCiaInternet") & "' AND "
			SQL = SQL & " B300101NPE = '" & wNPE & "' "
			XDTA300.Execute SQL	

			SQL = "DELETE FROM X300BF100  " 
			SQL = SQL & " WHERE "		
			SQL = SQL & " B300100CCI = '" & Session("glCiaInternet") & "' AND "
			SQL = SQL & " B300100NPE = '" & wNPE & "'"
			XDTA300.Execute SQL	
	
			'response.write wNPE & "-" & wSTS & "<br>"
		
		End If

		wIND = wIND + 1
		
	LOOP
	
	wURL = "X001A100_S.asp?NOMTAB=X300BQ100"
	Response.redirect wURL

%>