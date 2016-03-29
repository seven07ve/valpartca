<%


	wProceso = TRIM(Request.Form("PROCESO"))


	wCLA001 = TRIM(Request.Form("CLA001"))
	wCLA002 = TRIM(Request.Form("CLA002"))
	wCLA003 = TRIM(Request.Form("CLA003"))
	
	'RESPONSE.WRITE wCLA002
	'RESPONSE.END
	
	wSTSPED = TRIM(Request.Form("STSPED"))
	
	wCPR = TRIM(Request.Form("CPR"))
	wLOT = TRIM(Request.Form("LOT"))
	wCAN = TRIM(Request.Form("CAN"))
	wTUS = TRIM(Request.Form("TUS"))
	
	wCGR = TRIM(Request.Form("CGR"))	
	wCOG = TRIM(Request.Form("COG"))	
	wOBS = TRIM(Request.Form("OBS"))
	
	IF ISNULL(wE300002NFA) OR TRIM(wE300002NFA) = "" THEN
		wE300002NFA = "0"
	END IF 
	
	wOBS = Replace(wOBS, "'", "")
	wCAN = Replace(wCAN, "'", "")
	wLOT = Replace(wLOT, "'", "")
	wTUS = Replace(wTUS, "'", "")
	
	wCCI = Session("glCiaInternet") 
	wCIA = Session("glCia") 

	wPUS = Session("glUsuario")	
	wFECHA = DAY(DATE) & "-" & MONTH(DATE) & "-" & YEAR(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)

		

	
	
	strCnn	= Application("XDTA300_ConnectionString")

	
	wEXISTE = "S"	
	

	IF wEXISTE = "S" THEN

		Set XDTA300 = Server.CreateObject("ADODB.Connection")
		XDTA300.Open strCnn


		IF wProceso = "Agregar" then
			
			 SQL = "SELECT MAX(ISNULL(E300002NFA,0)) AS NFA "
			 SQL = SQL & " FROM X300EF002 " 
			 SQL = SQL & " WHERE "
			 SQL = SQL & " E300002CCI ='" & wCCI & "' AND "
			 SQL = SQL & " E300002CIA ='" & wCIA & "' AND "
	 		 SQL = SQL & " E300002COD ='" & wCLA002 & "'"
		 	 Set rstQuery = Server.CreateObject("ADODB.Recordset")
			 rstQuery.Open sql , strCnn
			 if NOT rstQuery.EOF then
				wNRO = rstQuery.Fields("NFA")
				IF ISNULL(wNRO) THEN
					wNRO = 0
				END IF 
				wNRO = cdbl(wNRO) + 1
	         end if
			 rstQuery.CLOSE
		 	 SET rstQuery = NOTHING	
		
		
	
             SQL = " INSERT INTO X300EF002 ( "
             SQL = SQL & " E300002CCI, E300002CIA, E300002COD, E300002NFA, "
             SQL = SQL & " E300002CPR, E300002CAN, E300002OBS, E300002FPR, "
             SQL = SQL & " E300002CGR, E300002COG, E300002DEL, E300002LOT ) "
             SQL = SQL & " VALUES ( "
             SQL = SQL & "'" & Session("glCiaInternet") & "',"
             SQL = SQL & "'" & Session("glCia")  & "',"
             SQL = SQL & "'" & wCLA002 & "',"
             SQL = SQL & "'" & wNRO & "',"
             SQL = SQL & "'" & wCPR & "',"
             SQL = SQL & "'" & wCAN & "',"
             SQL = SQL & "'" & wOBS & "',"
             SQL = SQL & "getdate(),"	
             SQL = SQL & "'" & wCGR & "',"	
	         SQL = SQL & "'" & wCOG & "',"
         	 SQL = SQL & "'" & wTUS & "',"
			 SQL = SQL & "'" & wLOT & "')"
			 wURL = "X001A116_S.ASP"		
	
		end if	
		IF wProceso = "Actualizar" or wProceso = "Eliminar" then
			if wProceso = "Eliminar" then
	  			SQL = "DELETE FROM X300EF002  " 
				
			else			
				SQL = "UPDATE X300EF002 SET " 
				SQL = SQL & " E300002OBS = '" & wOBS & "', "
				SQL = SQL & " E300002FAC = '" & wFECHA & "' "			
		
			end if	
			SQL = SQL & " WHERE "		
			SQL = SQL & " E300002CCI ='" & wCCI & "' AND "
			SQL = SQL & " E300002CIA ='" & wCIA & "' AND "
			SQL = SQL & " E300002NFA ='" & wCLA003 & "' AND "
			SQL = SQL & " E300002COD ='" & wCLA002 & "' "
		END IF
	
		XDTA300.Execute SQL
		XDTA300.Close 
		set XDTA300 = nothing
		
		
			
		wURL = "X001A115_S.ASP"	  	
		wURL = wURL & "?CLA001=" & wCLA001
		wURL = wURL & "&CLA002=" & wCLA002
		wURL = wURL & "&STSPED=" & wSTSPED
   
		
	
	END IF
'RESPONSE.WRITE wURL
    Response.Redirect wURL



%>