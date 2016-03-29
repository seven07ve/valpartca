<!--#include file="X001Z001.INC"-->

<%


	wProceso = TRIM(Request.Form("PROCESO"))


	wCLA001 = TRIM(Request.Form("CLA001"))
	
	wC300001CCI = Session("glCiaInternet")
	wC300001CIA = Session("glCia")
	
	wC300001OBR = Replace(TRIM(Request.Form("wDES")), "'", " ")
	
	

	wSTS = TRIM(Request.Form("STS"))
	
	wPUS = Session("glUsuario")	
	wFECHA = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)

	
	
	strCnn	= Application("XDTA300_ConnectionString")


	
	
		Set XDTA300 = Server.CreateObject("ADODB.Connection")
		XDTA300.Open strCnn

		IF wProceso = "Actualizar" or wProceso = "Eliminar" then

			SQL = "UPDATE X300CF001 SET " 
			SQL = SQL & " C300001OBR = '" & wC300001OBR & "', "			
			SQL = SQL & " C300001STS = '" & wSTS & "', "		
			SQL = SQL & " C300001FAC = '" & wFECHA & "' "
			SQL = SQL & " WHERE "		
			SQL = SQL & " C300001CCI ='" & wC300001CCI & "' AND "
			SQL = SQL & " C300001CIA ='" & wC300001CIA & "' AND "
			SQL = SQL & " C300001NDC ='" & wCLA001 & "'"
		END IF
	    'response.write sql
		XDTA300.Execute SQL
		XDTA300.Close 
		set XDTA300 = nothing
		

		'wURL = Session("glUrlBuscar")
		
		'wURL = "X001A108_S.ASP?NOMTAB=X300CQ001H"
	
		wURL = "../ASPX/C001E005.aspx?CAMC01=0&CAMC02=" & wCLA001 & "&URL=../Pedidos/X001A108_S.ASP?NOMTAB=X300CQ001H" 
	    Response.Redirect wURL



%>