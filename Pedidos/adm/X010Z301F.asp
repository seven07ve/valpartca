<%@ Language=VBScript %>
<%
wCLA = TRIM(Request.QueryString("CODCOR"))		
'bgcolor="#0000ff" 'Azul 1
bgcolor="#336699"


%>

<HTML>
<head>

<title>.::Modulo de Actualización del Web Site de Carvica::.</title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
</head>
<frameset framespacing="0" border="0" rows="124,*" frameborder="0">
  <frame name="header" scrolling="no" noresize target="main" src="admh.asp">
  <frame name="main2" src="X010Z301.asp?CODCOR=<%=wCLA%>" scrolling="auto">
  <noframes>
  <body>

  <p>This page uses frames, but your browser doesn't support them.</p>

  </body>
  </noframes>
</frameset>
</HTML>