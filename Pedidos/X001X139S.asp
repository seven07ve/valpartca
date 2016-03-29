<%@ Language=VBScript %>
<% Response.Expires = 0 %>
<% Response.AddHeader "PRAGMA", "NO-CACHE" %>
<!--#include file="X001Z001.INC"-->
<%


	wProceso = TRIM(Request.Form("PROCESO"))


	wCLA001 = TRIM(Request.Form("CLA001"))
	wCLA002 = TRIM(Request.Form("CLA002"))
	wCLA003 = TRIM(Request.Form("VENDEDOR"))
	wCLA004 = TRIM(Request.Form("CLA003"))

	wCLA003 = Replace(wCLA003, "%20", " ")
	'response.write wCLA003
	'response.end

	wEXISTE = "N"

	strCnn	= Application("XDTA300_ConnectionString")
	
	SQL = "SELECT Z300001NUS FROM X300ZF001 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300001CCI = '" & wCLA001 & "' AND "
	SQL = SQL & " Z300001PUS = '" & wCLA002 & "' "
	'Response.Write sql
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		wC01 = trim(rstQuery.Fields(0))
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	
	IF wProceso <> "Eliminar" THEN
		
		SQL = "SELECT Z300006PUS FROM X300ZF006 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " Z300006CCI = '" & wCLA001 & "' AND "
		SQL = SQL & " Z300006PSU = '" & wCLA002 & "' AND "
		SQL = SQL & " Z300006PUS = '" & wCLA003 & "'  "		
		'Response.Write sql
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		IF NOT rstQuery.EOF THEN
			wEXISTE = "S"
		END IF
		rstQuery.Close 
		set rstQuery = nothing
	  
	  ELSE
	  
   		wEXISTE = "S"	
   		
	END IF


	

		Set XDTA300 = Server.CreateObject("ADODB.Connection")
		XDTA300.Open strCnn


		IF wProceso = "Agregar" then		
					
			SQL = "INSERT INTO X300ZF006 (" 
			SQL = SQL & " Z300006CCI, Z300006CIA, Z300006PSU, Z300006PUS ) "
			SQL = SQL & " VALUES ( "
			SQL = SQL & "'" & wCLA001 & "',"
			SQL = SQL & "'01',"
			SQL = SQL & "'" & wCLA002 & "',"		
			SQL = SQL & "'" & wCLA003 & "')"		
			
	
		end if	
		IF wProceso = "Eliminar" and wEXISTE = "S" then
			
	  		SQL = "DELETE FROM X300ZF006 " 					
			SQL = SQL & " WHERE "		
			SQL = SQL & " Z300006CCI ='" & wCLA001 & "' AND "
			SQL = SQL & " Z300006PSU ='" & wCLA002 & "' AND "
			SQL = SQL & " Z300006PUS ='" & wCLA004 & "' "
			
		END IF
		'response.write SQL
		'response.end
		XDTA300.Execute SQL
		XDTA300.Close 
		set XDTA300 = nothing
		'response.write SQL
		
		
			
		wURL = "X001X137_S.ASP"	  	
		wURL = wURL & "?CLA001=" & wCLA001
		wURL = wURL & "&CLA002=" & wCLA002
		wURL = wURL & "&CLA003=" & Replace(wC01, " ", "%20")
		wURL = wURL & "&NOMTAB=X300ZF006" 
		Response.Redirect wURL



%>