<%@ Language=VBScript %>
<%

Response.Expires = -1
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"

%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 12.0">

<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<!--#include file="X001Z001.INC"-->
</HEAD>

	<%

	'Preparar Etiqueta Body del Formulario
	wCLA001 = trim(Request.QueryString("CLA001"))
	wCLABUS = trim(Request.QueryString("CLABUS"))
	wERROR  = trim(Request.QueryString("ERROR"))	
	wURLW = Request.ServerVariables("URL")
	wBody = "<body  align=""center"" style=""text-align: center"" topmargin=""0"" leftmargin=""19"" rightmargin=""0"" >"
	'onload=" & chr(34) & "Inicio '" & wCLA001 & "', '" & wURLW & "'" & chr(34) & "
	Response.Write wBody
	'Fin Preparar Etiqueta Body del Formulario
		
	wTIT = "Pedido" 
	wCLA001 = TRIM(Request.QueryString("CLA001"))
	wCLA002 = TRIM(Request.QueryString("CLA002"))
	wB300100CCI = Session("glCiaInternet")
	wB300100CIA = Session("glCia")
    wDisabled = ""	
    wDisabled2 = ""	

		
	IF Session("glTipoUsuario") = "C" THEN
	   wB300100CCL = Session("glUsuario")
	   wA300002RSO = Session("glUsuarioNombre")
	   wDisabled = "disabled"
	END IF 

	wPEDIDO = "Nuevo"		
	
	wA300002NT1 =""
	wA300002LCR =""	
	wProceso = "Agregar"
	
	wB300100SPP = "0"
	
	strCnn	= Application("XDTA300_ConnectionString")
	
	
	'BUSCA ERP COMPAÑIA INTERNET
	SQL = "SELECT Z300002ERP FROM X300ZF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300002CCI = '" & Session("glCiaInternet") & "'"
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
    rstQuery.Open sql , strCnn
	IF NOT rstQuery.EOF THEN
		wERP = TRIM(rstQuery.Fields("Z300002ERP"))
	END IF
	rstQuery.Close 
	set rstQuery = nothing

	wNER = "0"
	
    IF len(wCLA001) > 0 then	 

		'wPEDIDO = wCLA001 & "-" & wCLA002
		wPEDIDO = wCLA002

		wProceso = "Actualizar"
		
		strCnn	= Application("XDTA300_ConnectionString")
	
		SQL = "SELECT B300100CCL, A300002RSO, B300100CPE, B300100STS, B300100SPP, "
		SQL = SQL & " B300100AEP, B300100CSO, ISNULL(B300100NER,'0') AS B300100NER "
		SQL = SQL & " FROM X300BQ100 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " B300100CCI ='" & wB300100CCI & "' AND "
		SQL = SQL & " B300100CIA ='" & wB300100CIA & "' AND "
		SQL = SQL & " B300100OPE ='" & wCLA001 & "' AND "
		SQL = SQL & " B300100NPE = " & wCLA002 & " "

		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wA300002RSO = trim(rstQuery.Fields("A300002RSO"))
			wB300100CCL = trim(rstQuery.Fields("B300100CCL"))
			wB300100CPE = trim(rstQuery.Fields("B300100CPE"))
			wB300100SPP = trim(rstQuery.Fields("B300100SPP"))
			wAEP = trim(rstQuery.Fields("B300100AEP"))
			wSTS = trim(rstQuery.Fields("B300100STS"))
			wB300100CSO = trim(rstQuery.Fields("B300100CSO"))
			wNER = trim(rstQuery.Fields("B300100NER"))
		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING	
		
		IF LEN(TRIM(wNER)) = 0 THEN
			wNER = "0"
		END IF 

		wSELUNO1 = "" : wSELDOS1 = ""
		IF wSTS = "1" THEN
		   wSELUNO1 = "selected"
		  ELSE
		   wSELDOS1 = "selected"
		END IF   
		
		wSELUNO2 = "" : wSELDOS2 = ""
		IF wAEP = "S" THEN
		   wSELUNO2 = "selected"
		  ELSE
		   wSELDOS2 = "selected"
		END IF   
		
		If wB300100SPP = "1" Then
			wDisabled2 = " disabled"
		End If
    end if
	
	wTIT = wProceso & " " & wTIT   
	
	IF wCLABUS <> "" THEN
		wB300100CCL = wCLABUS
	END IF

	'wERROR = "Cliente no Existe"
	
	IF wCLABUS <> "" THEN
		wB300100CCL = wCLABUS		
	END IF
	
	IF wERP = "SAP" THEN
		wCnt = 0
		SQL = "SELECT A300010CSO, DESTINATARIO "
		SQL = SQL & " FROM X300AQ002C " 
		SQL = SQL & " WHERE "
		SQL = SQL & " A300002CCI ='" & wB300100CCI & "' AND "
		SQL = SQL & " A300010CCL ='" & wB300100CCL & "' "
		SQL = SQL & " ORDER BY A300010CON "
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		DO WHILE NOT rstQuery.EOF 
		
			wCSO = trim(rstQuery.Fields("A300010CSO"))
			wDES = trim(rstQuery.Fields("DESTINATARIO"))
			
			IF TRIM(wB300100CSO) = wCSO THEN
				wSEL3 = " selected"
			 ELSE 
				wSEL3 = ""
			END IF 
			
			wOPD = wOPD & "<option value=""" & wCSO & """" & wSEL3 & ">" & wCSO & "-" & wDES  & "</option>"
			
			wCnt = wCnt +1
			
			rstQuery.MoveNext 
		LOOP
		rstQuery.CLOSE
		SET rstQuery = NOTHING
		
		ELSE
		
		wCnt = 0
		SQL = "SELECT A300010CSO, A300010NSO "
		SQL = SQL & " FROM X300AF010 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " A300010CCI ='" & wB300100CCI & "' AND "
		SQL = SQL & " A300010CCL ='" & wB300100CCL & "' "
		SQL = SQL & " ORDER BY A300010CON "
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		DO WHILE NOT rstQuery.EOF 
		
			wCSO = trim(rstQuery.Fields("A300010CSO"))
			wDES = trim(rstQuery.Fields("A300010NSO"))
			
			IF TRIM(wB300100CSO) = wCSO THEN
				wSEL3 = " selected"
			 ELSE 
				wSEL3 = ""
			END IF 
			
			wOPD = wOPD & "<option value=""" & wCSO & """" & wSEL3 & ">" & wCSO & "-" & wDES  & "</option>"
			
			wCnt = wCnt +1
			
			rstQuery.MoveNext 
		LOOP
		rstQuery.CLOSE
		SET rstQuery = NOTHING
		
	END IF 

	wURL = "X001A100_AS.ASP"
	
	
	
	
	%>

	<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>">


<table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" align="center" height="100%" >
<tr>
<td valign="top"  >
	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURL%>" >

<table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF">



    
    
    <p style="margin-top: 0">&nbsp;</p>

    
    <table align="center" BORDER="1" WIDTH="650" cellspacing="0" cellpadding="0"  bordercolor="#ffffff" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" style="border-style: inset; border-width: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" cellpadding="4"  >
		 <TR>
		 <td CLASS="TDT" colspan=3 height="30" >
			<p CLASS="P1" style="margin-top: 3px; margin-bottom: 3px" ><%= wTIT %></p></td>		  
		 </TR>	

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Pedido:</p></td>
          <td class="TDD" width="80%" ><p CLASS="P1">
			<INPUT NAME="PEDIDO" Disabled size=6 value="<%=wPEDIDO%>"></P></td>
         </tr>
		 
		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Código Cliente:</p></td>
          <td class="TDD" width="80%" ><p CLASS="P1"><INPUT NAME="wCLA" size=15 <%=wDisabled%> value="<%=wB300100CCL%>" required><%=wA300002RSO%>
          <% IF Session("glTipoUsuario") <> "C" THEN %>
          <INPUT TYPE="button" NAME="cmdBuscarCliente" onclick="return cmdBuscarCliente_onclick()"  VALUE="Buscar">
          <% END IF %>
          <font color="#FF0000"><b><%=wERROR%></b></FONT>
		  
          </P></td>
         </tr>


		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Comentario:</p></td>
          <td class="TDD" width="80%" ><INPUT NAME="wDES" size=80 maxlength=150  value="<%=wB300100CPE%>"><p style="margin-top: 3px; margin-bottom: 3px">
			<font size="2">*Indique algún comentario respecto al pedido.</font></td>
         </tr>
         
         <%IF wERP = "SAP" THEN%>
         <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Destinatario:</p></td>
          <td class="TDD" width="77%" >
				<select size="1" name="DES">
				<% IF wCnt > 1 THEN %>
				<option value="9" >Seleccione...</option>
				<% END IF %>	
				<%=wOPD%>
				</select>		
          </td>
         </tr>
		<%ELSE %>
       <!--  <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Dirección de Despacho:</p></td>
          <td class="TDD" width="77%" >
				<select size="1" name="DES">
				<% IF wCnt > 1 THEN %>
				<option value="9" >Seleccione...</option>
				<% END IF %>	
				<%=wOPD%>
				</select>		
          </td>
         </tr>-->
		<%END IF %>


		<% If Session("glTipoUsuario") <> "C" Then %>	 
<!--
          <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Entrega Parcial:</p></td>
          <td class="TDD" width="80%" >
				<select size="1" name="AEP" <%=wDisabled2%>>
				<option value="S" <%=wSELUNO2%>>SI</option>
				<option value="N" <%=wSELDOS2%>>NO</option>
				</select>		
          </td>
         </tr>-->
        <% 
        End If
        
        If Session("glTipoUsuario") = "A" AND wPEDIDO <> "Nuevo" Then %>	  
		
		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Estatus:</p></td>
          <td class="TDD" width="80%" >
				<select size="1" name="STS">
				<option value="1" <%=wSELUNO1%>>Sin Comunicar</option>
				<option value="2" <%=wSELDOS1%>>Comunicado</option>
				</select>		
          </td>
         </tr>
		<% End If %>

		 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center"  >
		  <INPUT TYPE="Hidden" NAME="CLA001" value="<%=wCLA001%>">          
		  <INPUT TYPE="Hidden" NAME="CLA002" value="<%=wCLA002%>">          
		  
		  <% IF (wB300100SPP = "0" OR Session("glTipoUsuario") = "A") AND wNER = "0" THEN %>
          <!--#include file="X001Y005.PRC"-->
          
          <% ELSE %>
          <input type="button" value="Regresar" onclick="javascript:history.back()" >  
          
          <%END IF%>
         
 </td>
         </tr>

	</table>

 </td>
         </tr>

	</table>

</td>
	</tr>
</table>
</FORM>
</td>

        </tr>
        
        
        
        
               </table>

   



<SCRIPT LANGUAGE="javascript">

	function cmdSubmit_onclick(){

		/*if ((document.frmGral.DES.value == '9') || (document.frmGral.DES.value == '')){  
			alert("Debe Seleccionar una Dirección de Despacho Ó Destinatario");
			document.frmGral.DDE.focus(); 
		}else{*/
			document.frmGral.submit();
		//}

		//document.frmGral.submit();
	}

	function cmdBuscarCliente_onclick(){
		document.frmGral.PROCESO.value = "Buscar";
		document.frmGral.submit()
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

		if (confirm("¿Esta Seguro de Eliminar este Registro?")){ 
		/*if (confirm("¿Desea Crear una Copia de este Pedido antes de ser Eliminado?")){ 
			javascript:window.open('<%=wURLC%>&E=S','main')
		}else{*/
			document.frmGral.PROCESO.value = "Eliminar";
			document.frmGral.submit()
		//}	
		}	
	
	}
		  

</SCRIPT>

</BODY>
</HTML>
