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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META NAME="GENERATOR" Content="Microsoft FrontPage 12.0">

<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<!--#include file="X001Z001.INC"-->
<!--#include file="X001Y004.PRC"-->

<SCRIPT LANGUAGE="VBScript">
	
	Sub Mostrar()		

		If frmgral.MTF.value = "1" then 
			frmgral.BtFamilias.disabled = true 			
		else
			frmgral.BtFamilias.disabled = False
		End If 
		
	end sub

</SCRIPT>

<SCRIPT LANGUAGE="javascript">

	function cmdSubmit_onclick(){
		if (document.frmGral.wCLA.value.length==0){ 
			alert('Debe Indicar el Usuario.');
			document.frmGral.wCLA.focus()
		}else{
			document.frmGral.submit();
		}
	}
	
</SCRIPT> 

</HEAD>

<%

	
	'Preparar Etiqueta Body del Formulario
	wCLA001 = trim(Request.QueryString("CLA001"))
	wURLW = Request.ServerVariables("URL")
	'wBody = "<body  onload=" & chr(34) & "Inicio '" & wCLA001 & "', '" & wURLW & "'" & chr(34) & ">"
	'Response.Write wBody
	'Fin Preparar Etiqueta Body del Formulario
	
	
	wCCI = Session("glCiaInternet") 
	wCIA = Session("glCia") 

	wTIT = "Maestro de Usuarios" 



	
	wNUS =""
	wCUS =""
	wEML =""
	wCLU =""
	wCVE =""
	wMEX ="0"
	wSTS ="1"
	wPRE = 0
	wPDE ="0"	
	wCVE ="0"	
	wDisabled = ""
	wProceso = "Agregar"
	wSEL06 = "selected"
	wSELMNC2 = "selected"
	wSELMTR2 = "selected"
	wSELMEXO2 = "selected"
	wSELMTFO2 = "selected"
	wSELAIV2 = "selected"


    IF len(wCLA001) > 0 then	 
		
		wProceso = "Actualizar"
		
		wDisabled = "DISABLED"
    
		strCnn	= Application("XDTA300_ConnectionString")
	
		SQL = "SELECT Z300001NUS, Z300001CUS, Z300001MEX, " 
		SQL = SQL & " Z300001EML, Z300001EM2, Z300001CLU, "
		SQL = SQL & " Z300001CVE, Z300001STS, Z300001MTF, "
		SQL = SQL & " Z300001VIS, Z300001FUA, Z300001NIC, "
		SQL = SQL & " Z300001PDE, Z300001AIV, Z300001MNC, "
		SQL = SQL & " Z300001MTR, Z300001OBS, Z300001MVI, Z300001PRE "
		SQL = SQL & " FROM X300ZF001 "
		SQL = SQL & " WHERE "
		SQL = SQL & " Z300001CCI = '" & wCCI & "' AND "
		SQL = SQL & " Z300001CIA = '" & wCIA & "' AND "		
		SQL = SQL & " Z300001PUS = '" &  wCLA001 & "'" 	

		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wNUS = trim(rstQuery.Fields("Z300001NUS"))
			wCUS = trim(rstQuery.Fields("Z300001CUS"))
			wMEX = trim(rstQuery.Fields("Z300001MEX"))
			wEML = trim(rstQuery.Fields("Z300001EML"))
			wEM2 = trim(rstQuery.Fields("Z300001EM2"))
			wCLU = trim(rstQuery.Fields("Z300001CLU"))
			wCVE = trim(rstQuery.Fields("Z300001CVE"))
			wSTS = trim(rstQuery.Fields("Z300001STS"))
			wMTF = trim(rstQuery.Fields("Z300001MTF"))	
			wVIS = trim(rstQuery.Fields("Z300001VIS"))		
			wFUA = trim(rstQuery.Fields("Z300001FUA"))
			wNIC = trim(rstQuery.Fields("Z300001NIC"))
			wAIV = trim(rstQuery.Fields("Z300001AIV"))
			wMNC = trim(rstQuery.Fields("Z300001MNC"))
			wMTR = trim(rstQuery.Fields("Z300001MTR"))
			wOBS = trim(rstQuery.Fields("Z300001OBS"))
			wPDE = rstQuery.Fields("Z300001PDE")
			wMVI = trim(rstQuery.Fields("Z300001MVI"))
			wPRE = trim(rstQuery.Fields("Z300001PRE"))
		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING	
		
		
		IF wMVI = "1" THEN
			wChecked = " checked=checked"
			ELSE
			wChecked = ""
		END IF 
		
		wDIA_FED = Day(wFUA)
        If Len(Trim(wDIA_FED)) = "1" Then: wDIA_FED = "0" & wDIA_FED: End If
        wMES_FED = Month(wFUA)
        If Len(Trim(wMES_FED)) = "1" Then: wMES_FED = "0" & wMES_FED: End If
        wANO_FED = Year(wFUA)
        wFUA = wDIA_FED & "/" & wMES_FED & "/" & wANO_FED & "  " & TimeValue(wFUA)
        

		wSEL01 = "": wSEL02 = "": wSEL03 = "": wSEL04 = "": wSEL05 = ""
		wSEL06 = "": wSEL07 = "": wSEL08 = "": wSEL09 = ""
		
		'response.write wCLU	
		SELECT CASE wCLU
			CASE "A"
				wSEL01 = "selected"
			CASE "D"
				wSEL02 = "selected"
			CASE "G"
				wSEL03 = "selected"
			CASE "S"
				wSEL04 = "selected"
			CASE "U"
				wSEL04 = "selected"	
			CASE "V"
				wSEL05 = "selected"				
			CASE "C"
				wSEL06 = "selected"				
			CASE "EG"
				wSEL07 = "selected"
			CASE "CP"
				wSEL08 = "selected"
			CASE "UA"
				wSEL09 = "selected"					
		END SELECT				

		wSELUNO1 = "" : wSELDOS1 = ""
		IF wSTS = "1" THEN
		   wSELUNO1 = "selected"
		  ELSEIF wSTS = "2" THEN
		   wSELDOS1 = "selected"
		   ELSE
		   wSELTRES1 = "selected"
		END IF   
		
		wSELMEXO1 = "" : wSELMEXO2 = ""
		IF wMEX = "0" THEN
		   wSELMEXO1 = "selected"		  
		  ELSE
		   wSELMEXO2 = "selected"
		END IF   		
		
		wSELMTFO1 = "" : wSELMTFO2 = ""
		IF wMTF = "0" THEN
		   wSELMTFO1 = "selected"		  
		  ELSE
		   wSELMTFO2 = "selected"
		END IF   		
		
		wSELAIV1 = "" : wSELAIV2 = ""
		IF wAIV = "0" THEN
		   wSELAIV2 = "selected"		  
		  ELSE
		   wSELAIV1 = "selected"
		END IF   		
		
		wSELMNC1 = "" : wSELMNC2 = ""
		IF wMNC = "0" THEN
		   wSELMNC2 = "selected"		  
		  ELSE
		   wSELMNC1 = "selected"
		END IF   
		
		wSELMTR1 = "" : wSELMTR2 = ""
		IF wMTR = "0" THEN
		   wSELMTR2 = "selected"		  
		  ELSE
		   wSELMTR1 = "selected"
		END IF   		
		
    end if
	
	wTIT = wProceso & " " & wTIT   

	wURL = "X001X103S"
	wURLP = wURL & ".ASP?CLA001=" & wCLA001
	%>
	
	<body bgcolor="<%=Request.Cookies("CAR")("Color1")%>" topmargin="0" leftmargin="18" rightmargin="0" bottommargin="0" >

	
  
       <table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" cellspacing="0" align="center"  height="100%">
<tr>
<td valign="top"  >
<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURLP%>" >


<table width="919" bgcolor="#FFFFFF" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF">
    &nbsp;<table BORDER="0" WIDTH="650" align="center"   cellspacing="1" cellpadding="0"  bordercolor="#ffffff" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" style="border-style: inset; border-width: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" cellpadding="3"  >
		 <TR>
		 <td CLASS="TDT" colspan=2 height="30" ><%= wTIT %></td>		  
		 </TR>	
		 
		 <tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Usuario:</p></td>
          <td class="TDD" width="68%" ><p CLASS="P1"><INPUT NAME="wCLA" <%= wDisabled %> size=15 value="<%=wCLA001%>"></P></td>
         </tr>

		 <tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Nombre:</p></td>
          <td class="TDD" width="68%" >
			<INPUT NAME="wDES" size=50 value="<%=wNUS%>"></td>
         </tr>

		 <tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Contraseña:</p></td>
          <td class="TDD" width="68%" ><INPUT TYPE=password NAME="CUS" size=15 value="<%=wCUS%>"> 
          <% If Session("glTipoUsuario") = "A" Then %>         
            <!--<b><font size="3"><%=wCUS%></font></b>-->
          <% End If %>         
          </td>
         </tr>

		 <tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">E-mail:</p></td>
          <td class="TDD" width="68%" >
			<INPUT NAME="EML" size=50 value="<%=wEML%>"></td>
         </tr>


		 <tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">E-mail 2:</p></td>
          <td class="TDD" width="68%" >
			<INPUT NAME="EM2" size=50 value="<%=wEM2%>"></td>
         </tr>


		 <tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Clase de 
		  Usuario:</p></td>
          <td class="TDD" width="68%" >
				<select size="1" Name="CLU">
				<option value="A" <%=wSEL01%>>Administrador</option>
				<!--<option value="D" <%=wSEL02%>>Director</option>			
				<option value="G" <%=wSEL03%>>Gerente</option>-->
				<option value="S" <%=wSEL04%>>Supervisor</option>							
				<option value="V" <%=wSEL05%>>Vendedor</option>
				<option value="C" <%=wSEL06%>>Cliente</option>
				<!--<option value="EG" <%=wSEL07%>>Empleados Gabriel</option>
				<option value="CP" <%=wSEL08%>>Cliente-Proveedor</option>-->
				<!--<option value="UA" <%=wSEL09%>>Almacen</option>	-->			
          </select>	
          </td>
         </tr>
         


		 <tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Código de 
		  Vendedor:</p></td>
          <td class="TDD" width="68%" ><INPUT NAME="CVE" size=5 value="<%=wCVE%>"></td>
         </tr>

		 <tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Estatus:</p></td>
          <td class="TDD" width="68%" >
				<select size="1" name="STS">
				<option value="1" <%=wSELUNO1%>>Activo</option>
				<option value="2"  <%=wSELDOS1%>>Inactivo - Solo Puede ver 
				Consultas y Realizar Pagos</option>
				<option value="3" <%=wSELTRES1%>>Inactivo - Sin Acceso</option>
          		</select> 
          		<p style="margin-top: 5px; margin-bottom: 0"><b>
				<font size="2" color="#FF0000">*Llenar este campo en caso de 
				inactivación.</font></b></p>
				<p style="margin-top: 0">
			<INPUT NAME="OBS" size=50 value="<%=wOBS%>" maxlength="50">
          		</td>
         </tr>

		 

		 <tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Mostrar 
		  Columna Existencia:</p></td>
          <td class="TDD" width="68%" >
				<select size="1" name="MEX">
				<option value="0" <%=wSELMEXO1%>>No</option>
				<option value="1" <%=wSELMEXO2%>>Si</option>
          	  </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font color="#000000" style="font-size: 8pt" >
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" name="MVI" <%=wChecked%> > <strong>&nbsp;Mostrar 
				Valores</strong></font></td>
    
         </tr>
			<tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Mostrar Todas 
		  las Líneas:</p></td>
          <td class="TDD" width="68%" >
				<select size="1" name="MTF"  >
				<option value="0" <%=wSELMTFO1%>>No</option>
				<option value="1" <%=wSELMTFO2%>>Si</option>
          		</select>&nbsp;&nbsp;&nbsp;
				<!--input type="button" value="Familias" name="BtFamilias"  ></td-->
    
         </tr>
         
		 <tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Aplicar IVA:</p></td>
          <td class="TDD" width="68%" >
				<select size="1" name="AIV">
				<option value="1" <%=wSELAIV1%>>Si</option>
				<option value="0" <%=wSELAIV2%>>No</option>
				</select> 
          </td>
    
         </tr>
 <!--        
         <tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Mostrar Notas de Credito:</p></td>
          <td class="TDD" width="68%" >
				<select size="1" name="MNC">
				<option value="1" <%=wSELMNC1%>>Si</option>
				<option value="0" <%=wSELMNC2%>>No</option>
				</select>
          </td>

         </tr>
-->
<!--
		 <tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Mostrar Transito:</p></td>
          <td class="TDD" width="68%" >
				<select size="1" name="MTR">
				<option value="1" <%=wSELMTR1%>>Si</option>
				<option value="0" <%=wSELMTR2%>>No</option>
				</select> 
          </td>
   
         </tr>
-->
		<tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Presupuesto de Venta:</p></td>
          <td class="TDD" width="68%" >
			<INPUT NAME="PRE" size=5 value="<%=wPRE%>">
			<b><font size="2">*Aplica Solo para Usuario Clase Vendedor</font></b>
			</td>
         </tr>
         
			<tr>
          <td class="TDS" width="30%" height="22" ><p CLASS="P1" align="left">
			Visitas desde el 30/05/2007:</p></td>
          <td class="TDD" width="68%" height="22" >
				<b>
				<%=wVIS%>
    
         </b>
    
         </tr>
		<tr>
          <td class="TDS" width="30%" height="22" ><p CLASS="P1" align="left">
			Ultimo Acceso a la Web:</p></td>
          <td class="TDD" width="68%" height="22" >
				<b>
				<%=wFUA%>
    
         </b>
    
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
</table>

</td>
</tr> 
<!--
<td>
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