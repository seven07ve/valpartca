<%


	wProceso = TRIM(Request.Form("PROCESO"))


	wCLA001 = TRIM(Request.QueryString("CLA001"))
	wCLA002 = TRIM(Request.Form("NRO"))
	wP300100CCI = Session("glCiaInternet")
	wP300100CIA = Session("glCia")
	wP300100OPE = Session("glCodVendedor")
	wP300100CVE = Session("glCodVendedor")	
	wP300100CCL = wCLA001 'ucase(TRIM(Request.Form("wCLA")))

	wP300100INS = TRIM(Request.Form("ddlP300100INS"))
	wP300100RIN = TRIM(Request.Form("ddlP300100RIN"))
	wP300100CUR = TRIM(Request.Form("ddlP300100CUR"))
	wNUEVA = TRIM(Request.Form("NUEVA"))
	
	
	
	
	wEXISTE = "N"
	wPUS = Session("glUsuario")	
	wFECHA = DAY(DATE) & "-" & MONTH(DATE) & "-" & YEAR(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)

	strCnn	= Application("XDTA300_ConnectionString")
		
	
		
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
		

			
			wURL = "X001P104.ASP"		
	
		end if	
		IF wProceso = "Actualizar" or wProceso = "Eliminar" then
	
			SQL = " UPDATE X300PF100 SET " 
			SQL = SQL & " P300100INS = '" & wP300100INS & "',"
			SQL = SQL & " P300100RIN = '" & wP300100RIN & "',"
			SQL = SQL & " P300100CUR = '" & wP300100CUR & "',"
			SQL = SQL & " P300100FCI = '" & wFECHA & "',"
			SQL = SQL & " P300100PUC = '" & wPUS & "',"
			SQL = SQL & " P300100STS = '2'"
			SQL = SQL & " WHERE "		
			SQL = SQL & " P300100CCI ='" & wP300100CCI & "' AND "
			SQL = SQL & " P300100CIA ='" & wP300100CIA & "' AND "
			SQL = SQL & " P300100CCL ='" & wCLA001 & "' AND "
			SQL = SQL & " P300100NPE ='" & wCLA002 & "'"
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
			

		IF wNUEVA = "N" THEN
			wURL = "X001P999.asp?CLA001=" & wCLA001
		  ELSE
			wURL = "X001P100.asp?CLA001=" & wCLA001	  	
		END IF   
		
	   'ELSE
		'No existe cliente
		'wURL = "X001A100_A.ASP?CLA001=&ERROR=Cliente " & wB300100CCL & " no Existe"
	
	'END IF
	
	'RESPONSE.WRITE SQL 
	'RESPONSE.END 
    Response.Redirect wURL



%>