<%


wProceso = TRIM(Request.Form("PROCESO"))
Response.Write  wProceso


wCLA001 = TRIM(Request.QueryString("CLA001"))
if len(trim(wCLA001)) > 0 THEN
	 wCCL = wCLA001
	else
	 wCCL = ucase(TRIM(Request.Form("wCLA")))
end if

wCCI = Session("glCiaInternet") 
wCIA = Session("glCia") 

wZ300050TIL = trim(Request.Form("wDES"))
wZ300050DNC = trim(Request.Form("Z300050DNC"))
wZ300050DNL = trim(Request.Form("Z300050DNL"))
wZ300050FOP = trim(Request.Form("Z300050FOP"))
wZ300050FOG = trim(Request.Form("Z300050FOG"))
wZ300050STS = trim(Request.Form("Z300050STS"))	
wFEC = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)
wPUS = Session("glUsuario")


IF wProceso = "Agregar" then
	SQL = "INSERT INTO X300ZF050 (" 
	SQL = SQL & " Z300050CDN, Z300050TIL, Z300050DNC, Z300050DNL, "
	SQL = SQL & " Z300050FOP, Z300050FOG, Z300050STS, Z300050FEC, "
	SQL = SQL & " Z300050PUS ) "	
	SQL = SQL & " VALUES ( "
	SQL = SQL & "'" & wCCL & "',"		
	SQL = SQL & "'" & wZ300050TIL & "',"
	SQL = SQL & "'" & wZ300050DNC & "',"
	SQL = SQL & "'" & wZ300050DNL & "',"
	SQL = SQL & "'" & wZ300050FOP & "',"	
	SQL = SQL & "'" & wZ300050FOG & "',"	
	SQL = SQL & "'" & wZ300050STS & "',"
	SQL = SQL & "'" & wFEC & "',"
	SQL = SQL & "'" & wPUS & "')"		
end if	
IF wProceso = "Actualizar" or wProceso = "Eliminar" then
	if wProceso = "Eliminar" then
  		SQL = "DELETE FROM X300ZF050  " 
	  else
		SQL = "UPDATE X300ZF050 SET " 
		SQL = SQL & " Z300050TIL = '" & wZ300050TIL & "',"
		SQL = SQL & " Z300050DNC = '" & wZ300050DNC & "',"
		SQL = SQL & " Z300050DNL = '" & wZ300050DNL & "',"	
		SQL = SQL & " Z300050FOP = '" & wZ300050FOP & "',"
		SQL = SQL & " Z300050FOG = '" & wZ300050FOG & "',"	
		SQL = SQL & " Z300050STS = '" & wZ300050STS & "',"	
		SQL = SQL & " Z300050FEC = '" & wFEC & "', "				
		SQL = SQL & " Z300050PUS = '" & wPUS & "'"		
	END IF	
	SQL = SQL & " WHERE "			
	SQL = SQL & " Z300050CDN = '" & wCCL & "' "		
END IF

strCnn	= Application("XDTA300_ConnectionString")
Set XDTA300 = Server.CreateObject("ADODB.Connection")
XDTA300.Open strCnn
XDTA300.Execute SQL
XDTA300.Close 
set XDTA300 = nothing
'Response.Write SQL

'wURL = Session("glUrlBuscar")
'Response.Write wURL
wURL = "X010Z300FI.ASP" 
Response.Redirect wURL

%>



