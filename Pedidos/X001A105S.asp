<!--#include file="X001Z001.INC"-->

<%

	wCuenta = clng(TRIM(Request.Form("CUENTA")))
	
	wCLA001 = Request.QueryString("CLA001")	
	wTMFA = 0 
	wFECHA = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)		
	
	strCnn	= Application("XDTA300_ConnectionString")
	
	
	'Ubicar Correlativo Temporal de Pagos
	SQL = "SELECT * FROM X300ZF003 WHERE "
	SQL = SQL & " Z300003CCI = '" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " Z300003IDP = 'CO' AND "
	'IF Session("glTipoUsuario") = "C" THEN
		SQL = SQL & " Z300003CVE = '999999' AND "
		'  ELSE
		'SQL = SQL & " Z300003CVE = '888888' AND "
	'END IF
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
		'IF Session("glTipoUsuario") = "C" THEN
			SQL = SQL & " Z300003CVE = '999999' AND "
	  	'  ELSE
		'	SQL = SQL & " Z300003CVE = '888888' AND "
		'END IF
		SQL = SQL & " Z300003CIA = '" & Session("glCia") & "' "
		'set rstQuery1 = Server.CreateObject("ADODB.Recordset")
		'rstQuery1.Open sql , strCnn
		'SET rstQuery1 = NOTHING
								
	  ELSE
			  
		wNRO = 1
			
	END IF
	rstQuery.Close 
	set rstQuery = nothing
	wNRO = right(("000000" & wNRO),6)
	'Fin de ubicar correlativo de Pagos por Internet


	wTIT = "Resumen de Facturas a Cancelar"

%>

<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 6.0">

<link rel=stylesheet type="text/css" href="X001Z900.CSS">



<script language="Javascript">

function enviar() {

	if (confirm("¿Esta deacuerdo con las Facturas Seleccionadas?")){
		document.frmGral.submit(); 
	}
}

</script>

</HEAD>
<body bgcolor="#000000" leftmargin="18" rightmargin="0"   >


	<FORM NAME="frmGral" METHOD="post" ACTION="X001A105S2.asp" >

    <div align="center">


       <table width="760" bgcolor="#000000" border="0"  cellpadding="0" cellspacing="0" align="center"  >
<tr>
<td>

<table width="760" bgcolor="#FFFFFF" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF">



    &nbsp;<table BORDER="1" WIDTH="600" cellspacing="0" align="center"   cellpadding="0"  bordercolor="#0066CC" bgcolor="#FE9900" style="border-style: inset; border-width: 2px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" >
		 <TR>
		 <td CLASS="TDT" colspan=5 height="22"><%= wTIT %></td>		  
		 </TR>	

<%		 

	wIND = 1
	wVFA = "N"

    DO WHILE wIND < wCuenta

		wOBJ = right(("0000" & wIND),4)
		wNAMF = "F" & wOBJ
		wNAMC = "C" & wOBJ

		wNAMM = "M" & wOBJ
		wNAMO = "O" & wOBJ
		wNAME = "E" & wOBJ
		wNAMS = "S" & wOBJ
		wNAMA = "A" & wOBJ
		wNAMB = "B" & wOBJ
		wNAMP = "P" & wOBJ


		wNFA = TRIM(Request.Form(wNAMF))		
		wMOT = TRIM(Request.Form(wNAMM))
		wCCO = TRIM(Request.Form(wNAMO))
		wCCE = TRIM(Request.Form(wNAME))
		wSCO = TRIM(Request.Form(wNAMS))
		wARI = TRIM(Request.Form(wNAMA))		
		wSTS = TRIM(Request.Form(wNAMC))
		wMFA = TRIM(Request.Form(wNAMB))
		wPRI = TRIM(Request.Form(wNAMP))
		
		SQL = "SELECT A300003PIM FROM dbo.X300AF003 "
		SQL = SQL & " GROUP BY A300003PIM "
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wPIM = CDBL(rstQuery.Fields("A300003PIM"))
		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING
		
				
		
		If wSTS = "on" Then 
		
			wVFA = "S"
	
			wColspan = "colspan=2"
			
			IF wARI = "S" THEN
			
				wColspan = ""
			
				'Calculo de Retención
				wPI1 = wPIM * (wPRI/100)		
				wPI2 = wPIM * ((100-wPRI)/100)				
				
				wBI1 = wMFA * (wPI1/100)
				wBI2 = wMFA * (wPI2/100)
				
				wPIM = wPI2
				'response.write wPIM & "-" & wPI1 & "-" & wPI2 & "-" & wBI1 & "-" & wBI2 & "-" & wMFA & "<br>"
	
			ELSE
				
				wBI2 = wMFA * (wPIM/100)
				
			END IF 		
		
			wNET = wMFA
			 
			wMFA = wMFA + CDBL(wBI2)
			
			wTMFA = wTMFA + cdbl(wMFA)
			
			IF wIND = 1 THEN
				Response.write "<tr>"
        	  	Response.write "<td " & wColspan & " class=""TDS"" width=""25%"" ><p CLASS=""P1"" align=""left"">Factura</p></td>"
        	  	IF wARI = "S" THEN
        	  		Response.write "<td class=""TDS"" width=""25%"" ><p CLASS=""P1"" align=""Right"">Bs. Impuesto Ret.</p></td>"
        	  	END IF 
        	  	Response.write "<td class=""TDS"" width=""25%"" ><p CLASS=""P1"" align=""Right"">Bs. Impuesto</p></td>"
        	  	Response.write "<td class=""TDS"" width=""25%"" ><p CLASS=""P1"" align=""Right"">Monto</p></td>"
        	  	Response.write "<tr>"
          	END IF 
          	Response.write "<tr>"
          	
          	Response.write "<td " & wColspan & " class=""TDD"" width=""20%"" style=""font-size: 10pt; font-family: Tahoma; text-align:left"">"
			Response.write	wNFA  
	 		Response.write "</td>"
	 		IF wARI = "S" THEN
	 			Response.write "<td class=""TDD"" width=""20%"" style=""font-size: 10pt; font-family: Tahoma; text-align:right"">"
				Response.write	formatnumber(wBI1,2)  
	 			Response.write "</td>"
	 		END IF
	 		Response.write "<td class=""TDD"" width=""20%"" style=""font-size: 10pt; font-family: Tahoma; text-align:right"">"
			Response.write	formatnumber(wBI2,2)  
	 		Response.write "</td>"
	 		Response.write "<td class=""TDD"" width=""20%"" style=""font-size: 10pt; font-family: Tahoma; text-align:right"">"
			Response.write	formatnumber(wMFA,2)  
	 		Response.write "</td>"
	 		
	 		Response.write "</tr>"
			
			'INSERTA DETALLE
			Set XDTA300 = Server.CreateObject("ADODB.Connection")
			XDTA300.Open strCnn
			
			SQL = "INSERT INTO X300CF002 (" 
			SQL = SQL & " C300002CCI, C300002CIA, C300002CCO, C300002CCE, "
			SQL = SQL & " C300002NDC, C300002MOT, C300002NFA, C300002CCL, "
			SQL = SQL & " C300002PUS, C300002STS, C300002FPR, C300002FAC, "
			SQL = SQL & " C300002MCO, C300002ARI )"
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
			SQL = SQL & "'" & fmtNumStr(wMFA) & "'"			
			SQL = SQL & "'" & wARI & "')"
			'XDTA300.Execute SQL	
			'XDTA300.Close 
			'set XDTA300 = nothing			
	
			'response.write SQL	
			'response.write wNFA & "-" & wMFA & "-" & wPIM & "-" & wARI & "-" & wPRI & "<br>"
			
		
		End If

		wIND = wIND + 1
		
	LOOP	
	
	Response.write "<tr>"
  	Response.write "<td class=""TDS"" width=""25%"" colspan=""2""><p CLASS=""P1"" align=""left"">Total a Cancelar:</p></td>"
  	IF wARI = "S" THEN
  		'Response.write "<td class=""TDS"" width=""25%"" ><p CLASS=""P1"" align=""Right"">Bs. Impuesto Ret.</p></td>"
  	END IF 
   	Response.write "<td class=""TDS"" width=""25%"" ><p CLASS=""P1"" align=""Right""></p></td>"
    Response.write "<td class=""TDS"" width=""25%"" ><p CLASS=""P1"" align=""Right"">" & formatnumber(wTMFA,2) & "</p></td>"
    Response.write "<tr>"
	
	IF wVFA = "S" THEN
		
		'INSERTA HEADER
	
		Set XDTA300 = Server.CreateObject("ADODB.Connection")
		XDTA300.Open strCnn
		
		SQL = "INSERT INTO X300CF001 (" 
		SQL = SQL & " C300001CCI, C300001CIA, C300001CCO, C300001NDC, "
		SQL = SQL & " C300001CCL, C300001MCO, C300001FPR, C300001FAC, "
		SQL = SQL & " C300001PUS, C300001STS, C300001STP, C300001OBS )"
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
		SQL = SQL & "'0',"		
		SQL = SQL & "'P',"		
		SQL = SQL & "'')"		
		'XDTA300.Execute SQL
		'XDTA300.Close 
		'set XDTA300 = nothing			
		'response.write sql
		
	END IF 
	
	Function fmtNumStr(wMONTO)

		fmtNumStr = Replace(wMONTO, ",", ".") 

	End Function
	
	'wURL = "X001A100_S.asp?NOMTAB=X300BQ100"
	'Response.redirect wURL
	 
	 


%>

		 <tr>
          <td CLASS="TDT" width="100%" colspan=5 align="center">
          <input type="button" name="Guardar" Value="Guardar" onclick="javascript:enviar()"> 
          <input type="button" name="Regresar" Value="Regresar" onclick="javascript:history.back()"> 
          <input type="button" name="Imprimir" Value="Imprimir" onclick="javascript:window.print()">         
          </td>
         </tr>




	</table>
	</td>	
	</TR>	
	</table>
	
	<p>&nbsp;<p>&nbsp;<p>&nbsp;<p>&nbsp;<p>&nbsp;<p>&nbsp;</td>
</tr> 
<td>
<img src="../images/index/bottom.jpg" width="760" height="15" /></td>
</tr> 
</p> 

</td>

        </tr>
        
        
        
        
               </table>

    </td>				
  </tr>
</table>

	</div>
</FORM>
</BODY>