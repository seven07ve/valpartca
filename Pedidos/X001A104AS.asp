<%

wNRO = TRIM(Request.QueryString("NRO"))

IF LEN(TRIM(wNRO)) > 0 THEN

	wNRO = REPLACE(wNRO, "'", "")
	
	strCnn	= Application("XDTA300_ConnectionString")

	Set XDTA300 = Server.CreateObject("ADODB.Connection")
	XDTA300.Open strCnn

	SQL = "UPDATE X300EF001 SET "
    SQL = SQL & " E300001SCO = '1',"
    SQL = SQL & " E300001FCO = getdate()"
    SQL = SQL & " WHERE "
    SQL = SQL & " E300001CCI = '" & Session("glCiaInternet") & "' AND "
    SQL = SQL & " E300001CIA = '01'AND "
    SQL = SQL & " E300001COD = '" & wNRO & "' "
    XDTA300.Execute SQL
	XDTA300.Close 
	set XDTA300 = nothing
		
    Response.write "<script language=""javascript"">"
    Response.write "alert('Gracias, ya fue registrada su conformidad.');"
	Response.write "window.close();"
	Response.write "</script>"


END IF 


Response.write ""

%>		
