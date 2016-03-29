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
	wP300001CLI = TRIM(Request.Form("txP300001CLI"))
	wP300001NOM = TRIM(Request.Form("txP300001NOM"))
	wP300001APE = TRIM(Request.Form("txP300001APE"))
	wP300001NIT = TRIM(Request.Form("txP300001NIT"))
	wP300001PRO = TRIM(Request.Form("txP300001PRO"))
	wP300001FNA = TRIM(Request.Form("txP300001FNA"))
	wP300001EDA = TRIM(Request.Form("txP300001EDA"))
	wP300001NOC = TRIM(Request.Form("txP300001NOC"))
	wP300001CEL = TRIM(Request.Form("txP300001CEL"))
	wP300001TEL = TRIM(Request.Form("txP300001TEL"))
	wP300001EMA = TRIM(Request.Form("txP300001EMA"))
	wP300001CIU = TRIM(Request.Form("ddlP300001CIU"))
	
	wP300001EMP = TRIM(Request.Form("txP300001EMP"))
	wP300001NEM = TRIM(Request.Form("txP300001NEM"))
	wP300001TEM = TRIM(Request.Form("txP300001TEM"))
	wP300001DEM = TRIM(Request.Form("txP300001DEM"))
	wPAR = TRIM(Request.Form("txPAR"))
	wP300001SEC = TRIM(Request.Form("ddlP300001SEC"))
	
	wPUS = Session("glUsuario")	
	wFECHA = DAY(DATE) & "-" & MONTH(DATE) & "-" & YEAR(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)

	strCnn	= Application("XDTA300_ConnectionString")
	
	Set XDTA300 = Server.CreateObject("ADODB.Connection")
	XDTA300.Open strCnn
	
	wExiste = "N"	
	SQL = "SELECT P300001COD FROM X300PF001 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " P300001CCI = '" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " P300001NIT = '" & wP300001NIT & "' "
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	'RESPONSE.WRITE SQL
	rstQuery.Open sql , strCnn
	if NOT rstQuery.EOF then
		wExiste = "S"
		wCOD = trim(rstQuery.Fields("P300001COD"))
	end if
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	IF wExiste = "S" AND wP300001COD <> wCOD THEN
		Response.write "<script language=""javascript"">"
		Response.write "alert('NIT / RIF ya se encuentra registrado.');"
		Response.write "history.back();"
		Response.write "</script>"
		'Response.write SQL 
		Response.end
	END IF 

	
	If wP300001COD = "Nuevo" THEN

		SQL = "SELECT MAX(CAST(P300001COD AS FLOAT)) AS NRO FROM X300PF001 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " P300001CCI = '" & Session("glCiaInternet") & "' "
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
		
		
		SQL = "INSERT INTO X300PF001 (" 
		SQL = SQL & " P300001CCI, P300001COD, P300001CLI, P300001NOM, P300001APE, "
		SQL = SQL & " P300001NIT, P300001PRO, P300001FNA, P300001EDA, P300001NOC, "
		SQL = SQL & " P300001CEL, P300001TEL, P300001EMA, P300001CIU, P300001FAC, "
		SQL = SQL & " P300001FPR, P300001PUS, P300001CVE, P300001EMP, P300001NEM, "
		SQL = SQL & " P300001TEM, P300001DEM, P300001SEC) " 
		SQL = SQL & " VALUES ( "
		SQL = SQL & "'" & Session("glCiaInternet") & "',"
		SQL = SQL & "'" & wCL1 & "',"
		SQL = SQL & "'" & wP300001CLI & "',"
		SQL = SQL & "'" & wP300001NOM & "',"
		SQL = SQL & "'" & wP300001APE & "',"
		SQL = SQL & "'" & wP300001NIT & "',"		
		SQL = SQL & "'" & wP300001PRO & "',"		
		SQL = SQL & "'" & wP300001FNA & "',"		
		SQL = SQL & "'" & wP300001EDA & "',"		
		SQL = SQL & "'" & wP300001NOC & "',"		
		SQL = SQL & "'" & wP300001CEL & "',"		
		SQL = SQL & "'" & wP300001TEL & "',"
		SQL = SQL & "'" & wP300001EMA & "',"	
		SQL = SQL & "'" & wP300001CIU & "',"					
		SQL = SQL & "'" & wFECHA & "',"		
		SQL = SQL & "'" & wFECHA & "',"		
		SQL = SQL & "'" & Session("glUsuario") & "',"		
		SQL = SQL & "'" & Session("glCodVendedor") & "',"	
		SQL = SQL & "'" & wP300001EMP & "',"
		SQL = SQL & "'" & wP300001NEM & "',"
		SQL = SQL & "'" & wP300001TEM & "',"
		SQL = SQL & "'" & wP300001DEM & "',"
		SQL = SQL & "'" & wP300001SEC & "')"														
						
		wP300001COD = wCL1 

		
	  ELSE
		
		SQL = "UPDATE X300PF001 SET " 
		SQL = SQL & " P300001CLI = '" & wP300001CLI & "', "
		SQL = SQL & " P300001NOM = '" & wP300001NOM & "', "
		SQL = SQL & " P300001APE = '" & wP300001APE & "', "
		SQL = SQL & " P300001NIT = '" & wP300001NIT & "', "
		SQL = SQL & " P300001PRO = '" & wP300001PRO & "', "		
		SQL = SQL & " P300001FNA = '" & wP300001FNA & "', "
		SQL = SQL & " P300001EDA = '" & wP300001EDA & "', "			
		SQL = SQL & " P300001NOC = '" & wP300001NOC & "', "			
		SQL = SQL & " P300001CEL = '" & wP300001CEL & "', "			
		SQL = SQL & " P300001TEL = '" & wP300001TEL & "', "			
		SQL = SQL & " P300001EMA = '" & wP300001EMA & "', "			
		SQL = SQL & " P300001CIU = '" & wP300001CIU & "', "		
		SQL = SQL & " P300001EMP = '" & wP300001EMP & "', "
		SQL = SQL & " P300001NEM = '" & wP300001NEM & "', "
		SQL = SQL & " P300001TEM = '" & wP300001TEM & "', "
		SQL = SQL & " P300001DEM = '" & wP300001DEM & "', "
		SQL = SQL & " P300001SEC = '" & wP300001SEC & "', "											
		SQL = SQL & " P300001FAC = getdate(), "			
		SQL = SQL & " P300001PUS = '" & Session("glUsuario") & "' "			
		SQL = SQL & " WHERE "		
		SQL = SQL & " P300001CCI ='" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300001COD ='" & wP300001COD & "'"

				
	END IF 
	
	XDTA300.Execute SQL
	XDTA300.Close 
	set XDTA300 = nothing

	'response.write SQL 
	response.Redirect "X001P002.asp?CLA001=" & wP300001COD & "&PAR=" & wPAR

%>

