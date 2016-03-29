<%


wProceso = TRIM(Request.Form("PROCESO"))


wCCI = Session("glCiaInternet") 
wCIA = Session("glCia") 

wSTS = TRIM(Request.Form("STS"))

wFAC = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)
wPUS = Session("glUsuario")


	SQL = "UPDATE X300ZF002 SET " 
	SQL = SQL & " Z300002PUS = '" & wPUS & "',"
	SQL = SQL & " Z300002STS = '" & wSTS & "',"
	SQL = SQL & " Z300002FAC = '" & wFAC & "' "	
	SQL = SQL & " WHERE "		
	SQL = SQL & " Z300002CCI = '" & wCCI & "' "


'Response.Write SQL
strCnn	= Application("XDTA300_ConnectionString")
Set XDTA300 = Server.CreateObject("ADODB.Connection")
XDTA300.Open strCnn
XDTA300.Execute SQL
XDTA300.Close 
set XDTA300 = nothing

wURL = "X001X002.ASP"

Response.Redirect wURL



%>