<%@ Language=VBScript %>
<% Response.Expires = 0 %>
<% Response.AddHeader "PRAGMA", "NO-CACHE" %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<link rel=stylesheet type="text/css" href="X001Z900.CSS">



<!--#include file="X001Z001.INC"-->


</HEAD>

	<%

	'Preparar Etiqueta Body del Formulario
	wCLA001 = trim(Request.QueryString("CLA001"))
	wCLABUS = trim(Request.QueryString("CLABUS"))
	wERROR  = trim(Request.QueryString("ERROR"))	
	wURLW = Request.ServerVariables("URL")
	wBody = "<body  align=""center"" style=""text-align: center"" scroll=yes topmargin=""0"" leftmargin=""17"" rightmargin=""0"" bgcolor=" & Request.Cookies("CAR")("Color1") & " >"
	'onload=" & chr(34) & "Inicio '" & wCLA001 & "', '" & wURLW & "'" & chr(34) & "
	Response.Write wBody
	'Fin Preparar Etiqueta Body del Formulario
		
	wTIT = "Pago" 
	wCLA001 = TRIM(Request.QueryString("CLA001"))
	wCLA002 = TRIM(Request.QueryString("CLA002"))
	wC300001CCI = Session("glCiaInternet")
	wC300001CIA = Session("glCia")
    wDisabled = ""	

		
	
	
	

	wFRE = Right("0" & day(date),2) & "-" &  Right("0" & month(date),2) & "-" & year(date)
    IF len(wCLA001) > 0 then	 

		'wPEDIDO = wCLA001 & "-" & wCLA002
		wPEDIDO = wCLA002

		wProceso = "Actualizar"
		
		strCnn	= Application("XDTA300_ConnectionString")
	
		SQL = "SELECT C300001CCL, A300002RSO, C300001OBR, "
		SQL = SQL & " C300001STS, C300001FPR, C300001MCO " 
		SQL = SQL & " FROM X300CQ001 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " C300001CCI ='" & wC300001CCI & "' AND "
		SQL = SQL & " C300001CIA ='" & wC300001CIA & "' AND "
		SQL = SQL & " C300001NDC ='" & wCLA001 & "'"
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wA300002RSO = trim(rstQuery.Fields("A300002RSO"))
			wC300001CCL = trim(rstQuery.Fields("C300001CCL"))
			wC300001OBR = trim(rstQuery.Fields("C300001OBR"))			
			wSTS = trim(rstQuery.Fields("C300001STS"))
			wFPR = trim(rstQuery.Fields("C300001FPR"))
			wMCO = rstQuery.Fields("C300001MCO")
		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING
		
		wMCO = FormatNumber(wMCO,2) 
		
		wFPR = cdate(wFRE)	
		wFPR = Right("0" & day(wFPR),2) & "-" &  Right("0" & month(wFPR),2) & "-" & year(wFPR)

		wSELUNO1 = "" : wSELDOS1 = ""
		IF wSTS = "9" THEN
		   wSELDOS1 = "selected"
		  ELSE
		   wSELUNO1 = "selected"
		END IF   
    end if
	
	wTIT = wProceso & " " & wTIT   
	
	wURL = "X001A108_AS.ASP"
	%>
	

		<div align="center"  >
	<table border="0" height="100%" width="919" bgcolor="#FFFFFF" cellspacing="0"> <tr><td valign="top" >

	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURL%>" >

    
    <div align="center">
    <br>
	<table BORDER="1" WIDTH="700" cellspacing="0" cellpadding="0"  bordercolor="#CACACA" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" style="border-style: inset; border-width: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  
	  
	  
	  <table BORDER="0" WIDTH="100%" >
		 <TR>
		 
		 
		 <td CLASS="TDT" colspan=2>
			<p CLASS="P1" style="margin-top: 3px; margin-bottom: 3px"><%= wTIT %></p></td>		  
		 </TR>	

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Pago:</p></td>
          <td class="TDD" width="80%" height="25" ><p CLASS="P1"><%=wCLA001%></P></td>
         </tr>
		 
		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Cliente:</p></td>
          <td class="TDD" width="80%" height="25" ><p CLASS="P1"><%=wC300001CCL & " - " & wA300002RSO%></P></td>
         </tr>


	  <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Monto:</p></td>
          <td class="TDD" width="80%" height="25" ><p CLASS="P1"><%=wMCO%></p> </tr>

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Observación:</p></td>
          <td class="TDD" width="80%" ><INPUT NAME="wDES" size=80 maxlength=150  value="<%=wC300001OBR%>"><p style="margin-top: 3px; margin-bottom: 3px">
			<!--<font size="2">*Indique el motivo de rechazo del Pago.</font>--></td>
         </tr>
	
		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Estatus:</p></td>
          <td class="TDD" width="80%" >
				<select size="1" name="STS">
				<option value="3" <%=wSELUNO1%>>Conciliado</option>
				<option value="9" <%=wSELDOS1%>>Rechazado</option>
          </td>
         </tr>
	

		 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center">
		  <INPUT TYPE="Hidden" NAME="CLA001" value="<%=wCLA001%>">          
		
         <INPUT TYPE="Hidden" NAME="PROCESO" value="<%=wProceso%>">          
  		 <INPUT TYPE="button" NAME="cmdSubmit" VALUE="<%=wProceso%>" onclick="return cmdSubmit_onclick()" >  			  
 		 <INPUT type='button' value='Cancelar' id=button1 name=button1 OnClick='javascript:history.back()'>
          </td>
          
         </tr>
         </table>
</td>
</tr>

</table>
	

	

<SCRIPT LANGUAGE="javascript">

	function cmdSubmit_onclick(){
	
		if (document.frmGral.wDES.value==''){
			alert("Debe Ingresar Observaci&#65533;n")
			document.frmGral.wDES.focus();   	
			return false			
		}else{
		
		   document.frmGral.submit();
		
		}	   
	}		
	
	function Inicio(wCL1, wURL){

	if (wCL1 == ""){
		document.frmGral.wCLA.focus()
	  }else{
	    document.frmGral.wDES.focus()
	}	

	window.status = wURL

	}


	function cmdEliminar_onclick(){

		if (confirm("&#65533;Esta Seguro de Eliminar este Registro?")){ 
		/*if (confirm("&#65533;Desea Crear una Copia de este Pedido antes de ser Eliminado?")){ 
			javascript:window.open('<%=wURLC%>&E=S','main')
		}else{*/
			document.frmGral.PROCESO.value = "Eliminar";
			document.frmGral.submit()
		//}	
		}	
	
	}
		  

</SCRIPT>

</FORM>
</td></tr></table></div>
</BODY>
</div>

</HTML>
