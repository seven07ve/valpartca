
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../X001Z900.css">
<base target="main">
<script >
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



<script type="text/javascript" src="lib/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="lib/jquery.fancybox.js"></script>
	<link rel="stylesheet" type="text/css" href="style.css" media="screen"/>



<script type="text/javascript">
    $(document).ready(function() {
        $("#hidden_link").fancybox().trigger('click');
    });
</script>

	<script type="text/javascript">
		$(document).ready(function() {
			
			// Galer&#65533;a de im&#65533;genes simples. Utiliza la configuraci&#65533;n predeterminada

			$('.fancybox').fancybox();

			// Diferentes efectos 

			$('.fancybox').fancybox().trigger("click");

			// Change title type, overlay closing speed
			$(".fancybox-effects-a").fancybox({
				helpers: {
					title : {
						type : 'outside'
					},
					overlay : {
						speedOut : 0
					}
				}
			});

			// Disable opening and closing animations, change title type
			$(".fancybox-effects-b").fancybox({
				openEffect  : 'none',
				closeEffect	: 'none',

				helpers : {
					title : {
						type : 'over'
					}
				}
			});

			// Set custom style, close if clicked, change title type and overlay color
			$(".fancybox-effects-c").fancybox({
				wrapCSS    : 'fancybox-custom',
				closeClick : true,

				openEffect : 'none',

				helpers : {
					title : {
						type : 'inside'
					},
					overlay : {
						css : {
							'background' : 'rgba(238,238,238,0.85)'
						}
					}
				}
			});

			// Remove padding, set opening and closing animations, close if clicked and disable overlay
			$(".fancybox-effects-d").fancybox({
				padding: 0,

				openEffect : 'elastic',
				openSpeed  : 150,

				closeEffect : 'elastic',
				closeSpeed  : 150,

				closeClick : true,

				helpers : {
					overlay : null
				}
			});

			// Button helper. Disable animations, hide close button, change title type and content
			

			$('.fancybox-buttons').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',

				prevEffect : 'none',
				nextEffect : 'none',

				closeBtn  : false,

				helpers : {
					title : {
						type : 'inside'
					},
					buttons	: {}
				},

				afterLoad : function() {
					this.title = 'Image ' + (this.index + 1) + ' of ' + this.group.length + (this.title ? ' - ' + this.title : '');
				}
			});


			// Thumbnail helper. Disable animations, hide close button, arrows and slide to next gallery item if clicked

			$('.fancybox-thumbs').fancybox({
				prevEffect : 'none',
				nextEffect : 'none',

				closeBtn  : false,
				arrows    : false,
				nextClick : true,

				helpers : {
					thumbs : {
						width  : 50,
						height : 50
					}
				}
			});

			// Media helper. Group items, disable animations, hide arrows, enable media and button helpers.
			
			$('.fancybox-media')
				.attr('rel', 'media-gallery')
				.fancybox({
					openEffect : 'none',
					closeEffect : 'none',
					prevEffect : 'none',
					nextEffect : 'none',

					arrows : false,
					helpers : {
						media : {},
						buttons : {}
					}
				});

			// Open manually			
			
			
			$("#fancybox-manual-a").click(function() {
				$.fancybox.open('1_b.jpg');
			});

			$("#fancybox-manual-b").click(function() {
				$.fancybox.open({
					href : 'iframe.html',
					type : 'iframe',
					padding : 5
				});
			});

			$("#fancybox-manual-c").click(function() {
				$.fancybox.open([
					{
						href : '1_b.jpg',
						title : 'My title'
					}, {
						href : '2_b.jpg',
						title : '2nd title'
					}, {
						href : '3_b.jpg'
					}
				], {
					helpers : {
						thumbs : {
							width: 75,
							height: 50
						}
					}
				});
			});


		});
	</script>


<!--#include file="X001Z001.INC"-->
</head>


<script  >

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
	
	wOBS = ""
	
	SQL = "SELECT Z300002OBS, Z300002UR1 " 	
	SQL = SQL & " FROM X300ZF002 "
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300002CCI = '" & Session("glCiaInternet") & "' "
	
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	If NOT rstQuery.EOF Then	
		wOBS = trim(rstQuery.Fields("Z300002OBS"))
		wURI = trim(rstQuery.Fields("Z300002UR1"))
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
	
	wURI = Replace(wURI," ","%20")
	wURI = "../ASPX/" & wURI 

%>

<body onload="FP_preloadImgs(/*url*/'images/button69.jpg', /*url*/'images/button6A.jpg'); javascript:window.status='<%=Request.ServerVariables("URL") & " ( Usuario: " & Session("glUsuarioNombre") & " )" %>'" scroll=auto topmargin="0" leftmargin="18" rightmargin="0" bottommargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>">


<% IF LEN(TRIM(wURI)) > 0 and TRIM(wURI) <> "../ASPX/"  THEN %>	
<!--	<a class="fancybox" href="<%=wURI%>"></a>-->
<% END IF %>	





<!-- Inicio Div PopUp-->

<script type="text/javascript">
    function ocultar () {
    
        if (document.getElementById('popupNuevo').style.visibility == "hidden" || document.getElementById('popupNuevo').style.visibility == "") 
        {
            document.getElementById('popupNuevo').style.visibility = "visible";
        }
        else
        {
            document.getElementById('popupNuevo').style.visibility = "hidden";
        }
    
    }
</script>




<table width="919" bgcolor="#FFFFFF" border="0"  cellpadding="0" height="100%" align="center">
<tr>
<td bgcolor="#FFFFFF" valign="top">



<table width="919" bgcolor="#FFFFFF" border="0" cellpadding="0" cellspacing="0" >
<tr>
<td bgcolor="#FFFFFF" valign="top">
<p align="center" style="margin-top: 3px; margin-bottom: 3px">
     

 
<p align="center" style="margin-top: 5px; margin-bottom: 3px">&nbsp;</p>
 
<table align="center"   cellspacing="0" cellpadding="0" width="605" bordercolor="<%=Request.Cookies("CAR")("Color1")%>" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" style="padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px;" id="table6" border="1">
	

  <tr>
    <td width="79%" bgcolor="white" height="30">
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
					</p> 

					
				</td>
				<td width="32%" align="left" valign="middle">
									<font face="Tahoma" size="2" onclick="javascript:window.open('X001A100_A.asp?CLA001=','main')" style="CURSOR: pointer">
				<p style="margin-top: 5px">&nbsp;<b>Crear Pedido</b></p> 	</font>	

				
				</td>
				<td  align="center" width="1%"> 
				<p style="margin-top: 3px"> 
				</td>

				<td width="8%" align="center" > 
				
					<p style="margin-top: 3px"> 
				
					<img alt border="0" src="images/X002BV301.ICO" WIDTH="32" HEIGHT="32" onclick="javascript:window.open('X001A100_S.asp?NOMTAB=X300BQ100','main')" style="CURSOR: pointer">
				</td>
				<td width="25%" align="left" valign="middle">
				<font face="Tahoma" size="2" onclick="javascript:window.open('X001A100_S.asp?NOMTAB=X300BQ100','main')" style="CURSOR: pointer">
				<p style="margin-top: 3px">&nbsp;Pedidos No Procesados		</p> 	</font>					
				
				</td>
				
			</tr>
			<tr>
				<td  align="center" width="7%"> 
				</td>
				<td width="7%" align="center" > 
									
					<img alt border="0" src="images/X000ZV500B.ICO" WIDTH="32" HEIGHT="32" onclick="javascript:window.open('X001A100_S.asp?NOMTAB=X300BQ100H','main')" style="CURSOR: pointer">
				</td>
				<td width="32%" align="left" valign="middle">
				<font face="Tahoma" size="2" onclick="javascript:window.open('X001A100_S.asp?NOMTAB=X300BQ100H','main')" style="CURSOR: pointer">
				&nbsp;Pedidos Procesados (<b>Web</b>)</td>
				
				<% IF Session("glTipoUsuario") = "C" THEN 'OR Session("glTipoUsuario") = "V" %>
				<td  align="center" width="1%"> 
				</td>

				<td width="8%" align="center" > 
				
					<img alt border="0" src="images/gpago.png" onclick="javascript:window.open('X001A004.asp','main')" style="CURSOR: pointer"></td>
				<td width="25%" align="left" valign="middle">
				
				<font face="Tahoma" size="2" onclick="javascript:window.open('X001A004.asp','main')" style="CURSOR: pointer">
				&nbsp;Pagos
				</td>
				<%END IF %>		
				
				<% IF Session("glTipoUsuario") = "G" OR Session("glTipoUsuario") = "A" OR Session("glTipoUsuario") = "V" THEN %>
				<td  align="center" width="1%"> 
				</td>

				<td width="12%" align="center" > 
				
					<img alt border="0" src="images/X000ZV500B.ICO" WIDTH="32" HEIGHT="32" onclick="javascript:window.open('X001A100M_S.asp','main')" style="CURSOR: pointer"></td>
				<td width="11%" align="left" valign="middle">
				
				<font face="Tahoma" size="2" onclick="javascript:window.open('X001A100M_S.asp','main')" style="CURSOR: pointer">
				&nbsp;Pedidos Procesados (<b>Móvil</b>)</td>
				<%END IF %>				
			
			</tr>
			
			
				<!--Nuevo-->
				<tr>
				<td  align="center" width="7%"> 
				</td>
				<td width="7%" align="center" > 
					<!--				
					<img alt border="0" src="images/logosencamer.png" WIDTH="32" HEIGHT="32" onclick="javascript:window.open('X001A002.asp','main')" style="CURSOR: pointer">-->
				</td>
				<td width="32%" align="left" valign="middle">
				<!--<font face="Tahoma" size="2" onclick="javascript:window.open('X001A002.asp','main')" style="CURSOR: pointer">&nbsp;Sencamer 
				Productos Importados--></td>
				<td  align="center" width="1%"> 
				</td>
				</tr>	
						
				<% IF Session("glTipoUsuario") = "C" OR Session("glTipoUsuario") = "V" THEN%>
				<!--<tr>
				
				<td align="center" colspan="8"  height="35px" valign="center"  > 
					<p style="margin-top: 3px">
					<table>			
					<tr><td>
					<img alt border="0" src="images/pdf.jpg" WIDTH="32" HEIGHT="32" onclick="javascript:window.open('Instructivo_Uso_Web.pdf','_pdf')" style="CURSOR: pointer"> 
					 </td>
					 <td>
					 <font face="Tahoma" size="2" onclick="javascript:window.open('Instructivo_Uso_Web.pdf','_pdf')" style="CURSOR: pointer; font-weight:700">
					 &nbsp;Instructivo Uso General de la Web</font> 
					 </td> 
					 </tr>
					 </table> 
					 </td>
				</tr>-->
			<% END IF %>
				
			
			<!--FIN-->
				
			<% IF session("glTipoUsuario") = "A" THEN %>
			<tr>
				
				<td align="center" colspan="8"  height="35px" valign="center"  > 
					<p style="margin-top: 3px">
					<table>			
					<tr><td>
					<img alt border="0" src="images/acceso.gif" WIDTH="32" HEIGHT="32" onclick="javascript:window.open('X001X140.asp','main')" style="CURSOR: pointer"> 
					 </td>
					 <td>
					 <font face="Tahoma" size="2" onclick="javascript:window.open('X001X140.asp','main')" style="CURSOR: pointer; font-weight:700">
					 &nbsp;Cambiar Contraseña</font> 
					 </td> 
					 </tr>
					 </table> 
					 </td>
				
			
			</tr>
			
			<% END IF %>
		</table></td>


	</tr>
</table>

<p align="center">

<% 
IF LEN(TRIM(wOBS)) > 0 THEN
%>

<table border="0" width="605" align="center">
<tr><td align="center"  >
<i><u><font face="Arial"><b>NOTAS DE INTERÉS </b></font></u></i>
</td> 
</tr> 
<tr><td align="center"  >
<p align="center">
<%
	Response.write wOBS

%>
</p>
</td> 
</tr> 
</table> 

<% END IF %>
</p> 
<br>



<%

 on error resume next

    sUser2 = ""
    aSessions = dOnlineUsers.Keys
    for iUser = 0 to dOnlineUsers.Count - 1
        sKey = aSessions(iUser)
        sUserInfo = dOnlineUsers.Item(sKey)
        aUserInfo = split(sUserInfo, "<|>")
        
        sUser = aUserInfo(0)
        sUserName = aUserInfo(1)
        sVisitor = aUserInfo(2)
        sLastActionTime = aUserInfo(3)
        sCCI = trim(aUserInfo(5))
       
       	'response.write sCCI  & "-" & sUser & "<br>"        
        If sUser <> "" and sUserInfo <> "" AND Session("glCiaInternet") = sCCI Then  

        	IF sUser2 <> sUser THEN
        		
	        	iUsrCount = iUsrCount + 1  
	        	sUser2 = sUser     
        	END IF 
        End If
        sNickName = ""
        
    next
  
    %>

<p style="margin-top: 10px; margin-bottom: 1px">

<% IF Session("glTipoUsuario") <> "C" THEN %>
<table align="center" >
<tr>
		<td>
		<img src="images/Usuario.jpg" >
		</td>
      <td valign="center"  >
      <font face="Tahoma" style="font-size: 9pt; font-weight:700">Usuarios 
	  Conectados <%= iUsrCount %> de <%= wUsuarios%> </font> 
      </td>
      </tr>
      
      
</table>

<p align="center" style="margin-top: 0; margin-bottom: 0"><font color="#0000FF">

 <font face="Tahoma" onclick="javascript:window.open('X001A003.asp','main')" style="CURSOR: pointer;font-size: 9pt; font-weight:700" >
Pulse Aquí para ver Usuarios Conectados  </font> 

<% END IF %>
</font> </p> 

	<p align=center style="margin-top: 20px; margin-left:0px; margin-right:0px; margin-bottom:0">
	
	<table border ="0" align="center" >
	
		<tr><td align="center"  >

<% IF LEN(TRIM(wURI)) > 0 and TRIM(wURI) <> "../ASPX/"  THEN %>	
	<img border="0" src="<%=wURI%>" ></td></tr>
<% END IF %>	
		</table> 
		
</font></p>
<p align=justify style="margin-top: 30px; margin-left:55px; margin-right:55px">
		&nbsp;</p>
	


		</td>
        </tr>
                
        

        
        
        
        
               </table>
  		
		
</body>
</html>