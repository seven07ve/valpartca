<%


wProceso = TRIM(Request.Form("PROCESO"))


wCCI = Session("glCiaInternet") 
wCIA = Session("glCia") 


wFDE = TRIM(Request.Form("FDE"))
wFDE = RIGHT(TRIM(wFDE),4) & "-" & MID(TRIM(wFDE),4,2) & "-" & LEFT(TRIM(wFDE),2) & " 00:00:00"

wFHA = TRIM(Request.Form("FHA"))
wFHA = RIGHT(TRIM(wFHA),4) & "-" & MID(TRIM(wFHA),4,2) & "-" & LEFT(TRIM(wFHA),2) & " 23:59:59" 

wFAV = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)
wPUS = Session("glUsuario")


SQL = "UPDATE X300ZF002 SET " 
SQL = SQL & " Z300002PUS = '" & wPUS & "',"
SQL = SQL & " Z300002FAV = '" & wFAV & "',"	
SQL = SQL & " Z300002FDE = '" & wFDE & "',"
SQL = SQL & " Z300002FHA = '" & wFHA & "' "	
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