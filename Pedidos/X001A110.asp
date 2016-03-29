<%@ Language=VBScript %>

<!--#include file="X001Z001.INC"-->
<!--#include file="X001Z900.INC"-->

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<title>Comprobante Electrónico</title>

<script language="Javascript">
<!-- Begin
//document.oncontextmenu = function(){return false}
// End -->

	window.print()
	
</script>
<%
	
	'Preparar Etiqueta Body del Formulario
	wCLA001 = trim(Request.QueryString("CLA001"))
	
	wCCI = Session("glCiaInternet") 
	wCIA = Session("glCia") 
	
	wVEN = Request.Form("VENDEDOR") 

	wFECHA = RIGHT("00" & DAY(NOW),2) & "-" & RIGHT("00" & MONTH(NOW),2) & "-" & YEAR(NOW)

	wMCO = 0
    
	strCnn	= Application("XDTA300_ConnectionString")	
	
	SQL = "SELECT C300001CCL, C300001MCO, C300001FAC, "
	SQL = SQL & " C300001NRC, C300001OBS "
	SQL = SQL & " FROM X300CF001 "
	SQL = SQL & " WHERE "
	SQL = SQL & " C300001CCI = '" & wCCI & "' AND "
	SQL = SQL & " C300001NDC = '" & wCLA001  & "'"
	'response.write sql 
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	if NOT rstQuery.EOF then
		wCCL = Trim(rstQuery.Fields("C300001CCL"))
		wFAC = CDATE(rstQuery.Fields("C300001FAC"))
		wMCO = CDBL(rstQuery.Fields("C300001MCO"))
		wNRC = trim(rstQuery.Fields("C300001NRC"))
		wOBS = Trim(rstQuery.Fields("C300001OBS"))
	end if
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	wDIA = RIGHT("00" & DAY(wFAC),2)
	wMES = RIGHT("00" & MONTH(wFAC),2)
	wANO = YEAR(wFAC)

	SQL = "SELECT A300002RSO, A300002RIF, A300002CVE FROM X300AF002 "
	SQL = SQL & " WHERE "
	SQL = SQL & " A300002CCI = '" & wCCI & "' AND "
	SQL = SQL & " A300002CCL = '" & wCCL & "'"
	'response.write sql 
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	if NOT rstQuery.EOF then
		wRSO = Trim(rstQuery.Fields("A300002RSO"))
		wRIF = Trim(rstQuery.Fields("A300002RIF"))
		wCVE = Trim(rstQuery.Fields("A300002CVE"))
	end if
	rstQuery.CLOSE
	SET rstQuery = NOTHING	


	%>



<p>

<table border="0" >
<tr><td align="LEFT" >
<img border="0" src="http://www.valpartca.com/ASPX/Imagenes/Logos/VAL_Logo.jpg">
</td>
</tr>
<tr><td align="CENTER"  ><p CLASS="P1">
<b>R.I.F. J-30499717-5</b></p> 
</td></tr>
</table>
 
</p>

</head>

<body topmargin="0" leftmargin="5" rightmargin="5" bottommargin="0" >

<table border="0"  width="100%" height="85">
<tr><td valign="middle" width="228"  >
<table border="1" cellspacing="0" bordercolor="#808080" width="200" >
<tr>
<td align="center" bgcolor="#C0C0C0"><p CLASS="P1" align="center"><b>DIA</b></p> </td>
<td align="center" bgcolor="#C0C0C0"><p CLASS="P1" align="center"><b>MES</b></p> </td>
<td align="center" bgcolor="#C0C0C0"><p CLASS="P1" align="center"><b>AÑO</b></p> </td>
</tr>

<tr>
<td align="center" height="25" ><p CLASS="P1" align="center"><%=wDIA%></p> </td>
<td align="center"><p CLASS="P1" align="center"><%=wMES%></p> </td>
<td align="center"><p CLASS="P1" align="center"><%=wANO%></p> </td>
</tr>
<tr>
<td align="center" bgcolor="#C0C0C0" colspan="3" ><p CLASS="P1" align="center"><b>
CÓDIGO VENDEDOR</b></p> </td>
</tr>
<tr>
<td align="center" height="25" colspan="3"><p CLASS="P1" align="center"><%=wCVE%></p> </td>
</tr>

</table>

</td> 

<td width="398">



<p align="center" style="margin-top: 0; margin-bottom: 0">
<font face="Tahoma" size="1">DIRECCIÓN:</font></p>
<p align="center" style="margin-top: 0; margin-bottom: 0"><font size="1">Av. Alfredo Briceño Local Nro 31-A PB Zona Industrial Los Curos, Mérida Edo. Mérida Venezuela Zona Postal 5101<br>
<!--TEL.: (0212) 442 - 1754 </font><font size="2"><br>-->
&nbsp;</font></td> 

<td align="right"  >

<table border="1" cellpadding="3" cellspacing="0" bordercolor="#808080" width="200">
<tr><td align="LEFT" bgcolor="#000000">
<p CLASS="P1" align="center"><font color="#FFFFFF"><b>COMPROBANTE ELECTRÓNICO</b></font></p> 
</td>
</tr>
<tr><td align="CENTER"><p CLASS="P"><b>N° <%=wCLA001%></b> 
</p> 
</td></tr>
<tr><td align="LEFT" bgcolor="#000000" >
<p CLASS="P1" align="center"><font color="#FFFFFF"><b>CÓDIGO DE CLIENTE</b></font></p> 
</td>
</tr>
<tr><td align="CENTER"><p CLASS="P1"><%=wCCL%>
</p> 
</td></tr>

</table>


</td> 
</tr> 
</table>

<br>
<div align="center">
<table BORDER="0" WIDTH="100%" cellpadding="4" cellspacing="0" bordercolor="#808080" style="border-style: solid; border-width: 2px"  >
<tr><td align="left"  width="150" height="25">
<p CLASS="P1" align="left"><b>HEMOS RECIBIDO DE:</b></p> 
</td>
<td align="left"  >
<p CLASS="P1" align="left"><u><%=wRSO%></u></p> 
</td> 
</tr>
<% IF LEN(TRIM(wOBS)) > 0 THEN %>
<tr><td align="left"  width="150" height="25">
<p CLASS="P1" align="left"><b>Observación:</b></p> 
</td>
<td align="left"  >
<p CLASS="P1" align="left"><u><%=wOBS%></u></p> 
</td> 
</tr>
<% END IF %>
<tr><td align="left"  width="150" height="25">
<p CLASS="P1" align="left"><b>RIF.:</b></p> 
</td>
<td align="left"  >
<p CLASS="P1" align="left"><u><%=wRIF%></u>&nbsp;&nbsp;&nbsp;&nbsp;<b><span style="font-size: 8pt">PARA LA CANCELACIÓN DE LOS SIGUIENTES DOCUMENTOS:</span></b></p> 
</td> 
</tr>

</table>
	
</div>
	
<br>
       
<table width="100%" bgcolor="#FFFFFF" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF">


<div align="center">


<table BORDER="1" WIDTH="100%" cellpadding="3" cellspacing="0" bordercolor="#808080"   >
		 <TR>
		 <td CLASS="TDT" colspan=7 height="30">DOCUMENTOS</td>		  
		 </TR>	

    
    <%
    
    wC300002CCI = Session("glCiaInternet")
	wC300002CIA = Session("glCia")
	
	'*********************************************QUERY PARA FACTURAS*********************************************

    SQL = " SELECT C300002NFA, C300002MCO, C300002MNE, C300002PPP, "
	SQL = SQL & " C300002PIM, C300002ARI, C300002FVE, C300002TDO, "
	SQL = SQL & " C300002BPP, C300002FEC "
	SQL = SQL & " FROM X300CF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " C300002CCI ='" & wC300002CCI & "' AND "
	SQL = SQL & " C300002CIA ='" & wC300002CIA & "' AND "
	SQL = SQL & " C300002NDC ='" & wCLA001 & "' AND "
	SQL = SQL & " C300002TDO <> 'N/C' "
	SQL = SQL & " ORDER BY C300002FAC DESC " 	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
    wColumna  = 1
    wCuenta = 0
	wTC03 = 0 
	wTC08 = 0
	wTC09 = 0
	DO WHILE NOT rstQuery.EOF 
    
		wNFA = TRIM(rstQuery.Fields("C300002NFA"))		
		wARI = TRIM(rstQuery.Fields("C300002ARI"))		
		wMFA = TRIM(rstQuery.Fields("C300002MNE"))		
		wPIM = TRIM(rstQuery.Fields("C300002PIM"))		
		wPRI = TRIM(rstQuery.Fields("C300002PPP"))		
		wFVE = TRIM(rstQuery.Fields("C300002FVE"))
		wTDO = TRIM(rstQuery.Fields("C300002TDO"))		
		wFEC = TRIM(rstQuery.Fields("C300002FEC"))
		wPDE = TRIM(rstQuery.Fields("C300002BPP"))
		
		wNET = wMFA
		
		IF wARI = "N" THEN
			wPRI = 0
		END IF 						
					
			wVFA = "S"
	
			wColspan = "colspan=2"			
			IF wARI = "S" THEN
			
				wColspan = ""			
				'Calculo de Retención
				wPI1 = wPIM * (wPRI/100)		
				wPI2 = wPIM * ((100-wPRI)/100)						
				wBI1 = wMFA * (wPI1/100)
				wBI2 = wMFA * (wPI2/100)				
				'response.write wPIM & "-" & wPI1 & "-" & wPI2 & "-" & wBI1 & "-" & wBI2 & "-" & wMFA & "<br>"
				'wPIM = wPI2	
			ELSE				
				wBI2 = wMFA * (wPIM/100)
				wPI1 = 0
				wPI2 = wPIM				
			END IF 		
		
			'wNET = wMFA
			
			wMFA = wMFA + CDBL(wBI1) 
			wMFA = wMFA + CDBL(wBI2)			
			wTBI1 = wTBI1 + cdbl(wBI1)
			wTBI2 = wTBI2 + cdbl(wBI2)			
			wTMFA = wTMFA + cdbl(wMFA)
			wTNET = wTNET + cdbl(wNET)
			
			IF wCuenta = 0 THEN				
				Response.write "<tr>"			
        	
			  	Response.write "<td width=""6%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>&nbsp;</b></p></td>"
        	  	Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>Documento</b></p></td>"
        	  	Response.write "<td width=""6%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>Tipo</b></p></td>"
        	  	Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>Emisión</b></p></td>"
        	  	Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>Vencimiento</b></p></td>"
        	  	'Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>% Desc. Apli.</b></p></td>"
        	  	Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""right""><b>Bolivares</b></p></td>"
    	  	

        	  	Response.write "</tr>"
          	END IF 
          	
          	If wColumna = 1 Then
          		'Response.write "<tr>"
          	End If
          		          	
          	Response.write "<tr>"
          	
          	Response.write "<td width=""6%"" style=""font-size: 10pt; font-family: Tahoma; text-align:center"">&nbsp;"
			Response.write wColumna  
	 		Response.write "</td>"
	 		
          	Response.write "<td width=""15%"" style=""font-size: 10pt; font-family: Tahoma; text-align:center"">&nbsp;"
			Response.write	wNFA  
	 		Response.write "</td>"
	 		
	 		Response.write "<td width=""6%"" style=""font-size: 10pt; font-family: Tahoma; text-align:center"">&nbsp;"
			Response.write	wTDO  
	 		Response.write "</td>"
	 		
	 		Response.write "<td width=""15%"" style=""font-size: 10pt; font-family: Tahoma; text-align:center"">&nbsp;"
			Response.write	wFEC  
	 		Response.write "</td>"
	 		
	 		Response.write "<td width=""15%"" style=""font-size: 10pt; font-family: Tahoma; text-align:center"">&nbsp;"
			Response.write	wFVE  
	 		Response.write "</td>"
	 		
	 		'Response.write "<td width=""15%"" style=""font-size: 10pt; font-family: Tahoma; text-align:center"">&nbsp;"
			'Response.write	wPDE  
	 		'Response.write "</td>"
	 		
	 		Response.write "<td width=""15%"" style=""font-size: 10pt; font-family: Tahoma; text-align:right"">&nbsp;"
			Response.write	formatnumber(wMFA,2) 
	 		Response.write "</td>"
	 			
	 		Response.write "</tr>"		 	 		
	 		If wColumna = 2 Then
	 			'Response.write "</tr>"
	 			'wColumna = 0	
	 		End If 
			
			'response.write SQL	
			'response.write wNFA & "-" & wMFA & "-" & wPIM & "-" & wARI & "-" & wPRI & "<br>"
								
			wColumna  = wColumna  + 1
	
		rstQuery.MoveNext 
		wCuenta = wCuenta + 1
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	Response.write "<tr>"
  	Response.write "<td width=""20%"" colspan=""5"" height=""25""><p CLASS=""P1"" align=""right""><b>SUB-TOTAL Bs.</b></p></td>"
    Response.write "<td width=""20%"" ><p CLASS=""P1"" align=""Right"">" & formatnumber(wTMFA,2) & "</p></td>"
    Response.write "</tr>"
    
    '**********************************************FIN QUERY PARA FACTURAS**********************************************
   
        
    '*******************************************QUERY PARA NOTAS DE CREDITO*********************************************
	 SQL = " SELECT C300002NFA, C300002MCO, C300002MNE, C300002PPP, "
	SQL = SQL & " C300002PIM, C300002ARI, C300002FVE, C300002TDO " 
	SQL = SQL & " FROM X300CF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " C300002CCI ='" & wC300002CCI & "' AND "
	SQL = SQL & " C300002CIA ='" & wC300002CIA & "' AND "
	SQL = SQL & " C300002NDC ='" & wCLA001 & "' AND "
	SQL = SQL & " C300002TDO ='NC' "
	SQL = SQL & " ORDER BY C300002FAC DESC " 	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
    wColumna  = 1
    wCuenta2 = 0
	wTC03 = 0 
	wTC08 = 0
	wTC09 = 0
	DO WHILE NOT rstQuery.EOF 
    	
		wNFA = TRIM(rstQuery.Fields("C300002NFA"))		
		wARI = TRIM(rstQuery.Fields("C300002ARI"))		
		wMNC = TRIM(rstQuery.Fields("C300002MNE"))	
		wPIM = TRIM(rstQuery.Fields("C300002PIM"))	
		'wMFA = wMFA / (1+(wPIM /100))			
		wPRI = TRIM(rstQuery.Fields("C300002PPP"))		
		wFVE = TRIM(rstQuery.Fields("C300002FVE"))		
		wTDO = TRIM(rstQuery.Fields("C300002TDO"))		
		wNET = wMNC
				
		IF wARI = "N" THEN
			wPRI = 0
		END IF 				
					
			wVFA = "S"	
			wColspan = "colspan=2"
			
			IF wARI = "S" THEN
				wColspan = ""			
				'Calculo de Retención
				wPI1 = wPIM * (wPRI/100)		
				wPI2 = wPIM * ((100-wPRI)/100)						
				wBI1 = wMNC * (wPI1/100)
				wBI2 = wMNC * (wPI2/100)				
				'response.write wPIM & "-" & wPI1 & "-" & wPI2 & "-" & wBI1 & "-" & wBI2 & "-" & wMFA & "<br>"
				'wPIM = wPI2	
			ELSE				
				wBI2 = wMNC * (wPIM/100)
				wPI1 = 0
				wPI2 = wPIM				
			END IF 		
		
			'wNET = wMFA			
			wMNC = wMNC + CDBL(wBI1) 
			wMNC = wMNC + CDBL(wBI2)			
			wTBI12 = wTBI11 + cdbl(wBI1)
			wTBI22 = wTBI22 + cdbl(wBI2)			
			wTNET2 = wTNET2 + cdbl(wNET)
			wTMNC = wTMNC + cdbl(wMNC)			
			
			IF wCuenta2 = 0 THEN
				Response.write "<TR> <td CLASS=""TDT"" colspan=6 height=""30"">NOTAS DE CREDITO</td> </TR>"					
				Response.write "<tr>"			
        	  	Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>NOTA</b></p></td>"
        	  	Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>FECHA</b></p></td>"
        	  	Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""right""><b>BOLIVARES</b></p></td>"
        	  	Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>NOTA</b></p></td>"
	        	Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>FECHA</b></p></td>"
	        	Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""right""><b>BOLÍVARES</b></p></td>"        	  	
        	  	Response.write "<tr>"
          	END IF 
          	
          	If wColumna = 1 Then
          		Response.write "<tr>"
          	End If	          	
          	Response.write "<td width=""15%"" style=""font-size: 10pt; font-family: Tahoma; text-align:center"">&nbsp;"
			Response.write	wNFA  
	 		Response.write "</td>"	 		
	 		Response.write "<td width=""15%"" style=""font-size: 10pt; font-family: Tahoma; text-align:center"">&nbsp;"
			Response.write	wFVE  
	 		Response.write "</td>"	 		
	 		Response.write "<td width=""15%"" style=""font-size: 10pt; font-family: Tahoma; text-align:right"">&nbsp;"
			Response.write	formatnumber((wMNC*-1),2) 
	 		Response.write "</td>"	 	 		
	 		If wColumna = 2 Then
	 			Response.write "</tr>"
	 			wColumna = 0	
	 		End If 
			
			'response.write SQL	
			'response.write wNFA & "-" & wMFA & "-" & wPIM & "-" & wARI & "-" & wPRI & "<br>"					
			
			wColumna  = wColumna  + 1
	
		rstQuery.MoveNext 
		wCuenta2 = wCuenta2 + 1
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	IF wCuenta2 > 0 Then
		Response.write "<tr>"
  		Response.write "<td width=""20%"" colspan=""6"" height=""25""><p CLASS=""P1"" align=""right""><b>SUB-TOTAL Bs.</b></p></td>"
    	Response.write "<td width=""20%"" ><p CLASS=""P1"" align=""Right"">" & formatnumber((wTMNC*-1),2) & "</p></td>"
    	Response.write "</tr>"
    END IF 
   
   '******************************************FIN QUERY PARA NOTAS DE CREDITO*******************************************

   
    %>
    
     </table> 
    <br>
    <table border="0" cellspacing="0" width="100%" align="center"  cellpadding="4" >

    
     <TR>
		 <td CLASS="TDT" colspan=6 height="30">RESUMEN</td>		  
		 </TR>	
		 
		 <tr>
		 <td width="33%" colspan="2" bgcolor="#C0C0C0"><p CLASS="P1" align="left">
			<b>CONCEPTO</b></p></td>
         <td width="33%" colspan="2" bgcolor="#C0C0C0"><p CLASS="P1" align="center">
			<b>%</b></p></td>
         <td width="33%" colspan="2" bgcolor="#C0C0C0"><p CLASS="P1" align="right">
			<b>BOLÍVARES</b></p></td>
		 </tr>
		 
		 <tr>
		 <td width="33%" colspan="2" ><p CLASS="P1" align="left"><b>MONTO NETO SIN IVA</b></p></td>
         <td width="33%" colspan="2" ><p CLASS="P1" align="center">&nbsp;</p></td>
         <td width="33%" colspan="2" ><p CLASS="P1" align="right">&nbsp;<%=formatnumber(wTNET-wTNET2,2)%></p></td>	 
		 </tr>
		 
		 <% 
		 	'wTBI1+wTBI2	
		 	wIVA = wTBI1+wTBI2	
		 	wIVA = wIVA - (wTBI12 + wTBI22)		 		 	
		 		 	
		 %>

		 <tr>
		 <td width="33%" colspan="2" ><p CLASS="P1" align="left"><b>IVA</b></p></td>
         <td width="33%" colspan="2" ><p CLASS="P1" align="center">&nbsp;<%=formatnumber(wPI1+wPI2,2)%></p></td>
         <td width="33%" colspan="2" ><p CLASS="P1" align="right">&nbsp;<%=formatnumber(wIVA,2)%></p></td>	 
		 </tr>
		 
		 <tr>
		 <td width="33%" colspan="2" ><p CLASS="P1" align="left"><b>RETENCIÓN IVA</b></p></td>
         <td width="33%" colspan="2" ><p CLASS="P1" align="center">&nbsp;<%=formatnumber(wPRI,0)%> %</p></td>
         <td width="33%" colspan="2" ><p CLASS="P1" align="right">
          <% IF wTBI1 > 0 THEN %>
         	-&nbsp;<%=formatnumber(wTBI1-wTBI12,2)%>
         <% ELSE %>
         	&nbsp;<%=formatnumber(wTBI1,2)%>
         <% END IF %>

         </p></td>	 
		 </tr>
		 
	     <%
		 	
		 	'wTMFA-wTBI1
		 	wTOT = wTMFA - wTMNC
		 	wTOT = wTOT - (wTBI1-wTBI12)
		 
		 %>

		 <tr>
  		 <td width="20%" colspan="5" height="25"><p CLASS="P1" align="right"><b>TOTAL Bs.</b></p></td>
  	  	 <td width="20%" ><p CLASS="P1" align="Right"><%=formatnumber((wTOT),2)%></p></td>
    	 
		<tr>
  		 <td width="20%"  height="25"><p CLASS="P1" align="center"><b>SON 
			BOLÍVARES</b></p></td>
  	  	 <td width="20%" colspan="5" ><p CLASS="P1" align="center"><%=ucase(CONVERTIR(wTOT))%></p></td>
    	 </table>     </div>
</td>
    	 </tr>
    	 </table>
    	 
    	 
<% IF wNRC <> "0" THEN %>

<br>
<!--<table BORDER="1" WIDTH="100%" align="center" cellpadding="3" cellspacing="0" bordercolor="#808080"   bgcolor="#FFFFFF" >
		 <TR>
		 <td style="border-left-width: 1px; border-right-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px" width="250">
    <p CLASS="P1" align="left"><b>NRO. DE TALONARIO FÍSICO DE COBRANZA:</b> </p> 
    </td>
    <td ><p CLASS="P1" align="left">  
    <b><font size="3"><%=wNRC%></font></b></p> </td>
    </tr>
    </table>-->
<% END IF %>

    	 <br>
    	 <div align="center">
    	 <table BORDER="1" WIDTH="100%" cellpadding="3" cellspacing="0" bordercolor="#808080"   >
		 <TR width="100%">
		 <td CLASS="TDT" colspan=7 height="30" bgcolor="#C0C0C0">FORMA DE PAGO</td>		  
		 </TR>	
		 
		 <tr width="100%">
		 <td bgcolor="#C0C0C0"><p CLASS="P1" align="left"><b>BANCO</b></p></td>
		 <td bgcolor="#C0C0C0"><p CLASS="P1" align="left"><b>FORMA DE PAGO</b></p></td>
		 <td bgcolor="#C0C0C0"><p CLASS="P1" align="left"><b>NRO. DE PLANILLA</b></p></td>
		 <td bgcolor="#C0C0C0"><p CLASS="P1" align="center"><b>FECHA</b></p></td>
		 <td bgcolor="#C0C0C0"><p CLASS="P1" align="left"><b>CHEQUE</b></p></td>
		 <td bgcolor="#C0C0C0"><p CLASS="P1" align="left"><b>BANCO</b></p></td>
		 <td bgcolor="#C0C0C0" width="80"  ><p CLASS="P1" align="right"><b>MONTO</b></p></td>
		 </tr>
		 
		  
		 
		 
<%
		 
	SQL = " SELECT C300003CBN, C300003DOC, C300003TDP, C300003MCO, "
	SQL = SQL & " C300003FEC, C300003NCH, C300003CBC, X300AF034.A300034DEL, "
	SQL = SQL & " ISNULL(X300AF025.A300025DEL, '') AS A300025DEL "
	SQL = SQL &	" FROM  X300AF025 RIGHT OUTER JOIN "
    SQL = SQL &	" X300CF003 ON X300AF025.A300025CBN = X300CF003.C300003CBC AND "
    SQL = SQL &	" X300AF025.A300025CIA = X300CF003.C300003CIA AND "
    SQL = SQL &	" X300AF025.A300025CCI = X300CF003.C300003CCI LEFT OUTER JOIN "
    SQL = SQL &	" X300AF034 ON X300CF003.C300003CCI = X300AF034.A300034CCI AND "
    SQL = SQL &	" X300CF003.C300003CIA = X300AF034.A300034CIA AND "
    SQL = SQL &	" X300CF003.C300003CBN = X300AF034.A300034CBN "
	SQL = SQL & " WHERE "
	SQL = SQL & " C300003CCI ='" & wC300002CCI & "' AND "
	SQL = SQL & " C300003CIA ='" & wC300002CIA & "' AND "
	SQL = SQL & " C300003NDC ='" & wCLA001 & "' "
	SQL = SQL & " ORDER BY C300003FAC DESC " 	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	'response.write sql
    wCuenta = 0	
	wTMCO = 0  
	DO WHILE NOT rstQuery.EOF 
    

	
		wCBN = TRIM(rstQuery.Fields("C300003CBN"))		
		'wA300034DEL = TRIM(REPLACE(rstQuery.Fields("A300034DEL"),"BANCO", ""))		
		'wA300025DEL = TRIM(REPLACE(rstQuery.Fields("A300025DEL"),"BANCO", ""))		
		wA300034DEL = TRIM(rstQuery.Fields("A300034DEL"))
		wA300025DEL = TRIM(rstQuery.Fields("A300025DEL"))		
		wTDP = TRIM(rstQuery.Fields("C300003TDP"))		
		wDOC = TRIM(rstQuery.Fields("C300003DOC"))		
		wNCH = TRIM(rstQuery.Fields("C300003NCH"))		
		wCBC = TRIM(rstQuery.Fields("C300003CBC"))		
		wMCO = CDBL(rstQuery.Fields("C300003MCO"))		
		wFEC = TRIM(rstQuery.Fields("C300003FEC"))		
		
		IF ISNULL(wDEL) THEN
			wDEL = wCBN
		END IF 
		
		IF wTDP = "DP" THEN			 
			wTDP = "DEPOSITO"			
		  ELSE
			wTDP = "TRANSFERENCIA"							
		END IF 

		wFEC = RIGHT("00" & DAY(wFEC),2) & "-" & RIGHT("00" & MONTH(wFEC),2) & "-" & YEAR(wFEC) 		
		
		wTMCO = wTMCO + cdbl(wMCO) 
		 
		Response.write "<tr width=""100%""><td><p CLASS=""P1"">"        
			Response.write wA300034DEL          
		Response.write "</P></td>"
                   
        Response.write "<td style=""font-size: 10pt; font-family: Tahoma; text-align:left""><p CLASS=""P1"">"
			Response.write wTDP 
        Response.write "</P></td>"
                   
        Response.write "<td style=""font-size: 10pt; font-family: Tahoma; text-align:left""><p CLASS=""P1"">"
			Response.write wDOC			
		Response.write "</P></td>"
         
		Response.write "<td style=""font-size: 10pt; font-family: Tahoma; text-align:center""><p CLASS=""P1"">"						
			Response.write wFEC			
		Response.write "</P></td>"
		
		Response.write "<td style=""font-size: 10pt; font-family: Tahoma; text-align:left""><p CLASS=""P1"">"
			Response.write wNCH		
		Response.write "</P></td>"
		
		Response.write "<td style=""font-size: 10pt; font-family: Tahoma; text-align:left""><p CLASS=""P1"">"
			Response.write wA300025DEL          			
		Response.write "</P></td>"
          
        Response.write "<td style=""font-size: 10pt; font-family: Tahoma; "" align=""right"" ><p CLASS=""P1"" align=""right"">"			
			Response.write formatnumber(wMCO,2) 			
		Response.write "</P></td></tr>"
		
		rstQuery.MoveNext 
		wCuenta = wCuenta + 1
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	

         
         
%>

<tr width="100%">
         

		 <td  colspan=6 style="font-size: 10pt; font-family: Tahoma; text-align:right">
		 <b>TOTAL RECIBIDO Bs.
		</b>
		</td>
          
          <td  style="font-size: 10pt; font-family: Tahoma; " align="right">
			<%= formatnumber(wTMCO,2)%>			
			
			</td>
         
    
         </tr>

         	<tr width="100%">
  		 <td height="25"><p CLASS="P1" align="center"><b>SON</b></p></td>
  	  	 <td colspan="6" ><p CLASS="P1" align="center"><%=ucase(CONVERTIR(wTMCO))%></p></td>
    	 </table>   
    	 

  </div>
    	 

  </td>
    	 </tr>
         </table> 
    	 
    	 </div>
    	 <!--<table border="0" width="100%" id="table1">
			<tr>
				<td>
				<p align="left"><font size="1" style="font-size:  9 pto"><b>SE 
				ELIGE COMO DOMICILIO LA CIUDAD DE CAGUA, EDO. ARAGUA, A CUYOS TRIBUNALES LAS PARTES 
				DECLARAN SOMETERSE.</b></font></td>
			</tr>
</table>-->

<br>
    	 <table border="0" width="100%" id="table2" bgcolor="#000000">
			<tr>
				<td>
				<p align="center"><font size="1" color="#FFFFFF"><b>
				ESTE COMPROBANTE SE ENCUENTRA SUJETO A CONCILIACIÓN  BANCARIA Y PIERDE SU VALIDEZ 
					POR CHEQUES DEVUELTOS, EN CUYO CASO LOS 
				DOCUMENTOS NO SE CONSIDERAN CANCELADOS Y LOS DESCUENTOS PIERDEN 
				SU EFECTO</b></font></td>
			</tr>
</table>
<!--
<p>
    	 <br>
    	 </p>
    	 <p align="center"  >
    	 <input type="button" value="Imprimir" name="Imprimir"  onclick="javascript:window.print()">
    	 <input type="button" value="Cerrar" name="Cerrar"  onclick="javascript:window.close()">
    	</p> -->
</body>

</html>