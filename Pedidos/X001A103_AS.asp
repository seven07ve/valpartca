<%


	wB300101CVE = trim(Request.QueryString("CLA001"))
	wB300101NPE = trim(Request.QueryString("CLA002"))
	wB300101CPR = trim(Request.QueryString("CLA003"))
	wB300101DEL = trim(Request.QueryString("CLA004"))	
	wB300101PUN = trim(Request.QueryString("CLA005"))		
	wB300101PIM = trim(Request.QueryString("CLA006"))		
	wB300101KPC = trim(Request.QueryString("CLA007"))		
	wB300101DMA = trim(Request.QueryString("CLA008"))		
	
	wB300101UVE = TRIM(Request.Form("wCAN"))
	
	
	wB300101CCI = Session("glCiaInternet")
	wB300101CIA = Session("glCia")
	

	wPUS = Session("glUsuario")	
	wFECHA = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)
	
	
	strCnn	= Application("XDTA300_ConnectionString")
	Set XDTA300 = Server.CreateObject("ADODB.Connection")

	SQL = "INSERT INTO X300BF101 ("
    SQL = SQL & " B300101CCI, B300101CIA, B300101OPE, B300101NPE,"
    SQL = SQL & " B300101CPR, B300101DEL, B300101PUN, B300101UVE, B300101PPR,"
    SQL = SQL & " B300101BPR, B300101PIM, B300101KIL, B300101MNE, B300101BIV,"
    SQL = SQL & " B300101BDE, B300101BPP, B300101KPC, B300101DMA, B300101FAC, B300101STS )"
    SQL = SQL & " VALUES ( "
    SQL = SQL & "'" & Trim(wB300101CCI) & "', "
    SQL = SQL & "'" & Trim(wB300101CIA) & "', "
    SQL = SQL & "'" & Trim(wB300101CVE) & "', "
    SQL = SQL & "'" & Trim(wB300101NPE) & "', "
    SQL = SQL & "'" & Trim(wB300101CPR) & "', "
    SQL = SQL & "'" & Trim(wB300101DEL) & "', "
    SQL = SQL & "'" & Trim(wB300101PUN) & "', "
    SQL = SQL & "'" & Trim(wB300101UVE) & "', "
    SQL = SQL & "'0', "
    SQL = SQL & "'0', "
    SQL = SQL & "'" & Trim(wB300101PIM) & "', "
    SQL = SQL & " '0', '0', '0', '0', '0', "
    SQL = SQL & "'" & Trim(wB300101KPC) & "', "
    SQL = SQL & "'" & Trim(wB300101DMA) & "', "
    SQL = SQL & " '" & wFECHA & "',"
    SQL = SQL & " '1' )"

	XDTA300.Open strCnn	
	XDTA300.Execute SQL
	XDTA300.Close 		
	set XDTA300 = nothing			

	wURL = "X001A101_S.ASP?CLA001=" & wB300101CVE & "&CLA002=" & wB300101NPE
	Response.Redirect wURL
	'Response.WRITE wURL 


%>