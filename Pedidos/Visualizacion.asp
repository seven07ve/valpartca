<% PaginaActual="http://"&_ 
Request.ServerVariables("SERVER_NAME")&_ 
Request.ServerVariables("SCRIPT_NAME") %> 
<html> 

<head> 
<META HTTP-EQUIV="REFRESH" CONTENT="5;<%=PaginaActual%>"> 
<title>MiniChat (visualización)</title> 
</head> 

<body> 
<FONT FACE="Comic Sans MS" COLOR="Blue" size="1"> 
<% 
IF NOT isArray( Application("Opiniones")) THEN 
Application.Lock 
Dim Auxiliar() 
Redim Auxiliar(9) 
Application("Opiniones")=Auxiliar 
Application.UnLock 
END IF 

Temporal=Application("Opiniones") 
FOR Opinion=8 to 0 step -1%> 
<%= Temporal(Opinion) %> <BR> 
<% NEXT %> 
<FONT> 
<p>&nbsp;</p>
</body> 

</html> 
