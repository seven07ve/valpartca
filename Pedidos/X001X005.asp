<%@ Language=VBScript %>
<%

Response.Expires = -1
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"

%>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<link rel="stylesheet" type="text/css" href="../X001Z900.css">
<!--#include file="X001Z001.INC"-->
</head>
<style>

html{overflow-y:scroll} 

</style>
<script language="javascript" >


function OpenChat() {

	//window.open('http://www.carvica.com.ve/chat/chat.asp','_blank', 'menubar=0,resizable=0,location=0,status=0,scrollbars=0,directories=0,width=700,height=470') 
	OpenBrWindow('http://www.carvica.com.ve/chat/chat.asp','chat','menubar=0,resizable=0,location=0,status=0,scrollbars=0,directories=0,width=700,height=470','700','470','true')
}

</script> 


<body onload="window.status='<%=Request.ServerVariables("URL") & " ( Usuario: " & Session("glUsuarioNombre") & " )" %>'" scroll=auto topmargin="0" leftmargin="18"  bgcolor="<%=Request.Cookies("CAR")("Color1")%>" rightmargin="0">
     	
<%

	wTC = "33%"

	wURL = "javascript:window.open('X001X121_S.asp?NOMTAB=X300AQ002_002','main')"
	wURL2 = "javascript:window.open('X001X100_S.asp?NOMTAB=X300AQ003','main')"	
	wURL13 = "javascript:window.open('X001X100_S.asp?NOMTAB=X300AQ003&PARCON=1','main')"	
	wURL9 = "javascript:window.open('X001X115.asp','main')"	
	wURL4 = "javascript:window.open('X001X120_S.asp?NOMTAB=X300BQ102','main')"	
	wURL5 = "window.open('X001X116.asp','DVENDEDOR','toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, directories=no, status=no')"	
	wURL6 = "window.open('X001X117.asp','VFAMILIA','toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, directories=no, status=no')"	
	wURL7 = "window.open('X001X118.asp','VZONA','toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, directories=no, status=no')"	
	wURL8 = "window.open('X001X119.asp','VTOTALES','toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, directories=no, status=no')"	
	IF Session("glTipoUsuario") <> "C" AND Session("glTipoUsuario") <> "V" THEN
		wURL3 = "javascript:window.open('X001X100_S.asp?NOMTAB=X300ZF001','main')"
	END IF 
	wURL10 = "javascript:window.open('X001X124.asp','main')"
	wURL11 = "javascript:window.open('X001X126C.asp','main')"
	wURL12 = "window.open('X001X128_S.asp?NOMTAB=X300CQ204','main','toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, directories=no, status=no')" 
	wURL15 = "javascript:window.open('X001X129C.asp','main')"
	wURL14 = "javascript:window.open('X001X130_S.asp?NOMTAB=X300BQ200','main')"
	wURL16 = "javascript:window.open('X001X150.asp','main')"
	wURL17 = "javascript:window.open('X001X161.asp','main')"
	'IF Session("glTipoUsuario") = "A" OR Session("glTipoUsuario") = "G" THEN  
		wURL18 = "javascript:window.open('X001X132_S.asp?NOMTAB=X300BQ200','main')"
	'ELSE
	'	wURL18 = "javascript:alert('En Mantenimiento, por duplicidad de información. \n\n Disculpes las Molestias.');"
	'END IF 
%>

<div align="center">

<div align="center">

<table width="919" bgcolor="#FFFFFF" border="0"  cellpadding="0" cellspacing="0" height="100%"  >
<tr>
<td valign="top" align="center" >


<table width="919" bgcolor="#FFFFFF" border="0"  cellpadding="0" cellspacing="0" height="100%" >
<tr>
<td bgcolor="#FFFFFF" valign="top">



<p style="margin-top: 30px; margin-bottom: 30px">




<table  align="center"  cellspacing="0" cellpadding="0" width="650" bordercolor="<%=Request.Cookies("CAR")("Color1")%>" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" style="padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px;" id="table5" border="1">
	  <tr>
    <td width="91%" bgcolor="white">
      <p align="center" style="margin-top: 3px; margin-bottom: 3px"><b><font face="Tahoma" size="2">Consultas</font></b></p></td>
  </tr>
	<tr>
	<td width="91%" align="center" >

       <table border="0" cellpadding="0" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" width="600" id="table6">
        <tr>
       
		 
            <td align="right" style="width: 28%" > 
			<img alt border="0" src="images/Item2.ico"  onclick="<%=wURL2%>" style="CURSOR: pointer">
		  </td>
		  <td align="left" valign="middle" width="35%" >
			<font face="Tahoma" size="2" onclick="<%=wURL2%>" style="CURSOR: pointer">Productos
		  </td>    
	
        
      </table>
      

		<p>
     
   	 
       </p>
	   <p>
     
   	 
       </p>
   	 
	</td>				
  </tr>
</table>

<% IF Session("glEstatusUsuario") = "2" THEN %>
<br>
<br>
<table border="0" align="center" width="80%" >
	<tr><td align="center"  >
	<img src="images/alerta.gif" >  
	</td>
	<td width="546">
	<font face="Tahoma" size="2"><b>ESTIMADO USUARIO, SU ACCESO HA SIDO LIMITADO, SOLO 
	PODRÁ REALIZAR CONSULTAS DE PRODUCTOS, BACKORDERS , EDO DE CUENTA, FACTURAS 
	EMITIDAS EN LOS ÚLTIMOS 30 DÍAS Y REALIZAR PAGOS DE FACTURAS VENCIDAS. </b></font>
	</td> 
	</tr> 
</table>
<br>
<br>
<% END IF %>


<!--

<tr>
<td>
<img src="../images/index/bottom.jpg" width="790" height="15" /></td>
</tr> -->
</p> 

</td>

        </tr>
        
        
        
        
               </table>
               
               
    

    </div>

    </td>				
  </tr>
</table>
</div>
</p>
	</div>
</body>
</html>