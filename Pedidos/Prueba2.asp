<%@language=vbscript%>
<%
Response.Expires = 0
'Response.ContentType = "application/pdf"
'Response.AddHeader "Content-Disposition", "attachment; filename=""fichero.pdf"""
%>

<!--#include file="fpdf.asp"-->
<%
Dim i,pdf
dim spc 
'spc = chr(32) & chr(32) & chr(32) & chr(32) & chr(32) & chr(32) & chr(32) & chr(32) & chr(32) & chr(32) & chr(32) & chr(32)
spc = chr(46) & chr(46) & chr(46) & chr(46) & chr(46) & chr(46) & chr(46) & chr(46) & chr(46) & chr(46) & chr(46) & chr(46)

Set pdf = NOTHING

Set pdf=CreateJsObject("FPDF")
pdf.CreatePDF "P", "mm", "A4"
pdf.SetPath("fpdf/")
pdf.SetFont "Arial","",16
pdf.Open()
pdf.LoadModels("TestModels") ' il nome del modello è specificato senza estensione.
pdf.AddPage()
pdf.SetFont "Times","",10
for i=0 to 40
    pdf.Cell 0,8,"Printing Linea Nro: " & (llena(i," ",55,2)),1,1,"L"
    ''pdf.Cell 0,5,"Printing Linea Nro.a: " & Right(spc & i,8),0,1,"R"
	'pdf.writeHtml("<br>")   
    
    'PDF.Text 50, 0, "Veronica"
    
    'x = llena( i,chr(46),5,2)
    'Response.write right(x,6) & "<br>"
    
Next
pdf.Close()
pdf.Output()

Set pdf = NOTHING


function llena(palabra,caracter,cant,posicion)

	cuen = 1
	
	'creamos cadena de caracteres repetidos a agregar
	for cuen = 1 to cant  
		caracteres = caracteres&caracter
		'response.write cuen & "<br>"
	next

	if posicion = 1 Then ' 1 agrega al final los caracteres
		cadena = palabra&caracteres 
	ElseIf posicion = 2 Then ' 2 agrega al inicio los caracteres
		cadena = caracteres&palabra 
	End if

	llena = cadena

end Function

%>