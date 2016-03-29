<%
Function BuscarListaPrecio(wLPR)

	wCCI = Session("glCiaInternet")
	wCIA = Session("glCia")

	strCnn	= Application("XDTA300_ConnectionString")
	SQL = " SELECT A300018DEL "
	SQL = SQL & " FROM X300AF018 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " A300018CCI ='" & wCCI & "' AND "
	SQL = SQL & " A300018CIA ='" & wCIA & "' AND "
	SQL = SQL & " A300018LPR ='" & wLPR & "'  "
	
	'response.write SQL
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	if not rstQuery.EOF then
  	   wDEL = trim(rstQuery.Fields("A300018DEL"))
  	  else
   	   wDEL = "Cliente no existe" 
	end if
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	BuscarListaPrecio = wDEL
	
end Function
%>