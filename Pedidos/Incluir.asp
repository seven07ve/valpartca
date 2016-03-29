<% 
IF Request.Cookies("Apodo")="" and request.form("opinion")<>"" THEN 
if request.form("apodo")<>"" then 
Response.Cookies("Apodo")=Request.Form("Apodo") 
else 
Response.Cookies("Apodo")="Anonimo" 
end if 
Application.Lock 
Temporal=Application("Opiniones") 
FOR i=7 TO 0 STEP -1 
Temporal(i+1)=Temporal(i) 
NEXT 
if request.form("apodo")<>"" then 
Temporal(0)="<FONT COLOR=""#000000"">** " & Request.Form("Apodo") & " ** Entra en el minichat</FONT>" 
else 
Temporal(0)="<FONT COLOR=""#000000"">** Anonimo ** Entra en el minichat</FONT>" 
end if 
Application("Opiniones")=Temporal 
Application.Unlock 

END IF 
IF Request.Form("Opinion")<>"" THEN 
Apodo=Request.Cookies("Apodo") 
Application.Lock 
Temporal=Application("Opiniones") 
FOR i=7 TO 0 STEP -1 
Temporal(i+1)=Temporal(i) 
NEXT 
Temporal(0)=Apodo&": "&Request.Form("Opinion") 
Application("Opiniones")=Temporal 
Application.Unlock 
END IF%> 

<html> 

<head> 
<title>incluir opinion</title> 
<base target="_self"> 
</head> 

<body bgcolor="#6699FF"> 
<FORM METHOD="POST" ACTION="incluir.asp"> 
<% IF Request.Cookies("Apodo")="" THEN %> 
<font color="#FFFFFF"> 
Apodo:</font> <INPUT TYPE="TEXT" SIZE=10 NAME="Apodo"> 
<input type="hidden" name="go" size="20" value="si"><BR> 
<% END IF %> 
<INPUT TYPE="TEXT" SIZE=30 NAME="Opinion"> 
<INPUT TYPE="SUBMIT" VALUE="Enviar">         
<a href="cerrar.asp" target="_top">Salir</a> 
</FORM> 
</body> 

</html> 
