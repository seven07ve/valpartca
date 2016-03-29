<% 
Response.Expires = -1 
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"
%>

<!--#include file="X001Z001.INC"-->

<%

	wCuenta = clng(TRIM(Request.Form("CUENTA")))
	wOBS = TRIM(Request.Form("txOBS"))
	
	wCLA001 = Request.QueryString("CLA001")	
	wTMFA = 0 
	wFECHA = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)		
	
	strCnn	= Application("XDTA300_ConnectionString")
	
	'Ubicar Correlativo Temporal de Pagos
	SQL = "SELECT * FROM X300ZF003 WHERE "
	SQL = SQL & " Z300003CCI = '" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " Z300003IDP = 'CO' AND "
	SQL = SQL & " Z300003CVE = '999' AND "
	SQL = SQL & " Z300003CIA = '" & Session("glCia") & "' "
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
	
		wNRO = cLNG(rstQuery.Fields("Z300003CAT")) + 1						
		
		If wNRO > cLNG(rstQuery.Fields("Z300003NCH")) Then
			wNRO = cLNG(rstQuery.Fields("Z300003NCD"))
		End If
				
		wCVE = trim(rstQuery.Fields("Z300003CVE"))
		
		SQL = "UPDATE X300ZF003 SET "
		SQL = SQL & " Z300003CAT = " & wNRO & " "  'Correlativo actual
		SQL = SQL & " WHERE "
		SQL = SQL & " Z300003CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " Z300003IDP = 'CO' AND "
		SQL = SQL & " Z300003CVE = '999' AND "
		SQL = SQL & " Z300003CIA = '" & Session("glCia") & "' "
		set rstQuery1 = Server.CreateObject("ADODB.Recordset")
		rstQuery1.Open sql , strCnn
		SET rstQuery1 = NOTHING
								
	  ELSE
			  
		wNRO = 1
			
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	wNRO = right(("000000" & wNRO),6)
	'Fin de ubicar correlativo de Pagos por Internet


	wIND = 1
	wVFA = "N"

    DO WHILE wIND <= wCuenta    
		'response.write wIND & "<br> Cuenta"
		wOBJ = right(("0000" & wIND),4)
		wNAMF = "F" & wOBJ
		wNAMC = "C" & wOBJ
		wNAMT = "T" & wOBJ
		wNAMM = "M" & wOBJ
		wNAMO = "O" & wOBJ
		wNAME = "E" & wOBJ
		wNAMS = "S" & wOBJ
		wNAMA = "A" & wOBJ
		wNAMB = "B" & wOBJ
		wNAMP = "P" & wOBJ
		wNAMV = "V" & wOBJ
		wNAMI = "I" & wOBJ
		wNAMD = "D" & wOBJ
		wNAMR = "R" & wOBJ

		wNFA = TRIM(Request.Form(wNAMF))		
		wMOT = TRIM(Request.Form(wNAMM))
		wTDO = TRIM(Request.Form(wNAMT))
		wCCO = TRIM(Request.Form(wNAMO))
		wCCE = TRIM(Request.Form(wNAME))
		wSCO = TRIM(Request.Form(wNAMS))
		wARI = TRIM(Request.Form(wNAMA))		
		wSTS = TRIM(Request.Form(wNAMC))
		wMFA = TRIM(Request.Form(wNAMB))
		wPRI = TRIM(Request.Form(wNAMP))
		wFVE = TRIM(Request.Form(wNAMV))
		wPIM = TRIM(Request.Form(wNAMI))
		wPDE = TRIM(Request.Form(wNAMD))
		wFEC = TRIM(Request.Form(wNAMR))
		
		'RESPONSE.WRITE wNFA & "-" & wTDO & "-" & wPIM & "<BR>"
		wNET = wMFA
		
		'If wSTS = "on" Then 
		
			wVFA = "S"
	
			
			IF wARI = "S" THEN
					
				'Calculo de RetenciÃ³n
				wPI1 = wPIM * (wPRI/100)		
				wPI2 = wPIM * ((100-wPRI)/100)				
				
				wBI1 = wMFA * (wPI1/100)
				wBI2 = wMFA * (wPI2/100)
				
				'wPIM = wPI2
				'response.write wPIM & "-" & wPI1 & "-" & wPI2 & "-" & wBI1 & "-" & wBI2 & "-" & wMFA & "<br>"
	
			ELSE
				
				wBI2 = wMFA * (wPIM/100)
				
			END IF 		
		
			'wNET = wMFA
			 
			wMFA = wMFA + CDBL(wBI2)
			
			IF wTDO = "N/C" THEN
				wTMFA = wTMFA - cdbl(wMFA)
			 ELSE
				wTMFA = wTMFA + cdbl(wMFA)
			END IF 
			
			
			'INSERTA DETALLE
			Set XDTA300 = Server.CreateObject("ADODB.Connection")
			XDTA300.Open strCnn
			
			SQL = "INSERT INTO X300CF002 (" 
			SQL = SQL & " C300002CCI, C300002CIA, C300002CCO, C300002CCE, "
			SQL = SQL & " C300002NDC, C300002MOT, C300002NFA, C300002CCL, "
			SQL = SQL & " C300002PUS, C300002STS, C300002FPR, C300002FAC, "
			SQL = SQL & " C300002MCO, C300002ARI, C300002PPP, C300002BIM, "
			SQL = SQL & " C300002PI1, C300002PI2, C300002PIM, C300002FVE, "
			SQL = SQL & " C300002MNE, C300002TDO, C300002FEC, C300002BPP ) " 
			SQL = SQL & " VALUES ( "
			SQL = SQL & "'" & Session("glCiaInternet") & "',"
			SQL = SQL & "'" & Session("glCia") & "',"
			SQL = SQL & "'" & wCCO & "',"
			SQL = SQL & "'" & wCCE & "',"
			SQL = SQL & "'" & wNRO & "',"
			SQL = SQL & "'" & wMOT & "',"
			SQL = SQL & "'" & wNFA & "',"
			SQL = SQL & "'" & wCLA001 & "',"
			SQL = SQL & "'" & session("glUsuario") & "',"		
			SQL = SQL & "'" & wSCO & "',"		
			SQL = SQL & "'" & wFECHA & "',"				
			SQL = SQL & "'" & wFECHA & "',"		
			SQL = SQL & "'" & fmtNumStr(wMFA) & "',"			
			SQL = SQL & "'" & wARI & "',"
			SQL = SQL & "'" & fmtNumStr(wPRI) & "',"
			SQL = SQL & "'" & fmtNumStr(wBI2) & "',"
			SQL = SQL & "'" & fmtNumStr(wPI1) & "',"
			SQL = SQL & "'" & fmtNumStr(wPI2) & "',"
			SQL = SQL & "'" & fmtNumStr(wPIM) & "',"
			SQL = SQL & "'" & wFVE & "',"
			SQL = SQL & "'" & fmtNumStr(wNET) & "',"
			SQL = SQL & "'" & wTDO & "',"
			SQL = SQL & "'" & wFEC & "',"
			SQL = SQL & "'" & fmtNumStr(wPDE) & "')"
			'response.write SQL	
			XDTA300.Execute SQL	
			XDTA300.Close 
			set XDTA300 = nothing			
	
			
			'response.write wNFA & "-" & wMFA & "-" & wPIM & "-" & wARI & "-" & wPRI & "<br>"
		
			
		
		'End If

		wIND = wIND + 1
		
	LOOP	
	
	
	IF wVFA = "S" THEN
		
		wOBS = Replace(wOBS, "'", " ")
		
		'INSERTA HEADER
	
		Set XDTA300 = Server.CreateObject("ADODB.Connection")
		XDTA300.Open strCnn
		
		SQL = "INSERT INTO X300CF001 (" 
		SQL = SQL & " C300001CCI, C300001CIA, C300001CCO, C300001NDC, "
		SQL = SQL & " C300001CCL, C300001MCO, C300001FPR, C300001FAC, "
		SQL = SQL & " C300001PUS, C300001STS, C300001STP, C300001OBS, "
		SQL = SQL & " C300001SPP )"
		SQL = SQL & " VALUES ( "
		SQL = SQL & "'" & Session("glCiaInternet") & "',"
		SQL = SQL & "'" & Session("glCia") & "',"
		SQL = SQL & "'0',"
		SQL = SQL & "'" & wNRO & "',"
		SQL = SQL & "'" & wCLA001 & "',"
		SQL = SQL & "'" & fmtNumStr(wTMFA) & "',"		
		SQL = SQL & "'" & wFECHA & "',"				
		SQL = SQL & "'" & wFECHA & "',"		
		SQL = SQL & "'" & session("glUsuario") & "',"		
		SQL = SQL & "'1',"		
		SQL = SQL & "'P',"		
		SQL = SQL & "'" & wOBS & "',"			
		SQL = SQL & "'0')"		
		XDTA300.Execute SQL
		XDTA300.Close 
		set XDTA300 = nothing			
		'response.write sql
		
	END IF 
	
	Function fmtNumStr(wMONTO)

		fmtNumStr = Replace(wMONTO, ",", ".") 

	End Function
	
	'wURL = "X001A100_S.asp?NOMTAB=X300BQ100"
	'Response.redirect wURL
	 
	 



'IF wARI = "S" THEN
'	wURLP = "X001A112.asp?CLA001=" & wNRO
' ELSE
	wURLP = "X001A107.asp?CLA001=" & wNRO
'END IF 

%>



<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel=stylesheet type="text/css" href="X001Z900.CSS">

<script language="Javascript">
<!-- Begin
document.oncontextmenu = function(){return false}
// End -->
</script>
<style>

html{overflow-y:scroll} 

</style>
</HEAD>
<body bgcolor="<%=Request.Cookies("CAR")("Color1")%>"leftmargin="17" rightmargin="0"   bottommargin="0" topmargin="0"	>

<table width="919" bgcolor="#FFFFFF" border="0"  cellpadding="0" cellspacing="0" align="center" height="100%">
<tr>
<td bgcolor="#FFFFFF">

&nbsp;<table BORDER="1" WIDTH="650" cellspacing="0" align="center"   cellpadding="0"  bordercolor="#CACACA" bgcolor="<%=Request.Cookies("CAR")("Color2")%>"   style="border-style: inset; border-width: 2px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" >
		 <TR>
		 <td CLASS="TDT" colspan=5 height="22">&nbsp;<p><u><font size="3">Pagos</font></u></p>
			<p><span style="font-weight: 400"><font size="4">¿Desea Registrar el 
			Deposito y Procesar el Pago?</font></span></p>
			<p><font size="2"><span style="font-weight: 400">(Presione SI para 
			realizar el proceso o NO para hacerlo luego)</span></font></p>
			<p>&nbsp;</p>
			
				<p><input type="button" value="SI" name="SI" style="width: 50" onclick="javascript:window.open('<%=wURLP%>','main')">&nbsp;
				<input type="button" value="NO" name="NO" style="width: 50" onclick="javascript:window.open('X001A004.asp','main')"></p>
			</form>
			<p>&nbsp;</td>		  
		 </TR>	

</table>
</td>
</tr>
</table>
<br>
<br>

<p>&nbsp;</td>
</tr>
<tr>

</tr>
</table>
</body>
</html>