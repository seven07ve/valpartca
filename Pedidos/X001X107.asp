<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 6.0">

<link rel=stylesheet type="text/css" href="X001Z900.CSS">

<!--#include file="X001Y004.PRC"-->

<SCRIPT LANGUAGE="VBScript">
<!--
	'Validar Campos
	Sub cmdSubmit_onClick()

'		if not isnumeric(document.frmGral.A300002LCR.value) then
'			alert "Debe introducir solo numeros en el Limite de Credito"
'			document.frmGral.A300002LCR.focus
'			else			
			document.frmgral.submit
'		end if	
	
	end sub

	-->
 </SCRIPT>

</HEAD>


	<%

	'Preparar Etiqueta Body del Formulario
	wCLA001 = trim(Request.QueryString("CLA002"))
	wURLW = Request.ServerVariables("URL")
	wBody = "<body  onload=" & chr(34) & "Inicio '" & wCLA001 & "', '" & wURLW & "'" & chr(34) & ">"
	Response.Write wBody
	'Fin Preparar Etiqueta Body del Formulario
	
	wTIT = "Detalle de Lista de Precios" 
	wCLA001 = trim(Request.QueryString("CLA001"))
	wCLA002 = trim(Request.QueryString("CLA002"))	
	wCCI = Session("glCiaInternet") 
	wCIA = Session("glCia") 

	
	wDEL =""
	wKPC ="0"
	wPIM ="0"
	wSTS ="1"	
	wDisabled = ""
	wProceso = "Agregar"
    IF len(wCLA002) > 0 then
		
		wProceso = "Actualizar"
		
		wDisabled = "DISABLED"
    
		strCnn	= Application("XDTA300_ConnectionString")
	
		SQL = "SELECT * FROM X300AQ019 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " A300019CCI = '" & wCCI & "' AND "
		SQL = SQL & " A300019CIA = '" & wCIA & "' AND "		
		SQL = SQL & " A300019LPR ='" &  wCLA001 & "' AND " 	
		SQL = SQL & " A300019CPR ='" &  wCLA002 & "'" 	
		wACT = ""
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wDEL = trim(rstQuery.Fields("A300003DEL"))
			wPUA = formatnumber(trim(rstQuery.Fields("A300019PUA")),2)
			wPPR = formatnumber(trim(rstQuery.Fields("A300019PPR")),2)
			wBPR = formatnumber(trim(rstQuery.Fields("A300019BPR")),2)
			wSTS = trim(rstQuery.Fields("A300019STS"))
			wPUS = trim(rstQuery.Fields("A300019PUS"))
			wFAC = trim(rstQuery.Fields("A300019FAC"))
			wFPR = trim(rstQuery.Fields("A300019FPR"))			
			wACT =  wPUS & " el " & wFAC & "   ( Creado el " & wFPR & " ) "
		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING	

		wSELUNO1 = "" : wSELDOS1 = ""
		IF wSTS = "1" THEN
		   wSELUNO1 = "selected"
		  ELSE
		   wSELDOS1 = "selected"
		END IF   


    end if
	
	wTIT = wProceso & " " & wTIT   

	wURL = "X001X107S"
	wURLP = wURL & ".ASP?CLA002=" & wCLA002

	%>

	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURLP%>" >

    <table BORDER="1" WIDTH="85%" cellspacing="0" cellpadding="0" align="center">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" >
		 <TR>
		 <td CLASS="TDT" colspan=3><%= wTIT %></td>		  
		 </TR>	
		 
		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Codigo:</p></td>
          <td class="TDD" width="80%" ><p CLASS="P1"><INPUT NAME="wCLA" <%= wDisabled %> size=15 value="<%=wCLA002%>"><%=wDEL%></P></td>
         </tr>


		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Precio Unitario:</td>
          <td class="TDD" width="80%" ><INPUT NAME="wDES" size=10 value="<%=wPUA%>"></td>
         </tr>

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">% Promoción:</td>
          <td class="TDD" width="80%" ><INPUT NAME="PPR" size=10 value="<%=wPPR%>"></td>
         </tr>

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Bs. Promoción:</td>
          <td class="TDD" width="80%" ><INPUT NAME="BPR" size=10 value="<%=wBPR%>"></td>
         </tr>

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Status:</p></td>
          <td class="TDD" width="80%" >
				<select size="1" name="STS">
				<option value="1" <%=wSELUNO1%>>Activo</option>
				<option value="3" <%=wSELDOS1%>>Suspendido</option>
          </td>
         </tr>

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Actualizado por:</td>
          <td class="TDD" width="80%" ><%=wACT%></td>
         </tr>

		 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center">
		  <INPUT TYPE="Hidden" NAME="CL1" value="<%=wCLA001%>">
		  <!--#include file="X001Y005.PRC"-->
		  <!--
		  <INPUT TYPE="Hidden" NAME="PROCESO" value="<%=wProceso%>">          
          <INPUT TYPE="button" NAME="cmdSubmit" VALUE="<%=wProceso%>">
		  <%if wProceso = "Actualizar" then%>
				<INPUT TYPE="button" NAME="cmdEliminar" VALUE="Eliminar">
		  <%end if %>		  
          <INPUT type='button' value='Regresar' id=button1 name=button1 OnClick='javascript:history.back()'>
          -->
          </td>
         </tr>

	</table>
	</td>	
	</TR>	
	</table>
</FORM>
</BODY>
</HTML>
