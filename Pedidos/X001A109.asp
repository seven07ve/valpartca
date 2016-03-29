<%@ Language=VBScript %>

<%

Response.Expires = -1
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"

%>


<!--#include file="X001Z001.INC"-->
<!--#include file="X001Z900.INC"-->
<% wSTSIMP = Request.QueryString("STSIMP") %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Facturas del Pago</title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<!--#include file="X001Z001.INC"-->
</head>


<script language="Javascript">


function Procesar() {

	//if (confirm('&#65533;Desea Procesar Pago?')) {
	// Respuesta afirmativa...
	document.FrmProcesar.submit(); 
	//}
	//else{
	//alert('Recuerde que para que el Pedido sea Facturado debe Procesarlo');
	//}
	
}

</script> 


<!--#include file="X001Y001.PRC"-->

<% if wSTSIMP = "S"  THEN
	wcellpadding = "3"
	wBorderColor ="#C0C0C0"  %>
	<body onload="window.status='<%=Request.ServerVariables("URL")%>'" ALIGN="CENTER">
		<div align=center>

		<table BORDER="1" WIDTH="100%" cellspacing="0" cellpadding="<%=wcellpadding%>"
		  bordercolorlight="<%=wBorderColor%>" bordercolordark="<%=wBorderColor%>" bordercolor="<%=wBorderColor%>" align="center" >
		  
<%	ELSE %>
	<body bgcolor="<%=Request.Cookies("CAR")("Color1")%>" ALIGN="CENTER" vlink="#0000FF" scroll="yes"  onload="window.status='<%=Request.ServerVariables("URL")%>'" topmargin="0" leftmargin="17" rightmargin="0" bottommargin="0"  >

				
<%  

	wTIT = Request.QueryString("URLTIT")	
	wURLACT = TRIM(Request.QueryString("URLACT"))
	IF ISNULL(wURLACT) OR TRIM(wURLACT) = "" THEN
		wURLACT = "X001A109_A.ASP"
	END IF 

	wCLA001 = Request.QueryString("CAMC01")
	wCLA002 = Request.QueryString("CAMC02")
	wC300002CCI = Session("glCiaInternet")
	wC300002CIA = Session("glCia")
	
	IF ISNULL(wTIT) OR TRIM(wTIT) = "" THEN
		wNOMCLI = BuscarClientePago (wCLA002)
		wNOMCLI = replace(wNOMCLI, chr(34), " ") 
		wNOMCLI = replace(wNOMCLI, "'", " ") 
		wTIT = "Pago " & wCLA002 & " de "  &  wNOMCLI & "A"
	END IF 

	strCnn	= Application("XDTA300_ConnectionString")
	
    SQL = "SELECT C300001SPP, C300001NRC, C300001OBR, C300001STS, "
    SQL = SQL & " C300001NRD, C300001FD1, C300001DF1, C300001MF1, "
    SQL = SQL & " C300001FD2, C300001DF2, C300001MF2 "
    SQL = SQL & " FROM X300CF001 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " C300001NDC = '" &  wCLA002 & "' "	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		wSPP = trim(rstQuery.Fields("C300001SPP"))
		wNRC = trim(rstQuery.Fields("C300001NRC"))
		wOBR = trim(rstQuery.Fields("C300001OBR"))
		wSTS = trim(rstQuery.Fields("C300001STS"))
		wNRD = trim(rstQuery.Fields("C300001NRD"))
		wFD1 = trim(rstQuery.Fields("C300001FD1"))
		wDF1 = trim(rstQuery.Fields("C300001DF1"))
		wMF1 = trim(rstQuery.Fields("C300001MF1"))
		wFD2 = trim(rstQuery.Fields("C300001FD2"))
		wDF2 = trim(rstQuery.Fields("C300001DF2"))
		wMF2 = trim(rstQuery.Fields("C300001MF2"))
	END IF
	rstQuery.Close 
	set rstQuery = nothing


%>
		<table BORDER="0" width="919" align="center"  bgcolor="#FFFFFF" bordercolor="#FFFFFF" cellspacing="0" cellpadding="0"  height="100%">
		<tr><td valign="top" bgcolor="#FFFFFF">
		<br>
		<table BORDER="1" width="919" align="center"  bgcolor="#FFFFFF"  bordercolor="#FFFFFF" cellspacing="0"  height="100%"> 
<%	END IF


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
    
	wNOMTAB = Request.QueryString("NOMTAB")

	IF len(trim(wOBR)) > 0 THEN
		Response.write "<table WIDTH=""95%"" align=""center""><tr><td><p aling=""center""><font color=""#CC0000""><b>" 
		Response.write wOBR
		Response.write "</b></font></p></td></tr></table><br>"
	END IF 
	
	
	wC300002CCI = Session("glCiaInternet")
	wC300002CIA = Session("glCia")
	
	    
	'*********************************************QUERY PARA FACTURAS*********************************************
    SQL = " SELECT C300002NFA, C300002MCO, C300002MNE, C300002PPP, "
	SQL = SQL & " C300002PIM, C300002ARI, C300002FVE, C300002TDO,  "
	SQL = SQL & " C300002FEC, C300002BPP " 
	SQL = SQL & " FROM X300CF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " C300002CCI ='" & wC300002CCI & "' AND "
	SQL = SQL & " C300002CIA ='" & wC300002CIA & "' AND "
	SQL = SQL & " C300002NDC ='" & wCLA002 & "' AND "
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
		'wMFA = wMFA / (1+(wPIM /100))			
		wPRI = TRIM(rstQuery.Fields("C300002PPP"))		
		wFVE = TRIM(rstQuery.Fields("C300002FVE"))		
		wTDO = TRIM(rstQuery.Fields("C300002TDO"))
		wPDE = TRIM(rstQuery.Fields("C300002BPP"))		
		wFEC = TRIM(rstQuery.Fields("C300002FEC"))		
		wNET = wMFA
				
		IF wARI = "N" THEN
			wPRI = 0
		END IF 				
					
			wVFA = "S"	
			wColspan = "colspan=2"
			
			IF wARI = "S" THEN			
				wColspan = ""			
				'Calculo de Retenci&#65533;n
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
			wTNET = wTNET + cdbl(wNET)
			wTMFA = wTMFA + cdbl(wMFA)			
			
			IF wCuenta = 0 THEN			
				Response.write "<table BORDER=""1"" WIDTH=""95%"" bgcolor=""#FFFFFF"" align=""center"" cellpadding=""3"" cellspacing=""0"" bordercolor=""#808080""   >"
				 Response.write "<TR> <td CLASS=""TDT"" colspan=7 height=""30"">DOCUMENTOS</td> </TR>"					
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
    '**********************************************FIN QUERY PARA FACTURAS***********************************************
        
    
    '*******************************************QUERY PARA NOTAS DE CREDITO*********************************************
    
    SQL = " SELECT C300002NFA, C300002MCO, C300002MNE, C300002PPP, "
	SQL = SQL & " C300002PIM, C300002ARI, C300002FVE, C300002TDO " 
	SQL = SQL & " FROM X300CF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " C300002CCI ='" & wC300002CCI & "' AND "
	SQL = SQL & " C300002CIA ='" & wC300002CIA & "' AND "
	SQL = SQL & " C300002NDC ='" & wCLA002 & "' AND "
	SQL = SQL & " C300002TDO ='N/C' "
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
				Response.write "<BR></table>"
				Response.write "<table BORDER=""1"" WIDTH=""95%"" cellspacing=""0"" bordercolor=""#808080""   >"

				Response.write "<TR> <td CLASS=""TDT"" colspan=5 height=""30"">NOTAS DE CREDITO</td> </TR>"					
				Response.write "<tr>"			
        	  	Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>NOTA</b></p></td>"
        	  	Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>FECHA</b></p></td>"
        	  	Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""right""><b>BOLÍVARES</b></p></td>"
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
  		Response.write "<td width=""20%"" colspan=""5"" height=""25""><p CLASS=""P1"" align=""right""><b>SUB-TOTAL Bs.</b></p></td>"
    	Response.write "<td width=""20%"" ><p CLASS=""P1"" align=""Right"">" & formatnumber((wTMNC*-1),2) & "</p></td>"
    	Response.write "</tr>"
    END IF     
    '******************************************FIN QUERY PARA NOTAS DE CREDITO*******************************************
   
    %>
    </table> 
    <br>
    <table border="0" cellspacing="0" width="95%" align="center"  cellpadding="4" >
    
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
		 <td width="33%" colspan="2" ><p CLASS="P1" align="left"><b>MONTO NETO 
		 SIN IVA</b></p></td>
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
		 <td width="33%" colspan="2" ><p CLASS="P1" align="left"><b>RETENCIÓN 
		 IVA</b></p></td>
         <td width="33%" colspan="2" ><p CLASS="P1" align="center">&nbsp;<%=formatnumber(wPRI,0)%> 
		 %</p></td>
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
  		 <td width="20%" colspan="5" height="25"><p CLASS="P1" align="right"><b>
		 TOTAL Bs.</b></p></td>
  	  	 <td width="20%" ><p CLASS="P1" align="Right"><%=formatnumber((wTOT),2)%></p></td>
    	 
		<tr>
  		 <td width="20%"  height="25"><p CLASS="P1" align="center"><b>SON</b></p></td>
  	  	 <td width="20%" colspan="5" ><p CLASS="P1" align="center"><%=ucase(CONVERTIR(wTOT))%></p></td>
    	 </table>     

 

<% IF wSPP = "1" THEN 

IF wNRC <> "0" THEN

%>

<br>
<table BORDER="1" WIDTH="95%" align="center" cellpadding="3" cellspacing="0" bordercolor="#808080"   bgcolor="#FFFFFF" >
		 <TR>
		 <td style="border-left-width: 1px; border-right-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px" width="300">
    <p CLASS="P1" align="left"><b>NRO. DE TALONARIO FÍSICO DE COBRANZA:</b> </p> 
    </td>
    <td ><p CLASS="P1" align="left">  
    <b><font size="3"><%=wNRC%></font></b></p> </td>
    </tr>
    </table>

<br><!--
<table BORDER="1" WIDTH="95%" align="center" cellpadding="3" cellspacing="0" bordercolor="#808080"   bgcolor="#FFFFFF" >
<tr>
    <td>&nbsp;</td>
    <td >&nbsp;</td>
    <td ><p CLASS="P1" align="left">  
    <b>NRO. DE FACTURA</b></p> </td>
    <td ><p CLASS="P1" align="left">  
    <b>DETALLE DE FACTURA</b></p> </td>
    <td ><p CLASS="P1" align="RIGHT">  
    <b>MONTO</b></p> </td>
    </tr>	
	 <TR>
		 <td style="border-left-width: 1px; border-right-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px" width="300">
    <p CLASS="P1" align="left"><b>NRO. DE TALONARIO FÍSICO DE DEVOLUCIÓN:</b> </p> 
    </td>
    <td width="80"><p CLASS="P1" align="left">  
    <b><font size="3"><%=wNRD%></font> </b> </p> </td>
    <td ><p CLASS="P1" align="left">  
    <%=wFD1%></p> </td>
    <td ><p CLASS="P1" align="left">  
    <%=wDF1%></p> </td>
    <td ><p CLASS="P1" align="RIGHT">  
    <%=wMF1%></p> </td>
    </tr>
    <tr>
    <td>&nbsp;</td>
    <td>
    &nbsp; </td>
    <td ><p CLASS="P1" align="left">  
    <%=wFD2%></p> </td>
    <td ><p CLASS="P1" align="left">  
    <%=wDF2%></p> </td>
    <td ><p CLASS="P1" align="RIGHT">  
    <%=wMF2%></p> </td>
    </tr>
    </table>-->

<% END IF %>


<%

	SQL = " SELECT C300004NRO, C300004NAR, C300004NOR "
	SQL = SQL &	" FROM  X300CF004 "    
	SQL = SQL & " WHERE "
	SQL = SQL & " C300004CCI ='" & wC300002CCI & "' AND "
	SQL = SQL & " C300004CIA ='" & wC300002CIA & "' AND "
	SQL = SQL & " C300004NDC ='" & wCLA002 & "' "
	SQL = SQL & " ORDER BY C300004NRO " 	
	'Response.write SQL
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn

    wCnt = 0	
	DO WHILE NOT rstQuery.EOF 

		If wCnt = 0 Then
%>

       <br>
       <table BORDER="1" WIDTH="95%" align="center" cellpadding="3" cellspacing="0" bordercolor="#808080"   bgcolor="#FFFFFF" >
		 <TR width="100%">
		 <td CLASS="TDT" height="30" colspan="2" bgcolor="#C0C0C0">PLANILLA DE 
		 RETENCIÓN DE IMPUESTO (IVA)</td>		  
		 </TR>	
		 
<% 		End If %>		 
		 
		 <tr width="100%">
		 <td ><p CLASS="P1" align="center"><%=TRIM(rstQuery.Fields("C300004NRO"))%></p></td>  
		 <td ><p CLASS="P1" align="left"><font color="#0000CC"  onclick="Javascript:window.open('../ASPX/CRI/<%=TRIM(rstQuery.Fields("C300004NAR"))%>','_blank')" style="cursor:pointer" ><%=TRIM(rstQuery.Fields("C300004NOR"))%></font> </p></td>

		 </tr>
		 
<%

		rstQuery.MoveNext 
		wCnt = wCnt + 1
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	

	If wCnt > 0 Then %>

	    <TR width="100%">
		 <td CLASS="TDT" height="30" colspan="2" align="center" >Haga click 
		 sobre el nombre para visualizar el archivo.</td>		  
		 </TR>	
		 		
		</table>
	
	<%End If%>

 



    <br>
 <table BORDER="1" WIDTH="95%" align="center" cellpadding="3" cellspacing="0" bordercolor="#808080"   bgcolor="#FFFFFF" >
		 <TR width="100%">
		 <td CLASS="TDT" colspan=7 height="30" bgcolor="#C0C0C0">FORMA DE PAGO</td>		  
		 </TR>	
		 
		 <tr width="100%">
		 <td bgcolor="#C0C0C0"><p CLASS="P1" align="left"><b>BANCO</b></p></td>
		 <td bgcolor="#C0C0C0"><p CLASS="P1" align="left"><b>FORMA DE PAGO</b></p></td>
		 <td bgcolor="#C0C0C0"><p CLASS="P1" align="left"><b>NRO. DE PLANILLA</b></p></td>
		 <td bgcolor="#C0C0C0"><p CLASS="P1" align="center"><b>FECHA</b></p></td>
		 <td bgcolor="#C0C0C0"><p CLASS="P1" align="center"><b>CHEQUE</b></p></td>
		 <td bgcolor="#C0C0C0"><p CLASS="P1" align="center"><b>BANCO</b></p></td>
		 <td bgcolor="#C0C0C0" width="80"><p CLASS="P1" align="right"><b>MONTO</b></p></td>
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
	SQL = SQL & " C300003NDC ='" & wCLA002 & "' "
	SQL = SQL & " ORDER BY C300003FAC DESC " 	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn

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
		wMCO = CDBL(rstQuery.Fields("C300003MCO"))		
		wFEC = TRIM(rstQuery.Fields("C300003FEC"))		
		wNCH = TRIM(rstQuery.Fields("C300003NCH"))		
		
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
		
		Response.write "<td style=""font-size: 10pt; font-family: Tahoma; text-align:center""><p CLASS=""P1"">"						
			Response.write wNCH			
		Response.write "</P></td>"
		
		Response.write "<td style=""font-size: 10pt; font-family: Tahoma; text-align:center""><p CLASS=""P1"">"						
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
          
          <td style="font-size: 10pt; font-family: Tahoma; " align="right">
			<%= formatnumber(wTMCO,2)%>			
			
			</td>
         
    
         </tr>

         	<tr width="100%">
  		 <td  height="25"><p CLASS="P1" align="center"><b>SON</b></p></td>
  	  	 <td colspan="6" ><p CLASS="P1" align="center"><%=ucase(CONVERTIR(wTMCO))%></p></td>
    	 </table>   
    	 <br><BR>

  </td>
    	 </tr>
         </table> 
    	

  
<% END IF 

wCLA001 = Request.QueryString("CAMC01")
wCLA002 = Request.QueryString("CAMC02")


%>
</td>

    	 </tr>
    	 </table>

<% 

'IF wARI = "S" THEN
'	'wURLP = "../ASPX/C001X001.aspx?CCI=" & wC300002CCI & "&NDC=" & wCLA002 
'	wURLP = "X001A112.asp?CLA001=" & wCLA002
 'ELSE
	wURLP = "X001A107.asp?CLA001=" & wCLA002
'END IF 

%>
<form action="<%=wURLP%>" target="main" name="FrmProcesar" method="post">
<!--<form action="X001A107.asp?CLA001=<%=wCLA002%>" target="main" name="FrmProcesar" method="post">-->
</form> 

</body>

</html>