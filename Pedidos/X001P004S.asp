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
	wP300001COP = TRIM(Request.Form("rbCOP"))
	wP300001EIC = TRIM(Request.Form("rbEIC"))
	
	wTLIN = cdbl(Request.Form("tLIN"))
	
	
	


	strCnn	= Application("XDTA300_ConnectionString")
	
	SQL = "UPDATE X300PF001 SET " 
	SQL = SQL & " P300001COP = '" & wP300001COP & "', "											
	SQL = SQL & " P300001EIC = '" & wP300001EIC & "', "											
	SQL = SQL & " P300001FAC = getdate(), "			
	SQL = SQL & " P300001PUS = '" & Session("glUsuario") & "' "			
	SQL = SQL & " WHERE "		
	SQL = SQL & " P300001CCI ='" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " P300001COD ='" & wP300001COD & "'"
	Set XDTA300 = Server.CreateObject("ADODB.Connection")
	XDTA300.Open strCnn
	XDTA300.Execute SQL
	XDTA300.Close 
	set XDTA300 = nothing


	
	'response.write wTDEP
		
	'*****************************Lineas de Interes**************************
	wIND = 1
	DO WHILE wIND <= wTLIN - 1
		
		wchLIN = "chLIN" & wIND
		wtxLIN = "txLIN" & wIND
			
		wSTS = TRIM(Request.Form(wchLIN))
		wLIN = TRIM(Request.Form(wtxLIN))
		
		wExiste = "N"
		SQL = "SELECT P300004LIN "
		SQL = SQL & " FROM X300PF004 WHERE "
		SQL = SQL & " P300004CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300004LIN = '" & wLIN & "' AND "
		SQL = SQL & " P300004COD = '" & trim(wP300001COD) & "'" 
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
		rstQuery2.Open sql , strCnn
		IF NOT rstQuery2.EOF THEN
			wExiste = "S"
		END IF
		rstQuery2.Close 
		set rstQuery2 = nothing
		
		If wExiste = "N" and wSTS = "on" Then
			Inserta_Registro wLIN
		End If 
		
		If wExiste = "S" and wSTS = "" Then
			Elimina_Registro wLIN
		End If 		
			
		wIND = wIND + 1		
	LOOP	
	'*************************************************************************


Sub Inserta_Registro(wLIN)
	
		wP300001COD = TRIM(Request.Form("txP300001COD"))
		
		wPUS = Session("glUsuario")	
		wFECHA = DAY(DATE) & "-" & MONTH(DATE) & "-" & YEAR(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)
		
		Set XDTA300 = Server.CreateObject("ADODB.Connection")
		XDTA300.Open strCnn
		
		SQL = " INSERT INTO X300PF004 ("
		SQL = SQL & " P300004CCI, P300004COD, P300004LIN, "
		SQL = SQL & " P300004FAC, P300004FPR, P300004PUS ) " 
		SQL = SQL & " VALUES ( "
		SQL = SQL & "'" & Session("glCiaInternet") & "',"
		SQL = SQL & "'" & wP300001COD & "',"
		SQL = SQL & "'" & trim(wLIN) & "',"
		SQL = SQL & "'" & wFECHA & "',"		
		SQL = SQL & "'" & wFECHA & "',"		
		SQL = SQL & "'" & Session("glUsuario") & "')"	
		XDTA300.Execute SQL
		XDTA300.Close 
		set XDTA300 = nothing

		'RESPONSE.WRITE SQL

End Sub 


Sub Elimina_Registro(wLIN)
	
		wP300001COD = TRIM(Request.Form("txP300001COD"))
		
		Set XDTA300 = Server.CreateObject("ADODB.Connection")
		XDTA300.Open strCnn
		
		SQL = " DELETE FROM X300PF004 WHERE "		
		SQL = SQL & " P300004CCI ='" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300004LIN ='" & trim(wLIN) & "' AND "
		SQL = SQL & " P300004COD ='" & wP300001COD & "'"
		XDTA300.Execute SQL
		XDTA300.Close 
		set XDTA300 = nothing

End Sub 
	

	'response.write SQL 
response.Redirect "X001P999.asp?CLA001=" & wP300001COD 


%>
