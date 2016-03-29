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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../X001Z900.css">
<!--#include file="X001Z001.INC"-->
</head>
<style>

html{overflow-y:scroll} 

.auto-style3 {
	border-style: solid;
	border-width: 0;
}

.auto-style4 {
	font-size: x-small;
}
.auto-style5 {
	font-size: x-small;
	font-weight: normal;
}

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
	wURL9 = "javascript:window.open('X001X116E.asp','main')"	
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
	'	wURL18 = "javascript:alert('En Mantenimiento, por duplicidad de informaci&#65533;n. \n\n Disculpes las Molestias.');"
	'END IF 
	
	wURLU = "X001X114.ASP?URLTIT=Clientes con Usuario Registrado&NOMTAB=X300ZF001"
	wURLU = wURLU & "&CAMC01=Z300001PUS&CAMC02=Z300001NUS"
	wURLU = wURLU & "&CAMC03=Z300001STS&CAMC04=Z300001PPC"
	wURLU = wURLU & "&CAMC05=&CAMC06=&CAMC07=&STSIMP=S"
	
	wURL19 = "window.open('" & wURLU & "','usuarios','toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, directories=no, status=no')"
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




<table  align="center"  cellspacing="0" cellpadding="0" width="650" bordercolor="<%=Request.Cookies("CAR")("Color1")%>" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" style="padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px;" id="table5" border="1">
	  <tr>
    <td width="91%" bgcolor="white" height="30">
      <p align="center" style="margin-top: 3px; margin-bottom: 3px"><b><font face="Tahoma" size="2">
	  Consultas</font></b></p></td>
  </tr>
	<tr>
	<td width="91%" align="center" >

       <table cellpadding="0" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" width="600" id="table6">
        <tr>
       
		 
            <td  width="14%" align="right"> 
			<img alt border="0" src="images/Item2.ico"  onclick="<%=wURL2%>" style="CURSOR: pointer">
		  </td>
		  <td align="left" style="width: 40%">
			<font face="Tahoma" size="2" onclick="<%=wURL2%>" style="CURSOR: pointer">
			Productos
		  </td>    
<% IF Session("glTipoUsuario") <> "D" THEN %>	
		<% IF Session("glTipoUsuario") = "C" OR Session("glTipoUsuario") = "CP" THEN %>		 
	  	<td align="right"> 
			<img alt border="0" src="images/X003AV004.ICO"  onclick="<%=wURL4%>" style="CURSOR: pointer" width="32" height="32">
		  </td>
		  <td align="left" width="250">
			<font face="Tahoma" size="2" onclick="<%=wURL4%>"  style="CURSOR: pointer">
			BackOrders</font></td> 
		<% END IF  %>     	  
<% END IF  %>     
		  <% IF Session("glTipoUsuario") <> "C" AND Session("glTipoUsuario") <> "CP" THEN %>	
          <td> 			
			<img alt border="0" src="images/Clientes.ico" WIDTH="32" HEIGHT="32" onclick="<%=wURL%>" style="CURSOR: pointer">
		  </td>

		  <td align="left" width="250">
			<font face="Tahoma" size="2" onclick="<%=wURL%>" style="CURSOR: pointer">
			Clientes			
		  </td>
 			<% END IF  %>
			        
      
        </tr>
        
      </table>
      
      <!--<% IF Session("glCiaInternet") = "CAR" THEN %>		 
      <table border="0" cellpadding="0" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" width="600" id="table6">
        <tr>
       
		 
            <td width="14%"  align="right" > 
			<img alt border="0" src="images/Item2.ico"  onclick="<%=wURL13%>" style="CURSOR: pointer">
		  </td>
		  <td align="left" valign="middle" width="85%" >
			<font face="Tahoma" size="2" onclick="<%=wURL13%>" style="CURSOR: pointer">
			Precios y existencias para Ventas por contrato colectivo empleados 
			GDV</font></td>    

      
        </tr>
        
      </table>
      
      <% END IF%>-->
      <% IF Session("glTipoUsuario") = "C" OR Session("glTipoUsuario") = "CP"  THEN %>		 
             <table border="0" cellpadding="0" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" width="600" id="table8">
 <tr>
          

          <td width="14%" align="right" height="41" > 
			<img alt border="0" src="images/X002AV009.ICO" WIDTH="32" HEIGHT="32" onclick="<%=wURL12%>" style="CURSOR: pointer"></td>

		  <td align="left" valign="middle" height="41" style="width: 39%">
			<font face="Tahoma" size="2" onclick="<%=wURL12%>" style="CURSOR: pointer"> 
			Estado de Cuenta</font></td>
  		 

          <td align="right" class="auto-style3" style="width: 80px" > 
			 <img alt border="0" src="images/X002AV009.ICO" WIDTH="32" HEIGHT="32" onclick="<%=wURL14%>" style="CURSOR: pointer"></td>

		  <td width="41%" align="left" valign="middle" height="41" >
			  <font face="Tahoma"  size="2" onclick="<%=wURL14%>" style="CURSOR: pointer"> 
			  Facturado</font></td>
  		 </tr>     
		</table>
	  <% END IF %>		 	
	  <% IF Session("glTipoUsuario") <> "C" THEN %> 
       <table border="0" cellpadding="0" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" width="600" id="table7">
        <tr>
          
 <% IF Session("glTipoUsuario") <> "D" AND Session("glTipoUsuario") <> "CP" THEN %> 
          <td width="14%" align="right" > 
			<img alt border="0" src="images/X002AV009.ICO" WIDTH="32" HEIGHT="32" onclick="<%=wURL14%>" style="CURSOR: pointer">
		  </td>

		  <td align="left" valign="middle" style="width: 240px">
	 	<font face="Tahoma" size="2" onclick="<%=wURL14%>" style="CURSOR: pointer">Facturado</font>
		  </td>
  		  

		 
          <td  align="right" > 
			<img alt border="0" src="images/X003AV004.ICO"  onclick="<%=wURL4%>" style="CURSOR: pointer" width="32" height="32">
		  </td>
		  <td align="left" valign="middle" width="202">
			<font face="Tahoma" size="2" onclick="<%=wURL4%>" style="CURSOR: pointer">
			BackOrders</font></td> 
			    
	     <% END IF%>
        </tr>
        <% IF Session("glTipoUsuario") = "V" OR Session("glTipoUsuario") = "G" OR Session("glTipoUsuario") = "A" OR Session("glTipoUsuario") = "D" THEN %>
		<tr>
            <td width="14%" align="right" style="height: 34px" > 
			<img alt border="0" src="images/X002YV003.ico"  onclick="<%=wURL10%>" style="CURSOR: pointer" width="32" height="32"></td>

		  <td align="left" valign="middle" style="height: 34px; width: 240px">
			<font face="Tahoma" size="2" onclick="<%=wURL10%>" style="CURSOR: pointer">
			Lista de Precios</font></td>
  		
		<% IF Session("glTipoUsuario") = "V" THEN %>
			
			 <td align="right" style="height: 34px" > 
			<img alt border="0" src="images/X002AV009.ICO" WIDTH="32" HEIGHT="32" onclick="<%=wURL12%>" style="CURSOR: pointer"></td>

		  <td width="202" align="left" valign="middle" style="height: 34px" >
			<font face="Tahoma" size="2" onclick="<%=wURL12%>" style="CURSOR: pointer"> 
			Estado de Cuenta</font></td>

		   
        <tr>
          

          <td width="14%" align="right" height="41" > 
			<!--<img alt border="0" src="images/preparacion.PNG" WIDTH="32" HEIGHT="32" onclick="<%=wURL18%>" style="CURSOR: pointer">--></td>

		  <td align="left" valign="middle" height="41" style="width: 240px">
			<!--<font face="Tahoma" size="2" onclick="<%=wURL18%>" style="CURSOR: pointer"> 
			Pedidos en Preparaci&#65533;n</font>--></td>
  		 

          <td  align="right" height="41" > 
          <img alt border="0" src="images/X002AV009.ICO" WIDTH="32" HEIGHT="32" onclick="<%=wURL14%>" style="CURSOR: pointer">
			</td>
		  <td align="left" valign="middle" width="202" height="41">
		  <font face="Tahoma" size="2" onclick="<%=wURL14%>" style="CURSOR: pointer"> 
			Facturado</font></td>
			</td>     
        </tr>	

  <tr>
          

          <td width="14%" align="right" height="41" > 
			<img alt border="0" src="images/Usuarios.ico" WIDTH="32" HEIGHT="32" onclick="<%=wURL19%>" style="CURSOR: pointer"></td>

		  <td align="left" valign="middle" height="41" style="width: 240px">
			<font face="Tahoma" size="2" onclick="<%=wURL19%>" style="CURSOR: pointer"> 
			Clientes con Usuario Registrado</font></td>
  		 

          <td  align="right" height="41" > 
         			</td>
		  <td align="left" valign="middle" width="202" height="41">
		</td>
			</td>     
        </tr>	

		
		<% END IF %>
		
		
	 
		<% IF Session("glTipoUsuario") = "G" OR Session("glTipoUsuario") = "A" OR Session("glTipoUsuario") = "D" THEN %>
          <td  align="right" > 
			
			<img alt border="0" src="images/Clientes.ico" WIDTH="32" HEIGHT="32" onclick="<%=wURL11%>" style="CURSOR: pointer"></td>
		  
		  <td align="left" valign="middle" style="width: 240px">
		  
			<font face="Tahoma" size="2" onclick="<%=wURL11%>" style="CURSOR: pointer">Clientes Registrados en la Web
		  	
		  	</td>
		    <% END IF %>
		    	     
        </tr>
        <% END IF %>
      </table>
      <% IF Session("glTipoUsuario") = "G" OR Session("glTipoUsuario") = "A" OR Session("glTipoUsuario") = "D" THEN %>
       <table border="0" cellpadding="0" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" width="600" id="table8">
      
      <tr>
          

          <td width="14%" align="right" height="41" > 
			<img alt border="0" src="images/X002AV009.ICO" WIDTH="32" HEIGHT="32" onclick="<%=wURL12%>" style="CURSOR: pointer"></td>

		  <td align="left" valign="middle" height="41" style="width: 177px" class="auto-style5">
			<font face="Tahoma" size="2" onclick="<%=wURL12%>" style="CURSOR: pointer"> 
			Estado de Cuenta</font></td>
  		 

          <td  align="right" height="41" style="width: 45px" > 
          <img alt border="0" src="images/Clientes.ico" WIDTH="32" HEIGHT="32" onclick="<%=wURL15%>" style="CURSOR: pointer"></td>
			</td>
		  <td align="left" valign="middle" width="202" height="41">
		  <font face="Tahoma" size="2" onclick="<%=wURL15%>" style="CURSOR: pointer">Visitas Registradas en la Web
			</td>     
        </tr>	
        
        
        
        <tr>
          

          
  		 

          <td  align="right" height="41" > 
          <img alt border="0" src="images/X000ZV500B.ICO" WIDTH="32" HEIGHT="32" onclick="<%=wURL16%>" style="CURSOR: pointer">
		</td>
		  <td align="left" valign="middle" height="41" style="width: 177px">
		  <font face="Tahoma" size="2" onclick="<%=wURL16%>" style="CURSOR: pointer">
			Reclamos
		  </td> 
			
          <td  align="right" height="41" style="width: 45px" > 
          </td>
			</td>
		  <td align="left" valign="middle" width="202" height="41">
		  
			</td>     
        </tr>
        
        
        <td width="14%" align="right" height="41" > 
		<!--	<img alt border="0" src="images/preparacion.png" WIDTH="32" HEIGHT="32" onclick="<%=wURL18%>" style="CURSOR: pointer">--></td>

		  <td align="left" valign="middle" height="41" style="width: 177px">
			<!--<font face="Tahoma" size="2" onclick="<%=wURL18%>" style="CURSOR: pointer"> 
			Pedidos en Preparaci&#65533;n </font> --> </td>
		</table>
		<% END IF %>
      <% END IF %>
      
     <% IF Session("glUsuario") = "EPAREDES" THEN 'or Session("glTipoUsuario") = "G"  or Session("glTipoUsuario") = "D"  THEN %> 
     
      <table border="0" cellpadding="0" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" width="600" id="table8">
        <tr>
          

          <td width="14%" align="right" height="40" > 
			<img alt border="0" src="images/pagos.png" WIDTH="32" HEIGHT="32" onclick="<%=wURL17%>" style="CURSOR: pointer">
		  </td>

		  <td width="36%" align="left" valign="middle" height="40">
			<font face="Tahoma" size="2" onclick="<%=wURL17%>" style="CURSOR: pointer">
			Pagos Web</font></td>
  		 

	        
          <td  align="right" height="40" > 
		<!--<img alt border="0" src="images/X000ZV500B.ICO" WIDTH="32" HEIGHT="32" onclick="<%=wURL16%>" style="CURSOR: pointer">-->
		  </td>
		  <td align="left" valign="middle" width="201" height="40">
<!-- <font face="Tahoma" size="2" onclick="<%=wURL16%>" style="CURSOR: pointer"> 
			PQR'S</font>	-->	
</td>     
	     
        </tr>
        
        </table> 
        
     <!--
     <hr>
       
       <table border="0" cellpadding="0" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" width="600" id="table8">
        <tr>
          

          <td width="14%" align="right" height="40" > 
			<img alt border="0" src="images/X002AV013.ICO" WIDTH="32" HEIGHT="32" onclick="<%=wURL5%>" style="CURSOR: pointer">
		  </td>

		  <td width="36%" align="left" valign="middle" height="40">
			<font face="Tahoma" size="2" onclick="<%=wURL5%>" style="CURSOR: pointer">Ventas por Vendedor</font></td>
  		 

	        
          <td  align="right" height="40" > 
			<img alt border="0" src="images/X002AV013.ICO" WIDTH="32" HEIGHT="32" onclick="<%=wURL6%>" style="CURSOR: pointer">
		  </td>
		  <td align="left" valign="middle" width="201" height="40">
			<font face="Tahoma" size="2" onclick="<%=wURL6%>" style="CURSOR: pointer">
			Ventas por Familia</font></td>     
	     
        </tr>
        <tr>
          

          <td width="14%" align="right" height="41" > 
			<img alt border="0" src="images/X002AV013.ICO" WIDTH="32" HEIGHT="32" onclick="<%=wURL7%>" style="CURSOR: pointer"></td>

		  <td width="36%" align="left" valign="middle" height="41">
			<font face="Tahoma" size="2" onclick="<%=wURL7%>" style="CURSOR: pointer"> 
			Ventas por Zona</font></td>
  		 

          <td  align="right" height="41" > 
			<img alt border="0" src="images/X002AV013.ICO" WIDTH="32" HEIGHT="32" onclick="<%=wURL8%>" style="CURSOR: pointer"></td>
		  <td align="left" valign="middle" width="201" height="41">
			<font face="Tahoma" size="2" onclick="<%=wURL8%>" style="CURSOR: pointer"> Ventas Totales</font></td>     
        </tr>

			   
      
      </table>
     
   	  <% END IF %>
   	   
   	   <% IF Session("glTipoUsuario") = "D"  THEN %> 
       <table border="0" cellpadding="0" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" width="600" id="table8">
        <tr>
          

          <td width="14%" align="right" height="40" > 
			<img alt border="0" src="images/X000ZV500B.ICO" WIDTH="32" HEIGHT="32" onclick="<%=wURL5%>" style="CURSOR: pointer">
		  </td>

		  <td width="36%" align="left" valign="middle" height="40">
			<font face="Tahoma" size="2" onclick="javascript:window.open('X001A100_S.asp?NOMTAB=X300BQ100H','main')" style="CURSOR: pointer">
			&nbsp;Pedidos Procesados <b>Internet</b></td>
  		 

	        
          <td  align="right" height="40" > 
			<img alt border="0" src="images/X000ZV500B.ICO" WIDTH="32" HEIGHT="32" onclick="<%=wURL6%>" style="CURSOR: pointer">
		  </td>
		  <td align="left" valign="middle" width="200" height="40">
			<font face="Tahoma" size="2" onclick="javascript:window.open('X001A100M_S.asp','main')" style="CURSOR: pointer">
			&nbsp;Pedidos Procesados <b>M&#65533;vil</b></font></td>     
	     
        </tr>
   	   
   	   
   	   <tr>
   	   
   	   <td width="6%" align="center" > 
				
					<img alt border="0" src="images/chat.png" onclick="javascript:OpenChat()" style="CURSOR: pointer" align="right"></td>
				<td width="30%" align="left" valign="middle">
				
				<font face="Tahoma" size="2" onclick="javascript:OpenChat()" style="CURSOR: pointer">&nbsp;Chat 
				Carvica</td>
				
		 <td  align="right" height="40" > 
			
		  </td>
		  <td align="left" valign="middle" width="200" height="40">
			</td>     
		

   	   </tr>
   	   </table> 
   	   
   	   -->
   	   <% END IF %>
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
	<font face="Tahoma" size="2"><b>ESTIMADO USUARIO, SU ACCESO HA SIDO 
	LIMITADO, SOLO PODR&#65533; REALIZAR CONSULTAS DE PRODUCTOS, BACKORDERS , EDO DE 
	CUENTA, FACTURAS EMITIDAS EN LOS &#65533;LTIMOS 30 D&#65533;AS Y REALIZAR PAGOS DE 
	FACTURAS VENCIDAS. </b></font>
	</td> 
	</tr> 
</table>
<br>
<br>
<% END IF %>

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