<%

wNOMTAB = TRIM(Request.QueryString("NOMTAB"))
wTITULO = TRIM(Request.QueryString("TITULO"))
wURLACT = TRIM(Request.QueryString("URLACT"))
wSTSPED = TRIM(Request.QueryString("STSPED"))

wTIT = wTITULO

wURL  = "X001A100"   'Colocar nombre principal de pagina
'wPAR = wPAR & "?URLACT=" & wURL & "_A.ASP"
wPAR = wPAR & "?URLACT=" & wURLACT
wPAR = wPAR & "&URLIMP=" & wURL & ".ASP"
wPAR = wPAR & "&URLPRI=" & wURL & "_S.ASP?NOMTAB=" & wNOMTAB
wPAR = wPAR & "&URLTIT=" & wTIT
wPAR = wPAR & "&NOMTAB=" & wNOMTAB
wPAR = wPAR & "&STSPED=" & wSTSPED

wURLH = wURL & "_H.ASP" & wPAR
wURLD = wURL & ".ASP" & wPAR
wURLP = wURL & "_P.ASP" & wPAR
Session("glUrlBuscar") = wURLD
Session("glUrlBuscarDetalle") = wURLD
 
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title><%=wTIT%></title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
</head>

<frameset rows="57,*,70" framespacing="0" border="0" frameborder="0">
  <frame name="top" scrolling="no" noresize target="contents" src="<%=wURLH%>">
  <frame name="main1"  src="<%=wURLD%>"  target="main1" scrolling="auto">
  <frame name="footer2" scrolling="no" noresize  src="<%=wURLP%>" target="main1">
  <noframes>
  <body>

  <p>This page uses frames, but your browser doesn't support them.</p>

  </body>
  </noframes>
</frameset>

</html>
