<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 12.0">

<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<script language="JavaScript" src="calendar1.js"></script><!-- Date only with year scrolling -->



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
	
	strCnn	= Application("XDTA300_ConnectionString")
	
	wTIT = "Pagos Realizados en la Web" 

	
	wFEC = Right("0" & day(date),2) & "-" &  Right("0" & month(date),2) & "-" & year(date)

		
	%>

	<body  ALIGN="CENTER" vlink="#0000FF" topmargin="0" rightmargin="0" leftmargin="17" bottommargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>" >
<FORM NAME="FrmBuscar" METHOD="post" ACTION="X001X162.asp" target="main" >	 

    <div align="center">
    
    
       <table width="919" bgcolor="#FFFFFF" border="0"  cellpadding="0" cellspacing="0" align="center" height="100%"  >
<tr>
<td valign="top"  >

<table width="919" bgcolor="#FFFFFF" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF" align ="center" >



    &nbsp;
    
    <table cellspacing="0" cellpadding="0" width="607" bordercolor="#ffffff" bgcolor="<%=Request.Cookies("CAR")("Color2")%>"  style="padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px;" id="table6" border="1">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" cellpadding="5">
		 <TR>
		 <td CLASS="TDT" colspan=2 height="29"><%= wTIT %></td>		  
		 </TR>	
		 <tr>
		  <td class="TDS" width="24%" height="20" ><p CLASS="P1" align="left">
			Cliente:</p></td>
          <td class="TDD" width="73%" height="20" valign="middle" ><p CLASS="P1"><b>
            
          <SELECT name="CLIENTE" type="select-one" SelectedIndex style="font-family: Tahoma; font-size: 8pt" size="1" > 
									<%
																	
																		
									SQL = " SELECT A300002CCL, A300002RSO FROM X300AF002 " 	
									SQL = SQL & " WHERE "
									SQL = SQL & " A300002CCI = '" & wCCI & "' AND "
									SQL = SQL & " A300002CIA = '" & wCIA & "' AND "
									SQL = SQL & " A300002NIC = 'D001' "									
									'SQL = SQL & " Z300001CLU <> 'A' "									
									SQL = SQL & " ORDER BY  A300002CCL " 																		
									Set rstQuery = Server.CreateObject("ADODB.Recordset")
									rstQuery.Open sql , strCnn
									if Session("glTipoUsuario") <> "C" then
										Response.write "<OPTION value=000>TODOS</OPTION>" 										
                                    End if
                                    DO WHILE NOT rstQuery.EOF 
										wCOD = trim(rstQuery.Fields("A300002CCL"))
										wDES = LEFT(trim(rstQuery.Fields("A300002RSO")),45)							
										wSEL = ""
										Response.write "<OPTION value=" & wCOD & wSEL & " >" & wCOD & "-" & wDES & "</OPTION>" 										
									rstQuery.MoveNext  
                                	LOOP
                                	rstQuery.CLOSE
                                	SET rstQuery = NOTHING																									
		
									%>
									

					</SELECT>
          </b></P></td>
         </tr>

		 <tr>
          <td class="TDS" width="24%" height="20" ><p CLASS="P1" align="left">
			Fecha Desde:</p></td>
          <td class="TDD" width="73%" height="20" valign="middle" ><p CLASS="P1"><b>
          	<INPUT NAME="FDE" size=8 maxlength=10  value="<%=wFEC%>" readonly ><A href="javascript:cal1.popup();">
<IMG height=16 alt="Haga Click Aqui para Seleccionar Fecha" src  ="img/cal.gif" width=16 border=0 ></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

Hasta:  
          	<INPUT NAME="FHA" size=8 maxlength=10  value="<%=wFEC%>" readonly ><A href="javascript:cal2.popup();">
<IMG height=16 alt="Haga Click Aqui para Seleccionar Fecha" src  ="img/cal.gif" width=16 border=0 ></a>
   
          

          
          
          </b></P></td>
         </tr>

		 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center">
          				<INPUT type='button' value='Ver' id=btVer name=btVer OnClick='Javascript:enviar()'>
                        <INPUT type='button' value='Regresar' id=button1 name=button1 OnClick='Javascript:history.back()'>        
       
          </td>
         </tr>

	</table>
	</td>	
	</TR>	
	</table>
	
	<p>&nbsp;</td>
</tr> 
<td>
</td>
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

<script language="JavaScript">
<!-- // create calendar object(s) just after form tag closed
	 // specify form element as the only parameter (document.forms['formname'].elements['inputname']);
	 // note: you can have as many calendar objects as you need for your application
	var cal1 = new calendar1(document.forms['FrmBuscar'].elements['FDE']);
	cal1.year_scroll = true;
	cal1.time_comp = false;
	
	var cal2 = new calendar1(document.forms['FrmBuscar'].elements['FHA']);		
	cal2.year_scroll = true;
	cal2.time_comp = false;
			
//-->
</script>


</BODY>
</HTML>
