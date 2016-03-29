<%@ Language=VBScript %>
<% wSTSIMP = Request.QueryString("STSIMP") 
wIMP = Request.QueryString("IMP")

%>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<title>Estado de Cuenta</title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">

<style type="text/css">

html{overflow-y:scroll} 


</style> 

<script language="Javascript">


function OpenBrWindow(theURL,winName,features, myWidth, myHeight, isCenter) { //v3.0
	if(window.screen)if(isCenter)if(isCenter=="true"){
		var myLeft = (screen.width-myWidth)/2;
		var myTop = (screen.height-myHeight)/2;
		features+=(features!='')?',':'';
		features+=',left='+myLeft+',top='+myTop;
	}
	window.open(theURL,winName,features+((features!='')?',':'')+'width='+myWidth+',height='+myHeight);
}


</script>

<!--#include file="X001Z001.INC"-->
<!--#include file="X001Y007.PRC"-->
<%
  Datos_Compania wDEL, wURI			
%>
</head>
<% if wSTSIMP = "S" OR wSTSIMP = "E" THEN
	wcellpadding = "3"
	if wSTSIMP = "E" THEN 
		Response.ContentType = "application/vnd.ms-excel" 
		wcellpadding = "0"
	end if	
	wBorderColor ="#C0C0C0"  %>
	<body onload="window.status='<%=Request.ServerVariables("URL")%>'" style="text-align: center">
	<p align="left"  ><img border="0" src="<%=wURI%>" width="300" ></p>

		<div align=center>
		<table BORDER="1" WIDTH="100%" cellspacing="0" cellpadding="<%=wcellpadding%>"
		  bordercolorlight="<%=wBorderColor%>" bordercolordark="<%=wBorderColor%>" bordercolor="<%=wBorderColor%>">
<%	ELSE %>
	<body topmargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>" bottommargin="0" leftmargin="17" rightmargin="0" vlink="#0000FF" onload="window.status='<%=Request.ServerVariables("URL")%>'" style="text-align: center" scroll="yes">
		<table border="0" align="center" width="919" height="100%" bgcolor="#ffffff" cellpadding="0" cellspacing="0">
		<tr>
		<td valign="top"  > 

		
		<div >
		<table BORDER="0" WIDTH="919" cellpadding="6" cellspacing="1" bordercolor="#FFFFFF" align="center" >
<%	END IF

	wTIT = Request.QueryString("URLTIT")	
	wURLACT = TRIM(Request.QueryString("URLACT"))	
	wIMP = TRIM(Request.QueryString("IMP"))		
	wCVE = TRIM(Request.QueryString("CVE"))		
	
	wNOMTAB = "X300CQ204"
	wPAR = wPAR & "&CAMC01=B300120CPR" 
	wCAMC01 = "C300204CCL"
	wCAMC02 = "C300204NFA" 
	wCAMC03 = "A300002RSO" 
	wCAMC04 = "C300204MOT"	
	wCAMC05 = "C300204TDO"	
	wCAMC06 = "C300204FPR"	
	wCAMC07 = "C300204FVF"	
	wCAMC08 = "C300204SNV"
	wCAMC09 = "C300204SEA"
	wCAMC10 = "C300204SEB"
	wCAMC11 = "C300204SEC"	
	wCAMC12 = "C300204SED"		
		
	wFAM = Request.Form("FAMILIA") 
	wDES = Request.Form("DES") 
	
	
	IF wIMP = "S" THEN
	    wFAM = Session("glFamilia")
	    wDES = Session("glDescripcion")
	  	Mostrar_Titulo
		'Mostrar Encabezado
		wTipo = "E"
		wCLASS = "TDS"
		wShowURL = "N"
		Mostrar_Linea
	  ELSE
		Session("glFamilia") = wFAM
		Session("glDescripcion") = wDES
		wShowURL = "S"
	END IF 	

		
	'Mostrar Encabezado para impresion
	if wSTSIMP = "S" THEN
		'Mostrar Titulo
		'Mostrar_Titulo
		'Mostrar Encabezado
		'wTipo = "E"
		'wCLASS = "TDS"
		'wShowURL = "N"
		'Mostrar_Linea
	   ELSE	
		wShowURL = "S"
	END IF
	
	'Mostrar Encabezado para impresion
    
	
	wCAMXXX = left(wCAMC01,7) 


	strCnn	= Application("XDTA300_ConnectionString")
	
	SQL = "SELECT Z300002TDO "
	SQL = SQL & " FROM X300ZF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300002CCI = '" & Session("glCiaInternet") & "' "
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	if NOT rstQuery.EOF then
		wTDO = trim(rstQuery.Fields("Z300002TDO"))
	end if
	rstQuery.CLOSE
	SET rstQuery = NOTHING
		
	
	'SQL = "SELECT A300003PIM FROM dbo.X300AF003 "
	'SQL = SQL & " GROUP BY A300003PIM "
	'Set rstQuery = Server.CreateObject("ADODB.Recordset")
	'rstQuery.Open sql , strCnn
	'if NOT rstQuery.EOF then
	'	wPIM = CDBL(rstQuery.Fields("A300003PIM"))
	'end if
	'rstQuery.CLOSE
	'SET rstQuery = NOTHING
	
	wPIM = 0 
	
	'response.write "Vendedor: " & wCVE


	SQL = "SELECT " & wCAMC01 & ", " & wCAMC02 
	SQL = SQL & ", " & wCAMC03 & ", " & wCAMC04 
	SQL = SQL & ", " & wCAMC05 & ", " & wCAMC06 
	SQL = SQL & ", " & wCAMC07 & ", " & wCAMC08
	SQL = SQL & ", " & wCAMC09 & ", " & wCAMC10  
	SQL = SQL & ", " & wCAMC11 & ", " & wCAMC12
	
	SQL = SQL & ", ISNULL((SELECT C300001NDC FROM X300CF002,X300CF001 "
 	SQL = SQL & " WHERE "
 	SQL = SQL & " C300204CCI = C300001CCI AND "
 	SQL = SQL & " C300002NFA = C300204NFA AND "
 	SQL = SQL & " C300002TDO = C300204TDO AND "
 	SQL = SQL & " C300002NDC = C300001NDC AND "
 	SQL = SQL & " C300001SPP = '1' "
 	SQL = SQL & " AND C300001STS <> '9' "
 	SQL = SQL & " ),0) AS NDC, "
 	
 	SQL = SQL & " CASE WHEN "
 	SQL = SQL & " cast(len(ISNULL(( "
 	SQL = SQL & " SELECT C300002NFA FROM X300CF002,X300CF001 "
 	SQL = SQL & " WHERE "
 	SQL = SQL & " C300204CCI = C300001CCI AND "
 	SQL = SQL & " C300002TDO = C300204TDO AND "
 	SQL = SQL & " C300002NFA = C300204NFA AND "
 	SQL = SQL & " C300002NDC = C300001NDC AND "
 	SQL = SQL & " C300001SPP = '1' "
	SQL = SQL & " AND C300001STS <> '9' "
	SQL = SQL & " ),0) ) as integer) = 1 "
	SQL = SQL & " THEN "
	SQL = SQL & " 'NO' "
	SQL = SQL & " ELSE "
	SQL = SQL & " 'SI' "
	SQL = SQL & " END  AS STS "  
	
	SQL = SQL & " FROM " &  wNOMTAB 		
	SQL = SQL & " WHERE "
	SQL = SQL & wCAMXXX & "CCI ='" & Session("glCiaInternet") & "'  "
	SQL = SQL & " AND " & wCAMXXX & "CIA ='" & Session("glCia") & "' "
	If len(trim(wCVE)) > 0  AND wCVE <> "000" Then
		SQL = SQL & " AND C300204CVE ='" & wCVE & "' "
	End If
	If len(trim(wFAM)) > 0 and wFAM <> "000" and wFAM <> "999" then
		SQL = SQL & " AND C300204CCL ='" & wFAM & "' "
	End if 
	If Session("glTipoUsuario") = "V" Then
		SQL = SQL & " AND C300204CVE ='" & Session("glCodVendedor") & "' "
	End If
	If Session("glTipoUsuario") = "C" Then
		'SQL = SQL & " AND C300204TDO ='FAC' "
	End If
	SQL = SQL & " AND C300204TDO IN (" & wTDO & ")"
	If len(trim(wDES)) > 0 then
		SQL = SQL & " AND "
		SQL = SQL & " (( C300204CCL LIKE '%" & ucase(wDES) & "%') OR  "
		SQL = SQL & "  ( A300002RSO LIKE '%" & ucase(wDES) & "%'))  "
	End If 				'0
	If Session("glTipoUsuario") = "C" OR Session("glTipoUsuario") = "CP" then
		SQL = SQL & " AND C300204CCL ='" & Session("glUsuario") & "' "		
	End If
	SQL = SQL & " ORDER BY C300204CVE, C300204CCL, C300204FPR " 
	
	'Response.Write SQL	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	
    rstQuery.Open sql , strCnn
	wTipo = "D"
	wCLASS = "TDD"
	wCLASS2 = "TDD2"

	wCuenta = 0
	wTCuenta = 0 
	wTC08 = 0
	wTC09 = 0
	wTC10 = 0
	wCS08 = 0
	wTTC08 = 0
	wTTC09 = 0
	wTTC10 = 0
	wTTC08 = 0
	wCCL = "0"
	wC10 = 0 
	DO WHILE NOT rstQuery.EOF and (len(trim(wFAM)) > 0 or Session("glTipoUsuario") = "C")
		
		IF wCCL <> trim(rstQuery.Fields(0)) THEN
				
				IF wCCL <> "0" Then
					
					 Imprimir_Sub_Totales
					 					 		
					 wCuenta = 0			 
					 wTC06 = 0
					 wTC07 = 0
					 wCS08 = 0
					 wTC09 = 0
					 wTC10 = 0
					 
				End If
				
				wTIT = trim(rstQuery.Fields(0)) & " - " & trim(rstQuery.Fields(2)) 
				wTC07 = 0
				Mostrar_SubTitulo			
			    wCCL = trim(rstQuery.Fields(0))
		END IF 

		wC01 = trim(rstQuery.Fields(1))
		wC02 = trim(rstQuery.Fields(3))
		wC03 = trim(rstQuery.Fields(4))
		wC04 = trim(rstQuery.Fields(5))	
		wC05 = trim(rstQuery.Fields(6))	
		wC06 = trim(rstQuery.Fields(7))	
		'wC07 = trim(rstQuery.Fields(8))
		wCS08 = wCS08 + cdbl(trim(rstQuery.Fields(7)))
		
		'No Vencido
		wC09 = trim(rstQuery.Fields(10))
	
		'Vencido
		wC10 = cdbl(rstQuery.Fields(11))
		
		'response.write DateDiff("d",wC05,now)
		
		
		
		wNDC = TRIM(rstQuery.Fields(12))
		wSTS = ""
		wSTS = TRIM(rstQuery.Fields(13))
		
		IF wC06 < 0 THEN
			wC07 = wC06
			wC06 = 0
			ELSE
			wC07 = 0
		END IF 
		
		IF DateDiff("d",wC05,now) > 0 Then
			wC10 = wC06
			wC09 = 0
			else
			wC10 = 0
			wC09 = wC06
		END IF	
		
		IF wSTS = "SI" THEN
			wSTS = "<font color=""blue"" onclick=""javascript:OpenBrWindow('X001A110.asp?CLA001=" & wNDC & "','Imprimir',"
			wSTS = wSTS & "'menubar=0,resizable=0,location=0,status=0,scrollbars=1,directories=0,width=750,"
			wSTS = wSTS & "height=700','750','700','true')"" style=""CURSOR: pointer"">" & "SI" & "</font>"
		END IF 
		
		wC11 = wC10  
		wC11 = DateDiff("d",now,wC05) 
		
		'If wC10 <= 0 Then
		'	wC09 = 0
		'	If wC07 < 0 Then
		'	    wC10 = wC07
		'	   Else
		'		wC10 = wC06
		'	End If
		'	
		'	Else
		'	wC09 = wC06
		'	wC10 = 0
		'End If
		
		IF isnull(wC03) or wC03 = "" Then
			wC03 = "&nbsp;"
		End If  
			
		wTC06 = wTC06 + cdbl(wC06)
		wTC07 = wTC07 + cdbl(wC07)
		wTC09 = wTC09 + cdbl(wC09)
		wTC10 = wTC10 + cdbl(wC10)
		
		wTTC06 = wTTC06 + cdbl(wC06)
		wTTC07 = wTTC07 + cdbl(wC07)
		wTTC08 = wTTC08 + cdbl(trim(rstQuery.Fields(9)))
		wTTC09 = wTTC09 + cdbl(wC09)
		wTTC10 = wTTC10 + cdbl(wC10)
		
		wC06 = formatnumber(wC06,2)
		wC07 = formatnumber(wC07,2)
		wC08 = formatnumber(wCS08,2)
		wC09 = formatnumber(wC09,2)
		wC10 = formatnumber(wC10,2)
		
		wC04 = right("0" & Day(wC04),2) & "-" & right("0" & Month(wC04),2) & "-" & Year(wC04)	
		wC05 = right("0" & Day(wC05),2) & "-" & right("0" & Month(wC05),2) & "-" & Year(wC05)	

		

		wCLASS = "TDD"
		wCLASS2 = "TDD2"

		IF wFAM <> "000" THEN
			Mostrar_Linea
		END IF
		rstQuery.MoveNext 
		wCuenta = wCuenta + 1
		wTCuenta = wTCuenta + 1	
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	

	wTIURL = ""
	wTFURL = ""


	IF wCuenta > 0 then
		Imprimir_Sub_Totales	
		IF wFAM = "000" THEN
			Imprimir_Totales
		End If
	end if
	
	Sub Imprimir_Sub_Totales()
		
		IF wFAM <> "000" THEN
			wCLASS = "TD3"
			wCLASS2 = "TD3"
		  ELSE
			wCLASS = "TDD"
			wCLASS2 = "TDD2"
		END IF
		wTipo = "T"
		wC01 = wCuenta
		wC02 = "&nbsp;"		
		wC03 = "&nbsp;"
		wC04 = "&nbsp;"
		wC05 = "&nbsp;"
		wSTS = "&nbsp;"	
		wC06 = formatnumber(wTC06,2)
		wC07 = formatnumber(wTC07,2)
		wC08 = formatnumber(wC08,2)
		wC09 = formatnumber(wTC09,2)
		wC10 = formatnumber(wTC10,2)
		wC11 = "&nbsp;"
		Mostrar_Linea
	
	End Sub
	
	Sub Imprimir_Totales()
		
		
		wCLASS = "TD1"
		wCLASS2 = "TD3"
		
		wTipo = "T"
		wC01 = wTCuenta 
		wC02 = "Total Resumen en MM Bs."		
		wC03 = "&nbsp;"
		wC04 = "&nbsp;"
		wC05 = "&nbsp;"
		wSTS = "&nbsp;"	
		
		IF wTTC06 <> 0 THEN
			wTTC06 = (wTTC06/1000)
		END IF
		IF wTTC07 <> 0 THEN
			wTTC07 = (wTTC07/1000)
		END IF
		IF wTTC08 <> 0 THEN
			wTTC08 = (wTTC08/1000)
		END IF
		IF wTTC09 <> 0 THEN
			wTTC09 = (wTTC09/1000)
		END IF
		IF wTTC10 <> 0 THEN
			wTTC10 = (wTTC10/1000)
		END IF
		wC06 = formatnumber(wTTC06,2)
		wC07 = formatnumber(wTTC07,2)
		wC08 = formatnumber(wTTC08,2)
		wC09 = formatnumber(wTTC09,2)
		wC10 = formatnumber(wTTC10,2)
		wC11 = "&nbsp;"
	
		IF wSTSIMP = "S" OR wSTSIMP = "E" THEN
			Response.write "<table BORDER=""1"" WIDTH=""100%"" cellspacing=""0"">" 		
			ELSE		
			Response.write "</table><table BORDER=""0"" WIDTH=""790"" cellpadding=""6"" cellspacing=""0"" bordercolor=""#FFFFFF"" >"
		END IF
		
		Mostrar_Linea_Total
		
		Response.write "</table>"
		
	End Sub

%>
<%'Incluir Cuerpo del Reporte %>
<!--#include file="X001X128_C.ASP"-->
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