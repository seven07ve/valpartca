<%@ Language=VBScript %>
<%

	Response.Expires = -1
	Response.Expiresabsolute = Now() - 1	
	Response.AddHeader "pragma","no-cache"
	Response.AddHeader "cache-control","private"
	Response.CacheControl = "no-cache"

%>


<%
	
	wCLA001 = TRIM(Request.QueryString("CLA001"))
	wCON = TRIM(Request.QueryString("CON"))
	wProceso = TRIM(Request.QueryString("PRO"))
	wLIN = TRIM(Request.Form("ddlP300706LIN"))
	wTIP = TRIM(Request.Form("ddlP300706TIP"))
	wMAR = TRIM(Request.Form("ddlP300706MAR"))
	
		
	wPUS = Session("glUsuario")	
	wFECHA = DAY(DATE) & "-" & MONTH(DATE) & "-" & YEAR(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)

	strCnn	= Application("XDTA300_ConnectionString")
	
	Set XDTA300 = Server.CreateObject("ADODB.Connection")
	XDTA300.Open strCnn
	
	IF wProceso <> "E" THEN
		wExiste = "N"	
		SQL = "SELECT P300003COD FROM X300PF003 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " P300003CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300003COD = '" & wCLA001 & "' AND "
		SQL = SQL & " P300003LIN = '" & wLIN & "' AND "
		SQL = SQL & " P300003TIP = '" & wTIP & "' AND "
		SQL = SQL & " P300003MAR = '" & wMAR & "' "
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		'RESPONSE.WRITE SQL
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wExiste = "S"
		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING	

		If wExiste = "N" THEN

			SQL = "SELECT ISNULL(MAX(CAST(P300003CON AS FLOAT)),0) AS NRO FROM X300PF003 " 
			SQL = SQL & " WHERE "
			SQL = SQL & " P300003CCI = '" & Session("glCiaInternet") & "' AND "
			SQL = SQL & " P300003COD = '" & wCLA001 & "' "
			Set rstQuery = Server.CreateObject("ADODB.Recordset")
			'RESPONSE.WRITE SQL
			rstQuery.Open sql , strCnn
			if NOT rstQuery.EOF then
				wNRO = cdbl(rstQuery.Fields("NRO"))
			end if
			rstQuery.CLOSE
			SET rstQuery = NOTHING	
		
			wNRO = wNRO + 1
			wCL1 = Right("000000" & wNRO, 8)
		
			'Response.write wCL1
			'RESPONSE.		
		
			SQL = "INSERT INTO X300PF003 (" 
			SQL = SQL & " P300003CCI, P300003COD, P300003CON, P300003LIN, P300003TIP, "
			SQL = SQL & " P300003MAR, P300003FAC, P300003FPR, P300003PUS ) " 
			SQL = SQL & " VALUES ( "
			SQL = SQL & "'" & Session("glCiaInternet") & "',"
			SQL = SQL & "'" & wCLA001 & "',"
			SQL = SQL & "'" & wCL1 & "',"
			SQL = SQL & "'" & wLIN & "',"
			SQL = SQL & "'" & wTIP & "',"
			SQL = SQL & "'" & wMAR & "',"
			SQL = SQL & "'" & wFECHA & "',"		
			SQL = SQL & "'" & wFECHA & "',"		
			SQL = SQL & "'" & Session("glUsuario") & "')"						
					
		END IF 
	END IF 	

	If wProceso = "E" THEN
			
		SQL = " DELETE FROM X300PF003 "
		SQL = SQL & " WHERE " 
		SQL = SQL & " P300003COD = '" & wCLA001 & "' AND "
		SQL = SQL & " P300003CON = '" & wCON & "'"
	
	End if 

	'RESPONSE.WRITE SQL 
	'RESPONSE.END
	XDTA300.Execute SQL
	XDTA300.Close 
	set XDTA300 = nothing

	'response.write SQL 
	response.Redirect "X001P003M1.asp?CLA001=" & wCLA001 

%>

