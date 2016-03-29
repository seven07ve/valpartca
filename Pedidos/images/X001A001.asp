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
<base target="main">
<script language="JavaScript">
<!--
function FP_preloadImgs() {//v1.0
 var d=document,a=arguments; if(!d.FP_imgs) d.FP_imgs=new Array();
 for(var i=0; i<a.length; i++) { d.FP_imgs[i]=new Image; d.FP_imgs[i].src=a[i]; }
}

function FP_swapImg() {//v1.0
 var doc=document,args=arguments,elm,n; doc.$imgSwaps=new Array(); for(n=2; n<args.length;
 n+=2) { elm=FP_getObjectByID(args[n]); if(elm) { doc.$imgSwaps[doc.$imgSwaps.length]=elm;
 elm.$src=elm.src; elm.src=args[n+1]; } }
}

function FP_getObjectByID(id,o) {//v1.0
 var c,el,els,f,m,n; if(!o)o=document; if(o.getElementById) el=o.getElementById(id);
 else if(o.layers) c=o.layers; else if(o.all) el=o.all[id]; if(el) return el;
 if(o.id==id || o.name==id) return o; if(o.childNodes) c=o.childNodes; if(c)
 for(n=0; n<c.length; n++) { el=FP_getObjectByID(id,c[n]); if(el) return el; }
 f=o.forms; if(f) for(n=0; n<f.length; n++) { els=f[n].elements;
 for(m=0; m<els.length; m++){ el=FP_getObjectByID(id,els[n]); if(el) return el; } }
 return null;
}
// -->
</script>

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

function OpenMensaje() {

	//window.open('http://www.carvica.com.ve/chat/chat.asp','_blank', 'menubar=0,resizable=0,location=0,status=0,scrollbars=0,directories=0,width=700,height=470') 
	OpenBrWindow('http://www.carvica.com.ve/mensaje.htm','Mensaje','menubar=0,resizable=0,location=0,status=0,scrollbars=0,directories=0,width=550,height=270','550','270','true')

 
}



</script>

<%

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
	
	    'Application("ActiveUsers") = 1
    
    'wUsuariosConectados = Application("ActiveUsers")
    wUsuariosConectados = dOnlineUsers.Count
    
    IF wUsuariosConectados > wUsuarios Then
    	wUsuariosConectados = wUsuarios
	End if 
	
	Session("glTotalUsuarios") = wUsuarios
	

	

%>

<body onload="FP_preloadImgs(/*url*/'images/button69.jpg', /*url*/'images/button6A.jpg'); javascript:window.status='<%=Request.ServerVariables("URL") & " ( Usuario: " & Session("glUsuarioNombre") & " )" %>'" scroll=auto topmargin="0" leftmargin="18" rightmargin="0" bottommargin="0" bgcolor="#FFEBD6">

<div align="center">

<table width="919" bgcolor="#FFFFFF" border="0"  cellpadding="0" height="100%">
<tr>
<td bgcolor="#FFFFFF" valign="top">



<table width="919" bgcolor="#FFFFFF" border="0" cellpadding="0" cellspacing="0" >
<tr>
<td bgcolor="#FFFFFF" valign="top">
<p align="center" style="margin-top: 3px; margin-bottom: 3px">
     

 
<p align="center" style="margin-top: 5px; margin-bottom: 3px">&nbsp;</p>
 
<table align="center"   cellspacing="0" cellpadding="0" width="605" bordercolor="#0066CC" bgcolor="#FE9900" style="padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px;" id="table6" border="1">
	

  <tr>
    <td width="79%" bgcolor="white">
      <p align="center" style="margin-top: 3px; margin-bottom: 3px"><b>
		<font face="Tahoma" size="2">Ventas</font></b></p></td>
  </tr>

	<tr>
		
	<td width="79%" >

		<table border="0" cellpadding="0" bordercolorlight="#c0c0c0" bordercolordark="#c0c0c0" width="98%" id="table7">
			<tr>
				<td  align="center" width="7%"> 
				<p style="margin-top: 3px"> 
				</td>
				<td width="7%" align="center" > 
					<p style="margin-top: 3px">
					<a href="X001A100_A.asp?CLA001="> 
					<img alt border="0" src="images/PEDIDOS.gif" WIDTH="32" HEIGHT="32" style="CURSOR: pointer">
					</a> 
				</td>
				<td width="32%" align="left" valign="middle">
				<p style="margin-top: 3px"><a href="X001A100_A.asp?CLA001=">
				<img border="0" id="img1" src="images/button68.jpg" height="20" width="100" alt=" Crear Pedido" fp-style="fp-btn: Simple Text 1; fp-font-color-normal: #000000; fp-font-color-hover: #000000; fp-font-color-press: #000000; fp-justify-horiz: 0; fp-bgcolor: #FE9900" fp-title=" Crear Pedido" onmouseover="FP_swapImg(1,0,/*id*/'img1',/*url*/'images/button69.jpg')" onmouseout="FP_swapImg(0,0,/*id*/'img1',/*url*/'images/button68.jpg')" onmousedown="FP_swapImg(1,0,/*id*/'img1',/*url*/'images/button6A.jpg')" onmouseup="FP_swapImg(0,0,/*id*/'img1',/*url*/'images/button69.jpg')"></a></td>
				<td  align="center" width="1%"> 
				<p style="margin-top: 3px"> 
				</td>

				<td width="8%" align="center" > 
				
					<p style="margin-top: 3px"> 
				
					<img alt border="0" src="images/X002BV301.ICO" WIDTH="32" HEIGHT="32" onclick="javascript:window.open('X001A100_S.asp?NOMTAB=X300BQ100','main')" style="CURSOR: pointer">
				</td>
				<td width="25%" align="left" valign="middle">
				<font face="Tahoma" size="2" onclick="javascript:window.open('X001A100_S.asp?NOMTAB=X300BQ100','main')" style="CURSOR: pointer">
				<p style="margin-top: 3px">&nbsp;Pedidos No Procesados								
				
				</td>
				
			</tr>
			<tr>
				<td  align="center" width="7%"> 
				</td>
				<td width="7%" align="center" > 
									
					<img alt border="0" src="images/X000ZV500B.ICO" WIDTH="32" HEIGHT="32" onclick="javascript:window.open('X001A100_S.asp?NOMTAB=X300BQ100H','main')" style="CURSOR: pointer">
				</td>
				<td width="32%" align="left" valign="middle">
				<font face="Tahoma" size="2" onclick="javascript:window.open('X001A100_S.asp?NOMTAB=X300BQ100H','main')" style="CURSOR: pointer">&nbsp;Pedidos 
				Procesados (<b>Web</b>)</td>
				
				<% IF Session("glTipoUsuario") = "C" THEN 'OR Session("glTipoUsuario") = "V" %>
				<td  align="center" width="1%"> 
				</td>

				<td width="8%" align="center" > 
				
					<img alt border="0" src="images/gpago.png" onclick="javascript:window.open('X001A004.asp','main')" style="CURSOR: pointer"></td>
				<td width="25%" align="left" valign="middle">
				
				<font face="Tahoma" size="2" onclick="javascript:window.open('X001A004.asp','main')" style="CURSOR: pointer">&nbsp;Pagos
				<b><font color="#CC0000">*Nuevo</font></b></td>
				<%END IF %>		
				
				<% IF Session("glTipoUsuario") = "G" OR Session("glTipoUsuario") = "A" OR Session("glTipoUsuario") = "V" THEN %>
				<td  align="center" width="1%"> 
				</td>

				<td width="6%" align="center" > 
				
					<img alt border="0" src="images/X000ZV500B.ICO" WIDTH="32" HEIGHT="32" onclick="javascript:window.open('X001A100M_S.asp','main')" style="CURSOR: pointer"></td>
				<td width="30%" align="left" valign="middle">
				
				<font face="Tahoma" size="2" onclick="javascript:window.open('X001A100M_S.asp','main')" style="CURSOR: pointer">&nbsp;Pedidos 
				Procesados (<b>Móvil</b>)</td>
				<%END IF %>				
			
			</tr>
			
			
				<!--Nuevo-->
				<tr>
				<td  align="center" width="7%"> 
				</td>
				<td width="7%" align="center" > 
									
					<img alt border="0" src="images/logosencamer.png" WIDTH="32" HEIGHT="32" onclick="javascript:window.open('X001A002.asp','main')" style="CURSOR: pointer">
				</td>
				<td width="32%" align="left" valign="middle">
				<font face="Tahoma" size="2" onclick="javascript:window.open('X001A002.asp','main')" style="CURSOR: pointer">&nbsp;Sencamer 
				Productos Importados</td>
				<td  align="center" width="1%"> 
				</td>
				<% IF Session("glTipoUsuario") = "C" OR Session("glTipoUsuario") = "V" THEN%>
				<td width="8%" align="center" > 
				
					<img alt border="0" src="images/chat.png" onclick="javascript:OpenChat()" style="CURSOR: pointer"></td>
				<td width="25%" align="left" valign="middle">
				
				<font face="Tahoma" size="2" onclick="javascript:OpenChat()" style="CURSOR: pointer">&nbsp;Chat</td>
				
				<%ELSE%>
				<td width="8%" align="center" > 
				
					<img alt border="0" src="images/pdf.jpg" onclick="javascript:window.open('Instructivo_Uso_Web.pdf','_pdf')" style="CURSOR: pointer"></td>
				<td width="25%" align="left" valign="middle">
				
				<font face="Tahoma" size="2" onclick="javascript:window.open('Instructivo_Uso_Web.pdf','_pdf')" style="CURSOR: pointer">&nbsp;Instructivo Uso General de la Web</td>
				<%END IF %>				
				</tr>			
				
				<% IF Session("glTipoUsuario") = "C" OR Session("glTipoUsuario") = "V" THEN%>
				<tr>
				<td  align="center" width="7%"> 
				</td>
				<td width="7%" align="center" > 
									
					<img alt border="0" src="images/pdf.jpg" WIDTH="32" HEIGHT="32" onclick="javascript:window.open('Instructivo_Uso_Web.pdf','_pdf')" style="CURSOR: pointer">
				</td>
				<td width="32%" align="left" valign="middle">
				<font face="Tahoma" size="2" onclick="javascript:window.open('Instructivo_Uso_Web.pdf','_pdf')" style="CURSOR: pointer">&nbsp;Instructivo Uso General de la Web</td>
				<td  align="center" width="1%"> 
				</td>
				</tR>
				<%END IF %>				
				
	
				<!--FIN-->
				
			<!--	
			<tr>
				
				<td align="center" colspan="8"  height="35px" valign="center"  > 
					<p style="margin-top: 3px">
					<table>			
					<tr><td>
					<img alt border="0" src="images/pdf.jpg" WIDTH="32" HEIGHT="32" onclick="javascript:window.open('X001A002.asp','main')" style="CURSOR: pointer"> 
					 </td>
					 <td>
					 <font face="Tahoma" size="2" onclick="javascript:window.open('X001A002.asp','main')" style="CURSOR: pointer; font-weight:700">&nbsp;Sencamer Productos Importados </font> 
					 </td> 
					 </tr>
					 </table> 
					 </td>
				
			
			</tr>-->
		</table></td>


	</tr>
</table>

<p style="margin-top: 10px; margin-bottom: 1px">


<table align="center" >
<tr>
		<td>
		<img src="images/Usuario.jpg" >
		</td>
      <td valign="center"  >
      <font face="Tahoma" style="font-size: 9pt; font-weight:700">Usuarios 
		Conectados <%= wUsuariosConectados %> de <%= wUsuarios%> </font> 
      </td>
      </tr>
      
      
</table>

<p align="center" style="margin-top: 0; margin-bottom: 0"><font color="#0000FF">

<% IF Session("glTipoUsuario") <> "C" THEN %>
 <font face="Tahoma" onclick="javascript:window.open('X001A003.asp','main')" style="CURSOR: pointer;font-size: 9pt; font-weight:700" >Pulse Aquí para ver Usuarios Conectados  </font> 

<% END IF %>
</font> </p> 

	<p align=center style="margin-top: 20px; margin-left:0px; margin-right:0px; margin-bottom:0">
	
	<table border ="0" align="center" >
	
		<tr><td align="center"  >
		<img border="0" src="images/Concurso09022012_2.jpg" ></td></tr>
		<!--<tr><td align="center"  >
		&nbsp;<p>
		<img border="0" src="images/mensaje2.jpg" ></td></tr>-->
		</table> 
		
</font></p>


<!-- Inicio Mensaje-->

<!--
<hr width="650">
<div align="center">

<table  width="650"><tr><td width="32">
<p align="center" style="margin-left: 10px">
<img border="0" src="images/alert.jpg" width="32" height="32"></td>
	<td width="608"><font size="2"><span style="font-family: Tahoma">
	<b>Estimados 
Clientes</b>&nbsp;</span></font></td></tr>

<tr><td colspan="2" >
<p class="MsoNormal" style="margin: 5px 10px; " align="justify">
<span lang="ES" style="font-family: Tahoma"><font size="2">Queremos informarles 
que hemos incorporado a nuestra cesta de productos una nueva línea que esperamos 
sea de su aceptación.</font></span></p>
<p class="MsoNormal" style="margin: 5px 10px; " align="justify">
<span lang="ES" style="font-family: Tahoma"><font size="2">Podrán consultarla en 
la sección de Consulta “Productos” o bien al crear pedidos la verán en el menú 
de “Familias” que ofrece nuestro Website.</font></span></p>
<p class="MsoNormal" style="margin: 5px 10px; ">
<span lang="ES" style="font-family: Tahoma"><font size="2">Las línea incorporada 
es:</font></span><b><span lang="ES" style="font-family: Tahoma; color: #1F497D"><font size="2"> 
“PARTES KOREANAS”</font></span></b></p>
<p class="MsoNormal" style="margin: 5px 10px; ">
<span lang="ES" style="font-family: Tahoma"><font size="2">Estas Partes Koreanas 
contienen los siguientes Grupos de Productos:</font></span></p>
<p class="MsoListParagraph" style="margin:0 10pt; text-indent: 0pt; font-size: 11.0pt; font-family: Calibri,sans-serif; ">
<span lang="ES" style="font-family: Tahoma"><font size="2">-</font><span style="font-style: normal; font-variant: normal; font-weight: normal"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;
</font></span><font size="2">BASES DE AMORTIGUADOR</font></span></p>
<p class="MsoListParagraph" style="margin:0 10pt; text-indent: 0pt; font-size: 11.0pt; font-family: Calibri,sans-serif; ">
<span lang="ES" style="font-family: Tahoma"><font size="2">-</font><span style="font-style: normal; font-variant: normal; font-weight: normal"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;
</font></span><font size="2">BASES DE MOTOR</font></span></p>
<p class="MsoListParagraph" style="margin:0 10pt; text-indent: 0pt; font-size: 11.0pt; font-family: Calibri,sans-serif; ">
<span lang="ES" style="font-family: Tahoma"><font size="2">-</font><span style="font-style: normal; font-variant: normal; font-weight: normal"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;
</font></span><font size="2">BOMBAS DE GASOLINA ELÉCTRICAS</font></span></p>
<p class="MsoListParagraph" style="margin:0 10pt; text-indent: 0pt; font-size: 11.0pt; font-family: Calibri,sans-serif; ">
<span lang="ES" style="font-family: Tahoma"><font size="2">-</font><span style="font-style: normal; font-variant: normal; font-weight: normal"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;
</font></span><font size="2">BOBINAS DE IGNICIÓN</font></span></p>
<p class="MsoListParagraph" style="margin:0 10pt; text-indent: 0pt; font-size: 11.0pt; font-family: Calibri,sans-serif; ">
<span lang="ES" style="font-family: Tahoma"><font size="2">-</font><span style="font-style: normal; font-variant: normal; font-weight: normal"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;
</font></span><font size="2">BOMBAS DE ACEITE</font></span></p>
<p class="MsoListParagraph" style="margin:0 10pt; text-indent: 0pt; font-size: 11.0pt; font-family: Calibri,sans-serif; ">
<span lang="ES" style="font-family: Tahoma"><font size="2">-</font><span style="font-style: normal; font-variant: normal; font-weight: normal"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;
</font></span><font size="2">BOMBAS DE AGUA</font></span></p>
<p class="MsoListParagraph" style="margin:0 10pt; text-indent: 0pt; font-size: 11.0pt; font-family: Calibri,sans-serif; ">
<span lang="ES" style="font-family: Tahoma"><font size="2">-</font><span style="font-style: normal; font-variant: normal; font-weight: normal"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;
</font></span><font size="2">BUJES, MESETAS, MUÑONES, BRAZOS OSCILANTES y 
TERMINALES DE DIRECCIÓN</font></span></p>
<p class="MsoListParagraph" style="margin:0 10pt; text-indent: 0pt; font-size: 11.0pt; font-family: Calibri,sans-serif; ">
<span lang="ES" style="font-family: Tahoma"><font size="2">-</font><span style="font-style: normal; font-variant: normal; font-weight: normal"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;
</font></span><font size="2">CORREAS DE TIEMPO</font></span></p>
<p class="MsoListParagraph" style="margin:0 10pt; text-indent: 0pt; font-size: 11.0pt; font-family: Calibri,sans-serif; ">
<span lang="ES" style="font-family: Tahoma"><font size="2">-</font><span style="font-style: normal; font-variant: normal; font-weight: normal"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;
</font></span><font size="2">CUBOS DE RUEDA</font></span></p>
<p class="MsoListParagraph" style="margin:0 10pt; text-indent: 0pt; font-size: 11.0pt; font-family: Calibri,sans-serif; ">
<span lang="ES" style="font-family: Tahoma"><font size="2">-</font><span style="font-style: normal; font-variant: normal; font-weight: normal"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;
</font></span><font size="2">ESTOPERAS/RETENEDORES</font></span></p>
<p class="MsoListParagraph" style="margin:0 10pt; text-indent: 0pt; font-size: 11.0pt; font-family: Calibri,sans-serif; ">
<span lang="ES" style="font-family: Tahoma"><font size="2">-</font><span style="font-style: normal; font-variant: normal; font-weight: normal"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;
</font></span><font size="2">TENSORES Y POLEAS DE TIEMPO</font></span></p>
</td>
</tr> 
</table>


<hr width="650">
</div>
-->
<!-- Fin Mensaje-->

<!--
<p align=justify style="margin-top: 20px; margin-left:55px; margin-right:55px">
		<span style="text-decoration: none">
		<font face="Tahoma" style="font-size: 9pt"><font color="#006699"><b>En 
		esta sección usted tiene tres opciones</b>:</font><br>
		<br>
		<b><font color="#006699">Crear Pedidos:</font></b> En esta sección usted 
		enviará los requerimientos por familia de productos.<br>
		<br>
		<b><font color="#006699">Pedidos No Procesados:</font></b> Una vez que 
		usted ha realizado su pedido y por razones de su tiempo no pudo 
		concluirlo, usted tendrá la opción de dejarlo pendiente para enviarlo 
		posteriormente.<br>
		<br>
		<b><font color="#006699">Pedidos Procesados:</font></b> Le mantiene la 
		Historia de los pedidos enviados por usted a Carvica por esta vía, a fín 
		de que pueda consultarlos cuando lo desee. </font></span></p>
		
	-->	

<p align=justify style="margin-top: 30px; margin-left:55px; margin-right:55px">
		&nbsp;</p>
	


		</td>
        </tr>
                
        

<!--        
<tr>
<td>
<img src="../images/index/bottom.jpg" width="790" height="15" /></td>

</td>
        </tr>-->
        
        
        
        
               </table>
  		
		
</body>
</html>