<%


wProceso = TRIM(Request.Form("PROCESO"))

wCLA001 = TRIM(Request.QueryString("CLA001"))
wCLA002 = TRIM(Request.Form("wDES"))
if len(trim(wCLA002)) > 0 THEN
	 wCL1 = ucase(wCLA002)
	else
	 wCL1 = ucase(TRIM(Request.Form("wCLA")))
end if

wCCI = Session("glCiaInternet") 
wCIA = Session("glCia") 


wFEC = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)
wPUS = Session("glUsuario")

IF wProceso = "Agregar" then
	SQL = "INSERT INTO X300ZF006 (" 
	SQL = SQL & " Z300006CCI, Z300006CIA, Z300006PSU, Z300006PUS ) "
	SQL = SQL & " VALUES ( "
	SQL = SQL & "'" & wCCI & "',"
	SQL = SQL & "'" & wCIA & "',"
	SQL = SQL & "'" & wCLA001 & "',"
	SQL = SQL & "'" & wCL1 & "')"			
end if	
IF wProceso = "Actualizar" or wProceso = "Eliminar" then
	if wProceso = "Eliminar" then
  		SQL = "DELETE FROM X300ZF006  " 
	  else
	end if	
	SQL = SQL & " WHERE "		
	SQL = SQL & " Z300006CCI = '" & wCCI & "' AND "
	SQL = SQL & " Z300006CIA = '" & wCIA & "' AND "
	SQL = SQL & " Z300006PSU = '" & wCLA001 & "' AND "		
	SQL = SQL & " Z300006PUS = '" & wCL1 & "' "		
END IF

'Response.Write SQL
strCnn	= Application("XDTA300_ConnectionString")
Set XDTA300 = Server.CreateObject("ADODB.Connection")
XDTA300.Open strCnn
XDTA300.Execute SQL
XDTA300.Close 
set XDTA300 = nothing

wURL = Session("glUrlBuscar01")

Response.Redirect wURL
'Response.Write wURL


%>