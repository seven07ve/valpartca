<%

wNOMTAB = TRIM(Request.QueryString("NOMTAB"))
wPARBUS = TRIM(Request.QueryString("PARBUS"))
wCLA001 = TRIM(Request.QueryString("CLA001"))
wPARCON = TRIM(Request.QueryString("PARCON"))


Session("glError") = "N"

if wPARBUS <> "S" THEN
	Session("glBusqueda") = ""
END IF

wPAR = "NOMTAB=" & wNOMTAB & "&PARCON=" & wPARCON 		

SELECT CASE wNOMTAB
 'Maestro de Clientes
	CASE "X300AF002"
		wPAR = wPAR & "&TITULO=Maestro de Clientes" 
		wPAR = wPAR & "&CAMC01=A300002CCL" 
		wPAR = wPAR & "&CAMC02=A300002RSO" 
		wPAR = wPAR & "&CAMC03=A300002NT1" 
		wPAR = wPAR & "&CAMC04=A300002NT1" 
		wPAR = wPAR & "&URLACT=X001X101.ASP" 		
 'Maestro de Productos
	CASE "X300AQ003"
		IF wPARCON = "1" THEN
			wPAR = wPAR & "&TITULO=Precios y existencias para Ventas por contrato colectivo empleados Grupo Gabriel" 
		  ELSE
			wPAR = wPAR & "&TITULO=Consulta de Productos" 
		END IF
		wPAR = wPAR & "&CAMC01=A300003CPR" 
		wPAR = wPAR & "&CAMC02=A300003DEL" 
		wPAR = wPAR & "&CAMC03=A300003CIN" 
		wPAR = wPAR & "&CAMC04=A300003STS" 
		wPAR = wPAR & "&URLACT=X001X102.ASP" 		

 'Tabla de Lista de Precios
	CASE "X300AF018"
		wPAR = wPAR & "&TITULO=Tabla de Lista de Precios" 
		wPAR = wPAR & "&CAMC01=A300018LPR" 
		wPAR = wPAR & "&CAMC02=A300018DEL" 
		wPAR = wPAR & "&CAMC03=A300018STS" 
		wPAR = wPAR & "&CAMC04=A300018STS" 
		wPAR = wPAR & "&URLACT=X001X106.ASP" 		

 'Maestro de Usuarios
	CASE "X300ZF001"
		wPAR = wPAR & "&TITULO=Maestro de Usuarios" 
		wPAR = wPAR & "&CAMC01=Z300001PUS" 
		wPAR = wPAR & "&CAMC02=Z300001NUS" 
		wPAR = wPAR & "&CAMC03=Z300001STS" 
		wPAR = wPAR & "&CAMC04=Z300001PPC" 
		wPAR = wPAR & "&URLACT=X001X103.ASP" 		

 'Maestro de Compa�ias
	CASE "X300ZF002"
		wPAR = wPAR & "&TITULO=Maestro de Compa�ias" 
		wPAR = wPAR & "&CAMC01=Z300002CCI" 
		wPAR = wPAR & "&CAMC02=Z300002DEL" 
		wPAR = wPAR & "&CAMC03=Z300002DEC"
		wPAR = wPAR & "&CAMC04=Z300002DEC" 		 
		wPAR = wPAR & "&URLACT=X001X104.ASP" 		
 
 'Maestro de Compa�ias
	CASE "X300ZQ005"
		wPAR = wPAR & "&TITULO=Relaci�n Gerente-Supervisor" 
		wPAR = wPAR & "&CAMC01=Z300005PSU" 
		wPAR = wPAR & "&CAMC02=NOMSUP" 
		wPAR = wPAR & "&CAMC03=NOMGER"
		wPAR = wPAR & "&CAMC04=Z300005PGE" 		 
		wPAR = wPAR & "&URLACT=X001X104.ASP" 		

END SELECT

	'if Session("glCiaInternet") <> "" then
	'	response.redirect "default.asp"
	'  else
	  wURL = "X001X100_F.ASP?" & wPAR	
	'end if  	


Response.Redirect wURL

%>		
