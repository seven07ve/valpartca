<%

	wCuenta = clng(TRIM(Request.Form("CUENTA")))
	strCnn	= Application("XDTA300_ConnectionString")

	wIND = 1

    DO WHILE wIND < wCuenta

		wOBJ = right(("0000" & wIND),4)
		wNAMP = "P" & wOBJ
		wNAMC = "C" & wOBJ
		wNAMM = "M" & wOBJ

		wNLP = TRIM(Request.Form(wNAMP))
		wSTS = TRIM(Request.Form(wNAMC))
		wSTS2 = TRIM(Request.Form(wNAMM))
		
		Response.write wSTS & "<br>"
		'Response.End

		wExiste = "N"
		wExiste2 = "N"

		SQL = "SELECT "
		SQL = SQL & " B300125PUS " 
		SQL = SQL & " FROM X300BF125 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " B300125CCI ='" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " B300125CIA ='" & Session("glCia") & "' AND "
		SQL = SQL & " B300125NLP ='" & wNLP & "'"
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wExiste = "S"			
		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING	
		
		SQL = "SELECT "
		SQL = SQL & " B300128PUS " 
		SQL = SQL & " FROM X300BF128 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " B300128CCI ='" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " B300128CIA ='" & Session("glCia") & "' AND "
		SQL = SQL & " B300128NLP ='" & wNLP & "'"
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wExiste2 = "S"			
		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING	
		
			
		Set XDTA300 = Server.CreateObject("ADODB.Connection")
		XDTA300.Open strCnn
				
		If wExiste = "S" and wSTS = "9" Then 
		
		
			SQL = "DELETE FROM X300BF125  " 
			SQL = SQL & " WHERE "		
			SQL = SQL & " B300125CCI ='" & Session("glCiaInternet") & "' AND "
			SQL = SQL & " B300125CIA ='" & Session("glCia") & "' AND "
			SQL = SQL & " B300125NLP = '" & wNLP & "'"
			XDTA300.Execute SQL
			
			'response.write wNLP & "-" & wSTS & " Eliminada<br>"
			
		
		END IF


		If wExiste = "S" and wSTS <> "9" Then 
		
		
			SQL = "UPDATE X300BF125  SET " 
			SQL = SQL & " B300125STS = '" & wSTS & "',"
			SQL = SQL & " B300125PUS = '" & Session("glUsuario") & "',"
			SQL = SQL & " B300125FAC = getdate() "
			SQL = SQL & " WHERE "		
			SQL = SQL & " B300125CCI ='" & Session("glCiaInternet") & "' AND "
			SQL = SQL & " B300125CIA ='" & Session("glCia") & "' AND "
			SQL = SQL & " B300125NLP = '" & wNLP & "'"
			XDTA300.Execute SQL
			
			'response.write wNLP & "-" & wSTS & " Eliminada<br>"
			
		
		END IF
		
		If wExiste2 = "S" and wSTS2 = "" Then 
		
		

			SQL = "DELETE FROM X300BF128  " 
			SQL = SQL & " WHERE "		
			SQL = SQL & " B300128CCI ='" & Session("glCiaInternet") & "' AND "
			SQL = SQL & " B300128CIA ='" & Session("glCia") & "' AND "
			SQL = SQL & " B300128NLP = '" & wNLP & "'"
			XDTA300.Execute SQL
			
			'response.write wNLP & "-" & wSTS & " Eliminada<br>"
			
		
		END IF

		
		If wExiste = "N" and wSTS <> "9" Then 
		
			SQL = "INSERT INTO X300BF125 ( " 
			SQL = SQL & " B300125CCI, B300125CIA, B300125NLP,  "
			SQL = SQL & " B300125STS, B300125FAC, B300125PUS ) "
			SQL = SQL & " VALUES ( "
			SQL = SQL & "'" & Session("glCiaInternet") & "', "
			SQL = SQL & "'" & Session("glCia") & "', "
			SQL = SQL & "'" & wNLP & "', "
			SQL = SQL & "'" & wSTS & "', "
			SQL = SQL & "getdate(), "
			SQL = SQL & "'" & Session("glUsuario") & "') "
			XDTA300.Execute SQL	
		
			'response.write wNLP & "-" & wSTS & " Insertada<br>"
			
		End If
		
		If wExiste2 = "N" and wSTS2 = "on" Then 
		
			SQL = "INSERT INTO X300BF128 ( " 
			SQL = SQL & " B300128CCI, B300128CIA, B300128NLP,  "
			SQL = SQL & " B300128STS, B300128FAC, B300128PUS ) "
			SQL = SQL & " VALUES ( "
			SQL = SQL & "'" & Session("glCiaInternet") & "', "
			SQL = SQL & "'" & Session("glCia") & "', "
			SQL = SQL & "'" & wNLP & "', "
			SQL = SQL & "'0', "
			SQL = SQL & "getdate(), "
			SQL = SQL & "'" & Session("glUsuario") & "') "
			XDTA300.Execute SQL	
		
			'response.write wNLP & "-" & wSTS & " Insertada<br>"
			
		End If

		
		XDTA300.CLOSE
		SET XDTA300 = NOTHING

		wIND = wIND + 1
		
	LOOP
	
	wURL = "X001X153_S.asp"
	Response.redirect wURL

%>