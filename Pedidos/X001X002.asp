


<%@ Language=VBScript %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../X001Z900.css">
<!--#include file="X001Z001.INC"-->
<style type="text/css">
.auto-style1 {
	font-family: Arial, Helvetica, sans-serif;
	text-decoration: underline;
	font-size: small;
}
.auto-style2 {
	font-family: Arial, Helvetica, sans-serif;
	text-decoration: none;
	font-size: small;
}

</style>
</head>


<body onload="window.status='<%=Request.ServerVariables("URL") & " ( Usuario: " & Session("glUsuarioNombre") & " )" %>'" scroll=no topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>">


<%

	wTC = "33%"

	wURL = "javascript:window.open('ADM/X010Z300FI.ASP','main')"
	wURL2 = "window.open('X001X160_S.asp?NOMTAB=X300AF003&ORG=1','main')"	
	IF Session("glTipoUsuario") <> "C" AND Session("glTipoUsuario") <> "V" THEN
		wURL3 = "javascript:window.open('X001X114_S.asp?NOMTAB=X300ZF001','main')"
	END IF
	'wURL4 = "javascript:window.open('X001X127.asp','main')" 
	wURL4 = "javascript:window.open('../aspx/c001d002.aspx?CCI=" & Session("glCiaInternet") 
	wURL4 = wURL4 & "&PUS=" & Session("glUsuario") & "','main')"
	wURL5 = "javascript:window.open('X001X153_S.asp','main')"  
	'Notas de Interes
	wURL6 = "javascript:window.open('../aspx/c001d003.aspx?CCI=" & Session("glCiaInternet") 
	wURL6 = wURL6 & "&PUS=" & Session("glUsuario") & "','main')"
	'Bancos Compa&#65533;ia
	wURL7 = "javascript:window.open('X001X160_S.asp?NOMTAB=X300AF034','main')"  
	'Bancos Clientes
	wURL8 = "javascript:window.open('X001X160_S.asp?NOMTAB=X300AF025','main')"  
	'Perfil Catalogo PQR
	wURL9 = "javascript:window.open('X001X134_S.asp','main')"  
	'Grupos de Codigo PQR
	wURL10 = "javascript:window.open('X001X136_S.asp','main')"  	
	'Tipos de Documentos
	wURL11 = "javascript:window.open('X001X133.asp','main')" 
	wURL12 = "javascript:window.open('../aspx/c001M004.aspx?CCI=" & Session("glCiaInternet")
	wURL12 = wURL12 & "&PUS=" & Session("glUsuario") & "','main')"
	wURL13 = "javascript:window.open('ADM/X010Z300FI.ASP','main')"
	wURL14 = "javascript:window.open('X001X182.asp','main')" 

	
	
	strCnn	= Application("XDTA300_ConnectionString")
	
	SQL = "SELECT Z300002PR2, Z300002PR3, Z300002PR4 FROM X300ZF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300002CCI = '" & Session("glCiaInternet") & "' "
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	if NOT rstQuery.EOF then
		wPR2 = trim(rstQuery.Fields("Z300002PR2"))
		wPR3 = trim(rstQuery.Fields("Z300002PR3"))
		wPR4 = trim(rstQuery.Fields("Z300002PR4"))
	end if
	rstQuery.CLOSE
	SET rstQuery = NOTHING	

%>


<div align="center">

<table width="919" bgcolor="#FFFFFF" border="0"  cellpadding="0" height="100%"  >
<tr>
<td valign="top">

<div align="center">

<table width="919" bgcolor="#FFFFFF" border="0"  cellpadding="0" cellspacing="0" >
<tr>
<td bgcolor="#FFFFFF">

<p>&nbsp;</p>




<div align="center">




<table   cellspacing="0" cellpadding="0" width="605" bordercolor="<%=Request.Cookies("CAR")("Color1")%>" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" style="padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px;" id="table5" border="1">
	  <tr>
    <td width="91%" bgcolor="white" height="30">
      <p align="center" style="margin-top: 3px; margin-bottom: 3px"><b>
		<font face="Tahoma" size="2">Maestros</font></b></p></td>
  </tr>
	<tr>
	<td width="100%" align="center" >

       <table border="0" cellpadding="0" bordercolorlight="#c0c0c0" bordercolordark="#c0c0c0" id="table6" style="width: 100%">
        <tr>
          

          <td width="14%" align="right" > 
			<% IF Session("glTipoUsuario") <> "C" AND Session("glTipoUsuario") <> "V" THEN %>
			<img alt border="0" src="images/Setting_3.ico" WIDTH="32" HEIGHT="32" onclick="<%=wURL4%>" style="CURSOR: pointer">
				  	<% END IF %>
		  </td>
		  <td width="38%" align="left" valign="middle">
    		<% IF Session("glTipoUsuario") <> "C" AND Session("glTipoUsuario") <> "V" THEN %>
			<font face="Tahoma" size="2" onclick="<%=wURL4%>" style="CURSOR: pointer">
			<b>&nbsp;Configuración General</b>
				
			<% END IF  %>
		  </td>
			        
          <td align="right" style="width: 9%" > 
          <% IF Session("glTipoUsuario") <> "C" AND Session("glTipoUsuario") <> "V" THEN %>
			<img alt border="0" src="images/Usuarios.ico" WIDTH="32" HEIGHT="32" onclick="<%=wURL3%>" style="CURSOR: pointer">
		  <% END IF %>
		  </td>
		  <td align="left" valign="middle" style="width: 48%">
          <% IF Session("glTipoUsuario") <> "C" AND Session("glTipoUsuario") <> "V" THEN %>
			<font face="Tahoma" size="2" onclick="<%=wURL3%>" style="CURSOR: pointer">
			<b>&nbsp;Usuarios Web
		  <% END IF %></b>
		  </td>     


        </tr>
        <tr>
          

          <td width="14%" align="right" > 
			<img alt border="0" src="images/Setting_3.ico" WIDTH="32" HEIGHT="32" onclick="<%=wURL6%>" style="CURSOR: pointer">
</td>
		  <td width="38%" align="left" valign="middle">
    	  <font face="Tahoma" size="2" onclick="<%=wURL6%>" style="CURSOR: pointer">
			<b>&nbsp;Notas de Interés</b></font>
			</td>
			        
      <td align="right" style="width: 9%" > 
			<% IF Session("glTipoUsuario") <> "C" AND Session("glTipoUsuario") <> "V" THEN %>
			<img alt border="0" src="images/Item2.ico"  onclick="<%=wURL2%>" style="CURSOR: pointer">
		  	<% END IF %>
		  </td>
		  <td align="left" valign="middle" style="width: 48%">
    		<% IF Session("glTipoUsuario") <> "C" AND Session("glTipoUsuario") <> "V" THEN %>
			<font face="Tahoma" size="2" onclick="<%=wURL2%>" style="CURSOR: pointer; font-weight:700" >
			&nbsp;Fotos de Productos
		  	<% END IF %>
		  </td>
        </tr>
        <tr>
          

          <td width="14%" align="right" > 
			<img alt border="0" src="images/Setting_3.ico" WIDTH="32" HEIGHT="32" onclick="<%=wURL5%>" style="CURSOR: pointer"></td>
		  <td width="38%" align="left" valign="middle">
    	 <font face="Tahoma" size="2" onclick="<%=wURL5%>" style="CURSOR: pointer">
			<b>&nbsp;Configuración de Líneas</b></td>
			        
      <td align="right" style="width: 9%" > 
			<img alt border="0" src="images/Setting_3.ico" WIDTH="32" HEIGHT="32" onclick="<%=wURL7%>" style="CURSOR: pointer"></td>
		  <td align="left" valign="middle" style="width: 48%">
    		<font face="Tahoma" size="2" onclick="<%=wURL7%>" style="CURSOR: pointer">
			<b>&nbsp;Bancos Compañía</b></td>



        </tr>
        
        <tr>
          

          <td width="14%" align="right" > 
			<img alt border="0" src="images/Setting_3.ico" WIDTH="32" HEIGHT="32" onclick="<%=wURL8%>" style="CURSOR: pointer"></td>
		  <td width="38%" align="left" valign="middle">
    	 <font face="Tahoma" size="2" onclick="<%=wURL8%>" style="CURSOR: pointer">
			<b>&nbsp;Bancos Clientes</b></td>
			    <td align="right" style="width: 9%" > 
			<img alt border="0" src="images/Setting_3.ico" WIDTH="32" HEIGHT="32" onclick="<%=wURL11%>" style="CURSOR: pointer">		</td>		

		  <td align="left" valign="middle" style="width: 48%">
    	<font face="Tahoma" size="2" onclick="<%=wURL11%>" style="CURSOR: pointer">
			<b>&nbsp;Tipos de Documento Edo. Cuenta</b></font>     		</td>     
      


        </tr>
        
         <!--<tr>
          

          <td width="14%" align="right" > 
			<img alt border="0" src="images/Setting_3.ico" WIDTH="32" HEIGHT="32" onclick="<%=wURL12%>" style="CURSOR: pointer"></td>
		  <td width="38%" align="left" valign="middle">
    	 <font face="Tahoma" size="2" onclick="<%=wURL12%>" style="CURSOR: pointer">
			<b>&nbsp;Presupuesto por Vendedor</b></td>
		  
		  <td align="right" style="width: 9%"> 
		  	<img src="images/Setting_3.ico" width="32px" height="32px" alt="" onclick="<%=wURL14%>" style="CURSOR: pointer">
		  </td>		

		  <td align="left" valign="middle" style="width: 48%">
     	  	<font face="Tahoma" size="2px" onclick="<%=wURL14%>" style="CURSOR: pointer"><b>
			&nbsp;Periodo de Venta</b></font>
     	  </td>  
      


        </tr>-->

        
        <% IF wPR3 = "1" THEN %>
        
          <tr>
    <td width="91%" bgcolor="white" height="30" colspan="4">
      <p align="center" style="margin-top: 3px; margin-bottom: 3px"><b>
		<font face="Tahoma" size="2">PQR'S</font></b></p></td>
  </tr>


     <tr>
          

          <td width="14%" align="right" > 
			<img alt border="0" src="images/Setting_3.ico" WIDTH="32" HEIGHT="32" onclick="<%=wURL10%>" style="CURSOR: pointer"></td>
		  <td width="38%" align="left" valign="middle">
    	 <font face="Tahoma" size="2" onclick="<%=wURL10%>" style="CURSOR: pointer">
			<b>&nbsp;Grupos de Código</b> </font></td>
			        
     <td align="right" style="width: 9%" > 
			<img alt border="0" src="images/Setting_3.ico" WIDTH="32" HEIGHT="32" onclick="<%=wURL9%>" style="CURSOR: pointer"></td>
		  <td align="left" valign="middle" style="width: 48%">
    		<font face="Tahoma" size="2" onclick="<%=wURL9%>" style="CURSOR: pointer">
			<b>&nbsp;Perfil Catalogo</b></font></td>




        </tr>

        <% END IF %>
        
            <% IF wPR4 = "1" THEN %>
  <tr>
    <td width="91%" bgcolor="white" height="30" colspan="4">
      <p align="center" style="margin-top: 3px; margin-bottom: 3px"><b>
		<font face="Tahoma" size="2">Sales PRO</font></b></p></td>
  </tr>

     <tr>
          

          <td width="14%" align="right" > 
			<img alt border="0" src="images/Setting_3.ico" WIDTH="32" HEIGHT="32" onclick="javascript:window.open('X001X160_S.asp?NOMTAB=X300PF704','main')" style="CURSOR: pointer"></td>
		  <td width="38%" align="left" valign="middle">
    	 <font face="Tahoma" size="2" onclick="javascript:window.open('X001X160_S.asp?NOMTAB=X300PF704','main')" style="CURSOR: pointer">
			<b>&nbsp;Regionales</b> </font></td>
			        
     <td align="right" style="width: 9%" > 
			<img alt border="0" src="images/Setting_3.ico" WIDTH="32" HEIGHT="32" onclick="javascript:window.open('X001X160_S.asp?NOMTAB=X300PF705','main')" style="CURSOR: pointer"></td>
		  <td align="left" valign="middle" style="width: 48%">
    		<font face="Tahoma" size="2" onclick="javascript:window.open('X001X160_S.asp?NOMTAB=X300PF705','main')" style="CURSOR: pointer">
			<b>&nbsp;Ciudades</b></font></td>




        </tr>


     <tr>
          

          <td width="14%" align="right" > 
			<img alt border="0" src="images/Setting_3.ico" WIDTH="32" HEIGHT="32" onclick="javascript:window.open('X001X160_S.asp?NOMTAB=X300PF700','main')" style="CURSOR: pointer"></td>
		  <td width="38%" align="left" valign="middle">
    	 <font face="Tahoma" size="2" onclick="javascript:window.open('X001X160_S.asp?NOMTAB=X300PF700','main')" style="CURSOR: pointer">
			<b>&nbsp;Deportes/Hobbies/Procedencia</b> </font></td>
			        
     <td align="right" style="width: 9%" > 
			<img alt border="0" src="images/Setting_3.ico" WIDTH="32" HEIGHT="32" onclick="javascript:window.open('X001X160_S.asp?NOMTAB=X300PF702','main')" style="CURSOR: pointer"></td>
		  <td align="left" valign="middle" style="width: 48%">
    		<font face="Tahoma" size="2" onclick="javascript:window.open('X001X160_S.asp?NOMTAB=X300PF702','main')" style="CURSOR: pointer">
			<b>&nbsp;Sector / Canal</b></font></td>




        </tr>

     <tr>
          

          <td width="14%" align="right" > 
			<img alt border="0" src="images/Setting_3.ico" WIDTH="32" HEIGHT="32" onclick="javascript:window.open('X001X160_S.asp?NOMTAB=X300PF701','main')" style="CURSOR: pointer"></td>
		  <td width="38%" align="left" valign="middle">
    	 <font face="Tahoma" size="2" onclick="javascript:window.open('X001X160_S.asp?NOMTAB=X300PF701','main')" style="CURSOR: pointer">
			<b>&nbsp;Tipos de Proyecto</b> </font></td>
			        
     <td align="right" style="width: 9%" > 
			<img alt border="0" src="images/Setting_3.ico" WIDTH="32" HEIGHT="32" onclick="javascript:window.open('X001X160_S.asp?NOMTAB=X300PF703','main')" style="CURSOR: pointer"></td>
		  <td align="left" valign="middle" style="width: 48%">
    		<font face="Tahoma" size="2" onclick="<%=wURL9%>" style="CURSOR: pointer">
			<b>&nbsp;Accesorio de Equipos</b> </font></td>
	



        </tr>

     <tr>
          

          <td width="14%" align="right" > 
			<img alt border="0" src="images/Setting_3.ico" WIDTH="32" HEIGHT="32" onclick="javascript:window.open('X001X160_S.asp?NOMTAB=X300PF707','main')" style="CURSOR: pointer"></td>
		  <td width="38%" align="left" valign="middle">
    	 <font face="Tahoma" size="2" onclick="javascript:window.open('X001X160_S.asp?NOMTAB=X300PF707','main')" style="CURSOR: pointer">
			<b>&nbsp;Linea Producto de Interes</b> </font></td>
			        
     <td align="right" style="width: 9%" > 
			<img alt border="0" src="images/Setting_3.ico" WIDTH="32" HEIGHT="32" onclick="javascript:window.open('X001X160_S.asp?NOMTAB=X300PF708','main')" style="CURSOR: pointer"></td>
		  <td align="left" valign="middle" style="width: 48%">
    		<font face="Tahoma" size="2" onclick="javascript:window.open('X001X160_S.asp?NOMTAB=X300PF708','main')" style="CURSOR: pointer">
			<b>&nbsp;Familia / Tipo Producto Interes</b></font></td>




        </tr>
        
        <tr>
          

          <td width="14%" align="right" > 
			<img alt border="0" src="images/Setting_3.ico" WIDTH="32" HEIGHT="32" onclick="javascript:window.open('X001X160_S.asp?NOMTAB=X300PF709','main')" style="CURSOR: pointer"></td>
		  <td width="38%" align="left" valign="middle">
    	 <font face="Tahoma" size="2" onclick="javascript:window.open('X001X160_S.asp?NOMTAB=X300PF709','main')" style="CURSOR: pointer">
			<b>&nbsp;Marca Producto de Interes</b> </font></td>
			        
     <td align="right" style="width: 9%" > 
			<img alt border="0" src="images/Setting_3.ico" WIDTH="32" HEIGHT="32" onclick="javascript:window.open('X001X160_S.asp?NOMTAB=X300PF706','main')" style="CURSOR: pointer"></td>
		  <td align="left" valign="middle" style="width: 48%">
    		<font face="Tahoma" size="2" onclick="javascript:window.open('X001X160_S.asp?NOMTAB=X300PF706','main')" style="CURSOR: pointer">
			<b>&nbsp;Productos de Interes</b></font></td>




        </tr>


        <% END IF %>


      </table>
	</td>				
  </tr>




</table>

</td>	
</tr>

       
        
        
               </table>
               
               <br>
<table align="center" border="0" width="50%">



<tr>
<td class="auto-style1">
<strong>Proceso
</strong>
</td>

<td class="auto-style1">
<strong>Ultima Actualización
</strong>
</td>
</tr>


<%
	
	strCnn	= Application("XDTA300_ConnectionString")
	
	SQL = "SELECT Z300009DES, Z300009FFI "
	SQL = SQL & " FROM X300ZF009 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300009CCI ='" & Session("glCiaInternet") & "' "
	SQL = SQL & " ORDER BY Z300009DTS "
	'Response.Write SQL	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn	
	DO WHILE NOT rstQuery.EOF 
	
		wC01 = trim(rstQuery.Fields(0))
		wC02 = trim(rstQuery.Fields(1))
		
		wC02 = Right("00" & Day(wC02),2) & "-" & Right("00" & Month(wC02),2) & "-" & Year(wC02) & " " & timevalue(wC02)
%>
<tr>

<td class="auto-style2">
<b><%=wC01%></b>
</td>

<td class="auto-style2">
<%=wC02%>
</td>
</tr>

<%
	
	
		rstQuery.MoveNext 
		
	LOOP
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	%>


</table>


    </div>

    </td>				
  </tr>
</table>

		
		

    		</div>

</body>
</html>