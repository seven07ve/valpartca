<%


wProceso = TRIM(Request.Form("PROCESO"))

wCLA001 = TRIM(Request.QueryString("CLA001"))
if len(trim(wCLA001)) > 0 THEN
	 wCPR = wCLA001
	else
	 wCPR = ucase(TRIM(Request.Form("wCLA")))
end if

wCCI = Session("glCiaInternet") 
wCIA = Session("glCia") 

wDEL = TRIM(Request.Form("wDES"))
wKPC = TRIM(Request.Form("KPC"))
wPIM = TRIM(Request.Form("PIM"))
wUME = TRIM(Request.Form("UME"))
wUCA = TRIM(Request.Form("UCA"))
wSTS = TRIM(Request.Form("STS"))


wFEC = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)
wPUS = Session("glUsuario")

IF wProceso = "Agregar" then
	SQL = "INSERT INTO X300AF003 (" 
	SQL = SQL & " A300003CCI, A300003CIA, A300003CPR, A300003DEL, "
	SQL = SQL & " A300003KPC, A300003PIM, A300003UME, A300003UCA, "
	SQL = SQL & " A300003STS, A300003PUS, A300003FAC, A300003FPR )"
	SQL = SQL & " VALUES ( "
	SQL = SQL & "'" & wCCI & "',"
	SQL = SQL & "'" & wCIA & "',"	
	SQL = SQL & "'" & wCPR & "',"
	SQL = SQL & "'" & wDEL & "',"
	SQL = SQL & "'" & cdbl(wKPC) & "',"
	SQL = SQL & "'" & cdbl(wPIM) & "',"	
	SQL = SQL & "'" & wUME & "',"
	SQL = SQL & "'" & cdbl(wUCA) & "',"	
	SQL = SQL & "'" & wSTS & "',"
	SQL = SQL & "'" & wPUS & "',"
	SQL = SQL & "'" & wFEC & "',"		
	SQL = SQL & "'" & wFEC & "')"			
end if	
IF wProceso = "Actualizar" or wProceso = "Eliminar" then
	if wProceso = "Eliminar" then
  		SQL = "DELETE FROM X300AF003  " 
	  else
		SQL = "UPDATE X300AF003 SET " 
		SQL = SQL & " A300003DEL = '" & wDEL & "',"
		SQL = SQL & " A300003KPC = '" & cdbl(wKPC) & "',"
		SQL = SQL & " A300003PIM = '" & cdbl(wPIM) & "',"	
		SQL = SQL & " A300003UCA = '" & cdbl(wUCA) & "',"	
		SQL = SQL & " A300003UME = '" & wUME & "',"
		SQL = SQL & " A300003STS = '" & wSTS & "',"
		SQL = SQL & " A300003PUS = '" & wPUS & "',"	
		SQL = SQL & " A300003FAC = '" & wFEC & "' "	
	end if	
	SQL = SQL & " WHERE "		
	SQL = SQL & " A300003CCI = '" & wCCI & "' AND "
	SQL = SQL & " A300003CIA = '" & wCIA & "' AND "
	SQL = SQL & " A300003CPR = '" & wCPR & "' "		
		
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