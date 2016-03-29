<%@ Language=VBScript %>
<%

	Response.Expires = -1
	Response.Expiresabsolute = Now() - 1	
	Response.AddHeader "pragma","no-cache"
	Response.AddHeader "cache-control","private"
	Response.CacheControl = "no-cache"

%>


<%
	
	
	wP300001COD = TRIM(Request.Form("txP300001COD"))
	
	wTDEP = cdbl(Request.Form("tDEP"))
	wTHOB = cdbl(Request.Form("tHOB"))
	wTPRO = cdbl(Request.Form("tPRO"))
	
	
	


	strCnn	= Application("XDTA300_ConnectionString")
	
	'response.write wTDEP
	'*****************************Deportes ************************
	wIND = 1
	DO WHILE wIND <= wTDEP - 1
		
		wchDEP = "chDEP" & wIND
		wtxDEP = "txDEP" & wIND
			
		wSTS = TRIM(Request.Form(wchDEP))
		wDEP = TRIM(Request.Form(wtxDEP))
		
		wExiste = "N"
		SQL = "SELECT P300002CON "
		SQL = SQL & " FROM X300PF002 WHERE "
		SQL = SQL & " P300002CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300002CON = '" & wDEP & "' AND "
		SQL = SQL & " P300002TIP = '1' AND "
		SQL = SQL & " P300002COD = '" & trim(wP300001COD) & "'" 
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
		rstQuery2.Open sql , strCnn
		IF NOT rstQuery2.EOF THEN
			wExiste = "S"
		END IF
		rstQuery2.Close 
		set rstQuery2 = nothing
		
		If wExiste = "N" and wSTS = "on" Then
			Inserta_Registro wDEP, "1"
		End If 
		
		If wExiste = "S" and wSTS = "" Then
			Elimina_Registro wDEP, "1"
		End If 		
			
		wIND = wIND + 1		
	LOOP	
	'**************************************************************
	
	'*****************************Hobbies**************************
	wIND = 1
	DO WHILE wIND <= wTHOB - 1
		
		wchHOB = "chHOB" & wIND
		wtxHOB = "txHOB" & wIND
			
		wSTS = TRIM(Request.Form(wchHOB))
		wHOB = TRIM(Request.Form(wtxHOB))
		
		wExiste = "N"
		SQL = "SELECT P300002CON "
		SQL = SQL & " FROM X300PF002 WHERE "
		SQL = SQL & " P300002CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300002CON = '" & wHOB & "' AND "
		SQL = SQL & " P300002TIP = '2' AND "
		SQL = SQL & " P300002COD = '" & trim(wP300001COD) & "'" 
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
		rstQuery2.Open sql , strCnn
		IF NOT rstQuery2.EOF THEN
			wExiste = "S"
		END IF
		rstQuery2.Close 
		set rstQuery2 = nothing
		
		If wExiste = "N" and wSTS = "on" Then
			Inserta_Registro wHOB, "2"
		End If 
		
		If wExiste = "S" and wSTS = "" Then
			Elimina_Registro wHOB, "2"
		End If 		
			
		wIND = wIND + 1		
	LOOP	
	'******************************************************************
	
	'*****************************Procedencia**************************
	wIND = 1
	DO WHILE wIND <= wTPRO - 1
		
		wchPRO = "chPRO" & wIND
		wtxPRO = "txPRO" & wIND
			
		wSTS = TRIM(Request.Form(wchPRO))
		wPRO = TRIM(Request.Form(wtxPRO))
		
		wExiste = "N"
		SQL = "SELECT P300002CON "
		SQL = SQL & " FROM X300PF002 WHERE "
		SQL = SQL & " P300002CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300002CON = '" & wPRO & "' AND "
		SQL = SQL & " P300002TIP = '3' AND "
		SQL = SQL & " P300002COD = '" & trim(wP300001COD) & "'" 
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
		rstQuery2.Open sql , strCnn
		IF NOT rstQuery2.EOF THEN
			wExiste = "S"
		END IF
		rstQuery2.Close 
		set rstQuery2 = nothing
		
		If wExiste = "N" and wSTS = "on" Then
			Inserta_Registro wPRO, "3"
		End If 
		
		If wExiste = "S" and wSTS = "" Then
			Elimina_Registro wPRO, "3"
		End If 		
			
		wIND = wIND + 1		
	LOOP	
	'*************************************************************************


Sub Inserta_Registro(wCON, wTIP)
	
		wP300001COD = TRIM(Request.Form("txP300001COD"))
		
		wPUS = Session("glUsuario")	
		wFECHA = DAY(DATE) & "-" & MONTH(DATE) & "-" & YEAR(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)
		
		Set XDTA300 = Server.CreateObject("ADODB.Connection")
		XDTA300.Open strCnn
		
		SQL = " INSERT INTO X300PF002 ("
		SQL = SQL & " P300002CCI, P300002COD, P300002CON, P300002TIP, "
		SQL = SQL & " P300002FAC, P300002FPR, P300002PUS ) " 
		SQL = SQL & " VALUES ( "
		SQL = SQL & "'" & Session("glCiaInternet") & "',"
		SQL = SQL & "'" & wP300001COD & "',"
		SQL = SQL & "'" & trim(wCON) & "',"
		SQL = SQL & "'" & trim(wTIP) & "',"
		SQL = SQL & "'" & wFECHA & "',"		
		SQL = SQL & "'" & wFECHA & "',"		
		SQL = SQL & "'" & Session("glUsuario") & "')"	
		XDTA300.Execute SQL
		XDTA300.Close 
		set XDTA300 = nothing

		'RESPONSE.WRITE SQL

End Sub 


Sub Elimina_Registro(wCON, wTIP)
	
		wP300001COD = TRIM(Request.Form("txP300001COD"))
		
		Set XDTA300 = Server.CreateObject("ADODB.Connection")
		XDTA300.Open strCnn
		
		SQL = " DELETE FROM X300PF002 WHERE "		
		SQL = SQL & " P300002CCI ='" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300002TIP ='" & trim(wTIP) & "' AND "
		SQL = SQL & " P300002CON ='" & trim(wCON) & "' AND "
		SQL = SQL & " P300002COD ='" & wP300001COD & "'"
		XDTA300.Execute SQL
		XDTA300.Close 
		set XDTA300 = nothing

End Sub 
	

	'response.write SQL 
response.Redirect "X001P003M1.asp?CLA001=" & wP300001COD 

%>

