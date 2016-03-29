<%


	wProceso = TRIM(Request.Form("PROCESO"))


	wCLA001 = TRIM(Request.QueryString("CLA001"))
	wCLA002 = TRIM(Request.Form("NRO"))
	wP300102CCI = Session("glCiaInternet")
	wP300102CIA = Session("glCia")
	wP300102OPE = Session("glCodVendedor")
	wP300102CVE = Session("glCodVendedor")	
	wP300102CCL = wCLA001 'ucase(TRIM(Request.Form("wCLA")))
	wP300102COM = TRIM(Request.Form("txP300102COM"))
	
	wP300102ACT = TRIM(Request.Form("ddlP300102ACT"))
	wP300102FEC = TRIM(Request.Form("txP300102FEC"))
	
	wP300102DEM = TRIM(Request.Form("ddlP300102DEM"))
	wP300102MEF = TRIM(Request.Form("ddlP300102MEF"))
	wP300102CAL = TRIM(Request.Form("ddlP300102CAL"))
	wP300102DEO = TRIM(Request.Form("ddlP300102DEO"))
	
	
	IF LEN(TRIM(wP300102DEO)) > 0 AND TRIM(wP300102DEO) <> "0" THEN  
		wP300102STS = "9"
		ELSE
		wP300102STS = "1"
	END IF 
	
	
	wDES = TRIM(Request.Form("DES"))
	'wSTS = TRIM(Request.Form("STS"))
	
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
			
			wNRO = wNRO + 1

			
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
			
	
			'SQL = "INSERT INTO X300PF100 (" 
			'SQL = SQL & " P300100CCI, P300100CIA, P300100OPE, P300100NPE,"
			'SQL = SQL & " P300100CVE, P300100CCL, P300100CPE, P300100CSO,"
			'SQL = SQL & " P300100AEP, P300100PUS, P300100FAC, P300100FPR,"
			'SQL = SQL & " P300100FPA, P300100BAN, P300100MFA, P300100COP )"
			'SQL = SQL & " VALUES ( "
			'SQL = SQL & "'" & wP300100CCI & "',"
			'SQL = SQL & "'" & wP300100CIA & "',"
			'SQL = SQL & "'" & wP300100OPE & "',"
			'SQL = SQL & "'" & wNRO & "',"
			'SQL = SQL & "'" & wP300100CVE & "',"
			'SQL = SQL & "'" & wP300100CCL & "',"		
			'SQL = SQL & "'" & wP300100CPE & "',"
			'SQL = SQL & "'" & wDES & "',"		
			'SQL = SQL & "'" & wAEP & "',"		
			'SQL = SQL & "'" & wPUS & "',"		
			'SQL = SQL & "'" & wFECHA & "',"		
			'SQL = SQL & "'" & wFECHA & "',"
			'SQL = SQL & "'" & wP300100FPA & "',"
			'SQL = SQL & "'" & wP300100BAN & "',"
			'SQL = SQL & "'" & wP300100MFA & "',"
			'SQL = SQL & "'" & wP300100COP & "');"
			
			'SQL = SQL & " INSERT INTO X300PF102 (" 
			'SQL = SQL & " P300102CCI, P300102CIA, P300102OPE, P300102NPE, "
			'SQL = SQL & " P300102CCL, P300102COD, P300102UGA, P300102ACT, "
			'SQL = SQL & " P300102FEC, P300102COM, P300102DEM, P300102CAL,"
			'SQL = SQL & " P300102STS, P300102FPR, P300102FAC, P300102PUS )"
			'SQL = SQL & " VALUES ( "
			'SQL = SQL & "'" & wP300100CCI & "',"
			'SQL = SQL & "'" & wP300100CIA & "',"
			'SQL = SQL & "'" & wP300100OPE & "',"
			'SQL = SQL & "'" & wNRO & "',"
			'SQL = SQL & "'" & wP300100CCL & "',"
			'SQL = SQL & "'" & wNRO2 & "',"
			'SQL = SQL & "'" & wPUS & "',"
			'SQL = SQL & "'1',"
			'SQL = SQL & "getdate()+1,"		
			'SQL = SQL & "'',"		
			'SQL = SQL & "'N',"		
			'SQL = SQL & "'',"		
			'SQL = SQL & "'1',"
			'SQL = SQL & "'" & wFECHA & "',"
			'SQL = SQL & "'" & wFECHA & "',"
			'SQL = SQL & "'" & wPUS & "');"

			
			wURL = "X001P102.ASP"		
	
		end if	
		IF wProceso = "Actualizar" or wProceso = "Eliminar" then
			'if wProceso = "Eliminar" then
	  		'	SQL = "DELETE FROM X300PF102  " 
			'	SQL = SQL & " WHERE "		
			'	SQL = SQL & " P300102CCI ='" & wP300100CCI & "' AND "
			'	SQL = SQL & " P300102CIA ='" & wP300100CIA & "' AND "
			'	SQL = SQL & " P300102NPE = " & wCLA002 & " "
			'	'Borrar Detalle
			'	XDTA300.Execute SQL			
	  		'	SQL = "DELETE FROM X300PF100  " 
	  			
	  			
			'else			
			SQL = "UPDATE X300PF102 SET " 
			SQL = SQL & " P300102FEC = '" & wP300102FEC & "', "
			SQL = SQL & " P300102ACT = '" & wP300102ACT & "', "
			SQL = SQL & " P300102COM = '" & wP300102COM & "', "
			SQL = SQL & " P300102DEM = '" & wP300102DEM & "', "
			SQL = SQL & " P300102CAL = '" & wP300102CAL & "', "
			SQL = SQL & " P300102MEF = '" & wP300102MEF & "', "
			SQL = SQL & " P300102PUS = '" & wPUS & "', "
			SQL = SQL & " P300102DEO = '" & wP300102DEO & "', "
			SQL = SQL & " P300102STS = '" & wP300102STS & "', "
			SQL = SQL & " P300102FAC = '" & wFECHA & "' "			
			SQL = SQL & " WHERE "		
			SQL = SQL & " P300102CCI ='" & wP300102CCI & "' AND "
			SQL = SQL & " P300102CIA ='" & wP300102CIA & "' AND "
			SQL = SQL & " P300102CCL ='" & wCLA001 & "' AND "
			SQL = SQL & " P300102NPE ='" & wCLA002 & "'"
			SQL = SQL & " ; "
			SQL = SQL & " UPDATE X300PF100 SET " 
			SQL = SQL & " P300100STS = '" & wP300102STS & "'"
			SQL = SQL & " WHERE "		
			SQL = SQL & " P300100CCI ='" & wP300102CCI & "' AND "
			SQL = SQL & " P300100CIA ='" & wP300102CIA & "' AND "
			SQL = SQL & " P300100CCL ='" & wCLA001 & "' AND "
			SQL = SQL & " P300100NPE ='" & wCLA002 & "'"
		END IF
		
		'response.write sql 
		'response.end
	
		XDTA300.Execute SQL
		XDTA300.Close 
		set XDTA300 = nothing
		
		If len(trim(wCLA001)) = 0 Then
			wCLA001 = wP300102OPE
		End If
		
		If len(trim(wCLA002)) = 0 OR trim(wCLA002) = "Nuevo" Then
			wCLA002 = wNRO
		End If
			

		wURL = Session("glUrlBuscar")
		'wURL = "X001A100_S.ASP?NOMTAB=X300BQ100"
		
		'IF wProceso = "Eliminar" THEN
			wURL = "X001P999.asp?CLA001=" & wCLA001
		'  ELSE
		'	wURL = "X001P101.ASP"	  	
		'	wURL = wURL & "?CLA001=" & wCLA001
		'	wURL = wURL & "&CLA002=" & wCLA002
		'END IF   
		
	   'ELSE
		'No existe cliente
		'wURL = "X001A100_A.ASP?CLA001=&ERROR=Cliente " & wB300100CCL & " no Existe"
	
	'END IF
	
	'RESPONSE.WRITE SQL 
	'RESPONSE.END 
    Response.Redirect wURL



%>