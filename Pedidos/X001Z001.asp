<%@ Language=VBScript %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">

<link rel=stylesheet type="text/css" href="X001Z900.css">
</head>
<body onload="window.status='<%=Request.ServerVariables("URL") & " ( Usuario: " & Session("glUsuarioNombre") & " )" %>'">

<%

	wTC = "33%"
%>

<table border="0" width="85%" align="center">
<tr><td>
<table border="1" width="100%" align="center">
  <tr>
    <td width="50%" colspan="2" bgcolor="#ffffcc">
      <p align="center"><font face="Comic Sans MS" size="3">Información General del Sistema</font></p></td>
  </tr>
</table>
</td></tr>
<tr><td><p>&nbsp;</p></td></tr>
<tr><td>









</table>
</td></tr>
</table>

<table border="0" cellspacing="0" cellpadding="0" width="85%" align = center bgcolor="#336699">
	<tr>
	<td width="30%" >
		<table border="0" width="100%" align = center >
			<tr>
			<td width="15%" align=center>
			<img alt border="0" src="images/informacion.gif" WIDTH="32" HEIGHT="32">    
			</td>
			<td width="85%"><font color="#FFFF00"><b>Información</b></font></td>
			</tr>
		</table>
	</td>		
	<td width="70%">

       <table border="0" cellpadding="0" bordercolorlight="#c0c0c0" bordercolordark="#c0c0c0" width="98%">
        <tr>
          <td width="<%=wTC%>" bgcolor="#ffffcc">
          <p align="center" class="PD"><a href="X001Z999.ASP" >Mi cuenta</a></p>
          </td>
          <td width="<%=wTC%>" bgcolor="#ffffcc">
          <p align="center" class="PD"><a href="X001Z999.ASP" >Preguntas</a></p>
          </td>
          <td width="<%=wTC%>" bgcolor="#ffffcc">
          <p align="center" class="PD"><a href="X001Z999.ASP" >Manuales</a></p>
          </td>
          <td width="<%=wTC%>">&nbsp;</td>          

        </tr>
      </table>
	</td>				
  </tr>



	<tr>
	<td width="30%">
		<table border="0" width="100%" align = center>
			<tr>
			<td width="15%" align=center>
			<img alt border="0" src="images/logocata.gif" WIDTH="32" HEIGHT="32">  
			</td>
			<td width="85%"><font color="#FFFF00"><b>Sistema</b></font></td>
			</tr>
		</table>
	</td>		
	<td width="70%">
      <table border="0" cellpadding="0" bordercolorlight="#c0c0c0" bordercolordark="#c0c0c0" width="98%">
        <tr>
          <td width="<%=wTC%>" bgcolor="#ffffcc">
          <p align="center" class="PD"><a href="X001Z999.ASP" >Acerca de</a></p>
          </td>
          <td width="<%=wTC%>">&nbsp;</td>
          <td width="<%=wTC%>">&nbsp;</td>
          <td width="<%=wTC%>">&nbsp;</td>                    
        </tr>
      </table>
	</td>				
  </tr>





</table>


<!--#include file="copyright.inc"-->	


</body>
</html>





