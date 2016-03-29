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

wLIN = TRIM(Request.Form("LIN"))
wTIP = TRIM(Request.Form("TIP"))
wMAR = TRIM(Request.Form("MAR"))

strCnn	= Application("XDTA300_ConnectionString")

IF wProceso = "Agregar" then
	
	SQL = "SELECT ISNULL(MAX(CAST(P300706CON AS FLOAT)),0) AS NRO FROM X300PF706 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " P300706CCI = '" & Session("glCiaInternet") & "' "
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
	SQL = "INSERT INTO X300PF706 (" 
	SQL = SQL & " P300706CCI, P300706CON, P300706LIN, P300706TIP, "
	SQL = SQL & " P300706MAR, P300706PUS, P300706FAC, P300706FPR ) "
	SQL = SQL & " VALUES ( "
	SQL = SQL & "'" & wCCI & "',"
	SQL = SQL & "'" & wCL1 & "',"
	SQL = SQL & "'" & wLIN & "',"
	SQL = SQL & "'" & wTIP & "',"
	SQL = SQL & "'" & wMAR & "',"
	SQL = SQL & "'" & wPUS & "',"
	SQL = SQL & "'" & wFEC & "',"		
	SQL = SQL & "'" & wFEC & "')"			
end if	
IF wProceso = "Actualizar" OR wProceso = "Eliminar" then
	IF wProceso = "Actualizar" THEN
		SQL = "UPDATE X300PF706 SET " 
		SQL = SQL & " P300706LIN = '" & wLIN & "',"
		SQL = SQL & " P300706TIP = '" & wTIP & "',"
		SQL = SQL & " P300706MAR = '" & wMAR & "',"	
		SQL = SQL & " P300706PUS = '" & wPUS & "',"	
		SQL = SQL & " P300706FAC = '" & wFEC & "' "
      ELSE
		SQL = "DELETE FROM X300PF706 " 
	END IF
	SQL = SQL & " WHERE "		
	SQL = SQL & " P300706CCI = '" & wCCI & "' AND "
	SQL = SQL & " P300706CON = '" & wCL1 & "' "
		
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