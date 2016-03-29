<%@ Language=VBScript %>
<% Response.Expires = 0 %>
<% wSTSIMP = Request.QueryString("STSIMP") 
wIMP = Request.QueryString("IMP")
wEXP = Request.Form("VERSION")

%>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<title>PEDIDOS</title>
<% IF wEXP = "0" OR wSTSIMP = "S" THEN %>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<% END IF %>
<style type="text/css">

html{overflow-y:scroll} 


</style> 

<!--#include file="X001Z001.INC"-->

</head>
<% if wSTSIMP = "S" OR wSTSIMP = "E" OR wEXP = "1" OR wEXP = "2" THEN
	wcellpadding = "3"
	if wSTSIMP = "E" THEN 
		Response.ContentType = "application/vnd.ms-excel" 
		wcellpadding = "0"
	end if
	IF wEXP = "0" THEN
		wEXP = ""
	ELSEIF wEXP = "1" THEN 
		Response.ContentType = "application/vnd.ms-excel"
		Response.AddHeader "content-disposition", "inline; filename=Backorders.xls"
	ELSEIF wEXP = "2" THEN 
		Response.ContentType = "application/msword"
		Response.AddHeader "content-disposition", "inline; filename=Backorders.docx"
	END	IF	
	wBorderColor ="#C0C0C0"  %>
	<body onload="window.status='<%=Request.ServerVariables("URL")%>'" style="text-align: center">
		<div align=center>
		<table BORDER="1" WIDTH="100%" cellspacing="0" cellpadding="<%=wcellpadding%>"
		  bordercolorlight="<%=wBorderColor%>" bordercolordark="<%=wBorderColor%>" bordercolor="<%=wBorderColor%>">
<%	ELSE %>
	<body topmargin="0" leftmargin="18" rightmargin="0" bottommargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>" vlink="#0000FF" onload="window.status='<%=Request.ServerVariables("URL")%>'" style="text-align: center" scroll="auto">
		<table border="0" align="center" width="919" height="100%" bgcolor="#ffffff" cellpadding="0" cellspacing="0">
		<tr>
		<td valign="top"  > 
	
		<table BORDER="1" width="919" bordercolor="#FFFFFF" cellspacing="0" align="center"  >
<%	END IF

	wTIT = Request.QueryString("URLTIT")	
	wURLACT = TRIM(Request.QueryString("URLACT"))		
	wNOMTAB = "X300BQ102"
	wPAR = wPAR & "&CAMC01=B300120CPR" 
	wCAMC01 = "B300102CPR"
	wCAMC02 = "A300003REF" 
	wCAMC03 = "A300003DEL" 
	wCAMC04 = "B300102NPE"	
	wCAMC05 = "B300102BCK"	
	wCAMC06 = "B300102FEC"	
	wFAM = Request.Form("FAMILIA") 
	wDES = Request.Form("DES") 
	wIMP = Request.QueryString("IMP")
	'response.write wFAM 
	'response.write wEXP	
	IF wIMP = "S" THEN
	    wFAM = Session("glFamilia")
	    wDES = Session("glDescripcion")
	    Mostrar_Titulo
	    wCLASS = "TDS"
	    Mostrar_Linea
	  ELSE
		Session("glFamilia") = wFAM
		Session("glDescripcion") = wDES
	END IF 	
	
	
	'Mostrar Encabezado para impresion
	if wSTSIMP = "S" OR wEXP = "1" OR wEXP = "2" THEN
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
    
	
	wCAMXXX = left(wCAMC01,7) 

	IF Session("glTipoUsuario") = "C" THEN 
	   wFAM = Session("glUsuario") 
	END IF
		
	strCnn	= Application("XDTA300_ConnectionString")
	
	SQL = "SELECT Z300002ERP FROM X300ZF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300002CCI = '" & Session("glCiaInternet") & "' "
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	if NOT rstQuery.EOF then
		wERP = trim(rstQuery.Fields("Z300002ERP"))
	end if
	rstQuery.CLOSE
	SET rstQuery = NOTHING	

	
	SQL = "SELECT " & wCAMC01 & ","
	IF wERP = "SAP" THEN	
		 SQL = SQL & wCAMC02 
	ELSE
		SQL = SQL & " (SELECT A300015HOM FROM X300AF015 WHERE "
		SQL = SQL & " A300015CCL = B300102CCL AND "
		SQL = SQL & " A300015CPR = B300102CPR AND "
		SQL = SQL & " A300015CCI = B300102CCI) AS A300003REF "
	END IF 	 
	SQL = SQL & ", " & wCAMC03 & ", " & wCAMC04 
	SQL = SQL & ", " & wCAMC05 & ", " & wCAMC06 
	SQL = SQL & ", B300102CCL, A300002RSO, B300102PRE" 
	SQL = SQL & " FROM " &  wNOMTAB 		
	SQL = SQL & " WHERE "
	SQL = SQL & wCAMXXX & "CCI ='" & Session("glCiaInternet") & "'  "
	SQL = SQL & " AND " & wCAMXXX & "CIA ='" & Session("glCia") & "' "
	 
	If len(trim(wFAM)) > 0 and wFAM <> "000" then
		SQL = SQL & " AND B300102CCL ='" & wFAM & "' "
	End if 
	IF Session("glTipoUsuario") = "V" THEN
		SQL = SQL & " AND B300102CVE ='" & Session("glCodVendedor") & "' "
	END IF
	'SQL = SQL & " AND B300102STS = '1' "		
	If Session("glTipoUsuario") = "C" then
		SQL = SQL & " AND B300102CCL ='" & Session("glUsuario") & "' "		
	End If
	
	If len(trim(wDES)) > 0 then
		
		SQL = SQL & " AND "
		SQL = SQL & " (( B300102CCL LIKE '%" & ucase(wDES) & "%') OR  "
		SQL = SQL & "  ( A300002RSO LIKE '%" & ucase(wDES) & "%') OR  "
		SQL = SQL & " ( " & wCAMC01 & " LIKE '%" & ucase(wDES) & "%') OR "
		SQL = SQL & " ( " & wCAMC02 & " LIKE '%" & ucase(wDES) & "%') OR "
		SQL = SQL & " ( " & wCAMC03 & " LIKE '%" & ucase(wDES) & "%') OR "
		SQL = SQL & " ( " & wCAMC04 & " LIKE '%" & ucase(wDES) & "%') ) "
	End If 
				
	SQL = SQL & " ORDER BY B300102CCL, B300102FEC  "

	wRegistros = cint(Session("glRegistros"))	

	'Response.Write SQL	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	
    rstQuery.Open sql , strCnn
	wTipo = "D"
	wCLASS = "TDD"
	wCuenta = 0
	wTC03 = 0:	wTC04 = 0:	wTC05 = 0:	wCCL2 = 0
	'If Session("glTipoUsuario") <> "C" then
	  	  	
	DO WHILE NOT rstQuery.EOF and (len(trim(wFAM)) > 0 or wDES <> "")
		
		wC01 = trim(rstQuery.Fields(0))
		wC02 = trim(rstQuery.Fields(1))
		wC03 = trim(rstQuery.Fields(2))
		wC04 = trim(rstQuery.Fields(3))
		wC05 = trim(rstQuery.Fields(4))
		wC06 = trim(rstQuery.Fields(5))
		wCCL = trim(rstQuery.Fields(6))
		wC06 = right("0" & Day(wC06),2) & "-" & right("0" & Month(wC06),2) & "-" & Year(wC06)	
		wC07 = trim(rstQuery.Fields(8))
		wC07 = FormatNumber(wC07,2)	
		wURL = "X001X120_A.asp?CPR=" & Replace(wC01," ","%20") & "&CCL=" & wCCL & "&NPE=" & wC04
	
		if Session("glTipoUsuario") = "A" or Session("glTipoUsuario") = "V" then
			wTIURL = "<A href=" & wURL & " target=""_parent""> "
			wTFURL = " </A>"
		   ELSE
			wTIURL = ""
			wTFURL = ""
		END IF   	

			
		IF wCCL2 <> trim(rstQuery.Fields(6)) THEN
				wTIT = trim(rstQuery.Fields(6)) & " - " & trim(rstQuery.Fields(7)) 
				Mostrar_Titulo			
			    wCCL2 = trim(rstQuery.Fields(6))
		END IF 


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
		IF wIMP = "S" THEN
			wCLASS = "TD2"
		END IF 
		'response.write wCLASS 
		wTipo = "T"
		wC01 = wCuenta
		wC02 = "&nbsp;"		
		wC03 = "&nbsp;"
		wC04 = "&nbsp;"
		wC05 = "&nbsp;"
		wC06 = "&nbsp;"
		wC07 = "&nbsp;"
		wC08 = "&nbsp;"
		Mostrar_Linea	
	end if

%>
<%'Incluir Cuerpo del Reporte %>
<!--#include file="X001X120_C.ASP"-->
</table>

</td> 
</tr> 
</table> 
<% IF wIMP = "S" THEN %>
      <br>
	  <input type="button" name="Imprimir" Value="Imprimir" onclick="window.print()"> 
<% END IF %>

</body>
</html>
