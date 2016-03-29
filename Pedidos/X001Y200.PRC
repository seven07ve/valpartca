<%
Function CargaVendedores()


	Dim  cbVendedor
	
	'Chequear si el combo de vendedores esta en cache
	cbVendedor = Application("CargaVendedores")
	
	if cbVendedor = "" then
		'No esta en cache por lo tanto se armara se dejara en cache
		StrQuote = Chr(34)

		strCnn	= Application("XDTA300_ConnectionString")
		SQL = " SELECT Z300001CVE, Z300001PUS, Z300001NUS "
		SQL = SQL & " FROM X300ZF001 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " Z300001CCI ='" & wCCI & "' AND "
		SQL = SQL & " Z300001CIA ='" & wCIA & "'  "
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		
		cbVendedor = "<SELECT NAME="  & StrQuote & "VENDEDOR" & StrQuote & ">"

		cbVendedor = cbVendedor & "<OPTION VALUE=" & StrQuote & "000" & StrQuote & ">Todos</OPTION>"
		DO WHILE not rstQuery.EOF 

			wCVE = trim(rstQuery.Fields("Z300001CVE"))
			wPUS = trim(rstQuery.Fields("Z300001PUS"))
			wNUS = trim(rstQuery.Fields("Z300001NUS"))
			
			cbVendedor = cbVendedor & "<OPTION VALUE=" & StrQuote & wCVE & StrQuote & ">"  & wNUS  & "</OPTION>"
			
			rstQuery.MoveNext
		LOOP
		cbVendedor = cbVendedor & "</SELECT>" 
		rstQuery.CLOSE
		SET rstQuery = NOTHING	

		Application("CargaVendedores") = cbVendedor
	
	end if  

	CargaVendedores = cbVendedor
	
end Function
%>