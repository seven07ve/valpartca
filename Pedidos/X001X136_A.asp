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

<!--#include file="X001Y004.PRC"-->





</HEAD>

	<%

	'Preparar Etiqueta Body del Formulario
	wCLA001 = trim(Request.QueryString("CLA001"))
	wCLABUS = trim(Request.QueryString("CLABUS"))
	wERROR  = trim(Request.QueryString("ERROR"))	
	wURLW = Request.ServerVariables("URL")
	wBody = "<body  align=""center"" style=""text-align: center"" topmargin=""0"" leftmargin=""17"" rightmargin=""0"" bgcolor=" & Request.Cookies("CAR")("Color1") & ">"
	'onload=" & chr(34) & "Inicio '" & wCLA001 & "', '" & wURLW & "'" & chr(34) & "
	Response.Write wBody
	'Fin Preparar Etiqueta Body del Formulario
		
	wTIT = "Grupos de Codigo" 
	wCLA001 = TRIM(Request.QueryString("CLA001"))
	wCLA002 = TRIM(Request.QueryString("CLA002"))
	wCLA003 = TRIM(Request.QueryString("CLA003"))
	wCLA004 = TRIM(Request.QueryString("CLA004"))

    wDisabled = ""	

	
	
	
	wProceso = "Agregar"
    IF len(wCLA003) > 0 then	 

		'wPEDIDO = wCLA001 & "-" & wCLA002
		wPEDIDO = wCLA002

		wProceso = "Actualizar"
		
		wDisabled = " disabled "	

    end if
	
	wTIT = wProceso & " " & wTIT   
	
	IF wCLABUS <> "" THEN
		wB300100CCL = wCLABUS
	END IF

	wURL = "X001X136_AS.ASP"
	%>

	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURL%>" >


    
      <table border="0" cellspacing="0" cellpadding="0" width="919" height="100%" align="center" bgcolor="#ffffff">
        <tr>
                <td height="40" valign="top" >
    
    &nbsp;<table align="center" BORDER="1" WIDTH="700" cellspacing="0" cellpadding="0"  bordercolor="#FFFFFF" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" style="border-style: inset; border-width: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" cellpadding="4" >
		 <TR>
		 <td CLASS="TDT" colspan=2 height="30">
			<p CLASS="P1" style="margin-top: 3px; margin-bottom: 3px" ><%= wTIT %></p></td>		  
		 </TR>	
       
		 

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Grupo de Codigo:</p></td>
          <td class="TDD" width="80%" >
	<SELECT name="FAMILIA" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt" size="1" <%=wDisabled%> > 
									<%
																	
									strCnn	= Application("XDTA300_ConnectionString")
									
									
									SQL = " SELECT A300035CGR, A300035DGR FROM X300AF035 "
									SQL = SQL & " WHERE A300035CCI = '" & Session("glCiaInternet") & "'"
									IF LEN(TRIM(wCLA003)) = 0 THEN  																		
										SQL = SQL & " AND A300035CGR NOT IN "
										SQL = SQL & " (SELECT B300127CGR FROM X300BF127 "
										SQL = SQL & " WHERE B300127CCI = '" & Session("glCiaInternet") & "' )"
									END IF 
									SQL = SQL & " GROUP BY A300035CGR, A300035DGR "
									SQL = SQL & " ORDER BY  A300035DGR " 																		
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn									
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields("A300035CGR"))
										wDES = trim(rstQuery.Fields("A300035DGR"))
										IF TRIM(wCLA003) = wCOD THEN
										   wSEL = " selected"
										   'RESPONSE.WRITE Session("glBusqueda3") 
										  ELSE 
										   wSEL = ""
										END IF 

										Response.write "<OPTION value=" & wCOD & wSEL & " >" & wDES & "</OPTION>" 										
									rstQuery.MoveNext  
                                	LOOP
                                	rstQuery.CLOSE
                                	SET rstQuery = NOTHING																									
		
									%>
									

					</SELECT>
          </td>
         </tr>


		 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center">
		  <INPUT TYPE="Hidden" NAME="CLA001" value="<%=wCLA001%>">          
		  <INPUT TYPE="Hidden" NAME="CLA002" value="<%=wCLA002%>">       
  		  <INPUT TYPE="Hidden" NAME="CLA003" value="<%=wCLA003%>">       
		            
           <INPUT TYPE="Hidden" NAME="PROCESO" value="<%=wProceso%>">          
           <%if wProceso <> "Actualizar" then%>
  <INPUT TYPE="button" NAME="cmdSubmit" VALUE="<%=wProceso%>" onclick="return cmdSubmit_onclick()" >
  <%end if %>		  
  <%if wProceso = "Actualizar" then%>
 		<INPUT TYPE="button" NAME="cmdEliminar" onclick="return cmdEliminar_onclick()"  VALUE="Eliminar">
  <%end if %>		  
  <INPUT type='button' value='Cancelar' id=button1 name=button1 OnClick='javascript:history.back()'>
          </td>
         </tr>

	</table>
	</td>	
	</TR>	
	</table>

</tr>
</table>

	
</FORM>



<SCRIPT LANGUAGE="javascript">

	function cmdSubmit_onclick(){
		document.frmGral.submit();
	}

	function Inicio(wCL1, wURL){

		window.status = wURL

	}


	function cmdEliminar_onclick(){

		if (confirm("�Esta Seguro de Eliminar este Registro?")){ 
		/*if (confirm("�Desea Crear una Copia de este Pedido antes de ser Eliminado?")){ 
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
