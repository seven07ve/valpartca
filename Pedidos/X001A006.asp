<%@ Language=VBScript %>
<% Response.Expires = 0 %>
<% Response.AddHeader "PRAGMA", "NO-CACHE" %>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<link rel="stylesheet" type="text/css" href="../X001Z900.css">
<base target="main">
<!--#include file="X001Z001.INC"-->
<style type="text/css">
.auto-style1 {
	border-width: 0;
}
.auto-style2 {
	border-style: solid;
	border-width: 0;
}
</style>
</head>


<%

'	IF Session("glTipoUsuario") = "C" THEN
'		wURL = "X001A114.ASP?CLA001=" & Session("glUsuario")
		'wURL = "../ASPX/C001E004.aspx?CCL="& Session("glUsuario") & "&CLU=" & Session("glTipoUsuario") & "&PUS=" & Session("glUsuario")
'		ELSE
		wURL = "X001Z204.ASP?URL=1"
'	END IF 
%>

<body onload="window.status='<%=Request.ServerVariables("URL") & " ( Usuario: " & Session("glUsuarioNombre") & " )" %>'" scroll=yes topmargin="0" leftmargin="17" rightmargin="0" bottommargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>" >
<div align="center">

<table border="0" height="100%" width="919" bgcolor="#FFFFFF" > <tr><td valign="top" >
     <div align="center">



     	<br>&nbsp;<table border="0" width="607" cellspacing="0" id="table5" align="center" >

        <tr>
		<td width="100%" >

 

<table cellspacing="0" cellpadding="0" width="605" bordercolor="#FFFFFF" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" style="padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px;" id="table6" border="1">
	

  <tr>
    <td width="79%" bgcolor="white" height="30">
      <p align="center" style="margin-top: 3px; margin-bottom: 3px"><b>
		<font face="Tahoma" size="2">SALES PRO</font></b></p></td>
  </tr>

	<tr>
	
	<td width="79%" >

		<table cellpadding="0" bordercolorlight="#c0c0c0" bordercolordark="#c0c0c0" width="100%" id="table7" class="auto-style1">
			<tr>
				<td  align="center" width="12%" style="height: 73px"> 
				&nbsp;</td>
				<td width="10%" align="center" style="height: 73px" > 
					<p style="margin-top: 3px"> 
					<img alt border="0" src="images/X002BV301.ICO" WIDTH="32" HEIGHT="32" onclick="window.open('<%=wURL%>', 'main');" style="CURSOR: pointer">
				</td>
				<td width="34%" align="left" style="height: 73" class="auto-style2"  valign="middle">
				<font face="Tahoma" size="2" onclick="window.open('<%=wURL%>', 'main');" style="CURSOR: pointer">
				<p style="margin-top: 3px">&nbsp;<b>Prospectos</b></font><b><font color="#FFFFFF" size="2"> 
				</font></b></td>
				<td  align="center" width="1%" style="height: 73px"> 
				<p style="margin-top: 3px"> 
				</td>

				<td width="8%" align="center" style="height: 73px" > 
				
					<p style="margin-top: 3px"> 
				
					<img alt border="0" src="images/X000ZV500B.ICO" WIDTH="32" HEIGHT="32" onclick="window.open('X001P001.asp', 'main');" style="CURSOR: pointer">
				</td>
				<td width="32%" align="left" valign="middle" style="height: 73px">
				<font face="Tahoma" size="2" onclick="window.open('X001P001.asp', 'main');" style="CURSOR: pointer">
				<p style="margin-top: 3px"><b>Oportunidades</b></p> </font>							
				</td>
			</tr>
			
			<%IF Session("glTipoUsuario") <> "V" THEN%>
			<tr>
			<td width="79%" bgcolor="white" height="30" colspan="6">
      <p align="center" style="margin-top: 3px; margin-bottom: 3px"><b>
		<font face="Tahoma" size="2">Informes</font></b></p></td>

			
			</tr>
			
			<tr>
				<td  align="center" width="12%"> 
				&nbsp;</td>
				<td width="10%" align="center" > 
				
					<img alt border="0" src="images/X000ZV500B.ICO" WIDTH="32" HEIGHT="32" onclick="window.open('X001P200.asp?PAR=4', 'main');" style="CURSOR: pointer"></td>
				<td width="34%" align="left" valign="middle">
				<font face="Tahoma" size="2" onclick="window.open('X001P200.asp?PAR=4', 'main');" style="CURSOR: pointer">
				<b>Consolidado</b></font>								
				</td>
				<td  align="center" width="1%"> 
				&nbsp;</td>

				<td width="8%" align="center" > 
					<img alt border="0" src="images/X000ZV500B.ICO" WIDTH="32" HEIGHT="32" onclick="window.open('X001P200.asp?PAR=1', 'main');" style="CURSOR: pointer">
					</td>
				<td width="32%" align="left" valign="middle">
				<font face="Tahoma" size="2" onclick="window.open('X001P200.asp?PAR=1', 'main');" style="CURSOR: pointer">
				<b>Fuerza de Ventas</b></font>								
				</td>
			</tr>
			
			
			<tr>
				<td  align="center" width="12%"> 
				&nbsp;</td>
				<td width="10%" align="center" > 
				
					<img alt border="0" src="images/X000ZV500B.ICO" WIDTH="32" HEIGHT="32" onclick="window.open('X001P200.asp?PAR=2', 'main');" style="CURSOR: pointer"></td>
				<td width="34%" align="left" valign="middle">
				<font face="Tahoma" size="2" onclick="window.open('X001P200.asp?PAR=2', 'main');" style="CURSOR: pointer">
				<b>Oportunidades Descalificadas</b></font>								
				</td>
				<td  align="center" width="1%"> 
				&nbsp;</td>

				<td width="8%" align="center" > 
					<img alt border="0" src="images/X000ZV500B.ICO" WIDTH="32" HEIGHT="32" onclick="window.open('X001P200.asp?PAR=3', 'main');" style="CURSOR: pointer">
					</td>
				<td width="32%" align="left" valign="middle">
				<font face="Tahoma" size="2" onclick="window.open('X001P200.asp?PAR=3', 'main');" style="CURSOR: pointer">
				<b>Razones de Insatisfacción</b></font>								
				</td>
			</tr>
			<%END IF %>
			
			</table></td>


	</tr>
</table>



		</td>
        </tr>
        
        
        <!--
        <tr>
		<td colspan=2 >
		<p class="PX" >Para mayor información contactenos a traves de 
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