<%

	wCCI = Session("glCiaInternet") 
	wCIA = Session("glCia") 
	wCVEX = TRIM(Request.Form("VENDEDOR"))
	wCHR = Chr(34)

	'Pedidos Header
	wNOMARC = "XPH" & wCCI 
	wEXTARC = ".CAT"

	wFECHA = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)

	Set fso = CreateObject("Scripting.FileSystemObject")

	Set wArchivo = fso.CreateTextFile("d:\home\alcidesb\mipedido.com\download\" & wNOMARC & wEXTARC, True)
	'Set wArchivo = fso.OpenTextFile(server.mappath("..") & "\XAWE001\DOWNLOAD\XPEDIDOS.CAT", 2, True)

	strCnn	= Application("XDTA300_ConnectionString")


	Set XDTA300 = Server.CreateObject("ADODB.Connection")
	XDTA300.Open strCnn

	'Crear Header de Pedido
	SQL = "SELECT * FROM X300BF100 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " B300100CCI = '" & wCCI & "' AND "
	SQL = SQL & " B300100CIA = '" & wCIA & "' AND "		
	SQL = SQL & " B300100STS = '1'  "		
	IF wCVEX <> "000" THEN
		SQL = SQL & " AND A300100CVE = '" &  wCVEX & "'" 	
	END IF	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	DO WHILE NOT rstQuery.EOF 
		wOPE = trim(rstQuery.Fields("B300100OPE"))	
		wNPE = trim(rstQuery.Fields("B300100NPE"))
		wCVE = trim(rstQuery.Fields("B300100CVE"))
		wCCL = trim(rstQuery.Fields("B300100CCL"))
		wPDE = trim(rstQuery.Fields("B300100PDE"))
		wPPP = trim(rstQuery.Fields("B300100PPP"))
		wCPE = trim(rstQuery.Fields("B300100CPE"))
		wKIL = trim(rstQuery.Fields("B300100KIL"))
		wBBR = trim(rstQuery.Fields("B300100BBR"))
		wSTR = wCHR & wOPE & wCHR & ","
		wSTR = wSTR & wCHR & wNPE & wCHR & ","
		wSTR = wSTR & wCHR & wCVE & wCHR & ","
		wSTR = wSTR & wCHR & wCCL & wCHR & ","
		wSTR = wSTR & wCHR & wPDE & wCHR & ","
		wSTR = wSTR & wCHR & wPPP & wCHR & ","
		wSTR = wSTR & wCHR & wCPE & wCHR & ","
		wSTR = wSTR & wKIL & ","
		wSTR = wSTR & wBBR & " "
		wArchivo.Writeline(wSTR)

		'Actualizar Status de Comunicado
		SQL = "UPDATE X300BF100 SET " 
		SQL = SQL & " B300100STS = '2', "
		SQL = SQL & " B300100FAC = '" & wFECHA & "'  "		
		SQL = SQL & " WHERE "		
		SQL = SQL & " B300100CCI ='" & wCCI & "' AND "
		SQL = SQL & " B300100CIA ='" & wCIA & "' AND "
		SQL = SQL & " B300100OPE ='" & wOPE & "' AND "
		SQL = SQL & " B300100NPE ='" & wNPE & "'  "
		XDTA300.Execute SQL

		
		rstQuery.MoveNext 
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	wArchivo.Close
	
	XDTA300.Close 
	SET XDTA300 = NOTHING	


	wURL = Session("glUrlBuscar")
	'wURL = "/download/XPHALI.CAT"

	Response.Redirect wURL


%>