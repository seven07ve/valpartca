<%


wProceso = TRIM(Request.Form("PROCESO"))

wCLA001 = TRIM(Request.QueryString("CLA001"))
if len(trim(wCLA001)) > 0 THEN
	 wCCL = wCLA001
	else
	 wCCL = ucase(TRIM(Request.Form("wCLA")))
end if

wCCI = Session("glCiaInternet") 
wCIA = Session("glCia") 
wRSO = TRIM(Request.Form("wDES"))
wRIF = TRIM(Request.Form("A300002RIF"))
wNIT = TRIM(Request.Form("A300002NIT"))
wNT1 = TRIM(Request.Form("A300002NT1"))
wNRL = TRIM(Request.Form("A300002NRL"))
wPDE = TRIM(Request.Form("A300002PDE"))
wSTS = TRIM(Request.Form("A300002STS"))

wFEC = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)
wPUS = Session("glUsuario")


IF wProceso = "Agregar" then
	SQL = "INSERT INTO X300AF002 (" 
	SQL = SQL & " A300002CCI, A300002CIA, A300002CCL, A300002RSO, "
	SQL = SQL & " A300002RIF, A300002NIT, A300002NT1, A300002NRL, "
	SQL = SQL & " A300002PDE, A300002STS, "
	SQL = SQL & " A300002PUS, A300002FAC, A300002FPR  )"
	SQL = SQL & " VALUES ( "
	SQL = SQL & "'" & wCCI & "',"
	SQL = SQL & "'" & wCIA & "',"	
	SQL = SQL & "'" & wCCL & "',"
	SQL = SQL & "'" & wRSO & "',"
	SQL = SQL & "'" & wRIF & "',"
	SQL = SQL & "'" & wNIT & "',"	
	SQL = SQL & "'" & wNT1 & "',"
	SQL = SQL & "'" & wNRL & "',"
	SQL = SQL & "'" & wPDE & "',"	
	SQL = SQL & "'" & wSTS & "',"
	SQL = SQL & "'" & wPUS & "',"	
	SQL = SQL & "'" & wFEC & "',"	
	SQL = SQL & "'" & wFEC & "')"		
end if	
IF wProceso = "Actualizar" or wProceso = "Eliminar" then
	if wProceso = "Eliminar" then
  		SQL = "DELETE FROM X300AF002  " 
	  else
		SQL = "UPDATE X300AF002 SET " 
		SQL = SQL & " A300002RSO = '" & wRSO & "',"
		SQL = SQL & " A300002RIF = '" & wRIF & "',"
		SQL = SQL & " A300002NIT = '" & wNIT & "',"	
		SQL = SQL & " A300002NT1 = '" & wNT1 & "',"
		SQL = SQL & " A300002NRL = '" & wNRL & "',"	
		SQL = SQL & " A300002PDE = '" & wPDE & "',"	
		SQL = SQL & " A300002STS = '" & wSTS & "',"
		SQL = SQL & " A300002PUS = '" & wPUS & "',"
		SQL = SQL & " A300002FAC = '" & wFEC & "' "
	END IF	
	SQL = SQL & " WHERE "		
	SQL = SQL & " A300002CCI = '" & wCCI & "' AND "
	SQL = SQL & " A300002CIA = '" & wCIA & "' AND "
	SQL = SQL & " A300002CCL = '" & wCCL & "' "		
END IF

strCnn	= Application("XDTA300_ConnectionString")
Set XDTA300 = Server.CreateObject("ADODB.Connection")
XDTA300.Open strCnn
XDTA300.Execute SQL
XDTA300.Close 
set XDTA300 = nothing

wURL = Session("glUrlBuscar")

Response.Redirect wURL



%>