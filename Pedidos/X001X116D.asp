<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="content-language" content="es" />

<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<link href="calendario/calendar.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="calendario/js/mootools.js"></script>
<script type="text/javascript" src="calendario/js/calendar.js"></script>



<!--#include file="X001Z001.INC"-->
</HEAD>

<SCRIPT LANGUAGE="javascript">



    window.addEvent('domready', function() { myCal = new Calendar({ FDE: 'd/m/Y' }); });
	window.addEvent('domready', function() { myCal2 = new Calendar({ FHA: 'd/m/Y' }); });


	function cmdSubmit_onclick(){
	
		 document.frmGral.submit();
		 
	}

</SCRIPT>

<%

	'Preparar Etiqueta Body del Formulario
	wCLA001 = Session("glUsuario") 
	wURLW = Request.ServerVariables("URL")
	'wBody = "<body  onload=" & chr(34) & "Inicio '" & wCLA001 & "', '" & wURLW & "'" & chr(34) & " bgcolot=""#B72000"">"
	'Response.Write wBody
	'Fin Preparar Etiqueta Body del Formulario
	
	
	wCCI = Session("glCiaInternet") 
	wCIA = Session("glCia") 

	wTIT = "Estadística de Ventas" 
	
	wSTS ="1"	
		
	'wProceso = "Actualizar"
	wProceso2 = "Actualizarb"
		
	wDisabled = "DISABLED"
    
		strCnn	= Application("XDTA300_ConnectionString")
		
		SQL = "SELECT Z300002STS, Z300002FAC, Z300002PUS, Z300002OBS, "
		SQL = SQL & " Z300002EM1, Z300002EM2, Z300002EM3, Z300002FDE, "
		SQL = SQL & " Z300002FHA FROM X300ZF002 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " Z300002CCI = '" & wCCI & "' "		
		'response.write sql
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wSTS = trim(rstQuery.Fields("Z300002STS"))
			wPUS = trim(rstQuery.Fields("Z300002PUS"))
			wFAC = trim(rstQuery.Fields("Z300002FAC"))
			wOBS = trim(rstQuery.Fields("Z300002OBS"))
			wEM1 = trim(rstQuery.Fields("Z300002EM1"))
			wEM2 = trim(rstQuery.Fields("Z300002EM2"))
			wEM3 = trim(rstQuery.Fields("Z300002EM3"))
			wFDE = trim(rstQuery.Fields("Z300002FDE"))
			wFHA = trim(rstQuery.Fields("Z300002FHA"))
		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING
		
		wSELUNO = "" : wSELDOS = ""
		IF wSTS = "1" THEN
			wSELUNO = "selected"
		   ELSE
		    wSELDOS = "selected"
		END IF   
		
		wDIA_FED = Day(wFAC)
        If Len(Trim(wDIA_FED)) = "1" Then: wDIA_FED = "0" & wDIA_FED: End If
        wMES_FED = Month(wFAC)
        If Len(Trim(wMES_FED)) = "1" Then: wMES_FED = "0" & wMES_FED: End If
        wANO_FED = Year(wFAC)
        wFAC = wDIA_FED & "/" & wMES_FED & "/" & wANO_FED & "  " & TimeValue(wFAC)

		wDIA_FDE = Day(wFDE)
        If Len(Trim(wDIA_FDE)) = "1" Then: wDIA_FDE = "0" & wDIA_FDE: End If
        wMES_FDE = Month(wFDE)
        If Len(Trim(wMES_FDE)) = "1" Then: wMES_FDE = "0" & wMES_FDE: End If
        wANO_FDE = Year(wFDE)
        wFDE = wDIA_FDE & "/" & wMES_FDE & "/" & wANO_FDE 
        
        
		wDIA_FHA = Day(wFHA)
        If Len(Trim(wDIA_FHA)) = "1" Then: wDIA_FHA = "0" & wDIA_FHA: End If
        wMES_FHA = Month(wFHA)
        If Len(Trim(wMES_FHA)) = "1" Then: wMES_FHA = "0" & wMES_FHA: End If
        wANO_FHA = Year(wFHA)
        wFHA = wDIA_FHA & "/" & wMES_FHA & "/" & wANO_FHA 
	
	wTIT = wProceso & " " & wTIT   

	wURL = "X001X116.asp"
	
	%>
<body bgcolor="<%=Request.Cookies("CAR")("Color1")%>" topmargin="0" bottommargin="0"  >
	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURL%>" target="_blank" >

  <table  width="846" border="0" align="center" bgcolor="#ffffff" height="100%" >
<tr><td valign="top" align="center"  >
<p style="margin-top:30" >

    
    
        <table cellspacing="0" cellpadding="0" width="607" bordercolor="#CACACA"  bgcolor="<%=Request.Cookies("CAR")("Color2")%>"  style="padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px;" id="table6" border="1">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" >
		 <TR>
		 <td CLASS="TDT" colspan=2 height="30" ><%= wTIT %></td>		  
		 </TR>	
		 
	<tr>
          <td class="TDS" width="29%" height="23" class="tdform" ><p CLASS="P1" align="left">Fecha Desde:</p></td>
          <td class="TDD" width="70%" height="23" >
		<b>
			<table border="0" ><tr>
			<td valign="middle" ><input type="text" name="FDE" id="FDE" size="16" value="<%=wFDE%>"></td>
			<td width="40" class="TDD"><p CLASS="P1" align="center"><b>Hasta:</b></td> 
			<td><input type="text" name="FHA" id="FHA" size="16" value="<%=wFHA%>"></td></tr> 
			</table> 
        </b>
			</td>
	</tr>

	

 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center">
          <input type="submit" value="Ver">   
          </td>
         </tr>


		 
	</table>
	</td>	
	</TR>	
	</table>
	
	</p> 
	</td> 
	</tr> 
	</table> 
	
	
</FORM>
</BODY>
</HTML>