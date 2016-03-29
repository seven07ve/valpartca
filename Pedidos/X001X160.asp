<%@ Language=VBScript %>
<% Response.Expires = 0 %>
<% Response.AddHeader "PRAGMA", "NO-CACHE" %>

<% wSTSIMP = Request.QueryString("STSIMP") 
   wIMP = Request.QueryString("IMP")
%>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<title>Maestros</title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<style type="text/css" >

	html{overflow-y:scroll} 

</style>

<!--#include file="X001Z001.INC"-->
<!--#include file="X001Y007.PRC"-->
<%
  Datos_Compania wDEL, wURI			
%>

</head>
<% if wIMP = "S" OR wIMP = "E" THEN
	wcellpadding = "3"
	if wSTSIMP = "E" THEN 
		Response.ContentType = "application/vnd.ms-excel" 
		wcellpadding = "0"
	end if	
	wBorderColor ="#C0C0C0"  %>
	<body onload="window.status='<%=Request.ServerVariables("URL")%>'" style="text-align: center">
		<div align=center>
		<table BORDER="0" WIDTH="100%" cellspacing="0" cellpadding="<%=wcellpadding%>" >
		
		
		
		<%	ELSE %>
	
	
	<body topmargin="0"  leftmargin="17"  bgcolor="<%=Request.Cookies("CAR")("Color1")%>" rightmargin="0" vlink="#0000FF" onload="window.status='<%=Request.ServerVariables("URL")%>'" style="text-align: center" scroll="auto" bottommargin="0">	 
<table border="0" height="100%" width="839" bgcolor="#FFFFFF" cellspacing="0" align="center"  > <tr><td valign="top">
		<table align="center"  BORDER="1" bordercolor="#FFFFFF" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" WIDTH="920" cellspacing="0" cellpadding=4  style="padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px; ">
<%	END IF

	wTIT = Request.QueryString("URLTIT")	
	wURLACT = TRIM(Request.QueryString("URLACT"))
	wNOMTAB = TRIM(Request.QueryString("NOMTAB"))
	wCAMC01 = TRIM(Request.QueryString("CAMC01"))
	wCAMC02 = TRIM(Request.QueryString("CAMC02"))
	wCAMC03 = TRIM(Request.QueryString("CAMC03"))
	wCAMC04 = TRIM(Request.QueryString("CAMC04"))		
	wCAMC05 = TRIM(Request.QueryString("CAMC05"))
	wCAMC06 = TRIM(Request.QueryString("CAMC06"))
	wCAMC07 = TRIM(Request.QueryString("CAMC07"))	
	wCAMC08 = TRIM(Request.QueryString("CAMC08"))	
	
	wPARBUS01 = TRIM(Request.QueryString("PARBUS01"))
	wPARBUS02 = TRIM(Request.QueryString("PARBUS02"))
	wPARBUS03 = TRIM(Request.QueryString("PARBUS03"))
	'wPARBUS04 = TRIM(Request.QueryString("PARBUS04"))


	'wNOMTAB = "X300AQ003"
	'wCAMC01 = "A300003CPR"
	'wCAMC02 = "A300003DEL" 
	'wCAMC03 = "A300003CIN" 
	'wCAMC04 = "A300003STS"	
	
	
	wURLB = "X001X160.ASP?URLTIT=" & wTIT
	wURLB = wURLB & "&NOMTAB=" & wNOMTAB
	wURLB = wURLB & "&CAMC01=" & wCAMC01
	wURLB = wURLB & "&CAMC02=" & wCAMC02  
	wURLB = wURLB & "&CAMC03=" & wCAMC03
	wURLB = wURLB & "&CAMC04=" & wCAMC04 
	wURLB = wURLB & "&CAMC05=" & wCAMC05
	wURLB = wURLB & "&CAMC06=" & wCAMC06  
	wURLB = wURLB & "&CAMC07=" & wCAMC07
	wURLB = wURLB & "&CAMC08=" & wCAMC08   
	wURLB = wURLB & "&URLD=" & "X001X160.ASP"  
	wURLB = wURLB & "&URLACT=" & wURLACT 

	
	
	wFAM = Request.Form("FAMILIA")
	wDES = Request.Form("DESCRIPCION") 
	
	IF wIMP = "S" THEN
	    wFAM = Session("glFamilia")
	    IF wNOMTAB = "X300AQ003" THEN
			wDES = Session("glBusqueda")
		END IF
	    Mostrar_Logo
	    Mostrar_Titulo
	    wCLASS = "TDS"
	    Mostrar_Linea
	  ELSE	  	
		Session("glFamilia") = wFAM
		IF wNOMTAB = "X300AQ003" THEN
			Session("glBusqueda") = wDES
			ELSE
			wDES = Session("glBusqueda")  
		END IF 	
	END IF 	

	
		
	'Mostrar Encabezado para impresion
	if wSTSIMP = "S" THEN
		'Mostrar Titulo
		Mostrar_Titulo
		'Mostrar Encabezado
		wTipo = "E"
		wCLASS = "TDS"
		wShowURL = "N"
		Mostrar_Linea
	   ELSE	
		wShowURL = "S"
	END IF
	
	
	IF wNOMTAB = "X300AF003" THEN
		IF len(trim(Session("glBusqueda"))) > 0 Then
			Session("glBusquedaProductos") = Session("glBusqueda")
		  Else
			 Session("glBusqueda") = Session("glBusquedaProductos")
		End If   
	End If
	
	'Mostrar Encabezado para impresion
    
	
	wCAMXXX = left(wCAMC01,7) 


	strCnn	= Application("XDTA300_ConnectionString")
	
	SQL = "SELECT " & wCAMC01 & ", " & wCAMC02 & ", " & wCAMC03 & ", " & wCAMC04
	If wNOMTAB = "X300AF003" THEN
		SQL = SQL & ", A300003NLP "  
	END IF 
	If wNOMTAB = "X300AQ003" THEN
		SQL = SQL & ", " & wCAMC05 & ", " & wCAMC06 & ", " & wCAMC07 & ", " & wCAMC08 
	  ELSE
		wFAM = 1
	END IF
	SQL = SQL & " FROM " &  wNOMTAB 	
	SQL = SQL & " WHERE "
	SQL = SQL & wCAMXXX & "CCI ='" & Session("glCiaInternet") & "'  "
	'SQL = SQL & " AND " & wCAMXXX & "CIA ='" & Session("glCia") & "' "
	IF wNOMTAB = "X300AF003" AND LEN(TRIM(wPARBUS01)) = 0 AND LEN(TRIM(wPARBUS02)) = 0 AND LEN(TRIM(wPARBUS03)) = 0  THEN
		SQL = SQL & " AND " & wCAMXXX & "CCI ='...'  "
		'Response.Redirect wURLB
		'Response.End
	END IF
	wWHERE = " AND " 
	wRegistros = cint(Session("glRegistros"))	
	IF wNOMTAB = "X300AF003" THEN
		if len(trim(wPARBUS01)) > 0 then
			SQL = SQL & wWHERE
			SQL = SQL & " (" & wCAMC01 & " LIKE '%" & ucase(wPARBUS01) & "%')  "			
		end if	
		if len(trim(wPARBUS02)) > 0 then
			SQL = SQL & wWHERE
			SQL = SQL & " (" & wCAMC02 & " LIKE '%" & ucase(wPARBUS02) & "%')  "
		end if		  
		if wPARBUS03 <> "000" then
			SQL = SQL & wWHERE
			SQL = SQL & " ( A300003NPS = '" & wPARBUS03 & "')  "
		end if		  
		'if wPARBUS04 <> "9" then
		'	SQL = SQL & wWHERE
		'	SQL = SQL & " ( A300003STS = '" & wPARBUS04 & "')  "
		'end if		  
		
	  ELSE
		if len(trim(Session("glBusqueda"))) > 0 then
			SQL = SQL & wWHERE
			SQL = SQL & " ((" & wCAMC01 & " LIKE '%" & ucase(Session("glBusqueda")) & "%') OR  "
			SQL = SQL & "  (" & wCAMC02 & " LIKE '%" & ucase(Session("glBusqueda")) & "%'))  "
			wRegistros = 9999
		end if			
	END IF 
	If wNOMTAB = "X300AF003" THEN
		SQL = SQL & " ORDER BY A300003CPR " 
	END IF

	'Response.Write SQL	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	
    rstQuery.Open sql , strCnn
	wTipo = "D"
	wCLASS = "TDD"
	wCuenta = 0
	wTC03 = 0: wTC04 = 0: wTC05 = 0: wTC07 = 0:	
	
	
	DO WHILE NOT rstQuery.EOF 'and wPAR > 0

		wC01 = trim(rstQuery.Fields(0))
		wC02 = trim(rstQuery.Fields(1))
		wC03 = trim(rstQuery.Fields(2))
		wC04 = 0 'trim(rstQuery.Fields(3))
		
		wC07 = trim(rstQuery.Fields(2))
		If wNOMTAB = "X300AF003" THEN
			wC07 = formatnumber(wC07,0)
		
			wFAM = trim(rstQuery.Fields(4))
						
			SQL = "SELECT B300120DEC "
			SQL = SQL & " FROM X300BF120 " 
			SQL = SQL & " WHERE "
			SQL = SQL & " B300120CCI = '" & Session("glCiaInternet") & "' AND "
			SQL = SQL & " B300120CIA = '" & Session("glCia") & "' AND "		
			SQL = SQL & " B300120NPS = '" & wFAM & "'" 	
			'RESPONSE.WRITE SQL
			Set rstQuery1 = Server.CreateObject("ADODB.Recordset")
			rstQuery1.Open sql , strCnn
			If NOT rstQuery1.EOF Then			
				wDEC = trim(rstQuery1.Fields("B300120DEC"))
			   ELSE
				wDEC = "NO ASIGNADA"
			End If
			rstQuery1.CLOSE
			SET rstQuery1 = NOTHING	
			
			
			SQL = "SELECT A300022CPR "
			SQL = SQL & " FROM X300AF022 " 
			SQL = SQL & " WHERE "
			SQL = SQL & " A300022CCI = '" & Session("glCiaInternet") & "' AND "
			SQL = SQL & " A300022CIA = '" & Session("glCia") & "' AND "		
			SQL = SQL & " A300022CPR = '" & wC01 & "'" 	
			'RESPONSE.WRITE SQL
			Set rstQuery1 = Server.CreateObject("ADODB.Recordset")
			rstQuery1.Open sql , strCnn
			If NOT rstQuery1.EOF Then			
				wC06 = "SI"
			   ELSE
				wC06 = "NO"
			End If
			rstQuery1.CLOSE
			SET rstQuery1 = NOTHING	
			
			wFAM = wDEC 
			
			wTC07 = wTC07 + cdbl(wC07)

		END IF  
		
		wTC04 = wTC04 + cdbl(wC04)
		
			
		
		wC02 = left(wC02,60)		
		
		IF wC03 = "1" THEN
		   wC03 = "Activo"
		  ELSE
   	       wC03 = "Inactivo"
		END IF 

		
		
		'Armar URL
		
		IF wURLACT = "X000A001_S.ASP" THEN
			wURL = wURLACT & "?NOMTAB=X002BQ101" 
			ELSE
			
			wURL = wURLACT & "?CLA001=" & wC01 & "&CLA002=" & Session("glCiaInternet") & "&CLA003=" & Session("glUsuario")  
			wURL = wURL & "&PARBUS01=" & wPARBUS01 & "&PARBUS02=" & wPARBUS02
			wURL = wURL & "&PARBUS03=" & wPARBUS03 & "&PARBUS04=" & wPARBUS04
			
		END IF	

		if Session("glTipoUsuario") = "A" AND wNOMTAB <> "X300AQ003" then
			
			IF wIMP <> "S" THEN
			 	wTIURL = "<font color=""#0000FF"" onclick=""window.open('" & wURL & "','_parent');"" style=""CURSOR: pointer;""><b> "
			 	wTFURL = " </b></font>"
			END IF 
			
			
			
			IF wIMP <> "S" THEN
	
				wURL = "X001X126_S.ASP?CPR=" & wC01 
				wURL = wURL & "&PARBUS01=" & wPARBUS01 & "&PARBUS02=" & wPARBUS02
				wURL = wURL & "&PARBUS03=" & wPARBUS03 & "&PARBUS04=" & wPARBUS04
				wTSURL = "<font color=""#0000FF"" onclick=""window.open('" & wURL & "','_parent');"" style=""CURSOR: pointer;""><b> "

				wURL = "X001X124_S.ASP?CPR=" & wC01 
				wURL = wURL & "&PARBUS01=" & wPARBUS01 & "&PARBUS02=" & wPARBUS02
				wURL = wURL & "&PARBUS03=" & wPARBUS03 & "&PARBUS04=" & wPARBUS04			
				wTHURL = "<font color=""#0000FF"" onclick=""window.open('" & wURL & "','_parent');"" style=""CURSOR: pointer;""><b> "
			END IF 
		   ELSE
		    wTIURL = ""
			wTFURL = ""
			
		END IF   	

		SELECT CASE wNOMTAB
			'Maestro de Clientes
			CASE "X201AF002"
			'Lista de Precio
			
			CASE "X201AF018"
				wC03 = "Detalle"
				wURLD = "X001X105_S.asp?NOMTAB=X201AQ018&CLA001=" & wC01
				wTIDURL = "<A href=" & wURLD & " target=""_parent""> "
				wTFURL = " </A>"

		END SELECT	


		Mostrar_Linea
		rstQuery.MoveNext 
		wCuenta = wCuenta + 1

	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	

	wTIURL = ""
	wTFURL = ""


	IF wCuenta > 0 then
		wCLASS = "TD1"
		wTipo = "T"
		wC01 = wCuenta
		wC02 = "&nbsp;"		
		wC03 = "&nbsp;"
		wC04 = formatnumber(wTC04,0)
		wC05 = "&nbsp;"
		wSUS = "&nbsp;"
		wHOM = "&nbsp;"
		wC05F = "&nbsp;"
		wFAM = "&nbsp;"

		wC06 = "&nbsp;"
		wC07 = formatnumber(wTC07,0)
		wC08 = "&nbsp;"
		wREF = "&nbsp;"
		Mostrar_Linea	
	end if

%>
<%'Incluir Cuerpo del Reporte %>
<!--#include file="X001X160_C.ASP"-->
</table>

</td> </tr> </table> 

		</div>

<% IF wIMP = "S" THEN %>

    <br>
	  <input type="button" name="Imprimir" Value="Imprimir" onclick="window.print()"> 


 <% END IF%>


</body>
</html>
