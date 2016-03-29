<html> 

<head> 
<title>Salon de conversación</title> 
</head> 

<FRAMESET rows="*,70"> 
<FRAME SRC="visualizacion.asp"> 
<FRAME SRC="incluir.asp" target="_self"> 
</FRAMESET> 

</html> 

6.- Para que quede "bonito" mostraremos el chat en una nueva ventana sin barras y mas pequeña, eso lo haremos con javaScript 

<HTML> 
<HEAD> 
<script language="JavaScript"> 
<!-- 
function openWindow(url, name) { 
popupWin = window.open(url, name, 'scrollbars,resizable,width=400,height=350') 
} 
// --> 
</script> 
</HEAD> 
<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#000000" VLINK="#000000"> 
<a HREF="javascript:openWindow('default.asp', 'minichat');">Enter chatroom</a> 
</BODY> 
</HTML> 