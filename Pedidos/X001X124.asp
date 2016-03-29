<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel=stylesheet type="text/css" href="X001Z900.CSS">



</HEAD>

<script language="Javascript">

function enviar() {

	document.FrmBuscar.submit(); 
	
}

</script>


<%

	
	'Preparar Etiqueta Body del Formulario
	wCLA001 = trim(Request.QueryString("CLA001"))
	wURLW = Request.ServerVariables("URL")
	'wBody = "<body  >"
	'Response.Write wBody
	'Fin Preparar Etiqueta Body del Formulario
	
	
	wCCI = Session("glCiaInternet") 
	wCIA = Session("glCia") 

	wTIT = "Lista de Precios por Línea" 


		
	%>

	
<body bgcolor="<%=Request.Cookies("CAR")("Color1")%>" leftmargin="18" rightmargin="0" topmargin="0" bottommargin="0" >

	
<FORM NAME="FrmBuscar" METHOD="post" ACTION="X001X125.asp" target="_blank" >	 


       <table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" cellspacing="0" align="center" height="100%"   >
<tr>
<td valign="top"  >

<table width="919" bgcolor="#FFFFFF" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF">



    &nbsp;
    <table BORDER="1" WIDTH="650" align="center"  cellspacing="0" cellpadding="0"  bordercolor="#ffffff" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" style="border-style: inset; border-width: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" >
		 <TR>
		 <td CLASS="TDT" colspan=2 height="29"><%= wTIT %></td>		  
		 </TR>	
		 <tr>
          <td class="TDS" width="40%" height="20" ><p CLASS="P1" align="left">
			Línea:</p></td>
          <td class="TDD" width="58%" height="20" ><p CLASS="P1"><b>
          
          
          <SELECT name="LINEA" style="font-family: Tahoma; font-size: 8pt; width:300px" size="1"> 
									<%
														
											
									wLIN = TRIM(Request.QueryString("LINEA"))

									strCnn	= Application("XDTA300_ConnectionString")
									
									IF Session("glMostrarTodasFamilias") = "0" THEN
 										SQL = " SELECT B300123FAM, B300121DEC FROM X300BQ123 " 																		
							 			SQL = SQL & " WHERE "
							 			SQL = SQL & " B300123CCI = '" & trim(Session("glCiaInternet")) & "' AND "
							 			SQL = SQL & " B300123CCL = '" & trim(Session("glUsuario")) & "' "
	 									SQL = SQL & " ORDER BY  B300121DEC "			
										ELSE
 										SQL = " SELECT B300120NPS, B300120DEC FROM X300BF120 " 																		
 										SQL = SQL & " WHERE B300120CCI = '" & Session("glCiaInternet") & "'"
	 									SQL = SQL & " ORDER BY  B300120DEC " 					
									END IF 
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
									Response.write "<OPTION value=""000"">TODAS</OPTION>" 										
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields(0))
										wDES = LEFT(trim(rstQuery.Fields(1)),55)							
										IF wLIN = wCOD THEN
										   wSEL = " selected"										   
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

          
          
          </b></P></td>
         </tr>
         
         <!--
         		 <tr>
          <td class="TDS" width="43%" height="20" ><p CLASS="P1" align="left">
			Sub-Linea:</p></td>
          <td class="TDD" width="55%" height="20" ><p CLASS="P1"><b>
          
          
          <SELECT name="SUBLINEA" style="font-family: Tahoma; font-size: 8pt; width:300px" size="1" > 
									<%
														
											
									
									strCnn	= Application("XDTA300_ConnectionString")
									
									wLIN = TRIM(Request.QueryString("LINEA"))

									SQL = " SELECT B300121NLP, B300121DEC FROM X300BF121 " 			
									SQL = SQL & " WHERE "
									SQL = SQL & " B300121CCI = '" & Session("glCiaInternet") & "' AND "			
									SQL = SQL & " B300121STS = '1' AND "																	
									SQL = SQL & " B300121NPS = '" & wLIN & "'" 
 									SQL = SQL & " ORDER BY  B300121DEC " 					

									'RESPONSE.WRITE SQL & "ok"
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
									'Response.write "<OPTION value=""000"">       </OPTION>" 
									'IF Session("glMostrarTodasFamilias") <> "0" THEN
										Response.write "<OPTION value=""000"">TODAS</OPTION>" 
									'END IF										
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields(0))
										wDES = LEFT(trim(rstQuery.Fields(1)),55)							
										''IF TRIM(Session("glBusqueda3")) = wCOD THEN
										''   wSEL = " selected"
										   'RESPONSE.WRITE Session("glBusqueda3") 
										 '' ELSE 
										   wSEL = ""
										''END IF 
										Response.write "<OPTION value=""" & wCOD & wSEL & """ >" & wDES & "</OPTION>" 										
									rstQuery.MoveNext  
                                	LOOP
                                	rstQuery.CLOSE
                                	SET rstQuery = NOTHING																									
		
		
									%>
									

					</SELECT>

          
          
          </b></P></td>
         </tr>-->

    	  <% IF Session("glTipoUsuario") <> "V" THEN %>	

		  <tr>
          <td class="TDS" width="40%" height="20" ><p CLASS="P1" align="left">
			Únicamente Productos con Existencia:</p></td>
          <td class="TDD" width="58%" height="20" ><p CLASS="P1"><font color="#000000" style="font-size: 8pt" >
			<input type="checkbox" name="PIN" ></font></p> 
</td> 
</tr> 
			<%END IF %>
	     

		 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center">
          				<INPUT type='button' value='Ver Lista' id=btVer name=btVer OnClick='Javascript:enviar()'>
                        <INPUT type='button' value='Regresar' id=button1 name=button1 OnClick='Javascript:history.back()'>        
       
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

<script language="javascript">

function Cambiar_SubLinea(){
	
	var url = 'X001X124.asp'
	url+= '?LINEA=' + document.FrmBuscar.LINEA.value	
	

	
	window.open(url,'main') 
	//document.parentWindow.location.href = url;   
	
}
</script>

</BODY>
</HTML>
