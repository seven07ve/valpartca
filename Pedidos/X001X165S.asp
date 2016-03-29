<%


wProceso = TRIM(Request.Form("PROCESO"))
wCCI = Session("glCiaInternet") 
wCIA = Session("glCia") 


wCLA001 = TRIM(Request.QueryString("CLA001"))
if len(trim(wCLA001)) > 0 THEN
	 wCL1 = wCLA001
	else
	 wCL1 = ucase(TRIM(Request.Form("wCLA")))
end if

wDEL = TRIM(Request.Form("wDES"))
wTIP = TRIM(Request.Form("TIP"))

strCnn	= Application("XDTA300_ConnectionString")

IF wProceso = "Agregar" then
	'SQL = "SELECT P300700CON FROM X300PF700 " 
	'SQL = SQL & " WHERE "
	'SQL = SQL & " P300700CCI = '" & wCCI & "' AND "
	'SQL = SQL & " P300700CON ='" &  wCL1 & "'" 	
	'wExiste = "N"
	'Set rstQuery = Server.CreateObject("ADODB.Recordset")
	'rstQuery.Open sql , strCnn
	'if NOT rstQuery.EOF then
	'	wExiste = "S"
	'end if
	'rstQuery.CLOSE
	'SET rstQuery = NOTHING	
	
	SQL = "SELECT ISNULL(ISNULL(MAX(CAST(P300700CON AS FLOAT)),0),0) AS NRO FROM X300PF700 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " P300700CCI = '" & Session("glCiaInternet") & "' "
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	'RESPONSE.WRITE SQL
	rstQuery.Open sql , strCnn
	if NOT rstQuery.EOF then
		wNRO = cdbl(rstQuery.Fields("NRO"))
	end if
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	wNRO = wNRO + 1
	wCL1 = Right("000" & wNRO, 8)

	IF wExiste = "S" THEN
		Response.write "<script language=""javascript"">"
		Response.write "alert('El Codigo Indicado ya esta Registrado.');"
		Response.write "history.back();"
		Response.write "</script>"
		response.End
	END IF
END IF


wFEC = DAY(DATE) & "-" & MONTH(DATE) & "-" & YEAR(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)
wPUS = Session("glUsuario")

IF wProceso = "Agregar" then
	SQL = "INSERT INTO X300PF700 (" 
	SQL = SQL & " P300700CCI, P300700CON, P300700TIP, P300700DES, "
	SQL = SQL & " P300700PUS, P300700FAC, P300700FPR ) "
	SQL = SQL & " VALUES ( "
	SQL = SQL & "'" & wCCI & "',"
	SQL = SQL & "'" & wCL1 & "',"
	SQL = SQL & "'" & wTIP & "',"
	SQL = SQL & "'" & wDEL & "',"
	SQL = SQL & "'" & wPUS & "',"
	SQL = SQL & "'" & wFEC & "',"		
	SQL = SQL & "'" & wFEC & "')"			
end if	
IF wProceso = "Actualizar" OR wProceso = "Eliminar" then
	IF wProceso = "Actualizar" THEN
		SQL = "UPDATE X300PF700 SET " 
		SQL = SQL & " P300700DES = '" & wDEL & "',"
		SQL = SQL & " P300700TIP = '" & wTIP & "',"
		SQL = SQL & " P300700PUS = '" & wPUS & "',"	
		SQL = SQL & " P300700FAC = '" & wFEC & "' "
      ELSE
		SQL = "DELETE FROM X300PF700 " 
	END IF
	SQL = SQL & " WHERE "		
	SQL = SQL & " P300700CCI = '" & wCCI & "' AND "
	SQL = SQL & " P300700CON = '" & wCL1 & "' "
		
END IF

'Response.Write SQL
Set XDTA300 = Server.CreateObject("ADODB.Connection")
XDTA300.Open strCnn
XDTA300.Execute SQL
XDTA300.Close 
set XDTA300 = nothing

wURL = Session("glUrlBuscar")

Response.Redirect wURL



%>