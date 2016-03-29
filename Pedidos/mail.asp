<%

'dim stremail, strname, strcomments, mail
'stremail = "webmaster@carvica.com.ve"
'strname = "Webmaster"
'strcomments = "Prueba"

'set mail = Server.CreateObject("CDONTS.NewMail")
''mail.host = "mail.carvica.com.ve"
'mail.from = stremail
'mail.to "edgardarioparedes@hotmail.com"
'mail.subject = "your subject here"
'mail.body = "email: " & stremail & vbcrlf & "name: " & strname & vbcrlf & "comments: " & vbcrlf & strcomments
'on error resume next
'mail.send
'set mail = nothing
'if err <> 0 then 
'response.write "sorry, there was an error and your email was not sent." & err.description
'end if


Set objEmail = Server.CreateObject("Dundas.Mailer")
objEmail.Tos.Add "edgardarioparedes@hotmail.com"
objEmail.FromAddress = "webmaster@carvica.com.ve"
objEmail.Subject = "Prueba"
objEmail.Body = "Prueba2"
objEmail.SMTPRelayServers.Add "mail.carvica.com.ve"
objEmail.SendMailSet 
objMailer = Nothing
response.write("envío exitoso")   

%>

<html><head>
<title>asp web pro</title>
</head> 


<body>

</body>

</html>
