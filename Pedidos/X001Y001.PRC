<%
Function BuscarClientePedido(wOPE, wNPE)

	wCCI = Session("glCiaInternet")
	wCIA = Session("glCia")

	strCnn	= Application("XDTA300_ConnectionString")
	SQL = " SELECT A300002RSO "
	SQL = SQL & " FROM X300BQ100 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " B300100CCI ='" & wCCI & "' AND "
	SQL = SQL & " B300100CIA ='" & wCIA & "' AND "
	SQL = SQL & " B300100OPE ='" & wOPE & "' AND "
	SQL = SQL & " B300100NPE ='" & wNPE & "'  "
	
	'response.write SQL
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	if not rstQuery.EOF then
  	   wDEL = replace(trim(rstQuery.Fields("A300002RSO")),"&"," ")
	   wDEL = replace(wDEL,chr(34)," ")
	   wDEL = replace(wDEL,"'"," ")	
  	  else
   	   wDEL = "Cliente no existe" 
	end if
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	BuscarClientePedido = wDEL
	
end Function


Function BuscarClientePago(wNDC)

	wCCI = Session("glCiaInternet")
	wCIA = Session("glCia")

	strCnn	= Application("XDTA300_ConnectionString")
	SQL = " SELECT A300002RSO "
	SQL = SQL & " FROM X300CQ001 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " C300001CCI ='" & wCCI & "' AND "
	SQL = SQL & " C300001CIA ='" & wCIA & "' AND "
	SQL = SQL & " C300001NDC ='" & wNDC & "'  "
	
	'response.write SQL
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	if not rstQuery.EOF then
  	   wDEL = replace(trim(rstQuery.Fields("A300002RSO")),"&"," ")
	   wDEL = replace(wDEL,chr(34)," ")
	   wDEL = replace(wDEL,"'"," ")	
  	  else
   	   wDEL = "Cliente no existe" 
	end if
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	BuscarClientePago = wDEL
	
end Function

Function BuscarClienteReclamo(wCCL)

	wCCI = Session("glCiaInternet")
	wCIA = Session("glCia")

	strCnn	= Application("XDTA300_ConnectionString")
	SQL = " SELECT A300002RSO "
	SQL = SQL & " FROM X300AF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " A300002CCI ='" & wCCI & "' AND "
	SQL = SQL & " A300002CIA ='" & wCIA & "' AND "
	SQL = SQL & " A300002CCL ='" & wCCL & "'  "
	
	response.write SQL
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	if not rstQuery.EOF then
  	   wDEL = replace(trim(rstQuery.Fields("A300002RSO")),"&"," ")
	   wDEL = replace(wDEL,chr(34)," ")
	   wDEL = replace(wDEL,"'"," ")	
  	  else
   	   wDEL = "Cliente no existe" 
	end if
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	BuscarClienteReclamo = wDEL
	
end Function

%>