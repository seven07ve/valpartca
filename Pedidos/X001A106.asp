<% 
Response.Expires = -1 
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"
%>
<!--#include file="X001Z001.INC"-->
<!--#include file="X001Z900.INC"-->
<%

	wCuenta = clng(TRIM(Request.Form("CUENTA")))	
	wCLA001 = Request.QueryString("CLA001")	
	wTMFA = 0 
	wFECHA = YEAR(DATE) & "-" & MONTH(DATE) & "-" & DAY(DATE) & " " & HOUR(TIME) & ":" & MINUTE(TIME) & ":" & SECOND(TIME)		
	
	
	strCnn	= Application("XDTA300_ConnectionString")
	
	wTIT = "DOCUMENTOS SELECCIONADOS"
	wTIT2 = "NOTAS DE CREDITO SELECCIONADAS"

%>

<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel=stylesheet type="text/css" href="X001Z900.CSS">



<script language="Javascript">

function enviar() {

	document.frmGral.Guardar.disabled = true;
	document.frmGral.Regresar.disabled = true;
 
	if (confirm("¿Esta deacuerdo con las Facturas Seleccionadas?")){
		document.frmGral.submit(); 
		}else{
		document.frmGral.Guardar.disabled = false;
		document.frmGral.Regresar.disabled = false;
	}
}

//document.oncontextmenu = function(){return false}
</script>

</HEAD>
<style>

html{overflow-y:scroll} 

</style>
<body bgcolor="<%=Request.Cookies("CAR")("Color1")%>" leftmargin="17" rightmargin="0"   topmargin=0>


	<FORM NAME="frmGral" METHOD="post" ACTION="X001A106S.asp?CLA001=<%=wCLA001%>" >

    <div align="center">


       <table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" cellspacing="0" align="center" height="100%" >
<tr>
<td height="100%" >

<table width="919" bgcolor="#FFFFFF" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF" valign="top" height="100%"  >


<br>
    
	  <div align="center">
    
	  <table BORDER="1" WIDTH="90%" cellspacing="0" bordercolor="#808080"   >
		 <TR>
		 <td CLASS="TDT" colspan=6 height="30"><%= wTIT %></td>		  
		 </TR>	
<%		 

	wIND = 1
	wIND2 = 1
	wCuenta2 = 0
	wColumna  = 1
	wBI1 = 0
	
	wVFA = "N"

    DO WHILE wIND < wCuenta    

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
		wNAMN = "N" & wOBJ
		wNAMD = "D" & wOBJ
		wNAML = "L" & wOBJ
		wNAMR = "R" & wOBJ
		
		wTDO = TRIM(Request.Form(wNAMT))		
		wNFA = TRIM(Request.Form(wNAMF))		
		wMOT = TRIM(Request.Form(wNAMM))
		wCCO = TRIM(Request.Form(wNAMO))
		wCCE = TRIM(Request.Form(wNAME))
		wSCO = TRIM(Request.Form(wNAMS))
		wARI = TRIM(Request.Form(wNAMA))		
		wSTS = TRIM(Request.Form(wNAMC))
		wMFA = TRIM(Request.Form(wNAMB))
		wPIM = TRIM(Request.Form(wNAMI))
		wIVA = TRIM(Request.Form(wNAMN))
		wMFA = wMFA / (1+(wPIM /100))
		wPRI = TRIM(Request.Form(wNAMP))
		wFVE = TRIM(Request.Form(wNAMV))
		wFEC = TRIM(Request.Form(wNAMR))
		wNET = wMFA
		
		wPDE = cdbl(Request.Form(wNAMD))
		wAPD = trim(Request.Form(wNAML))
		
		'Response.write wTDO
				
		If wSTS = "on" AND wTDO <> "N/C" Then 
		
		
					
			wVFA = "S"
	
			wColspan = "colspan=2"
			
			'IF wAPD = "on" THEN
				wMFA = wMFA - (wMFA * wPDE) / 100
				wNET = wMFA 
			'	Else
			'	wPDE = 0
			'END IF
			
			'response.write wPDE & " - " & wAPD & " - " & wMFA
			
		
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
			
			wTIVA = wTIVA + cdbl(wIVA)
			wTMFA = wTMFA + cdbl(wMFA)
			wTNET = wTNET + cdbl(wNET)
			
			IF wCuenta2 = 0 THEN
				
				Response.write "<tr>"
			
				Response.write "<td width=""6%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>&nbsp;</b></p></td>"
        	  	Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>Documento</b></p></td>"
        	  	Response.write "<td width=""6%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>Tipo</b></p></td>"
        	  	Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>Emisión</b></p></td>"
        	  	Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>Vencimiento</b></p></td>"
        	  	'Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>% Desc. Apli.</b></p></td>"
        	  	Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""right""><b>Bolivares</b></p></td>"
      
        	  	'Response.write "<td width=""12%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>Documento</b></p></td>"
        	  	'Response.write "<td width=""6%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>Tipo</b></p></td>"
	        	'Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""center""><b>Vencimiento</b></p></td>"
	        	'Response.write "<td width=""15%"" bgcolor=""#C0C0C0""><p CLASS=""P1"" align=""right""><b>Bolivares</b></p></td>"
        	  	
        	  	Response.write "</tr>"
          	END IF 
          	
          	If wColumna = 1 Then
          		'Response.write "<tr>"
          	End If	
          	
          	Response.write "<tr>"
          	
          	Response.write "<td width=""6%"" style=""font-size: 10pt; font-family: Tahoma; text-align:center"">&nbsp;"
			Response.write wIND2 
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
	 			wColumna = 0	
	 		End If 
			
		
			'response.write wNFA & "-" & wMFA & "-" & wPIM & "-" & wARI & "-" & wPRI & "<br>"
			
			wOBJ = right(("0000" & wIND2),4)
			wNAMF = "F" & wOBJ
			wNAMT = "T" & wOBJ
			wNAMC = "C" & wOBJ
			wNAMM = "M" & wOBJ
			wNAMO = "O" & wOBJ
			wNAME = "E" & wOBJ
			wNAMS = "S" & wOBJ
			wNAMA = "A" & wOBJ
			wNAMB = "B" & wOBJ
			wNAMP = "P" & wOBJ
			wNAMV = "V" & wOBJ
			wNAMI = "I" & wOBJ
			wNAMR = "R" & wOBJ
			
			response.write "<INPUT NAME=" & wNAMF & " size=15 value=" & wNFA & " TYPE=Hidden>"	
			response.write "<INPUT NAME=" & wNAMT & " size=15 value=" & wTDO & " TYPE=Hidden>"	
			response.write "<INPUT NAME=" & wNAMM & " size=15 value=" & wMOT & " TYPE=Hidden>"
			response.write "<INPUT NAME=" & wNAMO & " size=15 value=" & wCCO & " TYPE=Hidden>"			
			response.write "<INPUT NAME=" & wNAME & " size=15 value=" & wCCE & " TYPE=Hidden>"	
			response.write "<INPUT NAME=" & wNAMS & " size=15 value=" & wSCO & " TYPE=Hidden>"	
			response.write "<INPUT NAME=" & wNAMA & " size=15 value=" & wARI & " TYPE=Hidden>"	
			response.write "<INPUT NAME=" & wNAMB & " size=15 value=" & wNET & " TYPE=Hidden>"
			response.write "<INPUT NAME=" & wNAMP & " size=15 value=" & wPRI & " TYPE=Hidden>"
			response.write "<INPUT NAME=" & wNAMV & " size=15 value=" & wFVE & " TYPE=Hidden>"
			response.write "<INPUT NAME=" & wNAMI & " size=15 value=" & wPIM & " TYPE=Hidden>"
			response.write "<INPUT NAME=" & wNAMD & " size=15 value=" & wPDE & " TYPE=Hidden>"
			response.write "<INPUT NAME=" & wNAMR & " size=15 value=" & wFEC & " TYPE=Hidden>"
			
			wColumna  = wColumna  + 1
			wCuenta2 = wCuenta2 + 1
			wIND2 = wIND2 + 1
			
		End If

		wIND = wIND + 1
	
	LOOP	
	
	IF wARI = "N" THEN
		wPRI = 0
	END IF 
	
	Response.write "<tr>"
  	Response.write "<td colspan=""5"" height=""25""><p CLASS=""P1"" align=""right""><b>SUB-TOTAL Bs.</b></p></td>"
    Response.write "<td ><p CLASS=""P1"" align=""Right"">" & formatnumber(wTMFA,2) & "</p></td>"
    Response.write "</tr>"
	
	
	Function fmtNumStr(wMONTO)

		fmtNumStr = Replace(wMONTO, ",", ".") 

	End Function
	
	'wURL = "X001A100_S.asp?NOMTAB=X300BQ100"
	'Response.redirect wURL
	 
	 


%>


<%		 

	wIND = 1
	'wIND2 = 1
	'wCuenta2 = 0
	wCuenta3 = 0
	wColumna  = 1
	wBI1 = 0
	
	wVFA = "N"

    DO WHILE wIND < wCuenta    

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
		wNAMN = "N" & wOBJ

		wTDO = TRIM(Request.Form(wNAMT))		
		wNFA = TRIM(Request.Form(wNAMF))		
		wMOT = TRIM(Request.Form(wNAMM))
		wCCO = TRIM(Request.Form(wNAMO))
		wCCE = TRIM(Request.Form(wNAME))
		wSCO = TRIM(Request.Form(wNAMS))
		wARI = TRIM(Request.Form(wNAMA))		
		wSTS = TRIM(Request.Form(wNAMC))
		wMNC = TRIM(Request.Form(wNAMB))
		wMNC = wMNC*-1
		wPIM = TRIM(Request.Form(wNAMI))
		wIVA = TRIM(Request.Form(wNAMN))
		wMNC = wMNC / (1+(wPIM /100))
		wPRI = TRIM(Request.Form(wNAMP))
		wFVE = TRIM(Request.Form(wNAMV))
		wNET = wMNC
		
		'Response.write wTDO & "<BR>"
				
		If wSTS = "on" AND wTDO = "N/C" Then 
		
					
			wVFA = "S"
	
			wColspan = "colspan=2"
			
		
			IF wARI = "S" THEN
			
				wColspan = ""
			
				'Calculo de Retenci&#65533;n
				wPI1 = wPIM * (wPRI/100)		
				wPI2 = wPIM * ((100-wPRI)/100)				
				
				wBI1 = wMNC * (wPI1/100)
				wBI2 = wMNC * (wPI2/100)
				
				'response.write wPIM & "-" & wPI1 & "-" & wPI2 & "-" & wBI1 & "-" & wBI2 & "-" & wMNC & "<br>"
				'wPIM = wPI2
				
	
			ELSE
				
				wBI2 = wMNC * (wPIM/100)
				wPI1 = 0
				wPI2 = wPIM
								
			END IF 		
		
			'wNET = wMFA
			
			wMNC = wMNC + CDBL(wBI1) 
			wMNC = wMNC + CDBL(wBI2)
			
			wTBI12 = wTBI12 + cdbl(wBI1)
			wTBI22 = wTBI22 + cdbl(wBI2)
			
			wTIVA2 = wTIVA2 + cdbl(wIVA)
			wTMNC = wTMNC + cdbl(wMNC)
			wTNET2 = wTNET2 + cdbl(wNET)
			
			IF wCuenta3 = 0 THEN
				
				
				Response.write "<BR></table>"
				Response.write "<table BORDER=""1"" WIDTH=""90%"" cellspacing=""0"" bordercolor=""#808080""   >"

			 	Response.write "<TR>"
				Response.write "<td CLASS=""TDT"" colspan=6 height=""30"">" &  wTIT2 & "</td>"
				Response.write "</TR>"	

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
			
		
			'response.write wNFA & "-" & wMNC & "-" & wPIM & "-" & wARI & "-" & wPRI & "<br>"
			
			wOBJ = right(("0000" & wIND2),4)
			wNAMF = "F" & wOBJ
			wNAMT = "T" & wOBJ
			wNAMC = "C" & wOBJ
			wNAMM = "M" & wOBJ
			wNAMO = "O" & wOBJ
			wNAME = "E" & wOBJ
			wNAMS = "S" & wOBJ
			wNAMA = "A" & wOBJ
			wNAMB = "B" & wOBJ
			wNAMP = "P" & wOBJ
			wNAMV = "V" & wOBJ
			wNAMI = "I" & wOBJ
			
			response.write "<INPUT NAME=" & wNAMF & " size=15 value=" & wNFA & " TYPE=Hidden>"	
			response.write "<INPUT NAME=" & wNAMT & " size=15 value=" & wTDO & " TYPE=Hidden>"	
			response.write "<INPUT NAME=" & wNAMM & " size=15 value=" & wMOT & " TYPE=Hidden>"
			response.write "<INPUT NAME=" & wNAMO & " size=15 value=" & wCCO & " TYPE=Hidden>"			
			response.write "<INPUT NAME=" & wNAME & " size=15 value=" & wCCE & " TYPE=Hidden>"	
			response.write "<INPUT NAME=" & wNAMS & " size=15 value=" & wSCO & " TYPE=Hidden>"	
			response.write "<INPUT NAME=" & wNAMA & " size=15 value=" & wARI & " TYPE=Hidden>"	
			response.write "<INPUT NAME=" & wNAMB & " size=15 value=" & wNET & " TYPE=Hidden>"
			response.write "<INPUT NAME=" & wNAMP & " size=15 value=" & wPRI & " TYPE=Hidden>"
			response.write "<INPUT NAME=" & wNAMV & " size=15 value=" & wFVE & " TYPE=Hidden>"
			response.write "<INPUT NAME=" & wNAMI & " size=15 value=" & wPIM & " TYPE=Hidden>"
			
			wColumna  = wColumna  + 1
			wCuenta2 = wCuenta2 + 1
			wCuenta3 = wCuenta3 + 1
			wIND2 = wIND2 + 1
			
		End If

		wIND = wIND + 1
	
	LOOP	
	
	IF wARI = "N" THEN
		wPRI = 0
	END IF 
		
	IF wCuenta3 > 0 THEN
		'wTNET2 = wTNET2*-1
		''wTIVA2 = wTIVA2*-1
		'wTBI12 = wTBI12*-1
		Response.write "<tr>"
  		Response.write "<td width=""20%"" colspan=""5"" height=""25""><p CLASS=""P1"" align=""right""><b>SUB-TOTAL Bs.</b></p></td>"
    		Response.write "<td width=""20%"" style=""font-size: 10pt; font-family: Tahoma;""><p CLASS=""P1"" align=""right"">" & formatnumber((wTMNC*-1),2) & "</p></td>"
    	Response.write "<tr>"
	END IF 
	
	 



%>


</TABLE>
<br>
<TABLE WIDTH="90%" border="0" cellspacing="0"  >



		 <TR>
		 <td CLASS="TDT" colspan=8 height="30">RESUMEN</td>		  
		 </TR>	
		 
		 <tr>
		 <td  width="33%" colspan="3" bgcolor="#C0C0C0"><p CLASS="P1" align="left">
			<b>CONCEPTO</b></p></td>
         <td width="33%" colspan="2" bgcolor="#C0C0C0"><p CLASS="P1" align="center">
			<b>%</b></p></td>
         <td width="33%" colspan="3" bgcolor="#C0C0C0"><p CLASS="P1" align="right">
			<b>BOLÍVARES</b></p></td>
		 </tr>
		 <% 'RESPONSE.WRITE wTNET & "-" & wTNET2 %>
		 <tr>
		 <td width="33%" colspan="3" ><p CLASS="P1" align="left">MONTO NETO SIN 
		 IVA</p></td>
         <td width="33%" colspan="2" ><p CLASS="P1" align="center">&nbsp;</p></td>
         <td width="33%" colspan="3" ><p CLASS="P1" align="right">&nbsp;<%=formatnumber(wTNET-wTNET2,2)%></p></td>	 
		 </tr>
		  <% 'RESPONSE.WRITE wTIVA & "-" & wTIVA2 %>

		 <tr>
		 <td width="33%" colspan="3" ><p CLASS="P1" align="left">IVA</p></td>
         <td width="33%" colspan="2" ><p CLASS="P1" align="center">&nbsp;<%=formatnumber(wPIM,2)%></p></td>
         <td width="33%" colspan="3" ><p CLASS="P1" align="right">&nbsp;<%=formatnumber(wTIVA-wTIVA2,2)%></p></td>	 
		 </tr>
		   <% 'RESPONSE.WRITE wTBI1 & "-" & wTBI12 %>
		 <tr>
		 <td width="33%" colspan="3" ><p CLASS="P1" align="left">RETENCIÓN IVA</p></td>
         <td width="33%" colspan="2" ><p CLASS="P1" align="center">&nbsp;<%=formatnumber(wPRI,0)%> 
		 %</p></td>
         <td width="33%" colspan="3" ><p CLASS="P1" align="right">
         <% IF wTBI1 > 0 THEN %>
         	-&nbsp;<%=formatnumber(wTBI1-wTBI12,2)%>
         <% ELSE %>
         	&nbsp;<%=formatnumber(wTBI1,2)%>
         <% END IF %>
         </p></td>	 
		 </tr>
		 <% 
		 	'wTMNC = wTMNC*-1
		 	wTOT = wTMFA - wTMNC
		 	wTOT = wTOT - (wTBI1-wTBI12)
		 	'wTMFA-wTBI1
		 	'Response.write wTOT 
		 	
		 	IF wTOT > 0 THEN
		 %>
		 
		 
		 <tr>
  		 <td width="20%" colspan="7" height="25"><p CLASS="P1" align="right"><b>
		 TOTAL A PAGAR Bs.</b></p></td>
  	  	 <td width="20%" ><p CLASS="P1" align="Right"><%=formatnumber((wTOT),2)%></p></td>
    	 
    	 
		<tr>
  		 <td width="20%"  height="25"><p CLASS="P1" align="center"><b>SON 
		 BOLÍVARES</b></p></td>
  	  	 <td width="20%" colspan="7" ><p CLASS="P1" align="center"><%=ucase(CONVERTIR(wTOT))%></p></td>
    	 <tr>
    	 
    	 <% END IF %> 
		 
		<INPUT TYPE="Hidden" NAME="CUENTA" value="<%=wCuenta2%>">
		 <tr>
		 
		 
		           <td CLASS="TDT" width="100%" colspan="8"  align="center" height=50 valign="middle"  >
		           <br>Observación:         
		           
		           
		           <INPUT TYPE="text" NAME="txOBS" value="" maxlength="250" size="67" >
		           </td> 
		</tr> 

		 <tr>
          <td CLASS="TDT" width="100%" colspan=8 align="center" height=50 valign="middle"  >
          <% IF wCuenta2 > 0 AND wTOT > 0 Then %>
          <input type="button" name="Guardar" Value="Guardar" onclick="javascript:enviar()" > 
          <% End If %>
          <input type="button" name="Regresar" Value="Regresar" onclick="javascript:history.back()"> 
          <% IF wCuenta2 > 0 AND wTOT > 0 Then %>
          <input type="button" name="Imprimir" Value="Imprimir" onclick="javascript:window.print()">         
          <% End If %>
          </td>
         </tr>




	</table>
	
	
	</div>
	
	
	<p>&nbsp;
	
	<table width="100%" border="0" cellpadding="5" cellspacing="1"  >
<tr>
<td align="center"  CLASS="TDT" valign="top" height="30" >
*Presione el botón guardar para generar el Comprobante de las facturas 
seleccionadas.
</td></tr> 
</table> 
</td>
</tr> 
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