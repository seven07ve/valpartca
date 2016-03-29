<%@ Language=VBScript %>
<% wSTSIMP = Request.QueryString("STSIMP") %>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 4.0">
<title>PEDIDOS</title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">


</head>
<% if wSTSIMP = "S" OR wSTSIMP = "E" THEN
	wcellpadding = "3"
	if wSTSIMP = "E" THEN 
		Response.ContentType = "application/vnd.ms-excel" 
		wcellpadding = "0"
	end if	
	wBorderColor ="#C0C0C0"  %>
	<body onload="window.status='<%=Request.ServerVariables("URL")%>'">
		<div align=center>
		<table BORDER="1" WIDTH="100%" cellspacing="0" cellpadding="<%=wcellpadding%>"
		  bordercolorlight="<%=wBorderColor%>" bordercolordark="<%=wBorderColor%>" bordercolor="<%=wBorderColor%>">
<%	ELSE %>
	<body topmargin="0"  vlink="#0000FF" onload="window.status='<%=Request.ServerVariables("URL")%>'">
		<div >
		<table BORDER="0" WIDTH="<%=Session("glTamano")%>" >
<%	END IF

	wTIT = Request.QueryString("URLTIT")	
	wURLACT = TRIM(Request.QueryString("URLACT"))		
	wNOMTAB = Request.QueryString("NOMTAB")
	wCAMC01 = Request.QueryString("CAMC01")


	'Mostrar Encabezado para impresion
	if wSTSIMP = "S" THEN
		'Mostrar Titulo
		Mostrar_Titulo
		'Mostrar Encabezado
		wTipo = "E"
		wCLASS = "TDS"
		wShowURL = "N"
		Mostrar_Linea
	   ELSE	
		wShowURL = "S"
	END IF
	
	'Mostrar Encabezado para impresion
    


	' File System Object
	Dim fso
		Set fso = Server.CreateObject("Scripting.FileSystemObject")
		
	' "Uploaded" Folder
	Dim folder
		'Set folder = fso.GetFolder(Server.MapPath("download/"))
		Set folder = fso.GetFolder("d:\home\alcidesb\mipedido.com\download\")

	wCLASS = "TDD"
	wCuenta = 0
		
		
	If folder.Size > 0 Then
		Response.Write "<ul>"
		For Each file In folder.Files
				wDate =  right("0" & day(file.DateLastModified),2) & "-" & right("0" & month(file.DateLastModified),2) & "-" &  year(file.DateLastModified) 
				wHora =  right("0" & hour(file.DateLastModified),2) & ":" & right("0" & minute(file.DateLastModified),2) & ":" &  right("0" & second(file.DateLastModified),2)
				
				wC01 = trim(file.Name)

				Select case wC01
					case "XPHALI.CAT"
						wC02 = "Archivo Header de Pedidos"
				end select					
					
				wC03 = file.Size
				wC04 = wDate
				wC05 = wHora  
				wURL = "d:\home\alcidesb\mipedido.com\download\" & wC01
				wTIURL = "<A href=" & wURL & " target=""_parent""> "
				wTFURL = " </A>"

				Mostrar_Linea
				wCuenta = wCuenta + 1
				
				
		Next
	Else
		Response.Write "<ul><li type=""circle"">No Files Uploaded.</ul>"
	End If


'	IF wCuenta > 0 then'
'		wCLASS = "TD1"
'		wTipo = "T"
'		wC01 = wCuenta
'		wC02 = "Totales"		
'		wC03 = "&nbsp;"
'		wC04 = "&nbsp;"
'		wC05 = "&nbsp;"
'		Mostrar_Linea	
'	end if


	

%>
<%'Incluir Cuerpo del Reporte %>
<!--#include file="X001W100_C.ASP"-->
</table>
</body>
</html>
