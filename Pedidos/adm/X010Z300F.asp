<%

wNOMTAB = TRIM(Request.QueryString("NOMTAB"))

wURLACT = TRIM(Request.QueryString("URLACT"))
wSTSPED = TRIM(Request.QueryString("STSPED"))



wURL  = "X010Z300"   'Colocar nombre principal de pagina
'wPAR = wPAR & "?URLACT=" & wURL & "_A.ASP"
wPAR = wPAR & "?URLACT=" & wURLACT
wPAR = wPAR & "&URLIMP=" & wURL & ".ASP"
wPAR = wPAR & "&URLPRI=" & wURL & "_S.ASP?NOMTAB=" & wNOMTAB
wPAR = wPAR & "&NOMTAB=" & wNOMTAB
wPAR = wPAR & "&STSPED=" & wSTSPED

wURLH = wURL & "H.ASP" & wPAR
wURLD = wURL & ".ASP" & wPAR
wURLP = wURL & "P.ASP" & wPAR
Session("glUrlBuscar") = wURLD
Session("glUrlBuscarDetalle") = wURLD

IF TRIM(Session("glUsuario")) = "" THEN
	Response.redirect "ADM.ASP"
END IF 
 
%>

<html>

<head>


<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Actualizar Noticias del Web Site de Carvica</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.3)">
</head>

<frameset rows="121,*" framespacing="0" border="0" frameborder="0">
   <frame name="header" scrolling="no" noresize target="main" src="admh.asp">  
  <frame name="footer" scrolling="no" noresize target="contents" src="X010Z300FI.ASP">
  <noframes>														  
  <body>

  <p>This page uses frames, but your browser doesn't support them.</p>

  </body>
  </noframes>
</frameset>

</html>
