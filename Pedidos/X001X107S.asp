<%


wProceso = TRIM(Request.Form("PROCESO"))
wCCI = Session("glCiaInternet") 
wCIA = Session("glCia") 


wCL1 = ucase(TRIM(Request.Form("CL1")))
wCLA002 = TRIM(Request.QueryString("CLA002"))

if len(trim(wCLA002)) > 0 THEN
	 wCL2 = wCLA002
	else
	 wCL2 = ucase(TRIM(Request.Form("wCLA")))
end if

wPUA = TRIM(Request.Form("wDES"))
wPPR = TRIM(Request.Form("PPR"))
wBPR = TRIM(Request.Form("BPR"))
wSTS = TRIM(Request.Form("STS"))

wFEC = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)
wPUS = Session("glUsuario")

IF wProceso = "Agregar" then
	SQL = "INSERT INTO X300AF019 (" 
	SQL = SQL & " A300019CCI, A300019CIA, A300019LPR, A300019CPR, "
	SQL = SQL & " A300019PUA, A300019PPR, A300019BPR, A300019STS, "
	SQL = SQL & " A300019PUS, A300019FAC, A300019FPR )"
	SQL = SQL & " VALUES ( "
	SQL = SQL & "'" & wCCI & "',"
	SQL = SQL & "'" & wCIA & "',"	
	SQL = SQL & "'" & wCL1 & "',"	
	SQL = SQL & "'" & wCL2 & "',"
	SQL = SQL & "'" & CDBL(wPUA) & "',"
	SQL = SQL & "'" & cdbl(wPPR) & "',"
	SQL = SQL & "'" & cdbl(wBPR) & "',"	
	SQL = SQL & "'" & wSTS & "',"
	SQL = SQL & "'" & wPUS & "',"
	SQL = SQL & "'" & wFEC & "',"		
	SQL = SQL & "'" & wFEC & "')"			
end if	
IF wProceso = "Actualizar" or wProceso = "Eliminar" then
	if wProceso = "Eliminar" then
  		SQL = "DELETE FROM X300AF019  " 
	  else
		SQL = "UPDATE X300AF019 SET " 
		SQL = SQL & " A300019PUA = '" & cdbl(wPUA) & "',"
		SQL = SQL & " A300019PPR = '" & cdbl(wPPR) & "',"
		SQL = SQL & " A300019BPR = '" & cdbl(wBPR) & "',"	
		SQL = SQL & " A300019STS = '" & wSTS & "',"
		SQL = SQL & " A300019PUS = '" & wPUS & "',"	
		SQL = SQL & " A300019FAC = '" & wFEC & "' "	
	end if  	
	SQL = SQL & " WHERE "		
	SQL = SQL & " A300019CCI = '" & wCCI & "' AND "
	SQL = SQL & " A300019CIA = '" & wCIA & "' AND "
	SQL = SQL & " A300019LPR = '" & wCL1 & "' AND "
	SQL = SQL & " A300019CPR = '" & wCL2 & "' "			
END IF

'Response.Write SQL
strCnn	= Application("XDTA300_ConnectionString")
Set XDTA300 = Server.CreateObject("ADODB.Connection")
XDTA300.Open strCnn
XDTA300.Execute SQL
XDTA300.Close 
set XDTA300 = nothing

wURL = Session("glUrlBuscarDetalle")

'Response.Write wURL
Response.Redirect wURL



%>