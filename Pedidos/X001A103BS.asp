<%


'wCOD = Request.QueryString("CODIGO") 
wCOD = Request.Form("CODIGO") 
Session("glBusqueda1") = wCOD 
wDES = Request.QueryString("DESCRIPCION") 
wDES = Request.Form("DESCRIPCION") 
Session("glBusqueda2") = wDES
'wFAM = Request.QueryString("FAMILIA") 
wFAM = Request.Form("FAMILIA") 
wSUB = Request.Form("SUBLINEA") 
wPIN = Request.Form("PIN")
Session("glBusqueda3") = wFAM
Session("glBusqueda4") = wSUB
wCGR = Request.Form("MODELO")
wURLTIT = Request.QueryString("URLTIT") 
wCLA001 = Request.QueryString("CAMC01") 
wCLA002 = Request.QueryString("CAMC02") 



'wURL = "X001A103_F.asp?URLTIT=" & wURLTIT
wURL = "X001Z100_F.asp?URLTIT=" & wURLTIT
wURL = wURL & "&CAMC01=" & wCLA001  
wURL = wURL & "&CAMC02=" & wCLA002  
wURL = wURL & "&CLA003=" & wCOD  
wURL = wURL & "&CLA004=" & wDES  
wURL = wURL & "&CLA005=" & wFAM  
wURL = wURL & "&CLA006=" & wPIN
wURL = wURL & "&CLA007=" & wSUB
wURL = wURL & "&CLA008=" & wCGR

'response.Write "URL:" & wURL
'Response.write wURL
Response.Redirect wURL

%>