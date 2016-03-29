<%@ Import Namespace="System.Data.SqlClient"%>
<%@ Import Namespace="System.Data"%>


<%

    Dim strCnn As SqlConnection
    Dim myCmd As SqlCommand
    Dim rstQuery As SqlDataReader
    Dim wCLA001, wCLA002, wB300101CCI, wB300101CIA As String
    Dim SQL As String
    Dim wCCL, wDCL As String
    Dim wPPP As Double
    Dim wCuenta As Double
    Dim wCLASS, wTipo As String
    Dim wC01, wC01_1, wC02, wC05, wC06 As String
    Dim wC03, wC04, wPIM, wC07, wC08, wC09 As Double
    Dim wTC03, wTC08, wTC09, wFIV, wUIVA As Double
    Dim wEHTML, wDHTML, wPHTML As String
        
    wCLA001 = Request.QueryString("CAMC01")
    wCLA002 = Request.QueryString("CAMC02")
    wB300101CCI = "CAR"
    wB300101CIA = "01"
    wCCL = "" : wDCL = ""
    
    strCnn = New SqlConnection(Application("XDTA300_ConnectionString"))

    myCmd = strCnn.CreateCommand
    SQL = "SELECT B300100CCL FROM X300BF100 "
    SQL = SQL & " WHERE "
    SQL = SQL & " B300100OPE = '" & wCLA001 & "' AND "
    SQL = SQL & " B300100NPE = '" & wCLA002 & "' "
    myCmd.CommandText = SQL
    strCnn.Open()
    rstQuery = myCmd.ExecuteReader()
    If rstQuery.Read() Then
        wCCL = Trim(rstQuery("B300100CCL").ToString())
    End If
    rstQuery.Close()
    strCnn.Close()
	
    myCmd = strCnn.CreateCommand
    SQL = "SELECT A300002RSO FROM X300AF002 "
    SQL = SQL & " WHERE "
    SQL = SQL & " A300002CCL = '" & wCCL & "'"
    myCmd.CommandText = SQL
    strCnn.Open()
    rstQuery = myCmd.ExecuteReader()
    If rstQuery.Read() Then
        wDCL = Trim(rstQuery("A300002RSO").ToString())
    End If
    rstQuery.Close()
    strCnn.Close()
		
    'BUSCA PORCENTAJE DE PRONTO PAGO
    myCmd = strCnn.CreateCommand
    SQL = "SELECT * FROM X300AQ004 "
    SQL = SQL & " WHERE "
    SQL = SQL & " B300100OPE = '" & wCLA001 & "' AND "
    SQL = SQL & " B300100NPE = '" & wCLA002 & "' "
    myCmd.CommandText = SQL
    strCnn.Open()
    rstQuery = myCmd.ExecuteReader()
    If rstQuery.Read() Then
        wPPP = rstQuery("A300002PPP").ToString()
    End If
    rstQuery.Close()
    strCnn.Close()
    
    
    wEHTML = "<html><head>"
    wEHTML = wEHTML & "<meta http-equiv=""Content-Type"" content=""text/html; charset=windows-1252"">"
    wEHTML = wEHTML & "<title>Sistema de Envio de Correos</title></head>"
    
    wEHTML = wEHTML & "<body ALIGN=""CENTER"" vlink=""#0000FF""  topmargin=""10"" leftmargin=""10"" rightmargin=""0"" >"
    wEHTML = wEHTML & "<table border=""0"" width=""90%""  cellspacing=""0"" cellpadding=""0"" align=""Center""><tr><td><p><img border=""0"" src=""http://www.carvica.com.ve/pedidos/images/Logo2.gif"" width=""179"" height=""64""></p>"
    wEHTML = wEHTML & "</td></tr></table></p>"
    
    'ENCABEZADO
    wEHTML = wEHTML & "<p><table border=""0"" width=""90%""  cellspacing=""0"" cellpadding=""0"" align=""Center"">"
    wEHTML = wEHTML & "<tr><td><font style=""font-family: Arial; font-size: 8pt"">"
    wEHTML = wEHTML & "<b>Pedido:</b> " & wCLA002
    wEHTML = wEHTML & "</td></tr>"
    wEHTML = wEHTML & "<tr><td><font style=""font-family: Arial; font-size: 8pt"">"
    wEHTML = wEHTML & "<b>Cliente:</b> " & wCCL & " - " & wDCL
    wEHTML = wEHTML & "</td></tr></table></p>"
    'FIN ENCABEZADO
    
    
    'INICIO TABLA DETALLE
    wDHTML = "<p><table style=""border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px"" border=""1"" width=""90%""  cellspacing=""0"" cellpadding=""0"" align=""Center"">"
    'TITULOS DETALLE
    wDHTML = wDHTML & "<tr><td bgcolor=""#C0C0C0""><font style=""font-family: Arial; font-size: 8pt"">"
    wDHTML = wDHTML & "<b>Item</b>"
    wDHTML = wDHTML & "</td>"
    wDHTML = wDHTML & "<td bgcolor=""#C0C0C0""><font style=""font-family: Arial; font-size: 8pt"">"
    wDHTML = wDHTML & "<b>Descripción</b>"
    wDHTML = wDHTML &"</td>"
    wDHTML = wDHTML & "<td bgcolor=""#C0C0C0"" align=""center"" ><font style=""font-family: Arial; font-size: 8pt"">"
    wDHTML = wDHTML & "<b>Cant</b>"
    wDHTML = wDHTML & "</td>"
    wDHTML = wDHTML & "<td bgcolor=""#C0C0C0"" align=""right""><font style=""font-family: Arial; font-size: 8pt"">"
    wDHTML = wDHTML & "<b>Precio</b>"
    wDHTML = wDHTML & "</td>"
    wDHTML = wDHTML & "<td bgcolor=""#C0C0C0"" align=""center""><font style=""font-family: Arial; font-size: 8pt"">"
    wDHTML = wDHTML & "<b>Marca</b>"
    wDHTML = wDHTML & "</td>"
    wDHTML = wDHTML & "<td bgcolor=""#C0C0C0""><font style=""font-family: Arial; font-size: 8pt"">"
    wDHTML = wDHTML & "<b>Homologo</b>"
    wDHTML = wDHTML & "</td>"
    wDHTML = wDHTML & "<td bgcolor=""#C0C0C0"" align=""right""><font style=""font-family: Arial; font-size: 8pt"">"
    wDHTML = wDHTML & "<b>Neto+Imp</b>"
    wDHTML = wDHTML & "</td></tr>"
    'FIN DE TITULOS DETALLE
    
    
    myCmd = strCnn.CreateCommand
    SQL = " SELECT B300101CPR, A300003DEL, B300101UVE, B300101PUN, "
    SQL = SQL & " B300101KIL, B300101MNE, B300101OPE, B300101NPE,"
    SQL = SQL & " B300101PPR, B300101BPR, B300101PIM, A300003MAR, "
    SQL = SQL & " A300003REF "
    SQL = SQL & " FROM X300BQ101 "
    SQL = SQL & " WHERE "
    SQL = SQL & " B300101CCI ='" & wB300101CCI & "' AND "
    SQL = SQL & " B300101CIA ='" & wB300101CIA & "' AND "
    SQL = SQL & " B300101OPE ='" & wCLA001 & "' AND "
    SQL = SQL & " B300101NPE ='" & wCLA002 & "' "
    SQL = SQL & " ORDER BY B300101FAC DESC "
    myCmd.CommandText = SQL
    strCnn.Open()
    rstQuery = myCmd.ExecuteReader()
    wTipo = "D" : wCLASS = "TDD"
    wCuenta = 0 : wTC03 = 0 : wTC08 = 0 : wTC09 = 0
    Do While rstQuery.Read()
				
        wC01 = Trim(rstQuery("B300101CPR").ToString())
        wC01_1 = Replace(Trim(rstQuery("B300101CPR").ToString()), " ", "@")
        wC02 = Left(Trim(rstQuery("A300003DEL").ToString()), 40)
        wC03 = rstQuery("B300101UVE").ToString()
        wC04 = rstQuery("B300101PUN").ToString()
        wC05 = Trim(rstQuery("A300003MAR").ToString())
        wC06 = Left(Trim(rstQuery("A300003REF").ToString()), 10)
        wPIM = rstQuery("B300101PIM").ToString()
        wC08 = rstQuery("B300101KIL").ToString()
        wC09 = rstQuery("B300101MNE").ToString()
		
        wPPP = CDbl(wPPP)
        wC04 = wC04 - ((wC04 * wPPP) / 100)
        wC07 = wPIM
        wFIV = 1 + (wPIM / 100)
        If wFIV > 1 Then
            wUIVA = wC04 * wFIV
        Else
            wUIVA = wC04
        End If
        
        wC09 = (wUIVA * wC03)

				
        If IsDBNull(wC03) Then : wC03 = 0 : End If
        If IsDBNull(wC04) Then : wC04 = 0 : End If
		
		
        If IsDBNull(wC07) Then : wC07 = 0 : End If
        If IsDBNull(wC08) Then : wC08 = 0 : End If
        If IsDBNull(wC09) Then : wC09 = 0 : End If

        wTC03 = wTC03 + wC03
        wTC08 = wTC08 + wC08
        wTC09 = wTC09 + wC09

        wC03 = FormatNumber(wC03, 2, , , TriState.True)
        wC04 = FormatNumber(wC04, 2, , , TriState.True)
		
		
        wC07 = FormatNumber(wC07, 2, , , TriState.True)
        wC08 = FormatNumber(wC08, 2, , , TriState.True)
        wC09 = FormatNumber(wC09, 2, , , TriState.True)
		
        'DETALLE
        wDHTML = wDHTML & "<tr><td style=""border-right-style: none; border-right-width: medium; border-bottom-style: solid; border-bottom-width: 1px"">"
        wDHTML = wDHTML & "<font style=""font-family: Arial; font-size: 8pt"">"
        wDHTML = wDHTML & wC01
        wDHTML = wDHTML & "</td>"
        wDHTML = wDHTML & "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-bottom-style: solid; border-bottom-width: 1px""><font style=""font-family: Arial; font-size: 8pt"">"
        wDHTML = wDHTML & wC02
        wDHTML = wDHTML & "</td>"
        wDHTML = wDHTML & "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-bottom-style: solid; border-bottom-width: 1px"" align=""center""><font style=""font-family: Arial; font-size: 8pt"">"
        wDHTML = wDHTML & wC03
        wDHTML = wDHTML & "</td>"
        wDHTML = wDHTML & "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-bottom-style: solid; border-bottom-width: 1px"" align=""right""><font style=""font-family: Arial; font-size: 8pt"">"
        wDHTML = wDHTML & wC04
        wDHTML = wDHTML & "</td>"
        wDHTML = wDHTML & "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-bottom-style: solid; border-bottom-width: 1px"" align=""center""><font style=""font-family: Arial; font-size: 8pt"">"
        wDHTML = wDHTML & wC05
        wDHTML = wDHTML & "</td>"
        wDHTML = wDHTML & "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-bottom-style: solid; border-bottom-width: 1px""><font style=""font-family: Arial; font-size: 8pt"">"
        wDHTML = wDHTML & wC06
        wDHTML = wDHTML & "</td>"
        wDHTML = wDHTML & "<td align=""right"" style=""border-left-style: none; border-left-width: medium; border-bottom-style: solid; border-bottom-width: 1px"" align=""right""><font style=""font-family: Arial; font-size: 8pt"">"
        wDHTML = wDHTML & wC09
        wDHTML = wDHTML & "</td></tr>"
        'FIN DETALLE
		
        wCuenta = wCuenta + 1
    Loop
    rstQuery.Close()
    strCnn.Close()

    If wCuenta > 0 Then
        wCLASS = "TD1"
        wTipo = "T"
        wC01 = wCuenta
        wC02 = "Totales"
        wC03 = wTC03
        wC08 = wTC08
        wC09 = wTC09
        wC03 = FormatNumber(wC03, 2, , , TriState.True)
        wC08 = FormatNumber(wC08, 2, , , TriState.True)
        wC09 = FormatNumber(wC09, 2, , , TriState.True)

        '&nbsp;
    End If
	
    'TOTALES
    wPHTML = "<tr><td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-bottom-style: none; border-bottom-width: medium"" ><font style=""font-family: Arial; font-size: 8pt"">"
    wPHTML = wPHTML & "&nbsp;"
    wPHTML = wPHTML & "</td>"
    wPHTML = wPHTML & "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-bottom-style: none; border-bottom-width: medium"" align=""right""><font style=""font-family: Arial; font-size: 10pt"">"
    wPHTML = wPHTML & "<b><i><u>Totales:</i></u></b>"
    wPHTML = wPHTML & "</td>"
    wPHTML = wPHTML & "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-bottom-style: solid; border-bottom-width: 1px"" align=""center""><font style=""font-family: Arial; font-size: 10pt"">"
    wPHTML = wPHTML & wC03
    wPHTML = wPHTML & "</td>"
    wPHTML = wPHTML & "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-bottom-style: solid; border-bottom-width: 1px"" align=""right""><font style=""font-family: Arial; font-size: 8pt"">"
    wPHTML = wPHTML & "&nbsp;"
    wPHTML = wPHTML & "</td>"
    wPHTML = wPHTML & "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-bottom-style: solid; border-bottom-width: 1px"" align=""center""><font style=""font-family: Arial; font-size: 8pt"">"
    wPHTML = wPHTML & "&nbsp;"
    wPHTML = wPHTML & "</td>"
    wPHTML = wPHTML & "<td style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-bottom-style: solid; border-bottom-width: 1px""><font style=""font-family: Arial; font-size: 8pt"">"
    wPHTML = wPHTML & "&nbsp;"
    wPHTML = wPHTML & "</td>"
    wPHTML = wPHTML & "<td align=""right"" style=""border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-bottom-style: solid; border-bottom-width: 1px"" align=""right""><font style=""font-family: Arial; font-size: 10pt"">"
    wPHTML = wPHTML & wC09
    wPHTML = wPHTML & "</td></tr></p></table>"
    
    wPHTML = wPHTML & "<p>&nbsp;</p>"
    wPHTML = wPHTML & "<table cellSpacing=""0"" cellPadding=""0"" width=""100%"" border=""0"">"
    wPHTML = wPHTML & "<tr vAlign=""top"">"
    wPHTML = wPHTML & "<td width=""100%""><hr class=""dotted"" align=""justify"">"
    wPHTML = wPHTML & "<p class=""xptFooter"" align=""justify"" style=""margin-left: 50px; margin-right: 50px"">"
    wPHTML = wPHTML & "<font face=""Arial"" size=""2"">No responda a este correo electrónico."
    wPHTML = wPHTML & " Este buzón no se supervisa y no recibirá respuesta. Si necesita "
    wPHTML = wPHTML & "ayuda, Comuníquese con nuestro Departamento de Atención al Cliente a "
    wPHTML = wPHTML & "la siguiente dirección: <a href=""mailto:ventas@carvica.com.ve"">"
    wPHTML = wPHTML & "ventas@carvica.com.ve</a> o a los Teléfonos: (0241) "
    wPHTML = wPHTML & "832.91.70-832.96.08.</font><br>"
    wPHTML = wPHTML & "&nbsp;</td>"
    wPHTML = wPHTML & "</tr></table>"

    '*********************************************************************************************

    'CONFIGURACION DEL CORREO
    Dim correo As New System.Net.Mail.MailMessage
    Dim smtp As New System.Net.Mail.SmtpClient
    
    correo.From = New System.Net.Mail.MailAddress("info@carvica.com.ve")
    correo.To.Add("edgardarioparedes@hotmail.com")
    correo.CC.Add("edgardario@cantv.net")
    correo.CC.Add("ventas@carvica.com.ve")
    correo.Subject = "Pruebas: Pedido Procesado Nro. " & wCLA002
    correo.Body = wEHTML & wDHTML & wPHTML
    correo.IsBodyHtml = True
    correo.Priority = System.Net.Mail.MailPriority.Normal
    
    smtp.Host = "mail.carvica.com.ve"
    smtp.Credentials = New System.Net.NetworkCredential("info@carvica.com.ve", "Ep12345")

    Try
        smtp.Send(correo)
        'Response.Write(wEHTML & wDHTML & wPHTML)
        Response.Write("Mensaje enviado satisfactoriamente")
    Catch ex As Exception
        Response.Write("ERROR: " & ex.Message)
    End Try



%>

</body>

</html>
