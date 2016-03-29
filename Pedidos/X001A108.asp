<%@ Language=VBScript %>
<% wSTSIMP = Request.QueryString("STSIMP") %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<title>Pagos</title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<style>

html{overflow-y:scroll} 

</style>
<!--#include file="X001Z001.INC"-->
</head>
<% if wSTSIMP = "S" OR wSTSIMP = "E" THEN
	wcellpadding = "3"
	if wSTSIMP = "E" THEN 
		Response.ContentType = "application/vnd.ms-excel" 
		wcellpadding = "0"
	end if	
	wBorderColor ="#C0C0C0"  %>
	<body onload="window.status='<%=Request.ServerVariables("URL")%>'" >
		<div align=center>

		<table BORDER="1" WIDTH="100%" cellspacing="0" cellpadding="<%=wcellpadding%>"
		  bordercolorlight="<%=wBorderColor%>" bordercolordark="<%=wBorderColor%>" bordercolor="<%=wBorderColor%>">
		  
<%	ELSE %>



<script language="JavaScript" >


  function enviar() {

	if (confirm('¿Desea Eliminar los Pagos Seleccionados?')) {
	   document.frmGral.submit();   
	}
}


</SCRIPT>

<body ALIGN="CENTER" vlink="#0000FF" topmargin="0" rightmargin="0" leftmargin="17" bgcolor="<%=Request.Cookies("CAR")("Color1")%>" >		
		
<FORM NAME="frmGral" METHOD="post" ACTION="X001A108_AS2.asp" target="main">

    <table border="0" height="100%" width="919" bgcolor="#FFFFFF" cellspacing="0" align="center"  > <tr><td valign="top">
     	
		<table BORDER="1" width="919" ALIGN="center" bordercolor="#FFFFFF" cellspacing="0"    > 
<%	END IF

	Function LastDayOfMonth(iMonth, iYear)
		NextMonth = DateAdd("m", 1, DateSerial(iYear, iMonth, "01"))
		LastDayOfMonth = Day(DateAdd("d", -1, NextMonth))
	End Function

	wTIT = Request.QueryString("URLTIT")	
	'wURLACT = TRIM(Request.QueryString("URLACT"))
	wURLACT = "X001A108_A.asp"
	wNOMTAB = Request.QueryString("NOMTAB")
	wSTSPED = Request.QueryString("STSPED")		
	wMES = Request.Form("MES")
	
 
	IF LEN(TRIM(wMES)) = 0 THEN
		'wMES = "0"
		wMES = Right("00" & Month(Now),2)	
	END IF
	
	IF LEN(trim(Request.QueryString("MES"))) > 0 THEN
		wMES = trim(Request.QueryString("MES"))
	END IF 
	
	'response.write wMES
	
	Function LastDayOfMonth(iMonth, iYear)
		NextMonth = DateAdd("m", 1, DateSerial(iYear, iMonth, "01"))
		LastDayOfMonth = Day(DateAdd("d", -1, NextMonth))
	End Function

	wDia_Actual = Right("00" & day(Now()),2)
	wMes_Actual = wMES 
	
	If  CInt(wMES) > Month(Now()) THEN
		wAno_Actual = (Year(Now()) - 1)
	Else
		wAno_Actual = Year(Now())
	End If
	
	wDiaFinal = LastDayOfMonth(wMes_Actual, wAno_Actual)
	wDiaFinal = Right("00" & wDiaFinal, 2)
	
    wFECHAI = wAno_Actual & "-" & wMes_Actual & "-01 00:00:00"
	wFECHAF = wAno_Actual & "-" & wMes_Actual & "-" & wDiaFinal & " 23:59:59"

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
	
	'Mostrar Encabezado para impresion
    
    
    
	'response.write wDiaFinal 

	strCnn	= Application("XDTA300_ConnectionString")
	
		
	SQL = "SELECT "
	SQL = SQL & " C300001NDC, C300001CCL, A300002RSO, C300001FAC, " 
	SQL = SQL & " C300001MCO, C300001STS, C300001NRC, C300001PUS, C300001OBR, "
	SQL = SQL & " (SELECT ISNULL(SUM(C300003MCO),0) FROM X300CF003 WHERE "
	SQL = SQL & " C300003NDC = C300001NDC AND C300003CCI = C300001CCI) AS MCO"
	SQL = SQL & " FROM " & wNOMTAB
	SQL = SQL & " WHERE "
	SQL = SQL & " C300001CCI ='" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " C300001CIA ='" & Session("glCia") & "' AND "
	SQL = SQL & " C300001SPP ='" & wSTSPED & "'  AND"		
	IF wSTSPED = "1" THEN
		If Session("glTipoUsuario") = "C" or Session("glTipoUsuario") = "V" then
			SQL = SQL & " DATEDIFF(day, C300001FAC, Getdate()) <= 90 "		
		  Else
		  	IF wMES <> "1" THEN
				SQL = SQL & " C300001FAC >= '" & wFECHAI & "' AND "
			END IF
			SQL = SQL & " C300001FAC <= '" & wFECHAF & "' "
		End If
	 ELSE
		SQL = SQL & " DATEDIFF(day, C300001FAC, Getdate()) <= 90 "
	END IF 
	wWHERE = " AND "	
	if Session("glTipoUsuario") = "C" then
		SQL = SQL & wWHERE
		SQL = SQL & " C300001CCL = '" & Session("glUsuario") & "' "
	end if
	if Session("glTipoUsuario") = "V" then
		SQL = SQL & wWHERE
		SQL = SQL & " A300002CVE = '" & Session("glCodVendedor") & "' "
	end if
	if Session("glTipoUsuario") = "S" then
		SQL = SQL & wWHERE
		SQL = SQL & " A300002CVE IN "
		SQL = SQL & " ( SELECT A300002CVE FROM X300AQ002 "
		SQL = SQL & " WHERE Z300006PSU = '" & Session("glUsuario") & "' )"
	end if
	if len(trim(Session("glBusqueda"))) > 0 then
		SQL = SQL & wWHERE
		SQL = SQL & " ((C300001CCL LIKE '%" & ucase(Session("glBusqueda")) & "%') OR  "
		SQL = SQL & "  (A300002RSO LIKE '%" & ucase(Session("glBusqueda")) & "%'))  "
	end if	
	SQL = SQL & " ORDER BY C300001FAC DESC " 	
    
    'Response.Write SQL
	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	wTipo = "D"
	wCLASS = "TDD"
	wCuenta = 1
	wCnt = 0 
	wTC04 = 0 
	wTC05 = 0
	wTC06 = 0
	DO WHILE NOT rstQuery.EOF 'and wCuenta < cint(Session("glRegistros"))

	
		IF (Session("glTipoUsuario") = "A" or Session("glTipoUsuario") = "G") and wSTSPED = "0" THEN

			wCHK = "<INPUT TYPE=CHECKBOX NAME=NO>"

		END IF
		
		IF wCuenta = 1 THEN
			wC01 = "&nbsp;"
			wC02 = "&nbsp;"
			wC03 = "&nbsp;"
			wC04 = "&nbsp;"
			wSTS = "&nbsp;"
			wC06 = "&nbsp;"
			wC07 = "&nbsp;"
			
 			
			IF wSTSPED = "0" THEN

				'Mostrar_Linea
			
				IF Session("glTipoUsuario") <> "A" and Session("glTipoUsuario") <> "G" and wSTSPED = "0" THEN
					'Mostrar_Linea
				END IF
			
			END IF
			
		
		
		END IF
		

		wOBJ = right(("0000" & wCuenta),4)
		wNAMP = "P" & wOBJ
		wNAMC = "C" & wOBJ
		
	
		
		wC01 = trim(rstQuery.Fields("C300001NDC"))		
		wC02 = trim(rstQuery.Fields("C300001CCL")) & " - " & LEFT(TRIM(replace(trim(rstQuery.Fields("A300002RSO")),"&"," ")),35)
		wC02 = replace(wC02,"'"," ")
		wC03 = right("0" & day(rstQuery.Fields("C300001FAC")),2) & "-" & right("0" & month(rstQuery.Fields("C300001FAC")),2) & "-" & right(year(rstQuery.Fields("C300001FAC")),2)
		wC04 = trim(rstQuery.Fields("C300001MCO"))		
		wSTS = trim(rstQuery.Fields("C300001STS"))			
		wNRC = trim(rstQuery.Fields("C300001NRC"))
		wOBR = trim(rstQuery.Fields("C300001OBR"))
		wPUS = trim(rstQuery.Fields("C300001PUS"))			
		wC05 = trim(rstQuery.Fields("MCO"))			
		
		
		SQL = " SELECT C300004NRO "
		SQL = SQL &	" FROM  X300CF004 "    
		SQL = SQL & " WHERE "
		SQL = SQL & " C300004CCI ='" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " C300004CIA ='" & Session("glCia") & "' AND "
		SQL = SQL & " C300004NDC ='" & wC01 & "' "
		SQL = SQL & " ORDER BY C300004NRO " 	
		'Response.write SQL
		Set rstQuery2 = Server.CreateObject("ADODB.Recordset")
    	rstQuery2.Open sql , strCnn
    	if NOT rstQuery2.EOF then
			wADJ = "<img src=images/adjunto2.gif alt=""Haz Click en Ver Detalle para Visualizar El Adjunto"">"
			ELSE
			wADJ = "&nbsp;"	
		end if
		rstQuery2.CLOSE
		SET rstQuery2 = NOTHING	
    	
		
		IF wNRC = "0" OR ISNULL(wNRC) THEN
			wNRC = "&nbsp;"
		END IF 
		wSTS2 = wSTS
		Select Case wSTS
		
			Case "1" 
				IF wSTSPED = "0" THEN		
					wSTS = "Sin Comunicar"
				  ELSE
					wSTS = "Conciliando"
				END IF 
		  	Case "2" 
		  		wSTS = "Conciliando"		
	  		Case "C" 
		  		wSTS = "<font color=""blue""><span style=""background-color: #FFFF00""><b>**CONCILIADO**</b></span>"		
		  	Case "3" 
		  		wSTS = "<font color=""blue""><span style=""background-color: #FFFF00""><b>**CONCILIADO**</b></span>"
		  	Case "9" 
		  		wSTS = "<font color=""red"">Rechazado"			
		  			
		End Select
		
		IF ISNULL(wC04) THEN
		    wC04 = "0"
	    END IF 
	    
   	    IF ISNULL(wC06) THEN
		    wC06 = "0"
	    END IF 	
		
		wC07 = "Ver"	
		 
		IF isnull(wC04) then
			wC04 = 0
		end if	
		
		IF wSTS2 <> "9" THEN
			wTC04 = wTC04 + wC04
			wTC05 = wTC05 + wC05
		END IF
		
		
		wC04 = formatnumber(wC04,2)
		wC05 = formatnumber(wC05,2)
		
		wCHK = "<INPUT TYPE=CHECKBOX NAME=" & wNAMC & ">"

		'Armar URL
		'IF wURLACT = "X000A001_S.ASP" THEN
		'	wURL = wURLACT & "?NOMTAB=X002BQ101" 
		'	ELSE
		wURL = wURLACT & "?CLA001=" & wC01 '& "&CLA002=" & wCL2
		wURLD = "X001A109_S.ASP" & "?CLA001=" & wCL1 & "&CLA002=" & wC01 & "&CLA003=" & wSTSPED & "&MES=" & wMES
		'END IF	
		wTDIURL = "<A href=" & wURLD & " target=""_parent""> "
					
		
		IF Session("glTipoUsuario") <> "C" and Session("glTipoUsuario") <> "V" and wSTSPED = "1" THEN					
			wTIURL = "<A href=" & wURL & " target=""main""> "
			wTFURL = " </A>"		
		ELSE
			wTIURL = ""
		END IF 
		
		if wSTSIMP = "S" then
			wTIURL = ""
			wTDIURL = ""
		END IF 



		response.write "<INPUT NAME=" & wNAMP & " size=15 value=" & wC01 & " TYPE=Hidden>"	

		Mostrar_Linea
		rstQuery.MoveNext 
		wCuenta = wCuenta + 1
		wCnt = wCnt + 1
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	

	wTDIURL = ""
	wTIURL = ""
	wTFURL = ""

	IF wCnt > 0 then
		wCLASS = "TD1"
		wTipo = "T"
		wC01 = wCnt
		wC02 = "<b>Totales</b>"		
		wADJ = "&nbsp;"
		wNRC = "&nbsp;"
		wC03 = "&nbsp;"
		wC04 = wTC04
		wC05 = wTC05
		wC06 = wTC06	
		wC06F = round((wTC06/1000),2) 
		wC04 = formatnumber(wC04,2)
		wC05 = formatnumber(wC05,2)
		wC06 = formatnumber(wC06,2)
		wSTS = "&nbsp;"
		wOBR = "&nbsp;"
		wPUS = "&nbsp;"
		wCHK = "&nbsp;"
		wC07 = "&nbsp;"
		'IF Session("glTipoUsuario") <> "A" and wSTSPED = "0" THEN
			Mostrar_Linea	
		'END IF 
		
		IF Session("glTipoUsuario") = "X" THEN
		
			SQL = " SELECT COUNT(*) AS POFI, ISNULL(SUM(C300001MCO),0) AS MOFI "
			SQL = SQL &	" FROM  X300CF001 "    
			SQL = SQL & " WHERE "
			SQL = SQL & " C300001CCI ='" & Session("glCiaInternet") & "' AND "
			SQL = SQL & " C300001CIA ='" & Session("glCia") & "' AND "
		  	IF wMES <> "1" THEN
				SQL = SQL & " C300001FAC >= '" & wFECHAI & "' AND "
			END IF
			SQL = SQL & " C300001FAC <= '" & wFECHAF & "' "
			SQL = SQL & " AND LEFT(LTRIM(C300001NDC),3) = '777' "
			SQL = SQL & " AND C300001SPP = '1' "
			'Response.write SQL
			Set rstQuery = Server.CreateObject("ADODB.Recordset")
    		rstQuery.Open sql , strCnn
    		if NOT rstQuery.EOF then
				wPOFI = cdbl(rstQuery.Fields("POFI"))
				wMOFI = trim(rstQuery.Fields("MOFI"))
			end if
			rstQuery.CLOSE
			SET rstQuery = NOTHING
			
			
			SQL = " SELECT COUNT(*) AS PVEN, ISNULL(SUM(C300001MCO),0) AS MVEN "
			SQL = SQL &	" FROM  X300CF001 "    
			SQL = SQL & " WHERE "
			SQL = SQL & " C300001CCI ='" & Session("glCiaInternet") & "' AND "
			SQL = SQL & " C300001CIA ='" & Session("glCia") & "' AND "
		  	IF wMES <> "1" THEN
				SQL = SQL & " C300001FAC >= '" & wFECHAI & "' AND "
			END IF
			SQL = SQL & " C300001FAC <= '" & wFECHAF & "' "
			SQL = SQL & " AND LEFT(LTRIM(C300001NDC),3) = '888' "
			SQL = SQL & " AND C300001SPP = '1' "
			'Response.write SQL
			Set rstQuery = Server.CreateObject("ADODB.Recordset")
	    	rstQuery.Open sql , strCnn
	    	if NOT rstQuery.EOF then
				wPVEN = cdbl(rstQuery.Fields("PVEN"))
				wMVEN = trim(rstQuery.Fields("MVEN"))
			end if
			rstQuery.CLOSE
			SET rstQuery = NOTHING
		
		
			SQL = " SELECT COUNT(*) AS PCLI, ISNULL(SUM(C300001MCO),0) AS MCLI "
			SQL = SQL &	" FROM  X300CF001 "    
			SQL = SQL & " WHERE "
			SQL = SQL & " C300001CCI ='" & Session("glCiaInternet") & "' AND "
			SQL = SQL & " C300001CIA ='" & Session("glCia") & "' AND "
		  	IF wMES <> "1" THEN
				SQL = SQL & " C300001FAC >= '" & wFECHAI & "' AND "
			END IF
			SQL = SQL & " C300001FAC <= '" & wFECHAF & "' "
			SQL = SQL & " AND LEFT(LTRIM(C300001NDC),3) = '999' "
			SQL = SQL & " AND C300001SPP = '1' "
			'Response.write SQL
			Set rstQuery = Server.CreateObject("ADODB.Recordset")
	    	rstQuery.Open sql , strCnn
	    	if NOT rstQuery.EOF then
				wPCLI = cdbl(rstQuery.Fields("PCLI"))
				wMCLI = trim(rstQuery.Fields("MCLI"))
			end if
			rstQuery.CLOSE
			SET rstQuery = NOTHING
			
			wTPAG = wPOFI+cdbl(wPVEN)+cdbl(wPCLI)
			wTMCO = cdbl(wMOFI)+cdbl(wMVEN)+cdbl(wMCLI)
			
			wPPAO = (wPOFI/wTPAG) * 100
			wPPAV = (wPVEN/wTPAG) * 100
			wPPAC = (wPCLI/wTPAG) * 100
		
			Response.write "</table><table bgcolor=""#FFFFFF"" width=""779"" align=""center"">"
			Response.write "<tr><td align=""center"" colspan=""4"" height=""20"" ></td></tr>"
			Response.write "<tr><td align=""center"" colspan=""4""><font size=""3"" face=""Arial""><b><u>Resumen de Pagos</u></b></td></tr>"

			'TITULOS------------
			Response.write "<tr><td align=""left"" ><font size=""2"" face=""Arial""><b></b></td>"
			Response.write "<td align=""center"" ><font size=""2"" face=""Arial""><b>Pagos</b></td>"
			Response.write "<td align=""right""><font size=""2"" face=""Arial""><b>Monto Bs. F</b></td>"
			Response.write "<td align=""right""><font size=""2"" face=""Arial""><b>% Pagos</b></td></tr>"
			'-------------------

			Response.write "<tr><td align=""left"" ><font size=""2"" face=""Arial""><b>Oficina</b></td>"
			Response.write "<td align=""center""><font size=""2"" face=""Arial"">" & wPOFI & "</td>"
			Response.write "<td align=""right""><font size=""2"" face=""Arial"">" & formatnumber(wMOFI,2) & "</td>"
			Response.write "<td align=""right""><font size=""2"" face=""Arial"">" & formatnumber(wPPAO,0) & "%</td></tr>"

			Response.write "<tr><td align=""left"" ><font size=""2"" face=""Arial""><b>Vendedores</b></td>"
			Response.write "<td align=""center""><font size=""2"" face=""Arial"">" & wPVEN & "</td>"
			Response.write "<td align=""right""><font size=""2"" face=""Arial"">" & formatnumber(wMVEN,2) & "</td>"
			Response.write "<td align=""right""><font size=""2"" face=""Arial"">" & formatnumber(wPPAV,0) & "%</td></tr>"

			Response.write "<tr><td align=""left"" ><font size=""2"" face=""Arial""><b>Clientes</b></td>"
			Response.write "<td align=""center""><font size=""2"" face=""Arial"">" & wPCLI & "</td>"
			Response.write "<td align=""right""><font size=""2"" face=""Arial"">" & formatnumber(wMCLI,2) & "</td>"
			Response.write "<td align=""right""><font size=""2"" face=""Arial"">" & formatnumber(wPPAC,0) & "%</td></tr>"

			'TOTALES-----------
			Response.write "<tr><td align=""left"" height=""30""><font size=""2"" face=""Arial""><b>TOTALES:</b></td>"
			Response.write "<td align=""center""><font size=""2"" face=""Arial""><B>" & wTPAG & "</B></td>"
			Response.write "<td align=""right""><font size=""2"" face=""Arial""><B>" & formatnumber(wTMCO,2) & "</B></td>"
			Response.write "<td align=""right""><font size=""2"" face=""Arial""></td></tr>"
			'------------------

			Response.write "<tr><td align=""center"" colspan=""4"" height=""20"" ></td></tr>"

			Response.write "</table>"
		END IF 
		
		
	end if
		
%>
<%'Incluir Cuerpo del Reporte %>
<!--#include file="X001A108_C.ASP"-->

           
  		</div>



<INPUT TYPE="Hidden" NAME="CUENTA" value="<%=wCuenta%>" >    
</TD></TR></TABLE>


</FORM>

<% IF wSTSIMP = "S"  THEN %>

<script language="javascript">
 window.print()
</script>

<% END IF %>

</body>
</html>

