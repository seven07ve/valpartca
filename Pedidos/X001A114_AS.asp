<%


	wProceso = TRIM(Request.Form("PROCESO"))


	wCLA001 = TRIM(Request.Form("CLA001"))
	wCLA002 = TRIM(Request.Form("CLA002"))
	wSTSPED = TRIM(Request.Form("STSPED"))
	
	wCTR = TRIM(Request.Form("MOT"))	
	wCGR = TRIM(Request.Form("CGR"))	
	wCOG = TRIM(Request.Form("COG"))	
	wSTS = TRIM(Request.Form("STS"))
	wOBS = TRIM(Request.Form("OBS"))
	wCRE = TRIM(Request.Form("CRE"))
	wSCO = TRIM(Request.Form("SCO"))
	wE300001NRO = TRIM(Request.Form("NRO"))
	
	IF ISNULL(wE300001NRO) OR TRIM(wE300001NRO) = "" THEN
		wE300001NRO = "0"
	END IF 
	
	wOBS = Replace(wOBS, "'", "")
	
	wCCI = Session("glCiaInternet") 
	wCIA = Session("glCia") 

	wPUS = Session("glUsuario")	
	wFECHA = DAY(DATE) & "-" & MONTH(DATE) & "-" & YEAR(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)

		
	IF Session("glTipoUsuario") = "C" THEN	
	   'wB300100CCL = Session("glUsuario")
	   'wSTS = "1"	   
	END IF 


	
	
	strCnn	= Application("XDTA300_ConnectionString")


	wEXISTE = "S"	
	

	IF wEXISTE = "S" THEN

		Set XDTA300 = Server.CreateObject("ADODB.Connection")
		XDTA300.Open strCnn


		IF wProceso = "Agregar" then		
		
			'Ubicar Correlativo de Pedido
			SQL = "SELECT Z300003CAT, Z300003NCH, Z300003NCD "
	        SQL = SQL & " FROM X300ZF003 WHERE "
			SQL = SQL & " Z300003CCI = '" & Session("glCiaInternet") & "' AND "
	        SQL = SQL & " Z300003IDP = 'RE' AND "
			SQL = SQL & " Z300003CIA = '" & Session("glCia") & "' "
			Set rstQuery = Server.CreateObject("ADODB.Recordset")
			rstQuery.Open sql , strCnn
			IF NOT rstQuery.EOF THEN
			
				wNRO = CLng(rstQuery.Fields("Z300003CAT")) + 1
	            If wNRO > CLng(rstQuery.Fields("Z300003NCH")) Then
	                wNRO = CLng(rstQuery.Fields("Z300003NCD"))
	            End If
				
				SQL = "UPDATE X300ZF003 SET "
				SQL = SQL & " Z300003CAT = " & wNRO & " "  'Correlativo actual
				SQL = SQL & " WHERE "
				SQL = SQL & " Z300003CCI = '" & Session("glCiaInternet") & "' AND "
				SQL = SQL & " Z300003IDP = 'RE' AND "
				SQL = SQL & " Z300003CIA = '" & Session("glCia") & "' "
				'Response.Write SQL
				set rstQuery1 = Server.CreateObject("ADODB.Recordset")
				rstQuery1.Open sql , strCnn
				SET rstQuery1 = NOTHING
								
			  ELSE
			  
				wNRO = 1
					
			END IF
			rstQuery.Close 
			set rstQuery = nothing
			wNRO = right(("00000000" & wNRO),8)
			wCLA002 = wNRO
			'Fin de ubicar correlativo de Reclamo
		'	RESPONSE.WRITE wNRO & "<BR>"
	
	
             SQL = " INSERT INTO X300EF001 ( "
             SQL = SQL & " E300001CCI, E300001CIA, E300001COD, E300001CTR, "
             SQL = SQL & " E300001CCL, E300001STS, E300001OBS, E300001FPR, "
             SQL = SQL & " E300001FAC, E300001PUS, E300001NRO, E300001NFA, "
             SQL = SQL & " E300001SCO, E300001FDE, E300001CGR, E300001COG) "
             SQL = SQL & " VALUES ( "
             SQL = SQL & "'" & Session("glCiaInternet") & "',"
             SQL = SQL & "'" & Session("glCia")  & "',"
             SQL = SQL & "'" & wNRO & "',"
             SQL = SQL & "'" & wCTR & "',"
             SQL = SQL & "'" & wCLA001 & "',"
             SQL = SQL & "'1',"
             SQL = SQL & "'" & wOBS & "',"
             SQL = SQL & "getdate(),"
             SQL = SQL & "getdate(),"
             SQL = SQL & "'" & wPUS & "',"	
			 SQL = SQL & "'0',"	
			 SQL = SQL & "'0',"
			 SQL = SQL & "'0',"	
			 SQL = SQL & "getdate(),"	
             SQL = SQL & "'" & wCGR & "',"	
	         SQL = SQL & "'" & wCOG & "')"	
			 
			 wURL = "X001A115_S.ASP"		
	
		end if	
		IF wProceso = "Actualizar" or wProceso = "Eliminar" then
			if wProceso = "Eliminar" then
	  			SQL = "DELETE FROM X300EF002  " 
				SQL = SQL & " WHERE "		
				SQL = SQL & " E300002CCI ='" & wCCI & "' AND "
				SQL = SQL & " E300002CIA ='" & wCIA & "' AND "
				SQL = SQL & " E300002COD ='" & wCLA002 & "' "
				'Borrar Detalle
				XDTA300.Execute SQL			
	  			SQL = "DELETE FROM X300EF001  " 
	  			
	  			
			else			
				SQL = "UPDATE X300EF001 SET " 
				'SQL = SQL & " B300100CCL = '" & wCCL & "', "
				'SQL = SQL & " E300001CRE = '" & wB300100CRE & "', "
				'SQL = SQL & " E300001CGR = '" & wNFA & "', "
				'SQL = SQL & " E300001SCO = '" & wSCO & "', "
				'SQL = SQL & " E300001FDE = '" & wFDE & "', "
				'SQL = SQL & " E300001NRO = '" & wE300001NRO & "', "
				'IF LEN(TRIM(wSTS)) > 0 THEN
				'	SQL = SQL & " E300001STS = '" & wSTS & "', "		
				'END IF 
				'SQL = SQL & " E300001CTR = '" & wCTR & "', "
				SQL = SQL & " E300001OBS = '" & wOBS & "', "
				SQL = SQL & " E300001FAC = '" & wFECHA & "' "			
		
			end if	
			SQL = SQL & " WHERE "		
			SQL = SQL & " E300001CCI ='" & wCCI & "' AND "
			SQL = SQL & " E300001CIA ='" & wCIA & "' AND "
			SQL = SQL & " E300001COD ='" & wCLA002 & "' "
		END IF
	
		XDTA300.Execute SQL
		XDTA300.Close 
		set XDTA300 = nothing
		
		
			

		'
		
		IF wProceso = "Eliminar" THEN
			wURL = "X001A113_S.asp?NOMTAB=X300BQ100" & "&STSPED=" & wCTR			
		  ELSE
			wURL = "X001A115_S.ASP"	  	
			wURL = wURL & "?CLA001=" & wCLA001
			wURL = wURL & "&CLA002=" & wCLA002
			wURL = wURL & "&STSPED=" & wSTSPED
		END IF   
		
	
	END IF

    Response.Redirect wURL



%>