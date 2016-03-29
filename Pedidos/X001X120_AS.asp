<%
	
	wB300102CPR = trim(Request.Form("CPR"))
	wB300102CCL = trim(Request.Form("CCL"))
	wB300102NPE = trim(Request.Form("NPE"))
	wB300102CVE = trim(Request.Form("CVE"))
	wB300102BCK = trim(Request.Form("BCK"))
	wB300102FEC = trim(Request.Form("FEC"))
	wB300102CCI = Session("glCiaInternet")
	wB300102CIA = Session("glCia")
	
	
	wB300102FEC = YEAR(wB300102FEC) & "-" & MONTH(wB300102FEC) & "-" & DAY(wB300102FEC) 
	wFECHA = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)
	
	
	strCnn	= Application("XDTA300_ConnectionString")
	
	SQL = "INSERT INTO X201BF102_3 (" 
	SQL = SQL & " B201102CCI, B201102CIA, B201102CPR, B201102CCL,"
	SQL = SQL & " B201102NPE, B201102CVE, B201102BCK, B201102STS,"
	SQL = SQL & " B201102STE, B201102FEC, B201102FAC)"
	SQL = SQL & " VALUES ( "
	SQL = SQL & "'" & wB300102CCI & "',"
	SQL = SQL & "'" & wB300102CIA & "',"
	SQL = SQL & "'" & wB300102CPR & "',"
	SQL = SQL & "'" & wB300102CCL & "',"
	SQL = SQL & "'" & wB300102NPE & "',"
	SQL = SQL & "'" & wB300102CVE & "',"		
	SQL = SQL & "'" & wB300102BCK & "',"		
	SQL = SQL & "'1',"
	SQL = SQL & "'0',"
	SQL = SQL & "'" & wB300102FEC & "',"
	SQL = SQL & "'" & wFECHA & "') "	
	Set XDTA300 = Server.CreateObject("ADODB.Connection")
	XDTA300.Open strCnn
	RESPONSE.WRITE SQL
	XDTA300.Execute SQL
	XDTA300.Close 
	SET XDTA300 = NOTHING
	
		
	'wURL = "X001X120_S.ASP?NOMTAB=X300BQ102"
	'Response.Redirect wURL
	Response.write "<script language=""javascript"">history.go(-2)</script>"

%>