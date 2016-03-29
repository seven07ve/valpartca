<%@ Language=VBScript %>
<% Response.Expires = 0 %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 6.0">

<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<!--#include file="X001Y004.PRC"-->

<SCRIPT LANGUAGE="javascript">
	
	function ValidarNumero(val){
    
	    var num = val; 
	    num = num.replace(",",".");
	    if (isNaN(num) == true) {
	        return true
		    }else{
	        return false
	    }
	}   
	
	function ValidarCantidad(){
	
		if (document.frmGral.wCAN.value<=0){
	   		alert("Ingrese la Cantidad")
			document.frmGral.wCAN.focus();   	
			document.frmGral.cmdSubmit.enable=false;
			return false
		}else{			
			document.frmGral.cmdSubmit.enable=true;
			return true
		}
	}			
	
	function Vacio(q) {  

	    for ( i = 0; i < q.length; i++ ) {  
	        if ( q.charAt(i) != " " ) {
	        	alert("Debe Ingresar un Valor Numerico");  
	            return true  
	         }  
	    }  
	    return false  
	}



function cmdSubmit_onclick(){
	
	if (document.frmGral.wCAN.value==''){
		alert("Debe Ingresar un Valor Numerico")
		document.frmGral.wCAN.focus();   	
		return false			
	}else{
		if (ValidarNumero(document.frmGral.wCAN.value)){
			alert("Debe Ingresar un Valor Numerico")
			document.frmGral.wCAN.focus();   	
			return false			
		}else{		
		   	document.frmGral.submit();		   
		}
	}	   
}		
	
function Pantalla() {	
	if (screen.width=='1024'){  
	   document.body.leftMargin = "19"  
    }
}


function validar() {	
	if (event.keyCode < 45 || event.keyCode > 57) {
		event.returnValue = false
		}
}


</SCRIPT>

</HEAD>

	<%
	
	wTIT = "Item en Reclamo" 
	wCLA001 = TRIM(Request.QueryString("CLA001"))
	wCLA002 = TRIM(Request.QueryString("CLA002"))
	wCLA003 = REPLACE(TRIM(Request.QueryString("CLA003")),"@", " ")
	wCLA004 = TRIM(Request.QueryString("CLA004"))
	wSTSPED = TRIM(Request.QueryString("STSPED"))
	wERROR = TRIM(Request.QueryString("ERROR"))
	
	wCCI = Session("glCiaInternet")
	wCIA = Session("glCia")

	wPEDIDO = wCLA002
	

	wProceso = "Agregar"
	wDisabled = ""	
    IF len(wCLA003) > 0 then	 

		wDisabled = "DISABLED"
		
		wProceso = "Actualizar"
		
		strCnn	= Application("XDTA300_ConnectionString")
		
		SQL = "SELECT E300001CTR "
		SQL = SQL & " FROM X300EF001 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " E300001CCI ='" & wCCI & "' AND "
		SQL = SQL & " E300001CIA ='" & wCIA & "' AND "
		SQL = SQL & " E300001COD ='" & wCLA002 & "' "
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		IF NOT rstQuery.EOF THEN
			wCTR = trim(rstQuery.Fields("E300001CTR"))
		END IF 
		rstQuery.CLOSE
		SET rstQuery = NOTHING

	
		SQL = "SELECT E300002CAN, E300002TRE, E300002DEL, "
		SQL = SQL & " E300002OBS " 		
		SQL = SQL & " FROM X300EF002 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " E300002CCI ='" & wCCI & "' AND "
		SQL = SQL & " E300002CIA ='" & wCIA & "' AND "
		SQL = SQL & " E300002COD ='" & wCLA002 & "' AND "
		SQL = SQL & " E300002NFA ='" & wCLA004 & "' AND "
		SQL = SQL & " E300002CPR ='" & wCLA003 & "' "	
		wB300101CPR = wCLA003
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		'RESPONSE.WRITE SQL
		IF NOT rstQuery.EOF THEN
			wE300002DEL = trim(rstQuery.Fields("E300002DEL"))
			wE300002CAN = trim(rstQuery.Fields("E300002CAN"))
			wTRE = trim(rstQuery.Fields("E300002TRE"))			
			wE300002OBS = trim(rstQuery.Fields("E300002OBS"))
		END IF 
		rstQuery.CLOSE
		SET rstQuery = NOTHING
		
		SQL = "SELECT B300200NPE, B300200BUL, B300200PUS, B300200PRE, B300200CON  "
		SQL = SQL & " FROM X300BF200 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " B300200CCI ='" & wCCI & "' AND "
		SQL = SQL & " B300200CIA ='" & wCIA & "' AND "
		SQL = SQL & " B300200NFA ='" & wCLA004 & "' "
		wB300101CPR = wCLA003
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		'RESPONSE.WRITE SQL
		IF NOT rstQuery.EOF THEN
			wB300200NPF = trim(rstQuery.Fields("B300200NPE"))
			wB300200PRE = trim(rstQuery.Fields("B300200PRE"))
			wB300200CON = trim(rstQuery.Fields("B300200CON"))
			wB300200BUL = trim(rstQuery.Fields("B300200BUL"))
			wB300200PUS = trim(rstQuery.Fields("B300200PUS"))
		END IF 
		rstQuery.CLOSE
		SET rstQuery = NOTHING	
		
		SQL = "SELECT B300201NPE, B300201NRB "
		SQL = SQL & " FROM X300BF201 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " B300201CCI ='" & wCCI & "' AND "
		SQL = SQL & " B300201CIA ='" & wCIA & "' AND "
		SQL = SQL & " B300201NFA ='" & wCLA004 & "' AND "
		SQL = SQL & " B300201CPR ='" & wCLA003 & "' "	
		wB300101CPR = wCLA003
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		'RESPONSE.WRITE SQL
		IF NOT rstQuery.EOF THEN
			wB300201NPE = trim(rstQuery.Fields("B300201NPE"))
			wB300201NRB = trim(rstQuery.Fields("B300201NRB"))
		END IF 
		rstQuery.CLOSE
		SET rstQuery = NOTHING	
		
		 wSEL01 = "": wSEL02 = "": wSEL03 = "": wSEL04 = "": wSEL05 = "": wSEL06 = "": wSEL07 = ""
		 wSEL08 = "": wSEL09 = "": wSEL10 = ""
	    
     	IF wTRE = "Defecto de Parte" THEN
     		wSEL01 = " selected"
     	END IF 
     	IF wTRE = "Backorders" THEN
     		wSEL02 = " selected"
     	END IF 
     	IF wTRE = "Error del Vendedor" THEN
     		wSEL03 = " selected"
     	END IF 
     	IF wTRE = "Precio" THEN
     		wSEL04 = " selected"
     	END IF 
     	IF wTRE = "Faltante" THEN
     		wSEL05 = " selected"
     	END IF 
     	IF wTRE = "Sobrante" THEN
     		wSEL06 = " selected"
     	END IF 
     	IF wTRE = "Faltante y Sobrante" THEN
     		wSEL07 = " selected"
     	END IF 
     	IF wTRE = "No Aplica" THEN
     		wSEL08 = " selected"
     	END IF 
     	IF wTRE = "Error del Cliente" THEN
     		wSEL09 = " selected"
     	END IF 
     	IF wTRE = "Error en Ventas" THEN
     		wSEL10 = " selected"
     	END IF 

		
		wPRO = wCLA003 & " - " & wE300002DEL		
        
    END IF 
	
	wTIT = wProceso & " " & wTIT   

	wURL = "X001A115_AS.ASP"
	wURL = wURL & "?CLA001=" & wCLA001 & "&CLA002=" & wCLA002 
	wURL = wURL & "&CLA003=" & wCLA003 & "&CLA004=" & wCLA004
	wURL = wURL & "&STSPED=" & wSTSPED 

	%>

	<body   align="center" style="text-align: center" topmargin="0" leftmargin="19" rightmargin="0" onload="document.frmGral.wCAN.focus()" bgcolor="#FFEBD6">
	
	
	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURL%>" >


   <table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" align="center" height="100%" >
<tr>
<td valign="top"  >

<table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF">




    <p style="margin-top: 0px">&nbsp;</p>

    <table align="center" BORDER="1" WIDTH="700" cellspacing="0" cellpadding="0"  bordercolor="#0066CC" bgcolor="#FE9900" style="border-style: inset; border-width: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" cellpadding="4" >
		 <TR>
		 <td CLASS="TDT" colspan=3 height="30" ><%= wTIT %></td>		  
		 </TR>	

		 <tr>
          <td class="TDS" width="23%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Reclamo:</p></td>
          <td class="TDD" width="73%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wPEDIDO%></P></td>
         </tr>
		 
		 <tr>
          <td class="TDS" width="23%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Producto:</p></td>
          <td class="TDD" width="73%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wPRO%></p> 
          
          </td>
         </tr> 
         
         <tr>
          <td class="TDS" width="23%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Factura:</p></td>
          <td class="TDD" width="73%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wCLA004%></p> 
          
          </td>
         </tr> 
         
         <tr>
          <td class="TDS" width="23%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Pre-Factura:</p></td>
          <td class="TDD" width="73%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wB300200NPF%></p> 
          
          </td>
         </tr> 
         
         <tr>
          <td class="TDS" width="23%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Predespacho:</p></td>
          <td class="TDD" width="73%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wB300200PRE & " - " & wB300200CON%></p> 
          
          </td>
         </tr> 
         
         <tr>
          <td class="TDS" width="23%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Total Bultos:</p></td>
          <td class="TDD" width="73%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wB300200BUL%></p> 
          
          </td>
         </tr> 
         
         <tr>
          <td class="TDS" width="23%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Preparado por:</p></td>
          <td class="TDD" width="73%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wB300200PUS%></p> 
          
          </td>
         </tr>     
         
			<tr>
          <td class="TDS" width="23%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Pedido:</p></td>
          <td class="TDD" width="73%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wB300201NPE%></p> 
          
          </td>
         </tr>        
		
		
			<tr>
          <td class="TDS" width="23%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Embalado en Bulto:</p></td>
          <td class="TDD" width="73%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wB300201NRB%></p> 
          
          </td>
         </tr>        
         
         
         <tr>
          <td class="TDS" width="23%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Motivo:</p></td>
          <td class="TDD" width="73%" height="23px">
			
			<SELECT name="MOTIVO" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt; width:200" size="1" > 					
				<%IF wCTR = "2" THEN%>
				<OPTION value="Defecto de Parte" <%=wSEL01%>>Defecto de Parte</OPTION> 					
				<OPTION value="Backorders" <%=wSEL02%>>Backorders</OPTION> 					
				<OPTION value="Error del Vendedor" <%=wSEL03%>>Error del Vendedor</OPTION> 					
				<OPTION value="Precio" <%=wSEL04%>>Precio</OPTION> 					
				<OPTION value="Error del Cliente" <%=wSEL09%>>Error del Cliente</OPTION> 					
				<OPTION value="Error en Ventas" <%=wSEL10%>>Error en Ventas</OPTION> 					
				<%ELSE%>				
				<OPTION value="Faltante" <%=wSEL05%>>Faltante</OPTION> 					
				<OPTION value="Sobrante" <%=wSEL06%>>Sobrante</OPTION> 					
				<OPTION value="Faltante Sobrante" <%=wSEL07%>>Faltante y Sobrante</OPTION> 					
				<%END IF%>
			</SELECT> 

			
			
          </td>
         </tr>
<!--
         <tr>
          <td class="TDS" width="23%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Observación:</p></td>
          <td class="TDD" width="73%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wE300002OBS%>%</p> 
          </td>
         </tr>
-->		
   
         
          <tr>
          <td class="TDS" width="23%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Cantidad:</p></td>
          <td class="TDD" width="73%" height="23px">
			<p style="margin-top: 0"><INPUT NAME="wCAN" size=2 maxlength=3  value="<%=wE300002CAN%>" onKeypress="validar()" onblur="return ValidarCantidad();" >
			<font color="#FF0000"><b><%= wERROR%></b></font>
          </td>
         </tr>
	

		 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center">
      <!--#include file="X001Y005.PRC"-->
                </td>
         </tr>

	</table>
	</td>	
	</TR>	
	</table>

	<p>&nbsp;</td>
	</tr>

</tr> 
</p> 

</td>

        </tr>
        
        
        
        
               </table>

    </td>				
  </tr>
</table>

   
   </FORM>


</BODY>
</HTML>