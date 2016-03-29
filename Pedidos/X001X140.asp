<%@ Language=VBScript %>
<% Response.Expires = 0 %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 12.0">

<link rel=stylesheet type="text/css" href="X001Z900.CSS">

<!--#include file="X001Z001.INC"-->
<!--#include file="X001Y004.PRC"-->

<SCRIPT LANGUAGE="javascript">

	function cmdSubmit_onclick(){
	
		if (document.frmGral.CUS.value!=''){
		
		if (document.frmGral.CUS0.value!=''){
	
		if ((document.frmGral.CUS.value)!=(document.frmGral.CUS0.value)){
			alert("Contraseña No Coincide");
		}else{
			 alert("Ha Cambiado su contraseña Satisfactoriamente!");	
			 
			 document.frmGral.submit();
		} 
		}else{
			alert("Ingrese Confirmación de la Nueva Contraseña");
			document.frmGral.CUS0.focus() 
		}
		}else{
			alert("Ingrese la Nueva Contraseña");
			document.frmGral.CUS.focus() 
		}
	}
	
	function validar(){
		
		alert('ok');		
		return false
		//}else{
		
	//	alert('ok2');
	//	true
	}
	
	

</SCRIPT>
<style>

html{overflow-y:scroll} 

</style>
</HEAD>

<%

	
	'Preparar Etiqueta Body del Formulario
	wCLA001 = Session("glUsuario") 
	wURLW = Request.ServerVariables("URL")
	'wBody = "<body  onload=" & chr(34) & "Inicio '" & wCLA001 & "', '" & wURLW & "'" & chr(34) & ">"
	'Response.Write wBody
	'Fin Preparar Etiqueta Body del Formulario
	
	
	wCCI = Session("glCiaInternet") 
	wCIA = Session("glCia") 

	wTIT = "Cambiar Contraseña" 



	
	wNUS =""
	wCUS =""
	wEML =""
	wCLU =""
	wCVE =""
	wSTS ="1"	
	wDisabled = ""
	wProceso = "Agregar"
	wSEL04 = "selected"
    IF len(wCLA001) > 0 then	 
		
		wProceso = "Actualizar"
		wProceso2 = "Actualizarb"
		
		wDisabled = "DISABLED"
    
		strCnn	= Application("XDTA300_ConnectionString")
	
		SQL = "SELECT * FROM X300ZF001 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " Z300001CCI = '" & wCCI & "' AND "
		SQL = SQL & " Z300001CIA = '" & wCIA & "' AND "		
		SQL = SQL & " Z300001PUS = '" &  wCLA001 & "'" 	

		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wNUS = trim(rstQuery.Fields("Z300001NUS"))
			wCUS = trim(rstQuery.Fields("Z300001CUS"))			
			wEML = trim(rstQuery.Fields("Z300001EML"))
			wCLU = trim(rstQuery.Fields("Z300001CLU"))
			wCVE = trim(rstQuery.Fields("Z300001CVE"))
			wCED = trim(rstQuery.Fields("Z300001CED"))
			wRIF = trim(rstQuery.Fields("Z300001RIF"))
			wTEL = trim(rstQuery.Fields("Z300001TEL"))
			wRSE = trim(rstQuery.Fields("Z300001RSE"))
			wPSE = trim(rstQuery.Fields("Z300001PSE"))
			wSTS = trim(rstQuery.Fields("Z300001STS"))
			wFUA = trim(rstQuery.Fields("Z300001FUA"))

		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING	
		
		wDIA_FED = Day(wFUA)
        If Len(Trim(wDIA_FED)) = "1" Then: wDIA_FED = "0" & wDIA_FED: End If
        wMES_FED = Month(wFUA)
        If Len(Trim(wMES_FED)) = "1" Then: wMES_FED = "0" & wMES_FED: End If
        wANO_FED = Year(wFUA)
        wFUA = wDIA_FED & "/" & wMES_FED & "/" & wANO_FED & "  " & TimeValue(wFUA)


    end if
	
	'wTIT = wTIT   

	wURL = "X001X140S"
	wURLP = wURL & ".ASP?CLA001=" & wCLA001
	%>

	<body onload="document.frmGral.CUS.focus();" topmargin="0" leftmargin="18" rightmargin="0" bottommargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>">

	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURLP%>" >

    <div align="center">
    
    <table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" align="center" height="100%" >
<tr>
<td valign="top"  >

<table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF">


    &nbsp;&nbsp;
    <table BORDER="1" WIDTH="650" cellspacing="0" cellpadding="0" align="center" bordercolor="#0066CC" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" style="border-style: inset; border-width: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" cellpadding="4"  >
		 <TR>
		 <td CLASS="TDT" colspan=2 height="30" ><%= wTIT %></td>		  
		 </TR>	
		 
		 <tr>
          <td class="TDS" width="29%" ><p CLASS="P1" align="left">Usuario:</p></td>
          <td class="TDD" width="70%" ><p CLASS="P1"><INPUT NAME="wCLA" <%= wDisabled %> size=15 value="<%=wCLA001%>"></P></td>
         </tr>

		 <tr>
          <td class="TDS" width="29%" ><p CLASS="P1" align="left">Nombre:</p></td>
          <td class="TDD" width="70%" >
		  <INPUT NAME="wDES" size=30 value="<%=wNUS%>" type=hidden >
		  <INPUT NAME="wDES1" disabled size=50 value="<%=wNUS%>" maxlength="30"></td>
         </tr>

		 <tr>
          <td class="TDS" width="29%" ><p CLASS="P1" align="left">Nueva Contraseña:</p></td>
          <td class="TDD" width="70%" >
    		<INPUT TYPE=password NAME="CUS" size=10 value="" maxlength="10"></td>
         </tr>

	
		 <tr>
          <td class="TDS" width="29%" ><p CLASS="P1" align="left">Confirme 
			Contraseña:</p></td>
          <td class="TDD" width="70%" >
			<INPUT TYPE=password NAME="CUS0" size=10 value="" maxlength="10"></td>
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
	<p>&nbsp;</td> 
	</tr>
	<!--<td>
<img src="../images/index/bottom.jpg" width="790" height="15" /></td>-->
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
</HTML>