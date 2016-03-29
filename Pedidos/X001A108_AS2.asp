<%

	wCuenta = clng(TRIM(Request.Form("CUENTA")))
	strCnn	= Application("XDTA300_ConnectionString")

	wIND = 1

    DO WHILE wIND < wCuenta

		wOBJ = right(("0000" & wIND),4)
		wNAMP = "P" & wOBJ
		wNAMC = "C" & wOBJ

		wNDC = TRIM(Request.Form(wNAMP))
		wSTS = TRIM(Request.Form(wNAMC))
		
		If wSTS = "on" Then 
		
			Set XDTA300 = Server.CreateObject("ADODB.Connection")
			XDTA300.Open strCnn
			
			SQL = "DELETE FROM X300CF002  " 
			SQL = SQL & " WHERE "		
			SQL = SQL & " C300002NDC = '" & wNDC & "'"
			XDTA300.Execute SQL	

			SQL = "DELETE FROM X300CF001  " 
			SQL = SQL & " WHERE "		
			SQL = SQL & " C300001NDC = '" & wNDC & "'"
			XDTA300.Execute SQL	
	
			'response.write wNPE & "-" & wSTS & "<br>"
		
		End If

		wIND = wIND + 1
		
	LOOP
	
	wURL = "X001A108_S.asp?NOMTAB=X300CQ001"
	Response.redirect wURL

%>