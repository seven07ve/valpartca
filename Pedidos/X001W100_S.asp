<%


	Session("glError") = "N"

	wPAR = wPAR & "TITULO=Transferir Datos a mi PC" 
	wPAR = wPAR & "&CAMC01=A300002CCL" 
	wPAR = wPAR & "&URLACT=X001W003.ASP" 		
	wURL = "X001W100_F.ASP?" & wPAR

	Response.Redirect wURL

%>		
