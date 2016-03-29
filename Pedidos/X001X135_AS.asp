<%


	wProceso = TRIM(Request.Form("PROCESO"))


	wCLA001 = TRIM(Request.Form("CLA001"))
	wCLA002 = TRIM(Request.Form("CLA002"))
	wCLA003 = TRIM(Request.Form("FAMILIA"))
	wCLA004 = TRIM(Request.Form("CLA003"))


	wEXISTE = "N"

	strCnn	= Application("XDTA300_ConnectionString")

	IF wProceso <> "Eliminar" THEN
		
		SQL = "SELECT B300126CPC FROM X300BF126 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " B300126CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " B300126NLP = '" & wCLA001 & "' AND "
		SQL = SQL & " B300126CPC = '" & wCLA003 & "'  "		
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
					
			SQL = "INSERT INTO X300BF126 (" 
			SQL = SQL & " B300126CCI, B300126NLP, B300126CPC ) "
			SQL = SQL & " VALUES ( "
			SQL = SQL & "'" & Session("glCiaInternet") & "',"
			SQL = SQL & "'" & wCLA001 & "',"		
			SQL = SQL & "'" & wCLA003 & "')"		
			
			wURL = "X001BF135_S.ASP"		
	
		end if	
		IF wProceso = "Actualizar" or wProceso = "Eliminar" and wEXISTE = "S" then
			if wProceso = "Eliminar" then

	  			SQL = "DELETE FROM X300BF126 " 
				
	  			
			else			
				SQL = "UPDATE X300BF126 SET " 
				SQL = SQL & " B300126CPC = '" & wCLA003 & "' "			
		
			end if	
			SQL = SQL & " WHERE "		
			SQL = SQL & " B300126CCI ='" & Session("glCiaInternet") & "' AND "
			SQL = SQL & " B300126NLP ='" & wCLA001 & "' AND "
			SQL = SQL & " B300126CPC ='" & wCLA004 & "' "
			
		END IF
		'response.write SQL
		XDTA300.Execute SQL
		XDTA300.Close 
		set XDTA300 = nothing
		
		
		
			
		wURL = "X001X135_S.ASP"	  	
		wURL = wURL & "?CLA001=" & wCLA001
		wURL = wURL & "&CLA002=" & wCLA002
		

    	Response.Redirect wURL



%>