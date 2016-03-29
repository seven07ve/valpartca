<%


	wProceso = TRIM(Request.Form("PROCESO"))


	wCLA001 = TRIM(Request.QueryString("CLA001"))
	wCLA002 = TRIM(Request.Form("NRO"))
	wP300103CCI = Session("glCiaInternet")
	wP300103CIA = Session("glCia")
	wP300103OPE = Session("glCodVendedor")
	wP300103CVE = Session("glCodVendedor")	
	wP300103CCL = wCLA001 'ucase(TRIM(Request.Form("wCLA")))
	
	
	wP300103NFA = TRIM(Request.Form("txP300103NFA"))
	wP300103FRE = TRIM(Request.Form("txP300103FRE"))
	wP300103FEN = TRIM(Request.Form("txP300103FEN"))
	wP300103COM = TRIM(Request.Form("txP300103COM"))
	
	wP300100FPA = TRIM(Request.Form("ddlP300100FPA"))
	wP300100BAN = TRIM(Request.Form("ddlP300100BAN"))
	
	
	
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
		'Response.Redirect "X001Z201.ASP?CLA001=" & wB300100CCL & "&CLA003=" & wCLA001 & "&CLA002=" & wCLA002
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
		
		wEXISTE = "N"
		
		SQL = "SELECT P300103COD FROM X300PF103 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " P300103CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " P300103CCL ='" & wCLA001 & "' AND "
		SQL = SQL & " P300103NPE ='" & wCLA002 & "'"
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		'RESPONSE.WRITE SQL
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wEXISTE = "S"
		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING	
		
	
		

		IF wEXISTE = "N" then		
		
			'Ubicar Correlativo de Registro de Recaudo
			SQL = "SELECT ISNULL(MAX(CAST(P300103COD AS FLOAT)),0) AS NRO FROM X300PF103 " 
			SQL = SQL & " WHERE "
			SQL = SQL & " P300103CCI = '" & Session("glCiaInternet") & "' AND "
			SQL = SQL & " P300103CCL ='" & wCLA001 & "' AND "
			SQL = SQL & " P300103NPE ='" & wCLA002 & "'"
			Set rstQuery = Server.CreateObject("ADODB.Recordset")
			'RESPONSE.WRITE SQL
			rstQuery.Open sql , strCnn
			if NOT rstQuery.EOF then
				wNRO = cdbl(rstQuery.Fields("NRO"))
			end if
			rstQuery.CLOSE
			SET rstQuery = NOTHING	
	
			wNRO = wNRO + 1
			
			wNRO = right(("0000000000" & wNRO),10)
			'Fin de ubicar correlativo de Oportunidad
			
				
			SQL = " INSERT INTO X300PF103 (" 
			SQL = SQL & " P300103CCI, P300103CIA, P300103OPE, P300103NPE, "
			SQL = SQL & " P300103CCL, P300103COD, P300103NFA, P300103FRE, "
			SQL = SQL & " P300103FEN, P300103COM, P300103FPR, P300103FAC, "
			SQL = SQL & " P300103PUS )"
			SQL = SQL & " VALUES ( "
			SQL = SQL & "'" & wP300103CCI & "',"
			SQL = SQL & "'" & wP300103CIA & "',"
			SQL = SQL & "'" & wP300103OPE & "',"
			SQL = SQL & "'" & wCLA002 & "',"
			SQL = SQL & "'" & wP300103CCL & "',"
			SQL = SQL & "'" & wNRO & "',"
			SQL = SQL & "'" & wP300103NFA & "',"
			SQL = SQL & "'" & wP300103FRE & "',"
			SQL = SQL & "'" & wP300103FEN & "',"
			SQL = SQL & "'" & wP300103COM & "',"
			SQL = SQL & "'" & wFECHA & "',"
			SQL = SQL & "'" & wFECHA & "',"
			SQL = SQL & "'" & wPUS & "');"

			wURL = "X001P103.ASP"		
	
		ELSE
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
			SQL = "UPDATE X300PF103 SET " 
			SQL = SQL & " P300103NFA = '" & wP300103NFA & "', "
			SQL = SQL & " P300103FRE = '" & wP300103FRE & "', "
			SQL = SQL & " P300103FEN = '" & wP300103FEN & "', "
			SQL = SQL & " P300103COM = '" & wP300103COM & "', "
			SQL = SQL & " P300103PUS = '" & wPUS & "', "
			SQL = SQL & " P300103FAC = '" & wFECHA & "' "			
			SQL = SQL & " WHERE "		
			SQL = SQL & " P300103CCI ='" & wP300103CCI & "' AND "
			SQL = SQL & " P300103CIA ='" & wP300103CIA & "' AND "
			SQL = SQL & " P300103CCL ='" & wCLA001 & "' AND "
			SQL = SQL & " P300103NPE ='" & wCLA002 & "'"
			SQL = SQL & " ; "
			SQL = SQL & " UPDATE X300PF100 SET " 
			SQL = SQL & " P300100FPA = '" & wP300100FPA & "',"
			SQL = SQL & " P300100BAN = '" & wP300100BAN & "'"
			SQL = SQL & " WHERE "		
			SQL = SQL & " P300100CCI ='" & wP300103CCI & "' AND "
			SQL = SQL & " P300100CIA ='" & wP300103CIA & "' AND "
			SQL = SQL & " P300100CCL ='" & wCLA001 & "' AND "
			SQL = SQL & " P300100NPE ='" & wCLA002 & "'"
		END IF
		
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