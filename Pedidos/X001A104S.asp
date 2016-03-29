<%@ Language=VBScript %>
<% Response.Expires = 0 %>
<% Response.AddHeader "PRAGMA", "NO-CACHE" %>

<%


	'Preparar Etiqueta Body del Formulario

	wCLA001 = Request.QueryString("CLA001")	
	wCCI = Session("glCiaInternet") 
	wCIA = Session("glCia") 

		
	Response.Redirect "X001A105.asp?CLA001=" & wCLA001 & "&CLA002=" & wNRO 
		
    
	strCnn	= Application("XDTA300_ConnectionString")
	
	
	'Ubicar Correlativo de Pagos
	SQL = "SELECT * FROM X300ZF003 WHERE "
	SQL = SQL & " Z300003CCI = '" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " Z300003IDP = 'CO' AND "
	'IF Session("glTipoUsuario") = "C" THEN
		SQL = SQL & " Z300003CVE = '999999' AND "
		'  ELSE
		'SQL = SQL & " Z300003CVE = '888888' AND "
	'END IF
	SQL = SQL & " Z300003CIA = '" & Session("glCia") & "' "
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
	
		wNRO = cLNG(rstQuery.Fields("Z300003CAT")) + 1						
		
		If wNRO > cLNG(rstQuery.Fields("Z300003NCH")) Then
			wNRO = cLNG(rstQuery.Fields("Z300003NCD"))
		End If
				
		wCVE = trim(rstQuery.Fields("Z300003CVE"))
		
		SQL = "UPDATE X300ZF003 SET "
		SQL = SQL & " Z300003CAT = " & wNRO & " "  'Correlativo actual
		SQL = SQL & " WHERE "
		SQL = SQL & " Z300003CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " Z300003IDP = 'CO' AND "
		'IF Session("glTipoUsuario") = "C" THEN
			SQL = SQL & " Z300003CVE = '999999' AND "
	  	'  ELSE
		'	SQL = SQL & " Z300003CVE = '888888' AND "
		'END IF
		SQL = SQL & " Z300003CIA = '" & Session("glCia") & "' "
		'Response.Write SQL
		set rstQuery1 = Server.CreateObject("ADODB.Recordset")
		rstQuery1.Open sql , strCnn
		SET rstQuery1 = NOTHING
								
	  ELSE
			  
		wNRO = 1
			
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	wNRO = right(("000000" & wNRO),6)
	'Fin de ubicar correlativo de Pagos por Internet
	
	wFECHA = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)
	
	Set XDTA300 = Server.CreateObject("ADODB.Connection")
	XDTA300.Open strCnn
		
	SQL = "INSERT INTO X300CF001 (" 
	SQL = SQL & " C300001CCI, C300001CIA, C300001CCO, C300001NDC, "
	SQL = SQL & " C300001CCL, C300001MCO, C300001FPR, C300001FAC, "
	SQL = SQL & " C300001PUS, C300001STS, C300001STP, C300001OBS )"
	SQL = SQL & " VALUES ( "
	SQL = SQL & "'" & wCCI & "',"
	SQL = SQL & "'" & wCIA & "',"
	SQL = SQL & "'0',"
	SQL = SQL & "'" & wNRO & "',"
	SQL = SQL & "'" & wCLA001 & "',"
	SQL = SQL & "'0',"		
	SQL = SQL & "'" & wFECHA & "',"				
	SQL = SQL & "'" & wFECHA & "',"		
	SQL = SQL & "'" & session("glUsuario") & "',"		
	SQL = SQL & "'0',"		
	SQL = SQL & "'P',"		
	SQL = SQL & "'')"		
	XDTA300.Execute SQL
	XDTA300.Close 
	set XDTA300 = nothing
	
	%>


