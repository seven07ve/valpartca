<%


wProceso = TRIM(Request.Form("PROCESO"))


wCCI = Session("glCiaInternet") 
wCIA = Session("glCia") 

wTDO = TRIM(Request.Form("TDO"))
wTDO = Replace(wTDO, "'", "''")
wFEC = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)
wPUS = Session("glUsuario")

SQL = "UPDATE X300ZF002 SET " 
SQL = SQL & " Z300002TDO = '" & wTDO & "',"
SQL = SQL & " Z300002PU2 = '" & wPUS & "',"
SQL = SQL & " Z300002FA2 = '" & wFEC & "' "	
SQL = SQL & " WHERE "		
SQL = SQL & " Z300002CCI = '" & wCCI & "' "
	

'Response.Write SQL
strCnn	= Application("XDTA300_ConnectionString")
Set XDTA300 = Server.CreateObject("ADODB.Connection")
XDTA300.Open strCnn
XDTA300.Execute SQL
XDTA300.Close 
set XDTA300 = nothing

'wURL = Session("glUrlBuscar")
wURL = "X001X002.ASP"
Response.write "<script language=""javascript"">"
Response.write "alert('Información Actualizada.');"
Response.write "window.open('" & wURL & "','main');"
Response.write "</script>"

%>