<%@ Page Debug="false"  %>
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
    Dim wPPR As Double
    Dim wCuenta As Double
    Dim wCLASS, wTipo As String
    Dim wC01, wC01_1, wC02, wC05, wC06 As String
    Dim wC03, wC04, wPIM, wC07, wC08, wC09 As Double
    Dim wTC03, wTC08, wTC09, wFIV, wUIVA As Double
    Dim wEHTML, wDHTML, wPHTML As String
    Dim wURL, wECL, wEVE, wCPE, wFPR As String
    Dim wError As Boolean = False
    
    
    wECL = "" : wEVE = "" : wCCL = "" : wDCL = ""
    wB300101CCI = trim(Request.QueryString("CCI"))
    wCLA001 = Request.QueryString("CAMC01")
    wCLA002 = Request.QueryString("CAMC02")
    wURL = Request.QueryString("URL")
    wB300101CCI = "VAL"
    wB300101CIA = "01"
    
    
    strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)

    myCmd = strCnn.CreateCommand
    SQL = "SELECT B300100CCL, B300100CPE, B300100FPR FROM X300BF100 "
    SQL = SQL & " WHERE "
    SQL = SQL & " B300100CCI = '" & wB300101CCI & "' AND "
    SQL = SQL & " B300100OPE = '" & wCLA001 & "' AND "
    SQL = SQL & " B300100NPE = '" & wCLA002 & "' "
    myCmd.CommandText = SQL
    strCnn.Open()
    rstQuery = myCmd.ExecuteReader()
    If rstQuery.Read() Then
        wCCL = Trim(rstQuery("B300100CCL").ToString())
        wCPE = Trim(rstQuery("B300100CPE").ToString())
        wFPR = Trim(rstQuery("B300100FPR").ToString())
    Else
        wFPR = Now
    End If
    rstQuery.Close()
    strCnn.Close()
    

    wFPR = Right("00" & Day(wFPR), 2) & "-" & Right("00" & Month(wFPR), 2) & "-" & Year(wFPR)

	
    myCmd = strCnn.CreateCommand
    SQL = "SELECT A300002RSO FROM X300AF002 "
    SQL = SQL & " WHERE "
    SQL = SQL & " A300002CCI = '" & wB300101CCI & "' AND "
    SQL = SQL & " A300002CCL = '" & wCCL & "'"
    myCmd.CommandText = SQL
    strCnn.Open()
    rstQuery = myCmd.ExecuteReader()
    If rstQuery.Read() Then
        wDCL = Trim(rstQuery("A300002RSO").ToString())
    End If
    rstQuery.Close()
    strCnn.Close()
	
	    
    'BUSCAR CORREO DEL CLIENTE
    myCmd = strCnn.CreateCommand
    SQL = "SELECT Z300001EML FROM X300ZF001 "
    SQL = SQL & " WHERE "
    SQL = SQL & " Z300001CCI = '" & wB300101CCI & "' AND "
    SQL = SQL & " Z300001PUS = '" & wCCL & "'"
    myCmd.CommandText = SQL
    strCnn.Open()
    rstQuery = myCmd.ExecuteReader()
    If rstQuery.Read() Then
        wECL = Trim(rstQuery("Z300001EML").ToString())
    End If
    rstQuery.Close()
    strCnn.Close()
    
    'BUSCAR CORREO DEL VENDEDOR
    myCmd = strCnn.CreateCommand
    SQL = "SELECT Z300001EML FROM X300ZF001 "
    SQL = SQL & " WHERE "
    SQL = SQL & " Z300001CCI = '" & wB300101CCI & "' AND "
    SQL = SQL & " Z300001CVE = '" & wCLA001 & "' AND "
    SQL = SQL & " (Z300001CLU = 'A' OR "
    SQL = SQL & "  Z300001CLU = 'V' ) "
    myCmd.CommandText = SQL
    strCnn.Open()
    rstQuery = myCmd.ExecuteReader()
    If rstQuery.Read() Then
        wEVE = Trim(rstQuery("Z300001EML").ToString())
    Else
        wEVE = "0"
    End If
    rstQuery.Close()
    strCnn.Close()
		    
    
    wEHTML = "<html><head>"
    wEHTML = wEHTML & "<meta http-equiv=""Content-Type"" content=""text/html; charset=windows-1252"">"
    wEHTML = wEHTML & "<title>Sistema de Envio de Correos</title></head>"
    
    wEHTML = wEHTML & "<body ALIGN=""CENTER"" vlink=""#0000FF""  topmargin=""10"" leftmargin=""10"" rightmargin=""0"" >"
    wEHTML = wEHTML & "<table border=""0"" width=""92%""  cellspacing=""0"" cellpadding=""0"" align=""Center""><tr>"
    wEHTML = wEHTML & "<td align=left><img align=left border=""0"" src=""http://www.valpartca.com/Pedidos/ASPX/VAL_Logo.jpg""></td>"
    wEHTML = wEHTML & "</tr>"
    wEHTML = wEHTML & "<tr><td align=left><font style=""font-family: Arial; font-size: 8pt"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
    wEHTML = wEHTML & "<b>RIF.: J-29875968-2</b></font></td>"
    wEHTML = wEHTML & "</tr>"
    wEHTML = wEHTML & "</table><br>"
    
    'ENCABEZADO
    wEHTML = wEHTML & "<p><table border=""0"" width=""90%""  cellspacing=""0"" cellpadding=""0"" align=""Center"">"
    wEHTML = wEHTML & "<tr><td><font style=""font-family: Arial; font-size: 8pt"">"
    wEHTML = wEHTML & "<b>Pedido:</b> " & wCLA002
    wEHTML = wEHTML & "</td></tr>"
    wEHTML = wEHTML & "<tr><td><font style=""font-family: Arial; font-size: 8pt"">"
    wEHTML = wEHTML & "<b>Cliente:</b> " & wCCL & " - " & wDCL
    wEHTML = wEHTML & "</td></tr>"
    wEHTML = wEHTML & "<tr><td><font style=""font-family: Arial; font-size: 8pt"">"
    wEHTML = wEHTML & "<b>Fecha:</b> " & wFPR
    wEHTML = wEHTML & "</td></tr>"
    wEHTML = wEHTML & "<tr><td><font style=""font-family: Arial; font-size: 8pt"">"
    wEHTML = wEHTML & "<b>Comentario:</b> " & wCPE
    wEHTML = wEHTML & "</td></tr>"
    wEHTML = wEHTML & "</table></p>"
    'FIN ENCABEZADO
    
    
    'INICIO TABLA DETALLE
    wDHTML = "<p><table style=""border-left-width: 0px; border-right-width: 0px; border-bottom-width: 0px"" border=""1"" width=""90%""  cellspacing=""0"" cellpadding=""0"" align=""Center"">"
    'TITULOS DETALLE
    wDHTML = wDHTML & "<tr><td bgcolor=""#C0C0C0""><font style=""font-family: Arial; font-size: 8pt"">"
    wDHTML = wDHTML & "<b>Item</b>"
    wDHTML = wDHTML & "</td>"
    wDHTML = wDHTML & "<td bgcolor=""#C0C0C0""><font style=""font-family: Arial; font-size: 8pt"">"
    wDHTML = wDHTML & "<b>Descripci&oacute;n</b>"
    wDHTML = wDHTML & "</td>"
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
    SQL = SQL & " ORDER BY A300003STP, B300101CPR"
    myCmd.CommandText = SQL
    strCnn.Open()
    rstQuery = myCmd.ExecuteReader()
    wTipo = "D" : wCLASS = "TDD"
    wCuenta = 0 : wTC03 = 0 : wTC08 = 0 : wTC09 = 0
    wPPR = 0
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
        wPPR = rstQuery("B300101PPR").ToString()
		
        wPPP = CDbl(wPPP)
        wPPR = CDbl(wPPR)
        wC04 = wC04 - ((wC04 * wPPP) / 100)
        'APLICA DESCUENTO POR FAMILIA
        wC04 = wC04 - ((wC04 * wPPR) / 100)
        wC07 = wPIM
        wFIV = 1 + (wPIM / 100)
        If wFIV > 1 Then
            'wUIVA = wC04 * wFIV
            wUIVA = wC04
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
    wPHTML = wPHTML & "<font face=""Arial"" size=""2"">No responda a este correo electr&oacute;nico."
    wPHTML = wPHTML & " Este buz&oacute;n no se supervisa y no recibir&aacute; respuesta. Si necesita "
    wPHTML = wPHTML & "ayuda, Comun&iacute;quese con nuestro Departamento de Atenci&oacute;n al Cliente "
    wPHTML = wPHTML & "la siguiente direcci&oacute;n: <a href=""mailto:ventasvalparts@gmail.com"">"
    wPHTML = wPHTML & "ventasvalparts@gmail.com</a> o a los Tel&eacute;fonos: </font><br>"
    wPHTML = wPHTML & "(0274) 271.30.59</td>"
    wPHTML = wPHTML & "</tr></table>"

    '*********************************************************************************************

    'CONFIGURACION DEL CORREO
    Dim correo As New System.Net.Mail.MailMessage
    Dim smtp As New System.Net.Mail.SmtpClient
    
    
    '****************************************************************************
    
    'Email Resumen para el Vendedor
    Dim wHTML As String
    
    wHTML = "<font face=""Arial"" size=""2"">El Cliente</font><br>"
    wHTML = wHTML & "<font face=""Arial"" size=""2""><b>" & wCCL & " - " & wDCL & "</b></font><br>"
    wHTML = wHTML & "<font face=""Arial"" size=""2"">ha pasado un pedido por internet por:</font><br>"
    wHTML = wHTML & "<font face=""Arial"" size=""2""><b>Bs. " & FormatNumber(wC09, 2, , , TriState.True) & "</b></font><br><br>"
    wHTML = wHTML & "<font face=""Arial"" size=""2"">Si este cliente tiene cobranza pendiente, informar a la Empresa</font><br>"
    wHTML = wHTML & "<font face=""Arial"" size=""2"">Para que liberen este pedido rapidamente</font><br><br>"
    wHTML = wHTML & "<font face=""Arial"" size=""2"">Gracias</font><br><br>"
    wHTML = wHTML & "<font face=""Arial"" size=""2"">Info-Web</font><br><br>"
    wHTML = wHTML & "<font face=""Arial"" size=""2"">*** Por favor no responda a este mensaje de respuesta autom&aacute;tica ***</font>"
        

    correo.From = New System.Net.Mail.MailAddress("info@valpartca.com", "Pedidos Corporacion Valparts")
    correo.To.Add("ventasvalparts@gmail.com")
    correo.Subject = "Pedido Procesado Nro. " & wCLA002
    correo.Body = wHTML
    correo.IsBodyHtml = True
    correo.Priority = System.Net.Mail.MailPriority.Normal

    smtp.Host = "relay-hosting.secureserver.net"
    'smtp.Port = 2640
    'smtp.UseDefaultCredentials = True
    'smtp.EnableSsl = True
    'smtp.Credentials = New System.Net.NetworkCredential("info@valpartca.com", "Ep123456")
    
	response.write(wHTML)  
    
    Try
        smtp.Send(correo)
        Response.Write("Mensaje enviado satisfactoriamente")
    Catch ex As Exception
        Response.Write("ERROR: " & ex.Message)
    End Try
    
    If Len(Trim(wURL)) > 0 Then
        Response.Redirect(wURL)
    End If


%>

</body>

</html>
