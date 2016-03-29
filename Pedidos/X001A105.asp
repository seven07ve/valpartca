<%@ Language=VBScript %>

<%

Response.Expires = -1
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"


'Preparar Etiqueta Body del Formulario

wCLA001 = Request.QueryString("CLA001")	
wCLA002 = Request.QueryString("CLA002")	
wCCI = Session("glCiaInternet") 
wCIA = Session("glCia") 
    
%>
	
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Facturas</title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">

<SCRIPT LANGUAGE="jscript" src="JScript.js" >
</SCRIPT>

<!--#include file="X001Z001.INC"-->
</head>

	<body topmargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>" leftmargin="17" rightmargin="0" vlink="#0000FF" style="text-align: center" scroll="auto" >
		<FORM NAME="frmGral" METHOD="post" ACTION="X001A106.asp?CLA001=<%=wCLA001%>" target="main">
				<div align="center"  >		
				<table BORDER="1" WIDTH="919" cellpadding="6" cellspacing="0" bordercolor="#FFFFFF" height="100%" bgcolor="#FFFFFF"   align="center" >

	<%
	
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
	wCAMC13 = "C300204CCO"		
	wCAMC14 = "C300204CCE"		
	wCAMC15 = "C300204STS"		
	wCAMC16 = "A300002LPR"		
	wCAMC17 = "C300204SEE"
	wCAMC18 = "C300204PIM"
	wCAMC19 = "C300204IVA"
	'wCAMC20 = "(case when isnumeric(SUBSTRING(replace(ltrim(rtrim(b300200des)),'%',''),1,3))<>0 then "
  	'wCAMC20 =	wCAMC20 & " SUBSTRING(replace(ltrim(rtrim(b300200des)),'%',''),1,3) " 
 	'wCAMC20 =	wCAMC20 & "	else 0 end) AS PDE "

	wCAMXXX = left(wCAMC01,7) 

	strCnn	= Application("XDTA300_ConnectionString")
	
	
	SQL = "SELECT A300002RSO FROM dbo.X300AF002 "
	SQL = SQL & " WHERE A300002CCI = '" & Session("glCiaInternet") & "' AND " 
	SQL = SQL & " A300002CIA = '" & Session("glCia") & "' AND " 
	SQL = SQL & " A300002CCL = '" & wCLA001 & "'" 
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	if NOT rstQuery.EOF then
		wRSO = TRIM(rstQuery.Fields("A300002RSO"))
	end if
	rstQuery.CLOSE
	SET rstQuery = NOTHING
	
	wTIT = wCLA001 & " - " & wRSO 

	SQL = "SELECT " & wCAMC01 & ", " & wCAMC02 
	SQL = SQL & ", " & wCAMC03 & ", " & wCAMC04 
	SQL = SQL & ", " & wCAMC05 & ", " & wCAMC06 
	SQL = SQL & ", " & wCAMC07 & ", " & wCAMC08
	SQL = SQL & ", " & wCAMC09 & ", " & wCAMC10  
	SQL = SQL & ", " & wCAMC11 & ", " & wCAMC12  
	SQL = SQL & ", " & wCAMC13 & ", " & wCAMC14
	SQL = SQL & ", " & wCAMC15 & ", " & wCAMC16 
	SQL = SQL & ", " & wCAMC17 & ", " & wCAMC18
	SQL = SQL & ", " & wCAMC19 '& ", " & wCAMC20   
	SQL = SQL & " FROM " &  wNOMTAB 		
	SQL = SQL & " WHERE "
	SQL = SQL & wCAMXXX & "CCI ='" & Session("glCiaInternet") & "'  "
	SQL = SQL & " AND " & wCAMXXX & "CIA ='" & Session("glCia") & "' "
	SQL = SQL & " AND C300204CCL ='" & wCLA001 & "' "
	If Session("glMostrarNC") = "0" Then
		SQL = SQL & " AND C300204TDO IN ('FAC','CHD', 'N/D') "		
	  ELSE
		SQL = SQL & " AND C300204TDO IN ('FAC','N/C','CHD', 'N/D') "
	End If

	'SQL = SQL & " AND (ltrim(rtrim(C300204NFA))+ltrim(rtrim(C300204TDO))) NOT IN "
	'SQL = SQL & " (SELECT (ltrim(rtrim(C300002NFA))+ltrim(rtrim(C300002TDO))) FROM X300CF002, X300CF001 WHERE "
	'SQL = SQL & " C300002CCI = C300001CCI AND "
	'SQL = SQL & " C300002CIA = C300001CIA AND "
	'SQL = SQL & " C300002NDC = C300001NDC AND "
	'SQL = SQL & " C300001STS <> '9') "

	SQL = SQL & " ORDER BY C300204CVE, C300204CCL, C300204FPR " 

	'Response.Write SQL	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	
    rstQuery.Open sql , strCnn
	wTipo = "D"
	wCLASS = "TDD"
	wCLASS2 = "TDD2"

	wCuenta = 0
	wCuenta2 = 1
	wTCuenta = 0 
	wTC08 = 0
	wTC09 = 0
	wTC10 = 0
	wCS08 = 0
	wTTC08 = 0
	wTTC09 = 0
	wTTC10 = 0
	wTTC08 = 0
	wCCL = 0
	wC10 = 0 
	
	Response.write "<table border=""0"" align=""center"" WIDTH=""919"" cellpadding=""0"" cellspacing=""0"" bgcolor=""#FFFFFF"" >"
	Response.write "<tr><td align=""left"">"
	Response.write "<table border=""1"" cellspacing=""0"" cellpadding=""1""  align=""left"" bordercolor=""#CACACA"" bgcolor=" & Request.Cookies("CAR")("Color1") & " WIDTH=""919""  style=""padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px;  "">"
	wTIT = "Documentos Pendientes de " & wTIT
	Mostrar_Titulo()
	wCLASS = "TDS"
	Mostrar_Linea		
	Response.write "</table>"
	Response.write "</td></tr>"
	Response.write "</table>"
	
	
	DO WHILE NOT rstQuery.EOF  
		
		IF wCCL <> trim(rstQuery.Fields(0)) THEN
				
				IF wCCL <> 0 Then
					
					 Imprimir_Sub_Totales
					 					 		
					 wCuenta = 0			 
					 wTC06 = 0
					 wTC07 = 0
					 wCS08 = 0
					 wTC09 = 0
					 wTC10 = 0
					 wSSNV = 0
					 wSSVE = 0
					 
				End If
				
				Response.write "<div id=""Facturas"" align=""center"" style=""overflow-y:scroll; overflow-x: hidden; width:919; height:100%; text-align: center; background-color: #FFFFFF;"">"
				Response.write "<table BORDER=""1"" WIDTH=""902"" cellpadding=""2"" cellspacing=""0"" bordercolor=""#FFFFFF"" align=""center"">"
	
				'wTIT = trim(rstQuery.Fields(0)) & " - " & trim(rstQuery.Fields(2)) 
				wTC07 = 0
								
				
			    wCCL = trim(rstQuery.Fields(0))
		END IF 

		wC01 = trim(rstQuery.Fields(1))
		wC02 = trim(rstQuery.Fields(3))
		wC03 = trim(rstQuery.Fields(4))
		wC04 = trim(rstQuery.Fields(5))	
		wC05 = trim(rstQuery.Fields(6))	
		wC06 = trim(rstQuery.Fields(7))	
		wC07 = trim(rstQuery.Fields(8))
		wCS08 = wCS08 + cdbl(trim(rstQuery.Fields(9)))
		wC09 = trim(rstQuery.Fields(10))
		wC10 = cdbl(rstQuery.Fields(7))
		wCCO = trim(rstQuery.Fields(12))
		wCCE = trim(rstQuery.Fields(13))
		wSTS = trim(rstQuery.Fields(14))
		wARI = trim(rstQuery.Fields(15))
		wPRI = trim(rstQuery.Fields(16))
		wPIM = trim(rstQuery.Fields(17))
		wIVA = trim(rstQuery.Fields(18))
		wC12 = 0 'cdbl(rstQuery.Fields(19))
		
		wMFA = cdbl(rstQuery.Fields(7))
		
		'AJUSTA DECIMALES DE PORCENTAJE DE IMPUESTO
		wPIM = round(wPIM)
		
		wC06 = DateDiff("d", cdate(wC04), Now)		  
		
		IF wC03 = "NC" THEN
			wMFA = cdbl(rstQuery.Fields(8))
		END IF 
		
		wOBJ = right(("0000" & wCuenta2),4)
		wNAMF = "F" & wOBJ
		wNAMC = "C" & wOBJ
		wNAML = "L" & wOBJ
		
		wNAMM = "M" & wOBJ
		wNAMT = "T" & wOBJ
		wNAMO = "O" & wOBJ
		wNAME = "E" & wOBJ
		wNAMS = "S" & wOBJ
		wNAMA = "A" & wOBJ
		wNAMB = "B" & wOBJ
		wNAMP = "P" & wOBJ
		wNAMV = "V" & wOBJ
		wNAMI = "I" & wOBJ 'Porcentaje de Impuesto
		wNAMN = "N" & wOBJ 'Iva en Bolivares
		wNAMD = "D" & wOBJ '% Descuento
		wNAMR = "R" & wOBJ 'Fecha de Emisión

		wCHK = "<INPUT TYPE=CHECKBOX NAME=" & wNAMC & ">"
		
		IF Session("glTipoUsuario") <> "C" THEN
			'wDEA = "<INPUT maxlength=2 size=1 TYPE=text NAME=" & wNAMD & " value=0>"
			wDEA = "<SELECT name=" & wNAMD & " type=""select-one"" >"
			wDEA = wDEA & "<OPTION value=""0"">0</OPTION>"
			wDEA = wDEA & "<OPTION value=""5"">5</OPTION>"
		  ELSE
			wDEA = "<INPUT maxlength=2 size=1 TYPE=text NAME=" & wNAMD & " value=0 DISABLED>"
		END IF 
		
		'Response.write "%: " & wC12
		IF wC12 > 0 THEN
			wC13 = "<INPUT TYPE=CHECKBOX NAME=" & wNAML & ">"
			ELSE
			wC13 = "<INPUT TYPE=CHECKBOX NAME=" & wNAML & " disabled>"
		END IF 
				
		wC11 = wC10  
		IF wC11 <> 0 THEN
			wC11 = CDBL(wC11) * -1
		END IF 
		
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
		
		wC11 = DateDiff("d", cdate(wC05), Now)
		
		'response.write wC10
		IF wC11 < 0 THEN
			wC11 = 0
			wColor = "Black"
			wSSNV = wSSNV + cdbl(wC10)
			wTSNV = wTSNV + cdbl(wC10)
			Else
			wColor = "Red"
			wSSVE = wSSVE + cdbl(wC10)
			wTSVE = wTSVE + cdbl(wC10)
		END IF 
			
		'wTC06 = wTC06 + cdbl(wC06)
		wTC07 = wTC07 + cdbl(wC07)
		wTC09 = wTC09 + cdbl(wC09)
		wTC10 = wTC10 + cdbl(wC10)
		
		'wTTC06 = wTTC06 + cdbl(wC06)
		wTTC07 = wTTC07 + cdbl(wC07)
		wTTC08 = wTTC08 + cdbl(trim(rstQuery.Fields(9)))
		wTTC09 = wTTC09 + cdbl(wC09)
		wTTC10 = wTTC10 + cdbl(wC10)
		
		'wC06 = formatnumber(wC06,2)
		wC07 = formatnumber(wC07,2)
		wC08 = formatnumber(wCS08,2)
		wC09 = formatnumber(wC09,2)
		wC10 = formatnumber(wC10,2)
		
		wC04 = right("0" & Day(wC04),2) & "-" & right("0" & Month(wC04),2) & "-" & Year(wC04)	
		wC05 = right("0" & Day(wC05),2) & "-" & right("0" & Month(wC05),2) & "-" & Year(wC05)	

		

		wCLASS = "TDD"
		wCLASS2 = "TDD2"

		response.write "<INPUT NAME=" & wNAMF & " size=15 value=" & wC01 & " TYPE=Hidden>"	
		response.write "<INPUT NAME=" & wNAMM & " size=15 value=" & wC02 & " TYPE=Hidden>"
		response.write "<INPUT NAME=" & wNAMT & " size=15 value=" & wC03 & " TYPE=Hidden>"
		response.write "<INPUT NAME=" & wNAMO & " size=15 value=" & wCCO & " TYPE=Hidden>"			
		response.write "<INPUT NAME=" & wNAME & " size=15 value=" & wCCE & " TYPE=Hidden>"	
		response.write "<INPUT NAME=" & wNAMS & " size=15 value=" & wSTS & " TYPE=Hidden>"	
		response.write "<INPUT NAME=" & wNAMA & " size=15 value=" & wARI & " TYPE=Hidden>"	
		response.write "<INPUT NAME=" & wNAMB & " size=15 value=" & wMFA & " TYPE=Hidden>"
		response.write "<INPUT NAME=" & wNAMP & " size=15 value=" & wPRI & " TYPE=Hidden>"
		response.write "<INPUT NAME=" & wNAMV & " size=15 value=" & wC05 & " TYPE=Hidden>"
		response.write "<INPUT NAME=" & wNAMI & " size=15 value=" & wPIM & " TYPE=Hidden>"
		response.write "<INPUT NAME=" & wNAMN & " size=15 value=" & wIVA & " TYPE=Hidden>"
		'response.write "<INPUT NAME=" & wNAMD & " size=15 value=" & wC12 & " TYPE=Hidden>"
		response.write "<INPUT NAME=" & wNAMR & " size=15 value=" & wC04 & " TYPE=Hidden>"
		
		Mostrar_Linea

		rstQuery.MoveNext 
		wCuenta = wCuenta + 1
		wCuenta2 = wCuenta2 + 1
		wTCuenta = wTCuenta + 1	
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	
	wTIURL = ""
	wTFURL = ""


	IF wCuenta > 0 then
		Imprimir_Sub_Totales	
		'Imprimir_Totales

	end if
	
	Sub Imprimir_Sub_Totales()
		

		wCLASS = "TD3"
		wCLASS2 = "TD3"
		wTipo = "T"
		
		wCHK = "&nbsp;"

		wC01 = wCuenta
		wC02 = "&nbsp;"		
		wC03 = "&nbsp;"
		wC04 = "&nbsp;"
		wC05 = "&nbsp;"
		wC06 = "&nbsp;"
		wC07 = formatnumber(wTC07,2)
		wC08 = formatnumber(wC08,2)
		wC09 = formatnumber(wTC09,2)
		wC10 = formatnumber(wTC10,2)
		wC11 = "&nbsp;"
		wC12 = "&nbsp;"
		wC13 = "&nbsp;"
		wDEA = "&nbsp;"
		Mostrar_Linea
	
	End Sub
	
	
	
%>

<%'Incluir Cuerpo del Reporte %>
<!--#include file="X001A105_C.ASP"-->	

</table>
<% IF wCuenta > "0" THEN %>          
<table width="100%" border="0" cellpadding="5" cellspacing="1" height="100%"  >
<tr>
<td align="center"  CLASS="TDT" valign="top" height="30" >
*Seleccione las Facturas que desea cancelar y presione el botón siguiente.
</td></tr> 
</table> 
<% END IF %>
</div>
<table  border="0" width="919"  cellpadding="2" cellspacing="0" height="45%">
 <TR>
	  <td CLASS="TDT" colspan=<%=wCOLSPAN%> valign="top">
	<INPUT TYPE="Hidden" NAME="CUENTA" value="<%=wCuenta2%>">
	<% IF wCuenta > "0" THEN %>          
	<script language="javascript"  >
		//Inicio_X001Z100D()
		
			var res = (((screen.height+400)/2)) 
		//alert('0 - '+res);
		document.getElementById('Facturas').style.height = screen.height-res;  
	//document.frmGral.C0001.focus()
	//alert()
	if (vIE()<='6'){
		document.getElementById('Facturas').style.height = screen.height-370;
		//alert('1 - '+res);
	}else{
		document.getElementById('Facturas').style.height = screen.height-res;  
		//alert('2 - '+res);
	}
	</script> 
	  
	  
	  
	  
	  <INPUT TYPE="submit" NAME="send" VALUE="Siguiente" tabindex="2"> 
	<% END IF %>
	<INPUT type='button' value='Cancelar' id=button1 name=button1 OnClick='javascript:history.back()'>
	  
	  </td>		  
	  </TR>
	
	  </table> 
	  </div>
	  </FORM> 
</body>

</html>
