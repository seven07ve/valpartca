<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 6.0">

<link rel=stylesheet type="text/css" href="X001Z900.CSS">


</HEAD>

<body  onload="window.status='<%=Request.ServerVariables("URL")%>'">

	<%
	
	wTIT = "Preparar Transferencia de Información" 

	wCCI = Session("glCiaInternet") 
	wCIA = Session("glCia") 


	wURL = "X001W003S"
	wURLP = wURL & ".ASP"

	%>
	<!--#include file="X001Y300.PRC"-->	

	<FORM ACTION="<%=wURLP%>" METHOD="post" ID=<%=wURL%> NAME="<%=wURL%>">

    <table BORDER="1" WIDTH="85%" cellspacing="0" cellpadding="0" align="center">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" >
		 <TR>
		 <td CLASS="TDT" colspan=3><%= wTIT %></td>		  
		 </TR>	

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Vendedor:</p></td>
          <td class="TDD" width="80%" ><p CLASS="P1">
          <%=CargaVendedores%>
          </P>
          </td>
         </tr>
		 

<!--
		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">% Impuesto:</p></td>
          <td class="TDD" width="80%" ><INPUT NAME="PIM" size=20 value="<%=wPIM%>"></td>
         </tr>
-->

		 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center">
          <INPUT TYPE="submit" NAME="send" VALUE="Preparar"> 
          <INPUT type='button' value='Regresar' id=button1 name=button1 OnClick='javascript:history.back()'>
          </td>
         </tr>

	</table>
	</td>	
	</TR>	
	</table>
</FORM>
</BODY>
</HTML>
