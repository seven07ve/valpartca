<%


	wProceso = TRIM(Request.Form("PROCESO"))


	wCLA001 = TRIM(Request.Form("CLA001"))
	wCLA002 = TRIM(Request.Form("CLA002"))
	wB300100CCI = Session("glCiaInternet")
	wB300100CIA = Session("glCia")
	wB300100OPE = Session("glCodVendedor")
	wB300100CVE = Session("glCodVendedor")	
	wB300100CCL = ucase(TRIM(Request.Form("wCLA")))
	wB300100CPE = TRIM(Request.Form("wDES"))
	wSTS = TRIM(Request.Form("STS"))
	wEXISTE = "N"
	wPUS = Session("glUsuario")	
	wFECHA = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)

		
	IF Session("glTipoUsuario") = "C" THEN	
	   wB300100CCL = Session("glUsuario")
	   wSTS = "1"	   
	END IF 


	IF wProceso = "Buscar" then
		Response.Redirect "X001Z201.ASP?CLA001=" & wB300100CCL & "&CLA003=" & wCLA001 & "&CLA002=" & wCLA002
	end if
	
	
	strCnn	= Application("XDTA300_ConnectionString")


	IF wProceso <> "Eliminar" THEN
		
		SQL = "SELECT A300002CCL FROM X300AQ002 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " A300002CCI = '" & wB300100CCI & "' AND "
		SQL = SQL & " A300002CIA = '" & wB300100CIA & "'  "
		'SQL = SQL & " (Z300001PUS = '" & Session("glUsuario") & "' OR "	
		'SQL = SQL & "  Z300006PSU = '" & Session("glUsuario") & "' OR "		
		'SQL = SQL & "  'G' = '" &  Session("glTipoUsuario") & 	"' OR "			
		'SQL = SQL & "  'A' = '" &  Session("glTipoUsuario") & 	"')  "			
		'if Session("glTipoUsuario") = "C" then
		'	SQL = SQL & "  AND "
		'	SQL = SQL & " A300002CCL = '" & Session("glUsuario") & "' "
		'end if
		'if Session("glTipoUsuario") = "V" then
		'	SQL = SQL & "  AND "
		'	SQL = SQL & " A300002CVE = '" & Session("glCodVendedor") & "' "
		'end if
		if Session("glTipoUsuario") = "C" then
			SQL = SQL & " AND "
			SQL = SQL & " A300002CCL = '" & Session("glUsuario") & "' "
		end if
		if Session("glTipoUsuario") = "V" then
			SQL = SQL & "  AND "
			SQL = SQL & " A300002CVE = '" & Session("glCodVendedor") & "' "
		end if
	    if Session("glTipoUsuario") = "U" then
			SQL = SQL & "  AND "
			SQL = SQL & "  Z300006PSU = '" & Session("glUsuario") & "' "		
		end if 
		SQL = SQL & "  AND "		
		SQL = SQL & " (A300002CCL = '" & wB300100CCL & "') "
		
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
'	response.write wEXISTE
	IF wEXISTE = "S" THEN

		Set XDTA300 = Server.CreateObject("ADODB.Connection")
		XDTA300.Open strCnn


		IF wProceso = "Agregar" then		
		
			'Ubicar Correlativo de Pedido
			SQL = "SELECT * FROM X300ZF003 WHERE "
			SQL = SQL & " Z300003CCI = '" & Session("glCiaInternet") & "' AND "
			SQL = SQL & " Z300003IDP = 'PE' AND "
			SQL = SQL & " Z300003CIA = '" & Session("glCia") & "' "
			Set rstQuery = Server.CreateObject("ADODB.Recordset")
			rstQuery.Open sql , strCnn
			IF NOT rstQuery.EOF THEN
				wNRO = cLNG(rstQuery.Fields("Z300003CAC")) + 1						
				If wNRO > cLNG(rstQuery.Fields("Z300003NCH")) Then
					wNRO = cLNG(rstQuery.Fields("Z300003NCD"))
				End If
				wCVE = trim(rstQuery.Fields("Z300003CVE"))
				SQL = "UPDATE X300ZF003 SET "
				SQL = SQL & " Z300003CAC = " & wNRO & " "  'Correlativo actual
				SQL = SQL & " WHERE "
				SQL = SQL & " Z300003CCI = '" & Session("glCiaInternet") & "' AND "
				SQL = SQL & " Z300003IDP = 'PE' AND "
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
			wNRO = right(("000000" & wNRO),6)
			'Fin de ubicar correlativo de pedido
			
	
			SQL = "INSERT INTO X300BF100 (" 
			SQL = SQL & " B300100CCI, B300100CIA, B300100OPE, B300100NPE,"
			SQL = SQL & " B300100CVE, B300100CCL, B300100CPE, B300100PUS,"
			SQL = SQL & " B300100FAC, B300100FPR )"
			SQL = SQL & " VALUES ( "
			SQL = SQL & "'" & wB300100CCI & "',"
			SQL = SQL & "'" & wB300100CIA & "',"
			SQL = SQL & "'" & wB300100OPE & "',"
			SQL = SQL & "'" & wNRO & "',"
			SQL = SQL & "'" & wB300100CVE & "',"
			SQL = SQL & "'" & wB300100CCL & "',"		
			SQL = SQL & "'" & wB300100CPE & "',"		
			SQL = SQL & "'" & wPUS & "',"		
			SQL = SQL & "'" & wFECHA & "',"		
			SQL = SQL & "'" & wFECHA & "')"		
			
			wURL = "X001A101_S.ASP"		
	
		end if	
		IF wProceso = "Actualizar" or wProceso = "Eliminar" then
			if wProceso = "Eliminar" then
	  			SQL = "DELETE FROM X300BF101  " 
				SQL = SQL & " WHERE "		
				SQL = SQL & " B300101CCI ='" & wB300100CCI & "' AND "
				SQL = SQL & " B300101CIA ='" & wB300100CIA & "' AND "
				SQL = SQL & " B300101OPE ='" & wCLA001 & "' AND "
				SQL = SQL & " B300101NPE = " & wCLA002 & " "
				'Borrar Detalle
				XDTA300.Execute SQL			
	  			SQL = "DELETE FROM X300BF100  " 
	  			
	  			
			else			
				SQL = "UPDATE X300BF100 SET " 
				SQL = SQL & " B300100CCL = '" & wB300100CCL & "', "
				SQL = SQL & " B300100CPE = '" & wB300100CPE & "', "
				SQL = SQL & " B300100STS = '" & wSTS & "', "		
				SQL = SQL & " B300100PUS = '" & wPUS & "', "
				SQL = SQL & " B300100FAC = '" & wFECHA & "' "			
		
			end if	
			SQL = SQL & " WHERE "		
			SQL = SQL & " B300100CCI ='" & wB300100CCI & "' AND "
			SQL = SQL & " B300100CIA ='" & wB300100CIA & "' AND "
			SQL = SQL & " B300100OPE ='" & wCLA001 & "' AND "
			SQL = SQL & " B300100NPE = " & wCLA002 & " "
		END IF
	
		XDTA300.Execute SQL
		XDTA300.Close 
		set XDTA300 = nothing
		
		If len(trim(wCLA001)) = 0 Then
			wCLA001 = wB300100OPE
		End If
		
		If len(trim(wCLA002)) = 0 Then
			wCLA002 = wNRO
		End If
			

		wURL = Session("glUrlBuscar")
		'wURL = "X001A100_S.ASP?NOMTAB=X300BQ100"
		
		IF wProceso = "Eliminar" THEN
			wURL = "X001A100_S.asp?NOMTAB=X300BQ100"
		  ELSE
			wURL = "X001A101_S.ASP"	  	
			wURL = wURL & "?CLA001=" & wCLA001
			wURL = wURL & "&CLA002=" & wCLA002
		END IF   
		
	   ELSE
		'No existe cliente
		wURL = "X001A100_A.ASP?CLA001=&ERROR=Cliente " & wB300100CCL & " no Existe"
	
	END IF

    Response.Redirect wURL



%>