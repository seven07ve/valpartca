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
	
	SQL = "SELECT COUNT(*) AS WCUENTA FROM X300ZF001 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300001CCI = '" & wCCI & "' AND "
	SQL = SQL & " Z300001CIA = '" & wCIA & "' AND "		
	SQL = SQL & " Z300001CLU = 'C' "		
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	If NOT rstQuery.EOF then
		wCLI = CDBL(rstQuery.Fields("WCUENTA"))			
	End if
	rstQuery.CLOSE
	SET rstQuery = NOTHING		

	wTIT = "Visitas Registradas en la Web" 
	wTIT2 = "Total Clientes Registrados en la Web" 
	
	wFEC = Right("0" & day(date),2) & "-" &  Right("0" & month(date),2) & "-" & year(date)

		
	%>

		<body bgcolor="<%=Request.Cookies("CAR")("Color1")%>" leftmargin="18" rightmargin="0" topmargin="0"  >
<FORM NAME="FrmBuscar" METHOD="post" ACTION="X001X129.asp" target="_blank" >	 

    <div align="center">
    
    
       <table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" cellspacing="0" align="center"  height="100%">
<tr>
<td valign="top"  > 

<table width="919" bgcolor="#FFFFFF" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF">



    &nbsp;
    
    <table BORDER="1" WIDTH="500" align="center" cellspacing="0" cellpadding="0"  bordercolor="#ffffff" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" style="border-style: inset; border-width: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" >
		 <TR>
		 <td CLASS="TDT" colspan=2 height="29"><%= wTIT2 %></td>		  
		 </TR>	
		 
		 <tr>
          <td class="TDS" width="24%" height="20" ><p CLASS="P1" align="left">
			Clientes:</p></td>
          <td class="TDD" width="73%" height="20" ><p CLASS="P1"><b><%=wCLI%></b></P></td>
         </tr>


         </table> 
         </td>
         </tr>
         
         </table> 
&nbsp;

        <table BORDER="1" WIDTH="500" align="center"   cellspacing="0" cellpadding="0"  bordercolor="#ffffff" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" style="border-style: inset; border-width: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" >
		 <TR>
		 <td CLASS="TDT" colspan=2 height="29"><%= wTIT %></td>		  
		 </TR>	
		 
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
<!--<td>
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
