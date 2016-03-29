<%


wProceso = TRIM(Request.Form("PROCESO"))

wCLA001 = TRIM(Request.QueryString("CLA001"))
if len(trim(wCLA001)) > 0 THEN
	 wCL1 = ucase(wCLA001)
	else
	 wCL1 = ucase(TRIM(Request.Form("wCLA")))
end if

wCCI = Session("glCiaInternet") 
wCIA = Session("glCia") 

wNUS = TRIM(Request.Form("wDES"))
wCUS = TRIM(Request.Form("CUS"))


wFEC = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)
wPUS = Session("glUsuario")

IF wProceso = "Actualizar" or wProceso = "Eliminar" then
	if wProceso = "Eliminar" then
  		'SQL = "DELETE FROM X300ZF001  " 
	  else
		SQL = "UPDATE X300ZF001 SET " 	
		SQL = SQL & " Z300001CUS = '" & wCUS & "',"	
		SQL = SQL & " Z300001FAC = '" & wFEC & "' "	
	end if	
	SQL = SQL & " WHERE "		
	SQL = SQL & " Z300001CCI = '" & wCCI & "' AND "
	SQL = SQL & " Z300001CIA = '" & wCIA & "' AND "
	SQL = SQL & " Z300001PUS = '" & wCL1 & "' "		
END IF

'Response.Write SQL
strCnn	= Application("XDTA300_ConnectionString")
Set XDTA300 = Server.CreateObject("ADODB.Connection")
XDTA300.Open strCnn
XDTA300.Execute SQL
XDTA300.Close 
set XDTA300 = nothing


wURL = "X001A001.ASP"
Response.Redirect wURL



%>