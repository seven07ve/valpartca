<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 6.0">
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<!--#include file="X001Y004.PRC"-->

<SCRIPT LANGUAGE="VBScript">
	Sub cmdSubmit_onClick()

		if not isnumeric(document.frmGral.pim.value) then
			alert "Debe introducir solo numeros"
			else			
				if (document.frmGral.pim.value)> 100  then
					alert "Monto no puede ser mayor a 100"
				 else
					document.frmgral.submit
				end if	
		end if	
	
	end sub

 </SCRIPT>


</HEAD>

<%

	'Preparar Etiqueta Body del Formulario
	wCLA001 = trim(Request.QueryString("CLA001"))
	wURLW = Request.ServerVariables("URL")
	wBody = "<body  onload=" & chr(34) & "Inicio '" & wCLA001 & "', '" & wURLW & "'" & chr(34) & ">"
	Response.Write wBody
	'Fin Preparar Etiqueta Body del Formulario


	wCCI = Session("glCiaInternet") 
	wCIA = Session("glCia") 	
	wTIT = "Maestro de Productos" 

	
	wDEL =""
	wKPC ="0"
	wPIM ="0"
	wSTS ="1"	
	wDisabled = ""
	wProceso = "Agregar"
    IF len(wCLA001) > 0 then	 
		
		wProceso = "Actualizar"
		
		wDisabled = "DISABLED"
    
		strCnn	= Application("XDTA300_ConnectionString")
	
		SQL = "SELECT * FROM X300AQ003 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " A300003CCI = '" & wCCI & "' AND "
		SQL = SQL & " A300003CIA = '" & wCIA & "' AND "		
		SQL = SQL & " A300003CPR ='" &  wCLA001 & "'" 	

		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wDEL = trim(rstQuery.Fields("A300003DEL"))
			wKPC = trim(rstQuery.Fields("A300003KPC"))
			wPIM = trim(rstQuery.Fields("A300003PIM"))
			wUCA = trim(rstQuery.Fields("A300003UCA"))
			wUME = trim(rstQuery.Fields("A300003UME"))
			wSTS = trim(rstQuery.Fields("A300003STS"))
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

	wURL = "X001X102S"
	wURLP = wURL & ".ASP?CLA001=" & wCLA001
	%>

	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURLP%>" >

    <div align="center">

    <table BORDER="1" WIDTH="700" cellspacing="0" cellpadding="0"  bordercolor="#0066CC" bgcolor="#FE9900" style="border-style: inset; border-width: 2px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" >
		 <TR>
		 <td CLASS="TDT" colspan=3><%= wTIT %></td>		  
		 </TR>	
		 
		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Codigo:</p></td>
          <td class="TDD" width="80%" ><p CLASS="P1"><INPUT NAME="wCLA" <%= wDisabled %> size=15 value="<%=wCLA001%>"></P></td>
         </tr>

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Descripción:</p></td>
          <td class="TDD" width="80%" ><INPUT NAME="wDES" size=50 value="<%=wDEL%>"></td>
         </tr>

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Peso:</p></td>
          <td class="TDD" width="80%" ><INPUT NAME="KPC" size=20 value="<%=wKPC%>"></td>
         </tr>

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">% Impuesto:</p></td>
          <td class="TDD" width="80%" ><INPUT NAME="PIM" size=5 value="<%=wPIM%>"></td>
         </tr>

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Unidad de Medida:</p></td>
          <td class="TDD" width="80%" ><INPUT NAME="UME" size=3 value="<%=wUME%>"></td>
         </tr>
         
		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Unidades por Caja:</p></td>
          <td class="TDD" width="80%" ><INPUT NAME="UCA" size=5 value="<%=wUCA%>"></td>
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
          <td CLASS="TDT" width="100%" colspan=2 align="center">
          <!--#include file="X001Y005.PRC"-->
          </td>
         </tr>

	</table>
	</td>	
	</TR>	
	</table>
	</div>
</FORM>


</BODY>
</HTML>
