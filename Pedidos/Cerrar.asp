<% if Request.cookies("Apodo")<>"" then 
Application.Lock 
Temporal=Application("Opiniones") 
FOR i=7 TO 0 STEP -1 
Temporal(i+1)=Temporal(i) 
NEXT 
Temporal(0)="<FONT COLOR=""#FF0000"">** " &Request.cookies("Apodo")&" ** Se va del minichat</FONT>" 
Application("Opiniones")=Temporal 
Application.Unlock 
response.cookies("apodo")="" 

END IF%> 
<HTML> 
<HEAD> 
<script language="JavaScript"> 
{close();} 
</SCRIPT> 
</HEAD> 
<BODY> 
</BODY> 
</HTML> 
