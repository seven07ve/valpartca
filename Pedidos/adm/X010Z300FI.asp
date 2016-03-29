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
 
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Actualizar Noticias del Web Site de Carvica</title>
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
</head>

<frameset rows="57,*,40" framespacing="0" border="0" frameborder="0">   
  <frame name="top" scrolling="no" noresize target="contents" src="<%=wURLH%>">
  <frame name="main" src="<%=wURLD%>" scrolling="auto">
  <frame name="footer" scrolling="no" noresize target="contents" src="<%=wURLP%>">
  <noframes>
  <body>

  <p>This page uses frames, but your browser doesn't support them.</p>

  </body>
  </noframes>
</frameset>

</html>
