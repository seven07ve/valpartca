<%

Response.Expires = -1
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"

%>

<!--#include file="X001Z001.INC"-->

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
wEML = TRIM(Request.Form("EML"))
wEM2 = TRIM(Request.Form("EM2"))

wMVI = TRIM(Request.Form("MVI"))

wCLU = TRIM(Request.Form("CLU"))
wCVE = TRIM(Request.Form("CVE"))
wSTS = TRIM(Request.Form("STS"))
wMEX = TRIM(Request.Form("MEX"))
wMTF = TRIM(Request.Form("MTF"))
'wNIC = TRIM(Request.Form("wNIC"))
wAIV = TRIM(Request.Form("AIV"))
'wAIV = "S"
wMNC = TRIM(Request.Form("MNC"))
wMTR = TRIM(Request.Form("MTR"))
wMTR = "N"
wOBS = TRIM(Request.Form("OBS"))
wPDE = 0 'Request.Form("PDE")
wPRE = TRIM(Request.Form("PRE"))


IF wMVI = "on" THEN
	wMVI = "1"
	ELSE
	wMVI = "0"
END IF 

wFEC = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)
wPUS = Session("glUsuario")

IF wProceso = "Agregar" then
	SQL = "INSERT INTO X300ZF001 (" 
	SQL = SQL & " Z300001CCI, Z300001CIA, Z300001PUS, Z300001NUS, "
	SQL = SQL & " Z300001CUS, Z300001EML, Z300001EM2, Z300001CLU, Z300001CVE, "
	SQL = SQL & " Z300001STS, Z300001MEX, Z300001MTF, Z300001FAC, Z300001FPR, "
	SQL = SQL & " Z300001PDE, Z300001AIV, Z300001NIC, Z300001MNC, Z300001MTR, "
	SQL = SQL & " Z300001OBS, Z300001MVI, Z300001PRE )"
	SQL = SQL & " VALUES ( "
	SQL = SQL & "'" & wCCI & "',"
	SQL = SQL & "'" & wCIA & "',"
	SQL = SQL & "'" & wCL1 & "',"
	SQL = SQL & "'" & wNUS & "',"	
	SQL = SQL & "'" & wCUS & "',"
	SQL = SQL & "'" & wEML & "',"
	SQL = SQL & "'" & wEM2 & "',"
	SQL = SQL & "'" & wCLU & "',"
	SQL = SQL & "'" & wCVE & "',"		
	SQL = SQL & "'" & wSTS & "',"
	SQL = SQL & "'" & wMEX & "',"
	SQL = SQL & "'" & wMTF & "',"
	SQL = SQL & "'" & wFEC & "',"		
	SQL = SQL & "'" & wFEC & "',"
	SQL = SQL & "'" & wPDE & "',"
	SQL = SQL & "'" & wAIV & "',"
	SQL = SQL & "'" & wNIC & "',"
	SQL = SQL & "'" & wMNC & "',"
	SQL = SQL & "'" & wMTR & "',"
	SQL = SQL & "'" & wOBS & "',"
	SQL = SQL & "'" & wMVI & "',"
	SQL = SQL & "'" & wPRE & "')"

			
end if	
IF wProceso = "Actualizar" or wProceso = "Eliminar" then
	if wProceso = "Eliminar" then
  		SQL = "DELETE FROM X300ZF001  " 
	  else
		SQL = "UPDATE X300ZF001 SET " 
		SQL = SQL & " Z300001NUS = '" & wNUS & "',"
		SQL = SQL & " Z300001CUS = '" & wCUS & "',"
		SQL = SQL & " Z300001EML = '" & wEML & "',"
		SQL = SQL & " Z300001EM2 = '" & wEM2 & "',"
		SQL = SQL & " Z300001CLU = '" & wCLU & "',"
		SQL = SQL & " Z300001CVE = '" & wCVE & "',"
		SQL = SQL & " Z300001STS = '" & wSTS & "',"
		SQL = SQL & " Z300001MEX = '" & wMEX & "',"
		SQL = SQL & " Z300001MTF = '" & wMTF & "',"
		SQL = SQL & " Z300001FAC = '" & wFEC & "',"
		'SQL = SQL & " Z300001PDE = '" & wPDE & "',"
		SQL = SQL & " Z300001AIV = '" & wAIV & "',"
		SQL = SQL & " Z300001NIC = '" & wNIC & "',"
		SQL = SQL & " Z300001MNC = '" & wMNC & "',"
		SQL = SQL & " Z300001MTR = '" & wMTR & "',"
		SQL = SQL & " Z300001MVI = '" & wMVI & "',"
		SQL = SQL & " Z300001OBS = '" & wOBS & "',"
		SQL = SQL & " Z300001PRE = '" & wPRE & "' "
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

IF wMTF <> "0" Then
	wURL = "X001X114_S.asp?NOMTAB=X300ZF001" 'Session("glUrlBuscar")
  Else
	wURL = "X001X123_S.asp?CLA001=" & wCCI & "&CLA002=" &wCL1 & "&CLA003=" & replace(wNUS,"'", " ")
End If 

Response.Redirect wURL



%>