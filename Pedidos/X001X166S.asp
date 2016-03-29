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
wNCB = TRIM(Request.Form("NCB"))

strCnn	= Application("XDTA300_ConnectionString")

IF wProceso = "Agregar" then
	'SQL = "SELECT P300702CON FROM X300PF702 " 
	'SQL = SQL & " WHERE "
	'SQL = SQL & " P300702CCI = '" & wCCI & "' AND "
	'SQL = SQL & " P300702CON ='" &  wCL1 & "'" 	
	'wExiste = "N"
	'Set rstQuery = Server.CreateObject("ADODB.Recordset")
	'rstQuery.Open sql , strCnn
	'if NOT rstQuery.EOF then
	'	wExiste = "S"
	'end if
	'rstQuery.CLOSE
	'SET rstQuery = NOTHING	
	
	SQL = "SELECT ISNULL(MAX(CAST(P300702CON AS FLOAT)),0) AS NRO FROM X300PF702 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " P300702CCI = '" & Session("glCiaInternet") & "' "
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
	SQL = "INSERT INTO X300PF702 (" 
	SQL = SQL & " P300702CCI, P300702CON, P300702DES, "
	SQL = SQL & " P300702PUS, P300702FAC, P300702FPR )"
	SQL = SQL & " VALUES ( "
	SQL = SQL & "'" & wCCI & "',"
	SQL = SQL & "'" & wCL1 & "',"
	SQL = SQL & "'" & wDEL & "',"
	SQL = SQL & "'" & wPUS & "',"
	SQL = SQL & "'" & wFEC & "',"		
	SQL = SQL & "'" & wFEC & "')"			
end if	
IF wProceso = "Actualizar" OR wProceso = "Eliminar" then
	IF wProceso = "Actualizar" THEN
		SQL = "UPDATE X300PF702 SET " 
		SQL = SQL & " P300702DES = '" & wDEL & "',"
		SQL = SQL & " P300702PUS = '" & wPUS & "',"	
		SQL = SQL & " P300702FAC = '" & wFEC & "' "
      ELSE
		SQL = "DELETE FROM X300PF702 " 
	END IF
	SQL = SQL & " WHERE "		
	SQL = SQL & " P300702CCI = '" & wCCI & "' AND "
	SQL = SQL & " P300702CON = '" & wCL1 & "' "
		
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