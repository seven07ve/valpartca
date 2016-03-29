<%
Function BuscarItemListaPrecio(wItem, wDES, wPUN, wPPR, wBPR, wPIM, wERR)


	wCCI = Session("glCiaInternet")
	wCIA = Session("glCia")
	wCPR = wITEM
	wDES = ""
	wPUN = 0
	wPPR = 0
	wBPR = 0	
	wPIM = 0
	wERR = ""	
	wESC = Session("glEscalaPrecio")
	
	strCnn	= Application("XDTA300_ConnectionString")
	SQL = " SELECT A300003DEL, A300003PU" & wESC & ", A300003PPR, A300003BPR, "
	SQL = SQL & " A300003PIM "
	SQL = SQL & " FROM X300AF003 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " A300003CCI ='" & wCCI & "' AND "
	SQL = SQL & " A300003CIA ='" & wCIA & "' AND "
	SQL = SQL & " A300003CPR ='" & wCPR & "'  "

	'response.write SQL
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	if not rstQuery.EOF then
  	   wDES = trim(rstQuery.Fields("A300003DEL"))
  	   wPUN = trim(rstQuery.Fields("A300003PU" & wESC))
  	   wPPR = trim(rstQuery.Fields("A300003PPR"))
  	   wBPR = trim(rstQuery.Fields("A300003BPR"))
  	   wPIM = trim(rstQuery.Fields("A300003PIM"))
  	  else
   	   wERR = "Item no existe en Lista de Precio" 
	end if
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
end Function
%>