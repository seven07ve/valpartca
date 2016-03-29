<%



wNOMTAB = TRIM(Request.QueryString("NOMTAB"))
wTITULO = TRIM(Request.QueryString("TITULO"))
wCAMC01 = TRIM(Request.QueryString("CAMC01"))
wCAMC02 = TRIM(Request.QueryString("CAMC02"))
wURLTIT = TRIM(Request.QueryString("URLTIT"))
wURLD = TRIM(Request.QueryString("URLD"))
wURLD2 = wURLD 
wURLACT = TRIM(Request.QueryString("URLACT"))
wREG = TRIM(Request.QueryString("REG"))
wCOD = TRIM(Request.Form("CODIGO"))
wDES = TRIM(Request.Form("DESCRIPCION"))
wFAM = TRIM(Request.Form("FAMILIA"))



wTIT = wTITULO

wURL  = "X001X131"   'Colocar nombre principal de pagina
'wPAR = wPAR & "?URLACT=" & wURL & "_A.ASP"
wPAR = wPAR & "?URLACT=" & wURLACT
wPAR = wPAR & "&URLIMP=" & wURL & ".ASP"
wPAR = wPAR & "&URLPRI=" & wURL & "_S.ASP?NOMTAB=" & wNOMTAB
wPAR = wPAR & "&URLTIT=" & wTIT
wPAR = wPAR & "&CAMC01=" & wCAMC01
wPAR = wPAR & "&CAMC02=" & wCAMC02    


wURLH = wURL & "_H.ASP" & wPAR
wURLD = wURL & ".ASP" & wPAR
wURLP = wURL & "_P.ASP" & wPAR



Session("glUrlBuscar") = wURLD
 
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title><%=wTIT%></title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
</head>


  
 <frameset rows="55,*,50" framespacing="0" border="0" frameborder="0">
 <frame name="top" scrolling="no" noresize target="contents" src="<%=wURLH%>">

  

  <frame name="main1"  src="<%=wURLD%>"  target="main1" scrolling="yes">
  
  <% IF wREG <> "S" THEN %>
  <frame name="footer" scrolling="no" noresize  src="<%=wURLP%>" target="main1">
  <% END IF %>
  
  <noframes>
  <body>

  <p>This page uses frames, but your browser doesn't support them.</p>

  </body>
  </noframes>
</frameset>


</html>

