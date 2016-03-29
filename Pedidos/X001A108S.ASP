


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
<%

	
	
	
	wCLA001 = Request.QueryString("CLA001")	
	
	wCBN = TRIM(Request.Form("CBN"))
	wTDP = TRIM(Request.Form("TDP"))
	wDOC = TRIM(Request.Form("DOC"))
	wMCO = TRIM(Request.Form("MCO"))
	wFEC = TRIM(Request.Form("FEC"))	
	wFEC = RIGHT(TRIM(wFEC),4) & "-" & MID(TRIM(wFEC),4,2) & "-" & LEFT(TRIM(wFEC),2)
	
	wCBN01 = TRIM(Request.Form("CBN01"))
	wTDP01 = TRIM(Request.Form("TDP01"))
	wDOC01 = TRIM(Request.Form("DOC01"))
	wMCO01 = TRIM(Request.Form("MCO01"))
	wFEC01 = TRIM(Request.Form("FEC01"))	
	wFEC01 = RIGHT(TRIM(wFEC01),4) & "-" & MID(TRIM(wFEC01),4,2) & "-" & LEFT(TRIM(wFEC01),2)
	
	wCBN02 = TRIM(Request.Form("CBN02"))
	wTDP02 = TRIM(Request.Form("TDP02"))
	wDOC02 = TRIM(Request.Form("DOC02"))
	wMCO02 = TRIM(Request.Form("MCO02"))
	wFEC02 = TRIM(Request.Form("FEC02"))	
	wFEC02 = RIGHT(TRIM(wFEC02),4) & "-" & MID(TRIM(wFEC02),4,2) & "-" & LEFT(TRIM(wFEC02),2)
	
	wCBN03 = TRIM(Request.Form("CBN03"))
	wTDP03 = TRIM(Request.Form("TDP03"))
	wDOC03 = TRIM(Request.Form("DOC03"))
	wMCO03 = TRIM(Request.Form("MCO03"))
	wFEC03 = TRIM(Request.Form("FEC03"))	
	wFEC03 = RIGHT(TRIM(wFEC03),4) & "-" & MID(TRIM(wFEC03),4,2) & "-" & LEFT(TRIM(wFEC03),2)
	
	wCBN04 = TRIM(Request.Form("CBN04"))
	wTDP04 = TRIM(Request.Form("TDP04"))
	wDOC04 = TRIM(Request.Form("DOC04"))
	wMCO04 = TRIM(Request.Form("MCO04"))
	wFEC04 = TRIM(Request.Form("FEC04"))	
	wFEC04 = RIGHT(TRIM(wFEC04),4) & "-" & MID(TRIM(wFEC04),4,2) & "-" & LEFT(TRIM(wFEC04),2)
	
		
	
	wFECHA = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)		
	
	strCnn	= Application("XDTA300_ConnectionString")
		
	
	'INSERTA PAGO
	
	Set XDTA300 = Server.CreateObject("ADODB.Connection")
	XDTA300.Open strCnn
	
	IF LEN(TRIM(wDOC)) > 0 AND LEN(TRIM(wMCO)) > 0 AND wMCO <> "0" THEN	
	
		SQL = "INSERT INTO X300CF003 (" 
		SQL = SQL & " C300003CCI, C300003CIA, C300003NDP, C300003NDC, "
		SQL = SQL & " C300003DCO, C300003DOC, C300003CBN, C300003TDP, "
		SQL = SQL & " C300003NCH, C300003CBC, C300003MCO, C300003FPR, "
		SQL = SQL & " C300003FAC, C300003PUS, C300003STS, C300003FEC)"
		SQL = SQL & " VALUES ( "
		SQL = SQL & "'" & Session("glCiaInternet") & "',"
		SQL = SQL & "'" & Session("glCia") & "',"
		SQL = SQL & "'000001',"
		SQL = SQL & "'" & wCLA001 & "',"
		SQL = SQL & "'B',"
		SQL = SQL & "'" & wDOC & "',"		
		SQL = SQL & "'" & wCBN & "',"				
		SQL = SQL & "'" & wTDP & "',"		
		SQL = SQL & "'',"
		SQL = SQL & "'',"
		SQL = SQL & "'" & fmtNumStr(wMCO) & "',"						
		SQL = SQL & "'" & wFECHA & "',"						
		SQL = SQL & "'" & wFECHA & "',"						
		SQL = SQL & "'" & session("glUsuario") & "',"		
		SQL = SQL & "'N',"	
		SQL = SQL & "'" & wFEC & "')"	
		XDTA300.Execute SQL
	
	END IF 
	
	IF LEN(TRIM(wDOC01)) > 0 AND LEN(TRIM(wMCO01)) > 0 AND wMCO01 <> "0" THEN	
	
		SQL = "INSERT INTO X300CF003 (" 
		SQL = SQL & " C300003CCI, C300003CIA, C300003NDP, C300003NDC, "
		SQL = SQL & " C300003DCO, C300003DOC, C300003CBN, C300003TDP, "
		SQL = SQL & " C300003NCH, C300003CBC, C300003MCO, C300003FPR, "
		SQL = SQL & " C300003FAC, C300003PUS, C300003STS, C300003FEC)"
		SQL = SQL & " VALUES ( "
		SQL = SQL & "'" & Session("glCiaInternet") & "',"
		SQL = SQL & "'" & Session("glCia") & "',"
		SQL = SQL & "'000002',"
		SQL = SQL & "'" & wCLA001 & "',"
		SQL = SQL & "'B',"
		SQL = SQL & "'" & wDOC01 & "',"		
		SQL = SQL & "'" & wCBN01 & "',"				
		SQL = SQL & "'" & wTDP01 & "',"		
		SQL = SQL & "'',"
		SQL = SQL & "'',"
		SQL = SQL & "'" & fmtNumStr(wMCO01) & "',"						
		SQL = SQL & "'" & wFECHA & "',"						
		SQL = SQL & "'" & wFECHA & "',"						
		SQL = SQL & "'" & session("glUsuario") & "',"		
		SQL = SQL & "'N',"	
		SQL = SQL & "'" & wFEC01 & "')"	
		XDTA300.Execute SQL
	
	END IF 
	
	IF LEN(TRIM(wDOC02)) > 0 AND LEN(TRIM(wMCO02)) > 0 AND wMCO02 <> "0" THEN	
	
		SQL = "INSERT INTO X300CF003 (" 
		SQL = SQL & " C300003CCI, C300003CIA, C300003NDP, C300003NDC, "
		SQL = SQL & " C300003DCO, C300003DOC, C300003CBN, C300003TDP, "
		SQL = SQL & " C300003NCH, C300003CBC, C300003MCO, C300003FPR, "
		SQL = SQL & " C300003FAC, C300003PUS, C300003STS, C300003FEC)"
		SQL = SQL & " VALUES ( "
		SQL = SQL & "'" & Session("glCiaInternet") & "',"
		SQL = SQL & "'" & Session("glCia") & "',"
		SQL = SQL & "'000003',"
		SQL = SQL & "'" & wCLA001 & "',"
		SQL = SQL & "'B',"
		SQL = SQL & "'" & wDOC02 & "',"		
		SQL = SQL & "'" & wCBN02 & "',"				
		SQL = SQL & "'" & wTDP02 & "',"		
		SQL = SQL & "'',"
		SQL = SQL & "'',"
		SQL = SQL & "'" & fmtNumStr(wMCO02) & "',"						
		SQL = SQL & "'" & wFECHA & "',"						
		SQL = SQL & "'" & wFECHA & "',"						
		SQL = SQL & "'" & session("glUsuario") & "',"		
		SQL = SQL & "'N',"	
		SQL = SQL & "'" & wFEC02 & "')"	
		XDTA300.Execute SQL
	
	END IF 
	
	IF LEN(TRIM(wDOC03)) > 0 AND LEN(TRIM(wMCO03)) > 0 AND wMCO03 <> "0" THEN	
	
		SQL = "INSERT INTO X300CF003 (" 
		SQL = SQL & " C300003CCI, C300003CIA, C300003NDP, C300003NDC, "
		SQL = SQL & " C300003DCO, C300003DOC, C300003CBN, C300003TDP, "
		SQL = SQL & " C300003NCH, C300003CBC, C300003MCO, C300003FPR, "
		SQL = SQL & " C300003FAC, C300003PUS, C300003STS, C300003FEC)"
		SQL = SQL & " VALUES ( "
		SQL = SQL & "'" & Session("glCiaInternet") & "',"
		SQL = SQL & "'" & Session("glCia") & "',"
		SQL = SQL & "'000004',"
		SQL = SQL & "'" & wCLA001 & "',"
		SQL = SQL & "'B',"
		SQL = SQL & "'" & wDOC03 & "',"		
		SQL = SQL & "'" & wCBN03 & "',"				
		SQL = SQL & "'" & wTDP03 & "',"		
		SQL = SQL & "'',"
		SQL = SQL & "'',"
		SQL = SQL & "'" & fmtNumStr(wMCO03) & "',"						
		SQL = SQL & "'" & wFECHA & "',"						
		SQL = SQL & "'" & wFECHA & "',"						
		SQL = SQL & "'" & session("glUsuario") & "',"		
		SQL = SQL & "'N',"	
		SQL = SQL & "'" & wFEC03 & "')"	
		XDTA300.Execute SQL
	
	END IF 
	
	IF LEN(TRIM(wDOC04)) > 0 AND LEN(TRIM(wMCO04)) > 0 AND wMCO04 <> "0" THEN	
	
		SQL = "INSERT INTO X300CF003 (" 
		SQL = SQL & " C300003CCI, C300003CIA, C300003NDP, C300003NDC, "
		SQL = SQL & " C300003DCO, C300003DOC, C300003CBN, C300003TDP, "
		SQL = SQL & " C300003NCH, C300003CBC, C300003MCO, C300003FPR, "
		SQL = SQL & " C300003FAC, C300003PUS, C300003STS, C300003FEC)"
		SQL = SQL & " VALUES ( "
		SQL = SQL & "'" & Session("glCiaInternet") & "',"
		SQL = SQL & "'" & Session("glCia") & "',"
		SQL = SQL & "'000005',"
		SQL = SQL & "'" & wCLA001 & "',"
		SQL = SQL & "'B',"
		SQL = SQL & "'" & wDOC04 & "',"		
		SQL = SQL & "'" & wCBN04 & "',"				
		SQL = SQL & "'" & wTDP04 & "',"		
		SQL = SQL & "'',"
		SQL = SQL & "'',"
		SQL = SQL & "'" & fmtNumStr(wMCO04) & "',"						
		SQL = SQL & "'" & wFECHA & "',"						
		SQL = SQL & "'" & wFECHA & "',"						
		SQL = SQL & "'" & session("glUsuario") & "',"		
		SQL = SQL & "'N',"	
		SQL = SQL & "'" & wFEC04 & "')"	
		XDTA300.Execute SQL
	
	END IF 
		
	
	XDTA300.Close 
	set XDTA300 = nothing			
	
		
	
	Function fmtNumStr(wMONTO)

		fmtNumStr = Replace(wMONTO, ",", ".") 

	End Function
	
	'Ubicar Correlativo Temporal de Pagos
	SQL = "SELECT * FROM X300ZF003 WHERE "
	SQL = SQL & " Z300003CCI = '" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " Z300003IDP = 'CO' AND "
	IF Session("glTipoUsuario") = "C" THEN
		SQL = SQL & " Z300003CVE = '999999' AND "
		  ELSE
		SQL = SQL & " Z300003CVE = '888888' AND "
	END IF
	SQL = SQL & " Z300003CIA = '" & Session("glCia") & "' "
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
	
		wNRO = cLNG(rstQuery.Fields("Z300003CAC")) + 1						
		
		If wNRO > cLNG(rstQuery.Fields("Z300003NCH")) Then
			wNRO = cLNG(rstQuery.Fields("Z300003NCD"))
		End If
				
		wCVE = trim(rstQuery.Fields("Z300003CVE"))
		
		SQL = "UPDATE X300ZF003 SET "
		SQL = SQL & " Z300003CAC = " & wNRO & " "  'Correlativo actual
		SQL = SQL & " WHERE "
		SQL = SQL & " Z300003CCI = '" & Session("glCiaInternet") & "' AND "
		SQL = SQL & " Z300003IDP = 'CO' AND "
		IF Session("glTipoUsuario") = "C" THEN
			SQL = SQL & " Z300003CVE = '999999' AND "
	  	  ELSE
			SQL = SQL & " Z300003CVE = '888888' AND "
		END IF
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
	
	IF Session("glTipoUsuario") = "C" THEN
		wNRO = TRIM("999999" & wNRO)
  	  ELSE
		wNRO = TRIM("888888" & wNRO)
	END IF
	'Fin de ubicar correlativo de Pagos por Internet
	
	
	Set XDTA300 = Server.CreateObject("ADODB.Connection")
	XDTA300.Open strCnn

	SQL = "UPDATE X300CF001 SET " 
	SQL = SQL & " C300001NDC ='" & wNRO & "'"
	SQL = SQL & " WHERE "		
	SQL = SQL & " C300001CCI ='" & Session("glCiaInternet")  & "' AND "
	SQL = SQL & " C300001NDC ='" & wCLA001 & "'"
	'RESPONSE.WRITE SQL
	XDTA300.Execute SQL

	SQL = "UPDATE X300CF002 SET " 
	SQL = SQL & " C300002NDC ='" & wNRO & "'"		
	SQL = SQL & " WHERE "		
	SQL = SQL & " C300002CCI ='" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " C300002NDC ='" & wCLA001 & "'"
	XDTA300.Execute SQL
	
	SQL = "UPDATE X300CF003 SET " 
	SQL = SQL & " C300003NDC ='" & wNRO & "'"		
	SQL = SQL & " WHERE "		
	SQL = SQL & " C300003CCI ='" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " C300003NDC ='" & wCLA001 & "'"
	XDTA300.Execute SQL

	SQL = "UPDATE X300CF001 SET " 
	SQL = SQL & " C300001SPP = '1', "
	SQL = SQL & " C300001FAC = '" & wFECHA & "' "		
	SQL = SQL & " WHERE "		
	SQL = SQL & " C300001CCI ='" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " C300001NDC ='" & wNRO & "'"
	XDTA300.Execute SQL

	XDTA300.Close 
	set XDTA300 = nothing	
	
	'wURL = "X001A104.asp"
	'Response.redirect wURL
	 
	 
%>

<HTML>
<HEAD>


<META NAME="GENERATOR" Content="Microsoft FrontPage 6.0">

<link rel=stylesheet type="text/css" href="X001Z900.CSS">
</HEAD>

<script language="javascript"  >

	//alert("Pago Procesado Satisfactoriamente.");
	//window.open('X001A004.asp','main');

</script>

<body bgcolor="#FFFFFF" leftmargin="18" rightmargin="0"   	>

<table width="760" bgcolor="#FFFFFF" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF">

&nbsp;<table BORDER="1" WIDTH="650" cellspacing="0" align="center"   cellpadding="0"  bordercolor="#0066CC" bgcolor="#990000" style="border-style: inset; border-width: 2px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" >
		 <TR>
		 <td CLASS="TDT" colspan=5 height="22">&nbsp;<p><u><font size="3">Pagos</font></u></p>
			<p><span style="font-weight: 400"><font size="4">Pago Procesado 
			Satisfactoriamente.</font></span></p>
			<p>&nbsp;</p>
			
				<p>
				<input type="button" value="Imprimir Recibo" name="Imprimir" style="width: 120; height:23" onclick="javascript:OpenBrWindow('X001A111.asp?CLA001=<%=wNRO%>','Imprimir','menubar=0,resizable=0,location=0,status=0,scrollbars=1,directories=0,width=750,height=700','750','700','true')">
				<input type="button" value="Finalizar" name="Finalizar" style="width: 84; height:23" onclick="javascript:window.open('X001A005.asp','main')"></p>
			</form>
			<p>&nbsp;</td>		  
		 </TR>	

</table>
</td>
</tr>
</table>
<p>&nbsp;</td>
</tr>
<tr>
<td>
</td>

</tr>
</table>

</body>
</html>
