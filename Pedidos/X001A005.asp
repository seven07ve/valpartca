<%@ Language=VBScript %>
<% Response.Expires = 0 %>
<% Response.AddHeader "PRAGMA", "NO-CACHE" %>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<link rel="stylesheet" type="text/css" href="../X001Z900.css">
<base target="main">
<!--#include file="X001Z001.INC"--->
</head>


<%

	IF Session("glTipoUsuario") = "C" THEN
		wURL = "../ASPX/C001E004.aspx?CCL="& Session("glUsuario") & "&CLU=" & Session("glTipoUsuario") & "&PUS=" & Session("glUsuario")
	ELSE
		wURL = "X001Z202.asp?PAR=1"
	End If
 
%>

<body onload="window.status='<%=Request.ServerVariables("URL") & " ( Usuario: " & Session("glUsuarioNombre") & " )" %>'" scroll=yes topmargin="0" leftmargin="17" rightmargin="0" bottommargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>">
<div align="center">

<table border="0" height="100%" width="919" bgcolor="#FFFFFF" > <tr><td valign="top" >
     <div align="center">



     &nbsp;<table border="0" width="607" cellspacing="0" id="table5" align="center" >

        <tr>
		<td width="100%" >

 

<table cellspacing="0" cellpadding="0" width="605" bordercolor="<%=Request.Cookies("CAR")("Color1")%>" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" style="padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px;" id="table6" border="1">
	

  <tr>
    <td width="79%" bgcolor="white">
      <p align="center" style="margin-top: 3px; margin-bottom: 3px"><b>
		<font face="Tahoma" size="2">Sugerencias y Reclamos</font></b></p></td>
  </tr>

	<tr>
		<!--<td width="30%" style="border-style: none; border-width: medium" >

		 <table border="0" width="80%" align = center >
			<tr>
				<td>
				<td width="15%" align=center>
				<img alt border="0" src="images/PEDIDOS.gif" WIDTH="32" HEIGHT="32">
				</td>
				<td width="85%"><b>Ventas</b></td>
			</tr>
		</table>
		
		</td>-->
	<td width="79%" >

		<table border="0" cellpadding="0" bordercolorlight="#c0c0c0" bordercolordark="#c0c0c0" width="98%" id="table7">
			<tr>
				<td  align="center" width="12%"> 
				<p style="margin-top: 3px"> 
				</td>
				<td width="10%" align="center" > 
					<p style="margin-top: 3px"> 
					<img alt border="0" src="images/X002BV301.ICO" WIDTH="32" HEIGHT="32" onclick="window.open('<%=wURL%>', 'main');" style="CURSOR: pointer">
				</td>
				<td width="34%" align="left" valign="middle">
				<font face="Tahoma" size="2" onclick="window.open('<%=wURL%>', 'main');" style="CURSOR: pointer">
				<p style="margin-top: 3px">&nbsp;<b>Nuevo</b></font><b><font color="#FFFFFF" size="2"> 
				</font></b></td>
				<td  align="center" width="1%"> 
				<p style="margin-top: 3px"> 
				</td>

				<td width="8%" align="center" > 
				
					<p style="margin-top: 3px"> 
				
					<img alt border="0" src="images/X000ZV500B.ICO" WIDTH="32" HEIGHT="32" onclick="window.open('X001A104_S.asp?NOMTAB=X300BQ100', 'main');" style="CURSOR: pointer">
				</td>
				<td width="32%" align="left" valign="middle">
				<font face="Tahoma" size="2" onclick="window.open('X001A104_S.asp?NOMTAB=X300BQ100', 'main');" style="CURSOR: pointer">
				<p style="margin-top: 3px"><font size="2"><b>&nbsp;Pendientes</b></font>								
				</td>
			</tr>
			
			
			<!--
				<tr>
				<td  align="center" width="17%" colspan="6"> 
				<p style="margin-top: 8px; margin-bottom: 8px" >
				<font face="Tahoma" size="2" onclick="window.open('Modulo_de_Requerimientos.pdf', '_blank');" style="CURSOR: pointer">
				<font color="#FFFFFF" size="2"><b>Instructivo</b></font></font> 
				
				 </p> 
				</td>
				
			</tr>
-->
			<!--<tr>
				<td  align="center" width="12%"> 
				&nbsp;</td>
				<td width="10%" align="center" > 
				
					<img alt border="0" src="images/X000ZV500B.ICO" WIDTH="32" HEIGHT="32" onclick="window.open('X001A113_S.asp?NOMTAB=X300BQ100S&CTR=2', 'main');" style="CURSOR: pointer"></td>
				<td width="34%" align="left" valign="middle">
				<font face="Tahoma" size="2" onclick="window.open('X001A113_S.asp?NOMTAB=X300BQ100S&CTR=2', 'main');" style="CURSOR: pointer">
				<font size="2"><b>Pendientes</b></font>								
				
				<b>(Tipo Devoluci�n)</b></td>
				<td  align="center" width="1%"> 
				&nbsp;</td>

				<td width="8%" align="center" > 
				
					&nbsp;</td>
				<td width="32%" align="left" valign="middle">
				&nbsp;</td>
			</tr>-->
			
			
			</table></td>


	</tr>
</table>



		</td>
        </tr>
        
        
        <!--
        <tr>
		<td colspan=2 >
		<p class="PX" >Para mayor informaci�n contactenos a traves de 
		<A href="mailto:info@mipedido.com"> info@mipedido.com </a>
		</p>
		</td>
        </tr>
		-->
        
                
        </table>
	


		<p align=justify style="margin-top: 30px; margin-left:55px; margin-right:55px">
		&nbsp;</p>
	
		<a href="http://www.insystech.com.ve" target="_blank">
<p align=center style="margin-top: 55px"><span style="text-decoration: none">
<!--#include file="copyright.inc"-->
</span></p>
</a>

    	<p>&nbsp;</div>
	
    </td>
	
</tr>
</table>
</div>

</body>
</html>