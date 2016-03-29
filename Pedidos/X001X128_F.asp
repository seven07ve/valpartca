<%

wNOMTAB = TRIM(Request.QueryString("NOMTAB"))
wCAMC01 = TRIM(Request.QueryString("CAMC01"))
wCAMC02 = TRIM(Request.QueryString("CAMC02"))
wCAMC03 = TRIM(Request.QueryString("CAMC03"))
wCAMC04 = TRIM(Request.QueryString("CAMC04"))
wCAMC05 = TRIM(Request.QueryString("CAMC05"))
wCAMC06 = TRIM(Request.QueryString("CAMC06"))
wCAMC07 = TRIM(Request.QueryString("CAMC07"))
wTITULO = TRIM(Request.QueryString("TITULO"))
wURLACT = TRIM(Request.QueryString("URLACT"))

wTIT = wTITULO

wURL  = "X001X128"   'Colocar nombre principal de pagina
'wPAR = wPAR & "?URLACT=" & wURL & "_A.ASP"
wPAR = wPAR & "?URLACT=" & wURLACT
wPAR = wPAR & "&URLIMP=" & wURL & ".ASP"
wPAR = wPAR & "&URLPRI=" & wURL & "_S.ASP?NOMTAB=" & wNOMTAB
wPAR = wPAR & "&URLTIT=" & wTIT
wPAR = wPAR & "&NOMTAB=" & wNOMTAB
wPAR = wPAR & "&CAMC01=" & wCAMC01
wPAR = wPAR & "&CAMC02=" & wCAMC02    
wPAR = wPAR & "&CAMC03=" & wCAMC03
wPAR = wPAR & "&CAMC04=" & wCAMC04
wPAR = wPAR & "&CAMC05=" & wCAMC05
wPAR = wPAR & "&CAMC06=" & wCAMC06
wPAR = wPAR & "&CAMC07=" & wCAMC07

wURLH = wURL & "_H.ASP" & wPAR
wURLD = wURL & ".ASP" & wPAR
wURLP = wURL & "_P.ASP" & wPAR
Session("glUrlBuscar") = wURL & "_S.ASP?NOMTAB=" & wNOMTAB
Session("glUrlBuscarDetalle") = wURLD
 
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title><%=wTIT%></title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
</head>

<% If Session("glTipoUsuario") <> "A" then %>

<frameset rows="52,*,60" framespacing="0" border="0" frameborder="0">
<% ELSE %>
<frameset rows="52,*,110" framespacing="0" border="0" frameborder="0">
<% END IF %>
  <frame name="top" scrolling="no" noresize target="contents" src="<%=wURLH%>">
  <frame name="main1"  src="<%=wURLD%>"  target="main1" scrolling="auto" >
  <frame name="footer" scrolling="no" noresize  src="<%=wURLP%>" target="main1">
  <noframes>
  <body>

  <p>This page uses frames, but your browser doesn't support them.</p>

  </body>
  </noframes>
</frameset>

</html>
