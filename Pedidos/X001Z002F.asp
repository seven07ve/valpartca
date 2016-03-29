
<%@ Language=VBScript %>

<%

Response.Expires = -1
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"

%>

<!--#include file="X001Z001.INC"-->
<!--#include file="X001Y007.PRC"-->
<%
  Datos_Compania wDEL, wURI			
%>

<HTML>
<head>
<title>.: <%=wDEL%> - Pedidos por Internet :.</title>
<meta name="GENERATOR" content="Microsoft FrontPage 12.0">
<meta name="ProgId" content="FrontPage.Editor.Document">



</head>


<%

     strCnn	= Application("XDTA300_ConnectionString")
	
     SQL = "SELECT Z300002PR1, Z300002PR2, Z300002PR3, Z300002PR4 FROM X300ZF002 " 
     SQL = SQL & " WHERE "
     SQL = SQL & " Z300002CCI = '" & Session("glCiaInternet") & "' "
     Set rstQuery = Server.CreateObject("ADODB.Recordset")
     rstQuery.Open sql , strCnn
     if NOT rstQuery.EOF then
	wPR1 = trim(rstQuery.Fields("Z300002PR1"))
	wPR2 = trim(rstQuery.Fields("Z300002PR2"))
	wPR3 = trim(rstQuery.Fields("Z300002PR3"))
	wPR4 = trim(rstQuery.Fields("Z300002PR4"))
     end if
     rstQuery.CLOSE
     SET rstQuery = NOTHING	

		


    IF wPR1 = "1" THEN
	wURL = "X001A001.ASP"
	ELSE
	IF wPR2 = "1" THEN
		wURL = "X001A004.ASP"
		ELSE
		IF wPR3 = "1" THEN
			wURL = "X001A005.ASP"		
			ELSE
			IF wPR4 = "1" THEN	
				wURL = "X001A006.ASP"
				ELSE
				wURL = "X001X002.ASP"					
			END IF 	
		END IF 	   		
	END IF 		
    END IF  	
	
	     SELECT CASE Session("glTipoUsuario")
	CASE "D"
	   wURL = "X001X003.ASP"	
     	CASE "EG"
       	   wURL = "X001X004.ASP"
	CASE "CP"
       	   wURL = "X001X005.ASP"	
	CASE "UA"
       	   wURL = "X001A005.ASP"	
	CASE ELSE
	   wURL = "X001A001.ASP"	
    END SELECT 



    IF Session("glEstatusUsuario") = "2" THEN
	wURL = "X001X001.ASP"	
    END IF 

%>


<frameset framespacing="0" border="0" rows="154,*" frameborder="0">
  <frame name="header" scrolling="no" noresize target="main" src="X001Z002H.ASP">
  <frame name="main" src="<%=wURL%>" scrolling="auto" target="main">
  <noframes>
<body onload="history.go(1)" onunload="history.go(1)" >
  <p>This page uses frames, but your browser doesn't support them.</p>

  </body>
  </noframes>
</frameset>





</HTML>


