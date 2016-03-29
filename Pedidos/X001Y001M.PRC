<%
Function BuscarClientePedido(wOPE, wNPE)

	wCCI = Session("glCiaInternet")
	wCIA = Session("glCia")

	strCnn	= Application("XDTA201_ConnectionString")
	SQL = " SELECT A201002RSO "
	'SQL = SQL & " FROM X201BQ100 " 
	SQL = SQL & " FROM X201BF100 LEFT OUTER JOIN X201AF002 ON "
    SQL = SQL & " B201100CCI = A201002CCI AND "
    SQL = SQL & " B201100CIA = A201002CIA AND "
    SQL = SQL & " B201100CCL = A201002CCL  "

	SQL = SQL & " WHERE "
	SQL = SQL & " B201100CCI ='" & wCCI & "' AND "
	SQL = SQL & " B201100CIA ='" & wCIA & "' AND "
	SQL = SQL & " B201100OPE ='" & wOPE & "' AND "
	SQL = SQL & " B201100NPE ='" & wNPE & "'  "
	
	'response.write SQL
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	if not rstQuery.EOF then
  	   wDEL = replace(trim(rstQuery.Fields("A201002RSO")),"&"," ")
	   wDEL = replace(wDEL,chr(34)," ")
	   wDEL = replace(wDEL,"'"," ")	
  	  else
   	   wDEL = "Cliente no existe" 
	end if
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	BuscarClientePedido = wDEL
	
end Function
%>