<%



wNOMTAB = TRIM(Request.QueryString("NOMTAB"))
wTITULO = TRIM(Request.QueryString("TITULO"))
wCAMC01 = TRIM(Request.QueryString("CAMC01"))
wCAMC02 = TRIM(Request.QueryString("CAMC02"))


wURLTIT = TRIM(Request.QueryString("URLTIT")) 
wURLACT = TRIM(Request.QueryString("URLACT"))
wREG = TRIM(Request.QueryString("REG"))
wCOD = TRIM(Request.Form("CODIGO"))
wDES = TRIM(Request.Form("DESCRIPCION"))
wFAM = TRIM(Request.Form("FAMILIA"))
wPIN = TRIM(Request.Form("PIN"))
wCGR = TRIM(Request.Form("MODELO"))
'''

wCLA001 = Request.QueryString("CAMC01") 
wCLA002 = Request.QueryString("CAMC02") 
wCOD = Request.QueryString("CLA003") 
wDES = Request.QueryString("CLA004")
wFAM = Request.QueryString("CLA005")  
wPIN = Request.QueryString("CLA006")  
wSUB = Request.QueryString("CLA007")
wCGR = Request.QueryString("CLA008")  

wURLD = "X001Z100D.asp?URLTIT=" & wURLTIT
wURLD = wURLD & "&CLA001=" & wCLA001  
wURLD = wURLD & "&CLA002=" & wCLA002  
wURLD = wURLD & "&CLA003=" & wCOD  
wURLD = wURLD & "&CLA004=" & wDES  
wURLD = wURLD & "&CLA005=" & wFAM  
wURLD = wURLD & "&CLA006=" & wPIN  
wURLD = wURLD & "&CLA007=" & wSUB 
wURLD = wURLD & "&CLA008=" & wCGR  
'''


wTIT = wTITULO

wURL  = "X001Z100D"   'Colocar nombre principal de pagina
'wPAR = wPAR & "?URLACT=" & wURL & "_A.ASP"
wPAR = wPAR & "?URLACT=" & wURLACT
wPAR = wPAR & "&URLIMP=" & wURL & ".ASP"
wPAR = wPAR & "&URLPRI=" & wURL & "_S.ASP?NOMTAB=" & wNOMTAB
wPAR = wPAR & "&URLTIT=" & wTIT
wPAR = wPAR & "&CAMC01=" & wCAMC01
wPAR = wPAR & "&CAMC02=" & wCAMC02    
wPAR = wPAR & "&CLA004=" & wDES 
wPAR = wPAR & "&CLA005=" & wFAM    
wPAR = wPAR & "&CLA006=" & wPIN
wPAR = wPAR & "&CLA007=" & wSUB
wPAR = wPAR & "&CLA008=" & wCGR
wURLH = "X001Z100_H.ASP" & wPAR

wURLP = "X001A101_P.ASP" & wPAR


Session("glUrlBuscar") = wURLD
 
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title><%=wTIT%></title>
<meta name="GENERATOR" content="Microsoft FrontPage 12.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
</head>



	 <frameset rows="60,*,160" framespacing="0" border="0" frameborder="0">
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

