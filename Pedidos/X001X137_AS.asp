<%@ Language=VBScript %>
<% Response.Expires = 0 %>
<% Response.AddHeader "PRAGMA", "NO-CACHE" %>
<!--#include file="X001Z001.INC"-->
<%


	wProceso = TRIM(Request.Form("PROCESO"))


	wCLA001 = TRIM(Request.Form("CLA001"))
	wCLA002 = TRIM(Request.Form("CLA002"))
	wCLA003 = TRIM(Request.Form("FAMILIA"))
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
		
		SQL = "SELECT B300123FAM FROM X300BF123 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " B300123CCI = '" & wCLA001 & "' AND "
		SQL = SQL & " B300123CCL = '" & wCLA002 & "' AND "
		SQL = SQL & " B300123FAM = '" & wCLA003 & "'  "		
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
					
			SQL = "INSERT INTO X300BF123 (" 
			SQL = SQL & " B300123CCI, B300123CCL, B300123FAM ) "
			SQL = SQL & " VALUES ( "
			SQL = SQL & "'" & wCLA001 & "',"
			SQL = SQL & "'" & wCLA002 & "',"		
			SQL = SQL & "'" & wCLA003 & "')"		
			
			wURL = "X001BF123_S.ASP"		
	
		end if	
		IF wProceso = "Eliminar" and wEXISTE = "S" then
			
	  		SQL = "DELETE FROM X300BF123 " 					
			SQL = SQL & " WHERE "		
			SQL = SQL & " B300123CCI ='" & wCLA001 & "' AND "
			SQL = SQL & " B300123CCL ='" & wCLA002 & "' AND "
			SQL = SQL & " B300123FAM ='" & wCLA004 & "' "
			
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
		Response.Redirect wURL



%>