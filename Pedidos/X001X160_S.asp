<% Response.Expires = 0 %>
<% Response.AddHeader "PRAGMA", "NO-CACHE" 


wNOMTAB = TRIM(Request.QueryString("NOMTAB"))
wORG = TRIM(Request.QueryString("ORG"))
wPARBUS = TRIM(Request.QueryString("PARBUS"))
wPARBUS01 = TRIM(Request.QueryString("PARBUS01"))
wPARBUS02 = TRIM(Request.QueryString("PARBUS02"))
wPARBUS03 = TRIM(Request.QueryString("PARBUS03"))
wPARBUS04 = TRIM(Request.QueryString("PARBUS04"))
wCLA001 = TRIM(Request.QueryString("CLA001"))


Session("glError") = "N"

if wPARBUS <> "S" THEN
	Session("glBusqueda") = ""
END IF

wPAR = "NOMTAB=" & wNOMTAB

SELECT CASE wNOMTAB
 'Maestro de Clientes
	CASE "X300AF002"
		wPAR = wPAR & "&TITULO=Maestro de Clientes" 
		wPAR = wPAR & "&CAMC01=A300002CCL" 
		wPAR = wPAR & "&CAMC02=A300002RSO" 
		wPAR = wPAR & "&CAMC03=A300002NT1" 
		wPAR = wPAR & "&CAMC04=A300002NT1" 
		wPAR = wPAR & "&URLACT=X001X101.ASP" 	
	'Consulta de Productos
	CASE "X300AQ003"
		wPAR = wPAR & "&TITULO=Consulta de Productos" 
		wPAR = wPAR & "&CAMC01=A300003CPR" 
		wPAR = wPAR & "&CAMC02=A300003DEL" 
		wPAR = wPAR & "&CAMC03=A300003CIN" 
		wPAR = wPAR & "&CAMC04=A300003STS" 
		wPAR = wPAR & "&CAMC05=A300003PUA"
		wPAR = wPAR & "&CAMC06=A300003MAR"
		wPAR = wPAR & "&CAMC07=A300003REF"
		wPAR = wPAR & "&CAMC08=A300003PIM"		 
		
		wPAR = wPAR & "&URLACT=X001X102.ASP" 					
 'Maestro de Productos
	CASE "X300AF003"
		wPAR = wPAR & "&TITULO=Maestro de Productos" 
		wPAR = wPAR & "&CAMC01=A300003CPR" 
		wPAR = wPAR & "&CAMC02=A300003DEL" 
		wPAR = wPAR & "&CAMC03=A300003CIN" 
		wPAR = wPAR & "&CAMC04=A300003TRA" 
		wPAR = wPAR & "&PARBUS01=" & wPARBUS01		 
		wPAR = wPAR & "&PARBUS02=" & wPARBUS02		 
		wPAR = wPAR & "&PARBUS03=" & wPARBUS03		 
		wPAR = wPAR & "&PARBUS04=" & wPARBUS04		 
		wPAR = wPAR & "&ORG=" & wORG		 
		'wPAR = wPAR & "&CAMC05=A300003PUA"
		'wPAR = wPAR & "&CAMC06=A300003MAR"
		'wPAR = wPAR & "&CAMC07=A300003REF"
		'wPAR = wPAR & "&CAMC08=A300003PIM"
		wPAR = wPAR & "&URLACT=../ASPX/C001M003.ASPX" 
		'wPAR = wPAR & "&URLACT=ASPX/C001M003.ASPX" 
   'Tabla de Bancos Clientes
	CASE "X300AF025"
		wPAR = wPAR & "&TITULO=Bancos de Clientes" 
		wPAR = wPAR & "&CAMC01=A300025CBN" 
		wPAR = wPAR & "&CAMC02=A300025DEL" 
		wPAR = wPAR & "&CAMC03=A300025PUS" 
		wPAR = wPAR & "&CAMC04=A300025FAC" 
		wPAR = wPAR & "&URLACT=X001X109.ASP"
   'Tabla de Bancos Compañia
	CASE "X300AF034"
		wPAR = wPAR & "&TITULO=Bancos de Compañia" 
		wPAR = wPAR & "&CAMC01=A300034CBN" 
		wPAR = wPAR & "&CAMC02=A300034DEL" 
		wPAR = wPAR & "&CAMC03=A300034PUS" 
		wPAR = wPAR & "&CAMC04=A300034FAC" 
		wPAR = wPAR & "&URLACT=X001X106.ASP" 		
	'Tabla de Familias	
	CASE "X300BF121"
		wPAR = wPAR & "&TITULO=Maestro de Familias" 
		wPAR = wPAR & "&CAMC01=B300121NLP" 
		wPAR = wPAR & "&CAMC02=B300121DEC" 
		wPAR = wPAR & "&CAMC03=B300121NPS" 
		wPAR = wPAR & "&CAMC04=B300121STS" 
		wPAR = wPAR & "&URLACT=../ASPX/C001M002.ASPX" 		
   		'wPAR = wPAR & "&URLACT=ASPX/C001M002.ASPX" 
    
	'Tabla de Regionales
	CASE "X300PF700"
		wPAR = wPAR & "&TITULO=Deporte / Hobbies  / Procedencia" 
		wPAR = wPAR & "&CAMC01=P300700CON" 
		wPAR = wPAR & "&CAMC02=P300700DES" 
		wPAR = wPAR & "&CAMC03=P300700PUS" 
		wPAR = wPAR & "&CAMC04=P300700FAC" 
		wPAR = wPAR & "&URLACT=X001X165.ASP" 	
	
	'TIpos de Proyecto
	CASE "X300PF701"
		wPAR = wPAR & "&TITULO=Tipos de Proyecto" 
		wPAR = wPAR & "&CAMC01=P300701CON" 
		wPAR = wPAR & "&CAMC02=P300701DES" 
		wPAR = wPAR & "&CAMC03=P300701PUS" 
		wPAR = wPAR & "&CAMC04=P300701FAC" 
		wPAR = wPAR & "&URLACT=X001X168.ASP" 	
	
	
 	'Sector / Canal
	CASE "X300PF702"
		wPAR = wPAR & "&TITULO=Sector / Canal" 
		wPAR = wPAR & "&CAMC01=P300702CON" 
		wPAR = wPAR & "&CAMC02=P300702DES" 
		wPAR = wPAR & "&CAMC03=P300702PUS" 
		wPAR = wPAR & "&CAMC04=P300702FAC" 
		wPAR = wPAR & "&URLACT=X001X166.ASP"
		
	'Accesorio de Equipos
	CASE "X300PF703"
		wPAR = wPAR & "&TITULO=Accesorio de Equipos" 
		wPAR = wPAR & "&CAMC01=P300703CON" 
		wPAR = wPAR & "&CAMC02=P300703DES" 
		wPAR = wPAR & "&CAMC03=P300703PUS" 
		wPAR = wPAR & "&CAMC04=P300703FAC" 
		wPAR = wPAR & "&URLACT=X001X167.ASP"	
			
    'Tabla de Regionales
	CASE "X300PF704"
		wPAR = wPAR & "&TITULO=Regionales" 
		wPAR = wPAR & "&CAMC01=P300704CRE" 
		wPAR = wPAR & "&CAMC02=P300704DES" 
		wPAR = wPAR & "&CAMC03=P300704PUS" 
		wPAR = wPAR & "&CAMC04=P300704FAC" 
		wPAR = wPAR & "&URLACT=X001X163.ASP" 	
		
	'Tabla de Ciudades
	CASE "X300PF705"
		wPAR = wPAR & "&TITULO=Ciudades" 
		wPAR = wPAR & "&CAMC01=P300705COD" 
		wPAR = wPAR & "&CAMC02=P300705DES" 
		wPAR = wPAR & "&CAMC03=P300705PUS" 
		wPAR = wPAR & "&CAMC04=P300705FAC" 
		wPAR = wPAR & "&URLACT=X001X164.ASP"

	'Tabla de Productos de Interes
	CASE "X300PF706"
		wPAR = wPAR & "&TITULO=Productos de Interes" 
		wPAR = wPAR & "&CAMC01=P300706CON" 
		wPAR = wPAR & "&CAMC02=P300706LIN" 
		wPAR = wPAR & "&CAMC03=P300706TIP" 
		wPAR = wPAR & "&CAMC04=P300706MAR" 
		wPAR = wPAR & "&URLACT=X001X172.ASP"
		
	'Linea Productos de Interes
	CASE "X300PF707"
		wPAR = wPAR & "&TITULO=Linea Productos de Interes" 
		wPAR = wPAR & "&CAMC01=P300707LIN" 
		wPAR = wPAR & "&CAMC02=P300707DEC" 
		wPAR = wPAR & "&CAMC03=P300707PUS" 
		wPAR = wPAR & "&CAMC04=P300707FAC" 
		wPAR = wPAR & "&URLACT=X001X169.ASP"

	'Familia / Tipo Productos de Interes
	CASE "X300PF708"
		wPAR = wPAR & "&TITULO=Familia / Tipo Productos de Interes" 
		wPAR = wPAR & "&CAMC01=P300708TIP" 
		wPAR = wPAR & "&CAMC02=P300708DEC" 
		wPAR = wPAR & "&CAMC03=P300708PUS" 
		wPAR = wPAR & "&CAMC04=P300708FAC" 
		wPAR = wPAR & "&URLACT=X001X170.ASP"
		
	'Marca Productos de Interes
	CASE "X300PF709"
		wPAR = wPAR & "&TITULO=Marca Productos de Interes" 
		wPAR = wPAR & "&CAMC01=P300709MAR" 
		wPAR = wPAR & "&CAMC02=P300709DEC" 
		wPAR = wPAR & "&CAMC03=P300709PUS" 
		wPAR = wPAR & "&CAMC04=P300709FAC" 
		wPAR = wPAR & "&URLACT=X001X171.ASP"	 		
		
   'Maestro de Usuarios
	CASE "X300ZF001"
		wPAR = wPAR & "&TITULO=Maestro de Usuarios" 
		wPAR = wPAR & "&CAMC01=Z300001PUS" 
		wPAR = wPAR & "&CAMC02=Z300001NUS" 
		wPAR = wPAR & "&CAMC03=Z300001STS" 
		wPAR = wPAR & "&CAMC04=Z300001PPC" 
		wPAR = wPAR & "&URLACT=X001X103.ASP" 		

 'Maestro de Compañias
	CASE "X300ZF002"
		wPAR = wPAR & "&TITULO=Maestro de Compañias" 
		wPAR = wPAR & "&CAMC01=Z300002CCI" 
		wPAR = wPAR & "&CAMC02=Z300002DEL" 
		wPAR = wPAR & "&CAMC03=Z300002DEC"
		wPAR = wPAR & "&CAMC04=Z300002DEC" 		 
		wPAR = wPAR & "&URLACT=X001X104.ASP" 		
 
 'Maestro de Compañias
	CASE "X300ZQ005"
		wPAR = wPAR & "&TITULO=Relación Gerente-Supervisor" 
		wPAR = wPAR & "&CAMC01=Z300005PSU" 
		wPAR = wPAR & "&CAMC02=NOMSUP" 
		wPAR = wPAR & "&CAMC03=NOMGER"
		wPAR = wPAR & "&CAMC04=Z300005PGE" 		 
		wPAR = wPAR & "&URLACT=X001X104.ASP" 		

END SELECT

	'if Session("glCiaInternet") <> "" then
	'	response.redirect "default.asp"
	'  else
	  wURL = "X001X160_F.ASP?" & wPAR	
	'end if  	


'Response.write wPARBUS01 & "-" & wPARBUS02 & "-" & wPARBUS03 & "-" & wPARBUS04 
Response.Redirect wURL

%>		
