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
	SQL = "SELECT A300025CBN FROM X300AF025 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " A300025CCI = '" & wCCI & "' AND "
	SQL = SQL & " A300025CIA = '" & wCIA & "' AND "		
	SQL = SQL & " A300025CBN ='" &  wCL1 & "'" 	
	wExiste = "N"
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	if NOT rstQuery.EOF then
		wExiste = "S"
	end if
	rstQuery.CLOSE
	SET rstQuery = NOTHING	

	IF wExiste = "S" THEN
		Response.write "<script language=""javascript"">"
		Response.write "alert('El Codigo Indicado ya esta Registrado.');"
		Response.write "history.back();"
		Response.write "</script>"
		response.End
	END IF
END IF


wFEC = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)
wPUS = Session("glUsuario")

IF wProceso = "Agregar" then
	SQL = "INSERT INTO X300AF025 (" 
	SQL = SQL & " A300025CCI, A300025CIA, A300025CBN, A300025DEL, "
	SQL = SQL & " A300025PUS, A300025FAC )"
	SQL = SQL & " VALUES ( "
	SQL = SQL & "'" & wCCI & "',"
	SQL = SQL & "'" & wCIA & "',"	
	SQL = SQL & "'" & wCL1 & "',"
	SQL = SQL & "'" & wDEL & "',"
	SQL = SQL & "'" & wPUS & "',"
	SQL = SQL & "'" & wFEC & "')"		
end if	
IF wProceso = "Actualizar" OR wProceso = "Eliminar" then
	IF wProceso = "Actualizar" THEN
		SQL = "UPDATE X300AF025 SET " 
		SQL = SQL & " A300025DEL = '" & wDEL & "',"
		SQL = SQL & " A300025PUS = '" & wPUS & "',"	
		SQL = SQL & " A300025FAC = '" & wFEC & "' "
      ELSE
		SQL = "DELETE FROM X300AF025 " 
	END IF
	SQL = SQL & " WHERE "		
	SQL = SQL & " A300025CCI = '" & wCCI & "' AND "
	SQL = SQL & " A300025CIA = '" & wCIA & "' AND "
	SQL = SQL & " A300025CBN = '" & wCL1 & "' "
		
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