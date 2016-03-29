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
IF Session("glTipoUsuario") = "V" OR Session("glTipoUsuario") = "C" OR Session("glTipoUsuario") = "" THEN 
	IF wCL1 = wCVE THEN
	   wCLU = "C"
	  ELSE
	   wCLU = "V"
	END IF    
END IF 
wCVE = TRIM(Request.Form("CVE"))
wCED = "" 'TRIM(Request.Form("CED"))
wRIF = "" 'TRIM(Request.Form("RIF"))
wNIT = "" 'TRIM(Request.Form("NIT"))
wTEL = "" 'TRIM(Request.Form("TEL"))
wPSE = "" 'TRIM(Request.Form("PSE"))
wRSE = "" 'TRIM(Request.Form("RSE"))
wSTS = "0"

wFEC = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)
wPUS = Session("glUsuario")

IF wProceso = "Agregar" then
	SQL = "INSERT INTO X300ZF001 (" 
	SQL = SQL & " Z300001CCI, Z300001CIA, Z300001PUS, Z300001NUS, "
	SQL = SQL & " Z300001CUS, Z300001EML, Z300001CLU, Z300001CVE, "
	SQL = SQL & " Z300001RIF, Z300001NIT, Z300001TEL, Z300001PSE, "
	SQL = SQL & " Z300001RSE, Z300001STS, Z300001FAC, Z300001FPR )"
	SQL = SQL & " VALUES ( "
	SQL = SQL & "'" & wCCI & "',"
	SQL = SQL & "'" & wCIA & "',"
	SQL = SQL & "'" & wCL1 & "',"
	SQL = SQL & "'" & wNUS & "',"	
	SQL = SQL & "'" & wCUS & "',"
	SQL = SQL & "'" & wEML & "',"
	SQL = SQL & "'" & wCLU & "',"
	SQL = SQL & "'" & wCVE & "',"		
	SQL = SQL & "'" & wRIF & "',"		
	SQL = SQL & "'" & wNIT & "',"		
	SQL = SQL & "'" & wTEL & "',"		
	SQL = SQL & "'" & wPSE & "',"		
	SQL = SQL & "'" & wRSE & "',"		
	SQL = SQL & "'" & wSTS & "',"	
	SQL = SQL & "'" & wFEC & "',"		
	SQL = SQL & "'" & wFEC & "')"			
end if	
IF wProceso = "Actualizar" or wProceso = "Eliminar" then
	if wProceso = "Eliminar" then
  		SQL = "DELETE FROM X300ZF001  " 
	  else
		SQL = "UPDATE X300ZF001 SET " 
		SQL = SQL & " Z300001NUS = '" & wNUS & "',"
		SQL = SQL & " Z300001CUS = '" & wCUS & "',"
		SQL = SQL & " Z300001EML = '" & wEML & "',"
		'SQL = SQL & " Z300001CED = '" & wCED & "',"				
		'SQL = SQL & " Z300001RIF = '" & wRIF & "',"				
		'SQL = SQL & " Z300001NIT = '" & wNIT & "',"				
		'SQL = SQL & " Z300001TEL = '" & wTEL & "',"				
		'SQL = SQL & " Z300001PSE = '" & wPSE & "',"				
		'SQL = SQL & " Z300001RSE = '" & wRSE & "',"				
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

'wURL = Session("glUrlBuscar")
wURL = "X001A001.ASP"
IF Session("glTipoUsuario") = "D" THEN
	'wURL = "X001X001.ASP"
END IF 
'Response.Redirect wURL

Response.write "<script language=""javascript"">"
Response.write "alert('Información Actualizada.');"
Response.write "window.open('X001X108.asp','main');"
Response.write "</script>"

%>