<%@ Language=VBScript %>
<% Response.Expires = 0 %>
<% Response.AddHeader "PRAGMA", "NO-CACHE" %>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<link rel="stylesheet" type="text/css" href="../X001Z900.css">
<base target="main">
<!--#include file="X001Z001.INC"-->
</head>


<%

	IF Session("glTipoUsuario") = "C" THEN
		wURL = "X001A114.ASP?CLA001=" & Session("glUsuario")
		'wURL = "../ASPX/C001E004.aspx?CCL="& Session("glUsuario") & "&CLU=" & Session("glTipoUsuario") & "&PUS=" & Session("glUsuario")
		ELSE
		wURL = "X001Z202.ASP?URL=1"
	END IF 
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
		<font face="Tahoma" size="2">PQR'S</font></b></p></td>
  </tr>

	<tr>
	
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
				
					<img alt border="0" src="images/X000ZV500B.ICO" WIDTH="32" HEIGHT="32" onclick="window.open('X001A113_S.asp?NOMTAB=X300BQ100&CTR=3', 'main');" style="CURSOR: pointer">
				</td>
				<td width="32%" align="left" valign="middle">
				<font face="Tahoma" size="2" onclick="window.open('X001A113_S.asp?NOMTAB=X300BQ100&CTR=0', 'main');" style="CURSOR: pointer">
				<p style="margin-top: 3px"><b>&nbsp;PQR'S No Procesadas</b></p> </font>							
				
				</td>
			</tr>
			
			
			<tr>
				<td  align="center" width="12%"> 
				&nbsp;</td>
				<td width="10%" align="center" > 
				
					<img alt border="0" src="images/X000ZV500B.ICO" WIDTH="32" HEIGHT="32" onclick="window.open('X001A113_S.asp?NOMTAB=X300BQ100S&CTR=2', 'main');" style="CURSOR: pointer"></td>
				<td width="34%" align="left" valign="middle">
				<font face="Tahoma" size="2" onclick="window.open('X001A113_S.asp?NOMTAB=X300BQ100S&CTR=1', 'main');" style="CURSOR: pointer">
				<b>PQR'S Procesadas</b></font>								
				</td>
				<td  align="center" width="1%"> 
				&nbsp;</td>

				<td width="8%" align="center" > 
				
					&nbsp;</td>
				<td width="32%" align="left" valign="middle">
				&nbsp;</td>
			</tr>
			
			
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