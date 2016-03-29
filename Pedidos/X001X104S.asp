<%


wProceso = TRIM(Request.Form("PROCESO"))

wCLA001 = TRIM(Request.QueryString("CLA001"))
if len(trim(wCLA001)) > 0 THEN
	 wCL1 = wCLA001
	else
	 wCL1 = ucase(TRIM(Request.Form("wCLA")))
end if

wDEL = TRIM(Request.Form("wDES"))
wDEC = TRIM(Request.Form("DEC"))
wSTS = TRIM(Request.Form("STS"))

wFEC = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)
wPUS = Session("glUsuario")

IF wProceso = "Agregar" then
	SQL = "INSERT INTO X300ZF002 (" 
	SQL = SQL & " Z300002CCI, Z300002DEC, Z300002DEL, Z300002STS, "
	SQL = SQL & " Z300002PUS, Z300002FAC, Z300002FPR )"
	SQL = SQL & " VALUES ( "
	SQL = SQL & "'" & wCL1 & "',"
	SQL = SQL & "'" & wDEC & "',"	
	SQL = SQL & "'" & wDEL & "',"
	SQL = SQL & "'" & wSTS & "',"
	SQL = SQL & "'" & wPUS & "',"
	SQL = SQL & "'" & wFEC & "',"		
	SQL = SQL & "'" & wFEC & "')"			
end if	
IF wProceso = "Actualizar" or wProceso = "Eliminar" then
	if wProceso = "Eliminar" then
  		SQL = "DELETE FROM X300ZF002  " 
	  else
		SQL = "UPDATE X300ZF002 SET " 
		SQL = SQL & " Z300002DEL = '" & wDEL & "',"
		SQL = SQL & " Z300002DEC = '" & wDEC & "',"
		SQL = SQL & " Z300002STS = '" & wSTS & "',"
		SQL = SQL & " Z300002PUS = '" & wPUS & "',"	
		SQL = SQL & " Z300002FAC = '" & wFEC & "' "	
	end if	
	SQL = SQL & " WHERE "		
	SQL = SQL & " Z300002CCI = '" & wCL1 & "' "
END IF

'Response.Write SQL
strCnn	= Application("XDTA300_ConnectionString")
Set XDTA300 = Server.CreateObject("ADODB.Connection")
XDTA300.Open strCnn
XDTA300.Execute SQL
XDTA300.Close 
set XDTA300 = nothing

wURL = Session("glUrlBuscar")

Response.Redirect wURL



%>
<html></html>