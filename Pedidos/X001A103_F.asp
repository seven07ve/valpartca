<%

'wNOMTAB = TRIM(Request.QueryString("NOMTAB"))

wTITULO = TRIM(Request.QueryString("URLTIT"))
wCLA001 = TRIM(Request.QueryString("CLA001"))
wCLA002 = TRIM(Request.QueryString("CLA002"))
wCLA003 = TRIM(Request.QueryString("CLA003"))
wCLA004 = TRIM(Request.QueryString("CLA004"))
wCLA005 = TRIM(Request.QueryString("CLA005"))

'wURLACT = TRIM(Request.QueryString("URLACT"))

wTIT = wTITULO

wURL  = "X001A103"   'Colocar nombre principal de pagina
'wPAR = wPAR & "?URLACT=" & wURL & "_A.ASP"
wPAR = wPAR & "?URLACT=" & wURLACT
wPAR = wPAR & "&URLIMP=" & wURL & ".ASP"
'wPAR = wPAR & "&URLPRI=" & wURL & "_S.ASP?NOMTAB=" & wNOMTAB
wPAR = wPAR & "&URLTIT=" & wTIT
wPAR = wPAR & "&CLA001=" & wCLA001
wPAR = wPAR & "&CLA002=" & wCLA002    
wPAR = wPAR & "&CLA003=" & wCLA003    
wPAR = wPAR & "&CLA004=" & wCLA004    
wPAR = wPAR & "&CLA005=" & wCLA005    


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

<frameset rows="55,*" framespacing="0" border="0" frameborder="0">
  <frame name="top222" scrolling="no" noresize target="contents" src="<%=wURLH%>">
  <frame name="main133"  src="<%=wURLD%>"  target="main1" scrolling="auto">

  <noframes>
  <body>

  <p>This page uses frames, but your browser doesn't support them.</p>

  </body>
  </noframes>
</frameset>

</html>
