


<%@ Language=VBScript %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<link rel="stylesheet" type="text/css" href="../X001Z900.css">
<!--#include file="X001Z001.INC"-->
</head>

<script language="javascript" >

function OpenBrWindow(theURL,winName,features, myWidth, myHeight, isCenter) { //v3.0
	if(window.screen)if(isCenter)if(isCenter=="true"){
		var myLeft = (screen.width-myWidth)/2;
		var myTop = (screen.height-myHeight)/2;
		features+=(features!='')?',':'';
		features+=',left='+myLeft+',top='+myTop;
	}
	window.open(theURL,winName,features+((features!='')?',':'')+'width='+myWidth+',height='+myHeight);
}

function OpenChat() {

	//window.open('http://www.carvica.com.ve/chat/chat.asp','_blank', 'menubar=0,resizable=0,location=0,status=0,scrollbars=0,directories=0,width=700,height=470') 
	OpenBrWindow('http://www.carvica.com.ve/chat/chat.asp','chat','menubar=0,resizable=0,location=0,status=0,scrollbars=0,directories=0,width=700,height=470','700','470','true')
}

function OpenCamaras() {

	//window.open('http://www.carvica.com.ve/chat/chat.asp','_blank', 'menubar=0,resizable=0,location=0,status=0,scrollbars=0,directories=0,width=700,height=470') 
	OpenBrWindow('camaras.asp','camaras','menubar=0,resizable=0,location=0,status=0,scrollbars=0,directories=0,width=700,height=470','700','700','true')
}


</script> 


<body onload="window.status='<%=Request.ServerVariables("URL") & " ( Usuario: " & Session("glUsuarioNombre") & " )" %>'" scroll=auto topmargin="0" leftmargin="18"  bgcolor="#FFEBD6" rightmargin="0">
     	
<%

	wTC = "33%"

	wURL = "javascript:window.open('X001X121_S.asp?NOMTAB=X300AQ002_002','main')"
	wURL2 = "javascript:window.open('X001X100_S.asp?NOMTAB=X300AQ003','main')"	
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
	
	strCnn	= Application("XDTA300_ConnectionString")

	SQL = "SELECT " 
	SQL = SQL & " Count(*) Usuarios  "
	SQL = SQL & " FROM X300ZF001 "
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300001CCI = '" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " Z300001STS = '1' "			
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	If NOT rstQuery.EOF Then	
		wUsuarios = cdbl(rstQuery.Fields("Usuarios"))
	End If
	rstQuery.CLOSE
	SET rstQuery = NOTHING	

	
	wUsuariosConectados = dOnlineUsers.Count
    
    IF wUsuariosConectados > wUsuarios Then
    	wUsuariosConectados = wUsuarios
	End if 
	
	Session("glTotalUsuarios") = wUsuarios

%>


    <table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" align="center" height="100%" >
<tr>
<td valign="top"  >

<div align="center">

<table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" cellspacing="0" height="100%" >
<tr>
<td bgcolor="#FFFFFF" valign="top"  >



<p style="margin-top: 30px; margin-bottom: 30px">




<table  align="center"  cellspacing="0" cellpadding="0" width="605" bordercolor="#0066CC" bgcolor="#FE9900" style="padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px;" id="table5" border="1">
	  <tr>
    <td width="91%" bgcolor="white">
      <p align="center" style="margin-top: 3px; margin-bottom: 3px"><b><font face="Tahoma" size="2">Consultas</font></b></p></td>
  </tr>
	<tr>
	<td align="center" >

       <table border="0" cellpadding="0" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" width="100%" id="table6">
        <tr>
       
		 
           
	  	  
     		
          <td align="right" > 			
			<img alt border="0" src="images/Clientes.ico" WIDTH="32" HEIGHT="32" onclick="<%=wURL%>" style="CURSOR: pointer">
		  </td>

		  <td width="191" align="left" valign="middle">
			<font face="Tahoma" size="2" onclick="<%=wURL%>" style="CURSOR: pointer">Clientes				
		  </td>
 		
		<td  align="right" width="79" > 
			
			<img alt border="0" src="images/Clientes.ico" WIDTH="32" HEIGHT="32" onclick="<%=wURL11%>" style="CURSOR: pointer"></td>
		    
		  <td align="left" valign="middle" width="214">
	
			<font face="Tahoma" size="2" onclick="<%=wURL11%>" style="CURSOR: pointer">
			Clientes Registrados en la Web
		
		  	</td>     	        
      
        </tr>
      </table>
	  
       <table border="0" cellpadding="0" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" width="100%" id="table7">
          
        
		<tr>
		
		 <td  width="17%" align="right" > 
			<img alt border="0" src="images/Item2.ico"  onclick="<%=wURL2%>" style="CURSOR: pointer">
		  </td>
		  <td align="left" valign="middle" width="33%" >
			<font face="Tahoma" size="2" onclick="<%=wURL2%>" style="CURSOR: pointer">Productos
		  </td>    
		  
		  
            <td width="13%" align="right" > 
			<img alt border="0" src="images/X002YV003.ico"  onclick="<%=wURL10%>" style="CURSOR: pointer" width="32" height="32"></td>

		  <td width="36%" align="left" valign="middle">
			<font face="Tahoma" size="2" onclick="<%=wURL10%>" style="CURSOR: pointer">Lista de Precios</font></td>
  		 

          
        </tr>
            </table>
      
      <hr>
      
       <table border="0" cellpadding="0" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" width="100%" id="table8">
        <tr>
          

          <td width="17%" align="right" height="40" > 
			<img alt border="0" src="images/X002AV013.ICO" WIDTH="32" HEIGHT="32" onclick="<%=wURL5%>" style="CURSOR: pointer">
		  </td>

		  <td width="32%" align="left" valign="middle" height="40">
			<font face="Tahoma" size="2" onclick="<%=wURL5%>" style="CURSOR: pointer">Ventas por Vendedor</font></td>
  		 

	        
          <td  align="right" height="40" > 
			<img alt border="0" src="images/X002AV013.ICO" WIDTH="32" HEIGHT="32" onclick="<%=wURL6%>" style="CURSOR: pointer">
		  </td>
		  <td align="left" valign="middle" width="212" height="40">
			<font face="Tahoma" size="2" onclick="<%=wURL6%>" style="CURSOR: pointer">
			Ventas por Familia</font></td>     
	     
        </tr>
        <tr>
          

          <td width="17%" align="right" height="41" > 
			<img alt border="0" src="images/X002AV013.ICO" WIDTH="32" HEIGHT="32" onclick="<%=wURL7%>" style="CURSOR: pointer"></td>

		  <td width="32%" align="left" valign="middle" height="41">
			<font face="Tahoma" size="2" onclick="<%=wURL7%>" style="CURSOR: pointer"> 
			Ventas por Zona</font></td>
  		 

          <td  align="right" height="41" > 
			<img alt border="0" src="images/X002AV013.ICO" WIDTH="32" HEIGHT="32" onclick="<%=wURL8%>" style="CURSOR: pointer"></td>
		  <td align="left" valign="middle" width="212" height="41">
			<font face="Tahoma" size="2" onclick="<%=wURL8%>" style="CURSOR: pointer"> Ventas Totales</font></td>     
        </tr>

   	   </table>
<hr>
       <table border="0" cellpadding="0" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" width="100%" id="table8">
        <tr>

          <td width="17%" align="right" height="40" > 
			<img alt border="0" src="images/X000ZV500B.ICO" WIDTH="32" HEIGHT="32" onclick="<%=wURL5%>" style="CURSOR: pointer">
		  </td>

		  <td width="32%" align="left" valign="middle" height="40">
			<font face="Tahoma" size="2" onclick="javascript:window.open('X001A100_S.asp?NOMTAB=X300BQ100H','main')" style="CURSOR: pointer">
			&nbsp;Pedidos Procesados <b>Internet</b></td>
  		 

	        
          <td  align="right" height="40" > 
			<img alt border="0" src="images/X000ZV500B.ICO" WIDTH="32" HEIGHT="32" onclick="<%=wURL6%>" style="CURSOR: pointer">
		  </td>
		  <td align="left" valign="middle" width="211" height="40">
			<font face="Tahoma" size="2" onclick="javascript:window.open('X001A100M_S.asp','main')" style="CURSOR: pointer">
			&nbsp;Pedidos Procesados <b>Móvil</b></font></td>     
	     
        </tr>
   	   
   	   
   	   <tr>
   	   
   	   <td width="17%" align="center" > 
				
					<img alt border="0" src="images/chat.png" onclick="javascript:OpenChat()" style="CURSOR: pointer" align="right"></td>
				<td width="32%" align="left" valign="middle">
				
				<font face="Tahoma" size="2" onclick="javascript:OpenChat()" style="CURSOR: pointer">&nbsp;Chat 
				Carvica</td>
				
		 <td  align="right" height="40" > 
					<img alt border="0" src="images/camara.gif" onclick="javascript:OpenCamaras()" style="CURSOR: pointer" align="right">
		  </td>
		  <td align="left" valign="middle" width="211" height="40">
		  <font face="Tahoma" size="2" onclick="javascript:OpenCamaras()" style="CURSOR: pointer">&nbsp;Cámaras 
				Carvica</td>

			</td>     
		

   	   </tr>
   	   </table> 
   	         
	</td>				
  </tr>
</table> 

<p style="margin-top: 10px; margin-bottom: 1px">
<table align="center" >
<tr>
		<td>
		<img src="images/Usuario.jpg" >
		</td>
      <td valign="center"  >
      <font face="Tahoma" style="font-size: 9pt; font-weight:700" >Usuarios 
		Conectados <%= wUsuariosConectados %> de <%= wUsuarios%> </font> 
      </td>
      </tr>
      
      
</table>
<p align="center" style="margin-top: 0; margin-bottom: 0"><font color="#0000FF">

<% IF Session("glTipoUsuario") <> "C" THEN %>
 <font face="Tahoma" onclick="javascript:window.open('X001A003.asp','main')" style="CURSOR: pointer;font-size: 9pt; font-weight:700" >Pulse Aquí para ver Usuarios Conectados  </font> 

<% END IF %>

</font> </p> </p> 

        
        
      </td>
      </tr>
      
      
</table>
  


	
	
</body>
</html>