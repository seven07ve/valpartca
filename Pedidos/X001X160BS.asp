<%


wURLTIT = Request.QueryString("URLTIT") 
wCOD = Request.Form("CODIGO") 
wDES = Request.Form("DESCRIPCION") 
wFAM = Request.Form("FAMILIA") 
'wSTS = Request.Form("STS") 

wURL = "X001X160_S.asp?NOMTAB=X300AF003" 
wURL = wURL & "&PARBUS01=" & wCOD  
wURL = wURL & "&PARBUS02=" & wDES  
wURL = wURL & "&PARBUS03=" & wFAM  
'wURL = wURL & "&PARBUS04=" & wSTS  

'response.Write "URL:" & wURL
'Response.write wURL
Response.Redirect wURL

%>