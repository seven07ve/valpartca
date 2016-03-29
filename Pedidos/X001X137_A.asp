<%@ Language=VBScript %>
<% Response.Expires = 0 %>
<% Response.AddHeader "PRAGMA", "NO-CACHE" %>

<!--#include file="X001Z001.INC"-->
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 6.0">

<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<!--#include file="X001Y004.PRC"-->





</HEAD>

	<%

	'Preparar Etiqueta Body del Formulario
	wCLA001 = trim(Request.QueryString("CLA001"))
	wCLABUS = trim(Request.QueryString("CLABUS"))
	wERROR  = trim(Request.QueryString("ERROR"))	
	wURLW = Request.ServerVariables("URL")
	wBody = "<body  align=""center"" style=""text-align: center"" topmargin=""0"" leftmargin=""17"" rightmargin=""0"" bgcolor=""#5F5756"">"
	'onload=" & chr(34) & "Inicio '" & wCLA001 & "', '" & wURLW & "'" & chr(34) & "
	Response.Write wBody
	'Fin Preparar Etiqueta Body del Formulario
		
	wTIT = "Familia por Usuario" 
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
		wDisabled = "DISABLED"			
		

    end if
	
	wTIT = wProceso & " " & wTIT   
	
	IF wCLABUS <> "" THEN
		wB300100CCL = wCLABUS
	END IF

	wURL = "X001X137_AS.ASP"
	%>

	<div align="center"  >
	<table border="0" height="100%" width="779" bgcolor="#FFFFFF" cellspacing="0"  > <tr><td valign="top" >

	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURL%>" >

    	
    
    <br><table align="center" BORDER="1" WIDTH="700" cellspacing="0" cellpadding="0"  bordercolor="#CACACA" bgcolor="#083674" style="border-style: inset; border-width: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" >
		 <TR>
		 <td CLASS="TDT" colspan=2>
			<p CLASS="P1" style="margin-top: 3px; margin-bottom: 3px"><%= wTIT %></p></td>		  
		 </TR>	

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Usuario:</p></td>
          <td class="TDD" width="80%" ><p CLASS="P1">
		<%= wCLA002 %>	
         </tr>
		 

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Familia:</p></td>
          <td class="TDD" width="80%" >
	<SELECT name="FAMILIA" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt" size="1"  <%=wDisabled %>> 
									<%
																	
									strCnn	= Application("XDTA300_ConnectionString")
									
									
									SQL = " SELECT B300121NLP, B300121DEC FROM X300BF121 " 																		
									IF wProceso = "Agregar" THEN
										SQL = SQL & " WHERE "
										SQL = SQL & " B300121NLP NOT IN "
										SQL = SQL & "(SELECT B300123FAM FROM X300BF123 WHERE "
										SQL = SQL & " B300123CCI = '" & wCLA001 & "' AND "
										SQL = SQL & " B300123CCL = '" & wCLA002 & "' ) "									 
									END IF
									SQL = SQL & " ORDER BY  B300121DEC " 																		
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn									
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields("B300121NLP"))
										wDES = LEFT(trim(rstQuery.Fields("B300121DEC")),25)							
										IF TRIM(wCLA003) = wCOD THEN
										   wSEL = " selected"
										   'RESPONSE.WRITE Session("glBusqueda3") 
										  ELSE 
										   wSEL = ""
										END IF 

										Response.write "<OPTION value=" & """" &  wCOD & """" &  wSEL & " >" & wDES & "</OPTION>" 										
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
		            
          <!--#include file="X001Y005.PRC"-->
          </td>
         </tr>

	</table>
	
</td> 
	</TR> </table> 
</FORM>


</td></tr></table></div>


<SCRIPT LANGUAGE="javascript">

	function cmdSubmit_onclick(){
		document.frmGral.submit();
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
