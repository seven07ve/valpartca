<%@ Language=VBScript %>
<%
'Variables session o globales
'Session("glConexion") = "ACCESS"
Session("glConexion") = "SQL"

'Session("glUsuario") = ""
Session("glCiaInternet") = ""
Session("glNombreCiaInternet") = "."	

'Colores

'bgcolor="#0000ff" 'Azul 1
bgcolor="#336699"


%>

<HTML>
<head>
<title>.: DCM, C.A. - Pedidos por Internet :.</title>
<meta name="GENERATOR" content="Microsoft FrontPage 12.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.2)">
</head>

<%
Response.redirect ".."
Response.End
%>

<frameset framespacing="0" border="0" rows="114,*" frameborder="0">
  <frame name="header" scrolling="no" noresize target="main" src="DEFAULTH.asp">
  <frame name="main" src="DEFAULTB.ASP" scrolling="auto">
  <noframes>
  <body>

  <p>This page uses frames, but your browser doesn't support them.</p>

  </body>
  </noframes>
</frameset>
</HTML>