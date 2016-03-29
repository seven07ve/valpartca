<html>
<head> 
<title>Prueba chat</title> 
<link href="chat.css" rel="stylesheet" type="text/css" /> 
</head>
<body>

<br>
<center>
Aqui pongan el contenido de su pagina.
</center>
<br>



<div id="taskbar"> 
	<div id="container"> 
		<a href="#" id="chata">Insystech</a> 
		<div id="chat">



		
<%

 on error resume next
    response.write "<table cellpadding=""2"" cellspacing=""1"" border=""0"" width=""600"" align=""center"">"        
    response.write "<tr><td align=""left""><strong><font face=""Tahoma"" style=""font-size: 8pt;"">Usuario</font></strong></td>"
    'response.write "<td align=""left""><strong><font face=""Tahoma"" style=""font-size: 8pt;"">Nombre</font></strong></td>"
    'response.write "<td align=""left""><strong><font face=""Tahoma"" style=""font-size: 8pt;"">Visitante Nro.</font></strong></td>"
    'response.write "<td align=""left""><strong><font face=""Tahoma"" style=""font-size: 8pt;"">Hora</font></strong></td>"
    Response.write "</tr>"
    
    aSessions = dOnlineUsers.Keys
    for iUser = 0 to dOnlineUsers.Count - 1
        sKey = aSessions(iUser)
        sUserInfo = dOnlineUsers.Item(sKey)
        aUserInfo = split(sUserInfo, "<|>")
        
        sUser = aUserInfo(0)
        sUserName = aUserInfo(1)
        sVisitor = aUserInfo(2)
        sLastActionTime = aUserInfo(3)
        
        If sUserInfo <> "" Then
        	iUsrCount = iUsrCount + 1
        	response.write "<tr>" '<td align=""right""><font face=""Tahoma"" style=""font-size: 8pt;"">" & iUsrCount & ".</font></td>"
        	response.write "<td align=""left""><font face=""Tahoma"" style=""font-size: 8pt;"">" & sUser & "</font></td>"
        	'response.write "<td align=""left""><font face=""Tahoma"" style=""font-size: 8pt;"">" & sUserName & "</font></td>"
        	'response.write "<td><font face=""Tahoma"" style=""font-size: 8pt;"">" & sVisitor & "</font></td>"
        	Response.write "</tr>"
        End If
        
    next
    response.write "</table>"
    %>




		</div> 
	</div> 
</div>
 
<script src="jquery.min.js" type="text/javascript"></script> 
<script src="mensaje.js" type="text/javascript"></script> 
<script src="global.js" type="text/javascript"></script>