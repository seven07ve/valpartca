<%

wTITULO = TRIM(Request.QueryString("TITULO"))
wCAMC01 = TRIM(Request.QueryString("CAMC01"))
wURLACT = TRIM(Request.QueryString("URLACT"))

wTIT = wTITULO

wURL  = "X001W100"   'Colocar nombre principal de pagina
'wPAR = wPAR & "?URLACT=" & wURL & "_A.ASP"
wPAR = wPAR & "?URLACT=" & wURLACT
wPAR = wPAR & "&URLIMP=" & wURL & ".ASP"
wPAR = wPAR & "&URLPRI=" & wURL & ".ASP"
wPAR = wPAR & "&URLTIT=" & wTIT
wPAR = wPAR & "&CAMC01=" & wCAMC01

wURLH = wURL & "_H.ASP" & wPAR
wURLD = wURL & ".ASP" & wPAR
wURLP = wURL & "_P.ASP" & wPAR
Session("glUrlBuscar") = wURL & ".ASP"
 
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title><%=wTIT%></title>
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
</head>

<frameset rows="60,*,30" framespacing="0" border="0" frameborder="0">
  <frame name="top" scrolling="no" noresize target="contents" src="<%=wURLH%>">
  <frame name="main1"  src="<%=wURLD%>"  target="main1" scrolling="auto">
  <frame name="footer" scrolling="no" noresize  src="<%=wURLP%>" target="main1">
  <noframes>
  <body>

  <p>This page uses frames, but your browser doesn't support them.</p>

  </body>
  </noframes>
</frameset>

</html>
