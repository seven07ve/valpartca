<%@ Language=VBScript %>
<% Response.Expires = 0 %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 12.0">

<link href="calendario/styles.css" rel="stylesheet" type="text/css">
<link href="calendario/calendar.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="calendario/js/mootools.js"></script>
<script type="text/javascript" src="calendario/js/calendar.js"></script>

<link rel=stylesheet type="text/css" href="X001Z900.CSS">


<!--#include file="X001Z001.INC"-->
<!--#include file="X001Y004.PRC"-->

<SCRIPT LANGUAGE="javascript">

	function cmdSubmit_onclick(){
	
		 document.frmGral.submit();
		 
	}

</SCRIPT>

<SCRIPT LANGUAGE="javascript">



    window.addEvent('domready', function() { myCal = new Calendar({ FDE: 'd/m/Y' }); });
	window.addEvent('domready', function() { myCal2 = new Calendar({ FHA: 'd/m/Y' }); });


	function cmdSubmit_onclick(){
	
		 document.frmGral.submit();
		 
	}

</SCRIPT>

</HEAD>
<style>

html{overflow-y:scroll} 

</style>
<%

	
	'Preparar Etiqueta Body del Formulario
	wCLA001 = Session("glUsuario") 
	wURLW = Request.ServerVariables("URL")
	'wBody = "<body  onload=" & chr(34) & "Inicio '" & wCLA001 & "', '" & wURLW & "'" & chr(34) & " bgcolot=""#FFFFF2"">"
	'Response.Write wBody
	'Fin Preparar Etiqueta Body del Formulario
	
	
	wCCI = Session("glCiaInternet") 
	wCIA = Session("glCia") 

	wTIT = "Periodo de Venta" 

		 
		
	wProceso = "Actualizar"
	wProceso2 = "Actualizarb"
		
	wDisabled = "DISABLED"
    
		strCnn	= Application("XDTA300_ConnectionString")
		
		SQL = "SELECT Z300002FAV, Z300002PUS, "
		SQL = SQL & " Z300002FDE, Z300002FHA "
		SQL = SQL & " FROM X300ZF002 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " Z300002CCI = '" & wCCI & "' "		
		'response.write sql
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wPUS = trim(rstQuery.Fields("Z300002PUS"))
			wFAV = trim(rstQuery.Fields("Z300002FAV"))
			wFDE = trim(rstQuery.Fields("Z300002FDE"))
			wFHA = trim(rstQuery.Fields("Z300002FHA"))
		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING
		
		
		wDIA_FED = Day(wFAV)
        If Len(Trim(wDIA_FED)) = "1" Then: wDIA_FED = "0" & wDIA_FED: End If
        wMES_FED = Month(wFAV)
        If Len(Trim(wMES_FED)) = "1" Then: wMES_FED = "0" & wMES_FED: End If
        wANO_FED = Year(wFAV)
        wFAV = wDIA_FED & "/" & wMES_FED & "/" & wANO_FED & "  " & TimeValue(wFAV)

		
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

	wURL = "X001X182S"
	wURLP = wURL & ".ASP?CLA001=" & wCLA001
	%>

	<body topmargin="0" leftmargin="17" rightmargin="0" bottommargin="0" scroll="yes"  bgcolor="<%=Request.Cookies("CAR")("Color1")%>" >

<div align="center"  >
	<table border="0" height="100%" width="846" bgcolor="#FFFFFF" cellspacing="0"> <tr><td valign="top">
	
	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURLP%>" >
	<br>

    <div align="center">
    
    
    <table BORDER="1" WIDTH="650" cellspacing="0" cellpadding="0" align="center"bordercolor="<%=Request.Cookies("CAR")("Color1")%>" bgcolor="<%=Request.Cookies("CAR")("Color2")%>"  style="border-style: inset; border-width: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" >
		 <TR>
		 <td  height="30" CLASS="TDT" colspan=2><%= wTIT %></td>		  
		 </TR>	
		 
 		  <tr>
          <td class="TDS" width="29%" height="23" class="tdform" ><p CLASS="P1" align="left">
			Periodo de Ventas:</p></td>
          <td class="TDD" width="70%" height="23" >
			<b>
			<table border="0" ><tr>
		<td valign="middle" >	<input type="text" name="FDE" id="FDE" size="16" value="<%=wFDE%>"> </td>
		<td width="40" class="TDD">   
		<p align="center">   <b>al</b></td> <td> <input type="text" name="FHA" id="FHA" size="16" value="<%=wFHA%>"></td> </tr> 
			</table> 
         </b>
</td>
         </tr>

		 <tr>
          <td class="TDS" width="29%" height="23" ><p CLASS="P1" align="left">Fecha de Actualización:</p></td>
          <td class="TDD" width="70%" height="23" >
			<b>
			
			<%=wFAV%> por <%=wPUS%>
    
         </b>
</td>
         </tr>
        
		 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center">
            <INPUT TYPE="Hidden" NAME="PROCESO" value="<%=wProceso%>">          
		  <INPUT TYPE="button" NAME="cmdSubmit" VALUE="<%=wProceso%>" onclick="return cmdSubmit_onclick()" >		  
		  <INPUT type='button' value='Regresar' id=button1 name=button1 OnClick='javascript:history.back()'>
          
          </td>
         </tr>

	</table>
	</td>	
	</TR>	
	</table>


	</div>
	
	</td></tr></table></div>
</FORM>
</BODY>
</HTML>