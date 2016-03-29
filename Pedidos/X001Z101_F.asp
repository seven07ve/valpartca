<%



wNOMTAB = TRIM(Request.QueryString("NOMTAB"))
wTITULO = TRIM(Request.QueryString("TITULO"))
wCLA001 = TRIM(Request.QueryString("CLA001"))
wCLA002 = TRIM(Request.QueryString("CLA002"))
wCLA003 = TRIM(Request.QueryString("CLA003"))
wSTSPED = TRIM(Request.QueryString("STSPED"))

wURLTIT = TRIM(Request.QueryString("URLTIT")) 
wURLACT = TRIM(Request.QueryString("URLACT"))
wREG = TRIM(Request.QueryString("REG"))
wCOD = TRIM(Request.Form("CODIGO"))
wDES = TRIM(Request.Form("DESCRIPCION"))
wFAM = TRIM(Request.Form("FAMILIA"))
wPIN = TRIM(Request.Form("PIN"))
'''

wURLD = "X001Z101D.asp?URLTIT=" & wURLTIT
wURLD = wURLD & "&CLA001=" & wCLA001  
wURLD = wURLD & "&CLA002=" & wCLA002  
wURLD = wURLD & "&CLA003=" & wCLA003 
wURLD = wURLD & "&CLA004=" & wDES  
wURLD = wURLD & "&CLA005=" & wFAM  
wURLD = wURLD & "&CLA006=" & wPIN  
wURLD = wURLD & "&STSPED=" & wSTSPED

'Response.write wURLD
'Response.end

'''


wTIT = wTITULO

wURL  = "X001Z101D"   'Colocar nombre principal de pagina
'wPAR = wPAR & "?URLACT=" & wURL & "_A.ASP"
wPAR = wPAR & "?URLACT=" & wURLACT
wPAR = wPAR & "&URLIMP=" & wURL & ".ASP"
wPAR = wPAR & "&URLPRI=" & wURL & "_S.ASP?NOMTAB=" & wNOMTAB
wPAR = wPAR & "&URLTIT=" & wTIT
wPAR = wPAR & "&CAMC01=" & wCLA001
wPAR = wPAR & "&CAMC02=" & wCLA002    
wPAR = wPAR & "&CLA003=" & wCLA003
wPAR = wPAR & "&CLA004=" & wDES 
wPAR = wPAR & "&CLA005=" & wFAM    
wPAR = wPAR & "&CLA006=" & wPIN
wPAR = wPAR & "&STSPED=" & wSTSPED

wURLH = "X001Z101_H.ASP" & wPAR

wURLP = "X001A115_P.ASP" & wPAR


Session("glUrlBuscar") = wURLD
 
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title><%=wTIT%></title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
</head>



	 <frameset rows="60,*,100" framespacing="0" border="0" frameborder="0">
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

