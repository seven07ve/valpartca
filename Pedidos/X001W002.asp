<%
	' -- show.asp --
	' Shows a list of uploaded files
	
	Response.Buffer = True
%>
<html>
<head>
	<title>List of uploaded Files</title>
	<style>
		body, input, td { font-family:verdana,arial; font-size:10pt; }
	</style>
</head>
<body>
	<p align="center">
		<b>List of uploaded Files</b><br>
		<a href="insert.htm">To upload files click here</a>
	</p>

<%
	' File System Object
	Dim fso
		Set fso = Server.CreateObject("Scripting.FileSystemObject")
		
	' "Uploaded" Folder
	Dim folder
		'Set folder = fso.GetFolder(Server.MapPath("download/"))
		Set folder = fso.GetFolder("d:\home\alcidesb\mipedido.com\download\")
		
		
	If folder.Size > 0 Then
		Response.Write "<ul>"
		For Each file In folder.Files
				wDate =  day(file.DateLastModified) & "-" & month(file.DateLastModified) & "-" &  year(file.DateLastModified) & "  " &  hour(file.DateLastModified)  
				
				
				Response.Write "<li type=""circle"">"
				Response.Write "<a href=""d:\home\alcidesb\mipedido.com\download\" & file.Name & """>"
				'Response.Write "<a href=""../xawe001/download/" & file.Name & """>"				
				Response.Write "<b>" & file.Name & "</b></a>&nbsp; &nbsp;"
				Response.Write "( Size: " & file.Size & " )&nbsp; &nbsp;"
				Response.Write "( Update: " & wDate & " )&nbsp; &nbsp;"
				
		Next
		Response.Write "</ul>"
	Else
		Response.Write "<ul><li type=""circle"">No Files Uploaded.</ul>"
	End If
%>
</body>
</html>