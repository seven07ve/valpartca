<%@ Language=VBScript %>
<% 
Response.Expires = -1 
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"
%>
<!--#include file="X001Z001.INC"-->
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 6.0">

<link rel=stylesheet type="text/css" href="X001Z900.CSS">


<SCRIPT LANGUAGE="javascript">

function Eliminar() {
	
	document.frmGral.btnEliminar.disabled = true;
	document.frmGral.btnRegresar.disabled = true;
 
	if (confirm("¿Esta Seguro que Desea Eliminar Este Backorder?")){
		document.frmGral.submit(); 
		}else{
		document.frmGral.btnEliminar.disabled = false;
		document.frmGral.btnRegresar.disabled = false;
	}
}
//document.oncontextmenu = function(){return false}
</script>


</HEAD>

	<%
	
	wTIT = "Eliminar Backorder" 
	wCPR = REPLACE(TRIM(Request.QueryString("CPR")),"%20", " ")
	wCCL = TRIM(Request.QueryString("CCL"))
	wNPE = TRIM(Request.QueryString("NPE"))
	wERROR = TRIM(Request.QueryString("ERROR"))
	
	wB300102CCI = Session("glCiaInternet")
	wB300102CIA = Session("glCia")

	
			
	strCnn	= Application("XDTA300_ConnectionString")
	
	SQL = "SELECT B201102BCK "
	SQL = SQL & " FROM X201BF102_3 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " B201102CCI ='" & wB300102CCI & "' AND "
	SQL = SQL & " B201102CIA ='" & wB300102CIA & "' AND "
	SQL = SQL & " B201102CCL ='" & wCCL & "' AND "
	SQL = SQL & " B201102NPE ='" & wNPE & "' AND "
	SQL = SQL & " B201102CPR ='" & wCPR & "' "	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	'RESPONSE.WRITE SQL
	wEliminado = "N"
	IF NOT rstQuery.EOF THEN		
		wEliminado = "S"
		Response.write "<script language=""javascript"">alert('Este Backorders ya fue Eliminado');</script>"
	END IF 
	rstQuery.CLOSE
	SET rstQuery = NOTHING
	
	SQL = "SELECT B300102BCK, B300102FEC, B300102CVE "
	SQL = SQL & " FROM X300BF102 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " B300102CCI ='" & wB300102CCI & "' AND "
	SQL = SQL & " B300102CIA ='" & wB300102CIA & "' AND "
	SQL = SQL & " B300102CCL ='" & wCCL & "' AND "
	SQL = SQL & " B300102NPE ='" & wNPE & "' AND "
	SQL = SQL & " B300102CPR ='" & wCPR & "' "	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	'RESPONSE.WRITE SQL
	IF NOT rstQuery.EOF THEN		
		wB300102FEC = trim(rstQuery.Fields("B300102FEC"))			
		wB300102BCK = trim(rstQuery.Fields("B300102BCK"))			
		wB300102CVE = trim(rstQuery.Fields("B300102CVE"))	
		wFEC = wB300102FEC 
	END IF 
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	
	SQL = "SELECT A300002RSO "
	SQL = SQL & " FROM X300AF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " A300002CCI ='" & wB300102CCI & "' AND "
	SQL = SQL & " A300002CIA ='" & wB300102CIA & "' AND "
	SQL = SQL & " A300002CCL ='" & wCCL & "' "	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	'RESPONSE.WRITE SQL
	IF NOT rstQuery.EOF THEN		
		wA300002RSO = trim(rstQuery.Fields("A300002RSO"))			
	END IF 
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	SQL = "SELECT A300003DEL, A300003MAR "
	SQL = SQL & " FROM X300AF003 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " A300003CCI ='" & wB300102CCI & "' AND "
	SQL = SQL & " A300003CIA ='" & wB300102CIA & "' AND "
	SQL = SQL & " A300003CPR ='" & wCPR & "' "	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	'RESPONSE.WRITE SQL
	IF NOT rstQuery.EOF THEN		
		wA300003DEL = trim(rstQuery.Fields("A300003DEL"))			
		wA300003MAR = trim(rstQuery.Fields("A300003MAR"))			
	END IF 
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	wB300102FEC = Right("00" & day(wB300102FEC), 2) & "-" & Right("00" & month(wB300102FEC), 2) & "-" & year(wB300102FEC)
	
		
	
	wURL = "X001X120_AS.ASP"
	%>

	<body   align="center" style="text-align: center" topmargin="0" leftmargin="17" rightmargin="0" bgcolor="#FFEBD6" scroll="yes" >
	
	
	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURL%>" >


   <table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" align="center" height="100%"   >
<tr>
<td valign="top"  >

<table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF">




    <p style="margin-top: 0px">&nbsp;</p>

    <table align="center" BORDER="1" WIDTH="700" cellspacing="0" cellpadding="0"  bordercolor="#0066CC" bgcolor="#FE9900" style="border-style: inset; border-width: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" cellpadding="4"   >
		 <TR>
		 <td CLASS="TDT" colspan=3 height="30" ><%= wTIT %></td>		  
		 </TR>	

			<tr>
          <td class="TDS" width="25%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Cliente:</p></td>
          <td class="TDD" width="71%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wCCL & " - " & wA300002RSO%></p> 
          </td>
         </tr>
		 <tr>
          <td class="TDS" width="25%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Pedido:</p></td>
          <td class="TDD" width="71%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wNPE%></P></td>
         </tr>
		 
		 <tr>
          <td class="TDS" width="25%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Producto:</p></td>
          <td class="TDD" width="71%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wCPR & " - " & wA300003DEL %></p> 
          
          </td>
         </tr>        
		
         <tr>
          <td class="TDS" width="25%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Marca:</p></td>
          <td class="TDD" width="71%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%= wA300003MAR %></p> 
          
          </td>
         </tr>        

         <tr>
          <td class="TDS" width="25%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Fecha:</p></td>
          <td class="TDD" width="71%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wB300102FEC%></p> 
          </td>
         </tr>
		
         <tr>
          <td class="TDS" width="25%" >
			<p CLASS="P1" align="left" style="margin-top: 0">Cantidad:</p></td>
          <td class="TDD" width="71%" height="23px">
			<p CLASS="P1" style="margin-top: 0"><%=wB300102BCK%></p> 
          </td>
         </tr>
         
        	

		 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center">
          
          <INPUT TYPE="Hidden" NAME="CPR" value="<%=wCPR%>">
		  <INPUT TYPE="Hidden" NAME="CCL" value="<%=wCCL%>">
		  <INPUT TYPE="Hidden" NAME="NPE" value="<%=wNPE%>">
		  <INPUT TYPE="Hidden" NAME="CVE" value="<%=wB300102CVE%>">
		  <INPUT TYPE="Hidden" NAME="BCK" value="<%=wB300102BCK%>">
		  <INPUT TYPE="Hidden" NAME="FEC" value="<%=wFEC%>">
	
		<% IF wEliminado = "N" THEN %>
        <input type="button" name="btnEliminar"  value="Eliminar" onclick="Javascript:Eliminar();" >  
        <% END IF  %>
    	 <input type="button" name="btnRegresar" value="Regresar" onclick="Javascript:history.back()" >  


         </td>
         </tr>

	</table>
	</td>	
	</TR>	
	</table>

	<p>&nbsp;</td>
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

   
   </FORM>


</BODY>
</HTML>