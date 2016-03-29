<%



wNOMTAB = TRIM(Request.QueryString("NOMTAB"))
wTITULO = TRIM(Request.QueryString("TITULO"))
wCAMC01 = TRIM(Request.QueryString("CAMC01"))
wCAMC02 = TRIM(Request.QueryString("CAMC02"))
wURLTIT = TRIM(Request.QueryString("URLTIT"))
wURLD = TRIM(Request.QueryString("URLD"))
wSTSPED = TRIM(Request.QueryString("STSPED"))
wURLD2 = wURLD 
wURLACT = TRIM(Request.QueryString("URLACT"))
wREG = TRIM(Request.QueryString("REG"))
wCOD = TRIM(Request.Form("CODIGO"))
wDES = TRIM(Request.Form("DESCRIPCION"))
wFAM = TRIM(Request.Form("FAMILIA"))

IF ISNULL(wURLD) OR TRIM(wURLD) = "" THEN	
   wURLD = "X001A115.asp"	
   wURLD2 = "X001A115.asp"
END IF 

wTIT = wTITULO

wURL  = "X001A115"   'Colocar nombre principal de pagina
'wPAR = wPAR & "?URLACT=" & wURL & "_A.ASP"
wPAR = wPAR & "?URLACT=" & wURLACT
wPAR = wPAR & "&URLIMP=" & wURL & ".ASP"
wPAR = wPAR & "&URLPRI=" & wURL & "_S.ASP?NOMTAB=" & wNOMTAB
wPAR = wPAR & "&URLTIT=" & wTIT
wPAR = wPAR & "&CAMC01=" & wCAMC01
wPAR = wPAR & "&CAMC02=" & wCAMC02    
wPAR = wPAR & "&STSPED=" & wSTSPED

wURLH = wURL & "_H.ASP" & wPAR
wURLH2 = wURLH2 & "X001A103_A.asp" & wPAR


IF wURLD = "X001A115.asp" THEN
    wURLD = wURL & ".ASP" & wPAR
  ELSE 
    wURLD = wURLD & "?URLTIT=" & wURLTIT
    wURLD = wURLD & "&CLA001=" & wCAMC01
    wURLD = wURLD & "&CLA002=" & wCAMC02
    wURLD = wURLD & "&CODIGO=" & wCOD
    wURLD = wURLD & "&DESCRIPCION=" & wDES
    wURLD = wURLD & "&FAMILIA=" & wFAM
END IF 

wURLP = wURL & "_P.ASP" & wPAR
'wURLD2
'RESPONSE.WRITE wURLD2

Session("glUrlBuscar") = wURLD
 
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title><%=wTIT%></title>
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
</head>


  
  <% IF wURLD2 = "X001A115.asp" THEN %>
	 <frameset rows="55,*,85" framespacing="0" border="0" frameborder="0">
	 <frame name="top" scrolling="no" noresize target="contents" src="<%=wURLH%>">
  <% ELSE%>   
 	 <frameset rows="*,80" framespacing="0" border="0" frameborder="0">

  <% END IF %>
  

  <frame name="main1"  src="<%=wURLD%>"  target="main1" scrolling="auto">
  
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



