<%


	wProceso = TRIM(Request.Form("PROCESO"))


	wCLA001 = TRIM(Request.QueryString("CLA001"))
	wCLA002 = TRIM(Request.Form("NRO"))
	wP300100CCI = Session("glCiaInternet")
	wP300100CIA = Session("glCia")
	wP300100OPE = Session("glCodVendedor")
	wP300100CVE = Session("glCodVendedor")	
	wP300100CCL = wCLA001 'ucase(TRIM(Request.Form("wCLA")))
	wP300100CPE = TRIM(Request.Form("txP300100CPE"))
	
	wP300100FPA = TRIM(Request.Form("ddlP300100FPA"))
	wP300100BAN = TRIM(Request.Form("ddlP300100BAN"))
	wP300100MFA = TRIM(Request.Form("ddlP300100MFA"))
	wP300100COP = TRIM(Request.Form("ddlP300100COP"))


	wDES = TRIM(Request.Form("DES"))
	wSTS = TRIM(Request.Form("STS"))
	wAEP = TRIM(Request.Form("AEP"))
	wEXISTE = "N"
	wPUS = Session("glUsuario")	
	wFECHA = DAY(DATE) & "-" & MONTH(DATE) & "-" & YEAR(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)

	strCnn	= Application("XDTA300_ConnectionString")
		
	
	
	
	wSTS = "1"
	wAEP = "S"	   
		
	'BUSCA ERP COMPAÑIA INTERNET
	SQL = "SELECT Z300002ERP FROM X300ZF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300002CCI = '" & Session("glCiaInternet") & "'"
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		wERP = TRIM(rstQuery.Fields("Z300002ERP"))
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	
	IF ISNULL(wDES) OR LEN(TRIM(wDES)) = 0 THEN
		wDES = wB300100CCL 
		IF wERP = "ASW" THEN
			wDES = "00"
		END IF
	END IF 


	
	IF wProceso = "Buscar" then
		R'esponse.Redirect "X001Z201.ASP?CLA001=" & wB300100CCL & "&CLA003=" & wCLA001 & "&CLA002=" & wCLA002
	end if
		
'	response.write wB300100CVE 
'response.end 

	'IF wProceso <> "Eliminar" THEN
		
	 ' ELSE
 '  		wEXISTE = "S"	
	'END IF
'	response.write wEXISTE
'	IF wEXISTE = "S" THEN

		Set XDTA300 = Server.CreateObject("ADODB.Connection")
		XDTA300.Open strCnn


		IF wCLA002 = "Nuevo" then		
		
			'Ubicar Correlativo de Oportunidad
			SQL = "SELECT ISNULL(MAX(CAST(P300100NPE AS FLOAT)),0) AS NRO FROM X300PF100 " 
			SQL = SQL & " WHERE "
			SQL = SQL & " P300100CCI = '" & Session("glCiaInternet") & "' "
			Set rstQuery = Server.CreateObject("ADODB.Recordset")
			'RESPONSE.WRITE SQL
			rstQuery.Open sql , strCnn
			if NOT rstQuery.EOF then
				wNRO = cdbl(rstQuery.Fields("NRO"))
			end if
			rstQuery.CLOSE
			SET rstQuery = NOTHING
			
					
			'Ubicar Correlativo de Actividad
			SQL = "SELECT ISNULL(MAX(CAST(P300102COD AS FLOAT)),0) AS NRO FROM X300PF102 " 
			SQL = SQL & " WHERE "
			SQL = SQL & " P300102CCI = '" & Session("glCiaInternet") & "' "
			Set rstQuery = Server.CreateObject("ADODB.Recordset")
			'RESPONSE.WRITE SQL
			rstQuery.Open sql , strCnn
			if NOT rstQuery.EOF then
				wNRO2 = cdbl(rstQuery.Fields("NRO"))
			end if
			rstQuery.CLOSE
			SET rstQuery = NOTHING	
	
			wNRO = wNRO + 1
			wNRO2 = wNRO2 + 1
	
		
			wNRO = right(("0000000000" & wNRO),10)
			wNRO2 = right(("0000000000" & wNRO2),10)
			'Fin de ubicar correlativo de Oportunidad
			
	
			SQL = "INSERT INTO X300PF100 (" 
			SQL = SQL & " P300100CCI, P300100CIA, P300100OPE, P300100NPE,"
			SQL = SQL & " P300100CVE, P300100CCL, P300100CPE, P300100CSO,"
			SQL = SQL & " P300100AEP, P300100PUS, P300100FAC, P300100FPR,"
			SQL = SQL & " P300100FPA, P300100BAN, P300100MFA, P300100COP )"
			SQL = SQL & " VALUES ( "
			SQL = SQL & "'" & wP300100CCI & "',"
			SQL = SQL & "'" & wP300100CIA & "',"
			SQL = SQL & "'" & wP300100OPE & "',"
			SQL = SQL & "'" & wNRO & "',"
			SQL = SQL & "'" & wP300100CVE & "',"
			SQL = SQL & "'" & wP300100CCL & "',"		
			SQL = SQL & "'" & wP300100CPE & "',"
			SQL = SQL & "'" & wDES & "',"		
			SQL = SQL & "'" & wAEP & "',"		
			SQL = SQL & "'" & wPUS & "',"		
			SQL = SQL & "'" & wFECHA & "',"		
			SQL = SQL & "'" & wFECHA & "',"
			SQL = SQL & "'" & wP300100FPA & "',"
			SQL = SQL & "'" & wP300100BAN & "',"
			SQL = SQL & "'" & wP300100MFA & "',"
			SQL = SQL & "'" & wP300100COP & "');"
			
			SQL = SQL & " INSERT INTO X300PF102 (" 
			SQL = SQL & " P300102CCI, P300102CIA, P300102OPE, P300102NPE, "
			SQL = SQL & " P300102CCL, P300102COD, P300102UGA, P300102ACT, "
			SQL = SQL & " P300102FEC, P300102COM, P300102DEM, P300102CAL,"
			SQL = SQL & " P300102STS, P300102FPR, P300102FAC, P300102PUS )"
			SQL = SQL & " VALUES ( "
			SQL = SQL & "'" & wP300100CCI & "',"
			SQL = SQL & "'" & wP300100CIA & "',"
			SQL = SQL & "'" & wP300100OPE & "',"
			SQL = SQL & "'" & wNRO & "',"
			SQL = SQL & "'" & wP300100CCL & "',"
			SQL = SQL & "'" & wNRO2 & "',"
			SQL = SQL & "'" & wPUS & "',"
			SQL = SQL & "'1',"
			SQL = SQL & "getdate()+1,"		
			SQL = SQL & "'',"		
			SQL = SQL & "'N',"		
			SQL = SQL & "'',"		
			SQL = SQL & "'1',"
			SQL = SQL & "'" & wFECHA & "',"
			SQL = SQL & "'" & wFECHA & "',"
			SQL = SQL & "'" & wPUS & "');"

			
			wURL = "X001P101.ASP"		
	
		end if	
		IF wProceso = "Actualizar" or wProceso = "Eliminar" then
			if wProceso = "Eliminar" then
	  			SQL = "DELETE FROM X300PF101  " 
				SQL = SQL & " WHERE "		
				SQL = SQL & " P300101CCI ='" & wP300100CCI & "' AND "
				SQL = SQL & " P300101CIA ='" & wP300100CIA & "' AND "
				SQL = SQL & " P300101NPE = " & wCLA002 & " "
				'Borrar Detalle
				XDTA300.Execute SQL			
	  			SQL = "DELETE FROM X300PF100  " 
	  			
	  			
			else			
				SQL = "UPDATE X300PF100 SET " 
				SQL = SQL & " P300100CCL = '" & wP300100CCL & "', "
				SQL = SQL & " P300100CPE = '" & wP300100CPE & "', "
				SQL = SQL & " P300100STS = '" & wSTS & "', "
				SQL = SQL & " P300100AEP = '" & wAEP & "', "		
				SQL = SQL & " P300100PUS = '" & wPUS & "', "
				SQL = SQL & " P300100FAC = '" & wFECHA & "', "	
				SQL = SQL & " P300100FPA = '" & wP300100FPA & "',"
				SQL = SQL & " P300100BAN = '" & wP300100BAN & "',"
				SQL = SQL & " P300100MFA = '" & wP300100MFA & "',"
				SQL = SQL & " P300100COP = '" & wP300100COP & "'"
		
		
			end if	
			SQL = SQL & " WHERE "		
			SQL = SQL & " P300100CCI ='" & wP300100CCI & "' AND "
			SQL = SQL & " P300100CIA ='" & wP300100CIA & "' AND "
			SQL = SQL & " P300100CCL ='" & wCLA001 & "' AND "
			SQL = SQL & " P300100NPE = " & wCLA002 & " "
		END IF
		
		'response.write sql 
		'response.end
	
		XDTA300.Execute SQL
		XDTA300.Close 
		set XDTA300 = nothing
		
		If len(trim(wCLA001)) = 0 Then
			wCLA001 = wP300100OPE
		End If
		
		If len(trim(wCLA002)) = 0 OR trim(wCLA002) = "Nuevo" Then
			wCLA002 = wNRO
		End If
			

		wURL = Session("glUrlBuscar")
		'wURL = "X001A100_S.ASP?NOMTAB=X300BQ100"
		
		IF wProceso = "Eliminar" THEN
			wURL = "X001P999.asp?CLA001=" & wCLA001
		  ELSE
			wURL = "X001P101.ASP"	  	
			wURL = wURL & "?CLA001=" & wCLA001
			wURL = wURL & "&CLA002=" & wCLA002
		END IF   
		
	   'ELSE
		'No existe cliente
		'wURL = "X001A100_A.ASP?CLA001=&ERROR=Cliente " & wB300100CCL & " no Existe"
	
	'END IF
	
	'RESPONSE.WRITE SQL 
	'RESPONSE.END 
    Response.Redirect wURL



%>