<%@ Language="VB"  debug="false"   %>
<%@ Import Namespace="System.Data.SqlClient"%>
<%@ Import Namespace="System.Data"%>


<%

      
    Dim strCnn As SqlConnection
    Dim myCmd As SqlCommand
    Dim rstQuery As SqlDataReader
    Dim wCLA001, wCLA002 As String
    Dim SQL, wCCI, wCIA As String
    Dim wCCL, wDCL As String
    Dim wCuenta As Double
    Dim wCLASS, wTipo As String
    Dim wFAC As String = ""
    Dim wNRC As String = ""
    Dim wNRD As String = ""
    
    Dim wURL, wECL, wEVE, wFPR As String
    Dim wError As Boolean = False
    Dim wMCO As Double
    Dim wPUS As String = ""
    Dim wOBS As String = ""
    Dim wARI As String = ""
    Dim wCLU As String = ""
    
    Dim wPSU As String = ""
    Dim wESU As String = ""
    Dim wPUV As String = ""
    
    wECL = "" : wEVE = ""
    
    'wCLA001 = Request.QueryString("CAMC01")
    wCLA002 = Request.QueryString("CAMC02")
    wURL = Request.QueryString("URL")
    wCCI = "VAL"
    wCIA = "01"
    wCCL = "" : wDCL = ""
    
    
    strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)

    myCmd = strCnn.CreateCommand
    SQL = "SELECT C300001CCL, C300001MCO, C300001PUS, C300001NRC, "
    SQL = SQL & " C300001OBS, C300001FAC, ISNULL(C300001NRD,'') AS C300001NRD "
    SQL = SQL & " FROM X300CF001 WHERE "
    SQL = SQL & " C300001NDC = '" & wCLA002 & "' "
    myCmd.CommandText = SQL
    strCnn.Open()
    rstQuery = myCmd.ExecuteReader()
    If rstQuery.Read() Then
        wCCL = Trim(rstQuery("C300001CCL").ToString())
        'wMCO = rstQuery("C300001MCO").ToString()
        wPUS = Trim(rstQuery("C300001PUS").ToString())
        wNRC = Trim(rstQuery("C300001NRC").ToString())
        wNRD = Trim(rstQuery("C300001NRD").ToString())
        wOBS = Trim(rstQuery("C300001OBS").ToString())
        wFPR = Trim(rstQuery("C300001FAC").ToString())
    End If
    rstQuery.Close()
    strCnn.Close()
    
    myCmd = strCnn.CreateCommand
    SQL = "SELECT C300003MCO"
    'SQL = "SELECT SUM(C300003MCO) AS C300003MCO "
    SQL = SQL & " FROM X300CF003 "
    SQL = SQL & " WHERE "
    SQL = SQL & " C300003NDC = '" & wCLA002 & "' "
    myCmd.CommandText = SQL
    strCnn.Open()
    rstQuery = myCmd.ExecuteReader()
    If rstQuery.Read() Then
        wMCO = rstQuery("C300003MCO").ToString()
    End If
    rstQuery.Close()
    strCnn.Close()
    
    ''''
    wFPR = Right("00" & Day(wFPR), 2) & "-" & Right("00" & Month(wFPR), 2) & "-" & Year(wFPR)

	
    myCmd = strCnn.CreateCommand
    SQL = "SELECT A300002RSO, A300002CVE, A300002LPR "
    SQL = SQL & " FROM X300AF002 "
    SQL = SQL & " WHERE "
    SQL = SQL & " A300002CCL = '" & wCCL & "'"
    myCmd.CommandText = SQL
    strCnn.Open()
    rstQuery = myCmd.ExecuteReader()
    If rstQuery.Read() Then
        wDCL = Trim(rstQuery("A300002RSO").ToString())
        wCLA001 = Trim(rstQuery("A300002CVE").ToString())
        wARI = Trim(rstQuery("A300002LPR").ToString())
    End If
    rstQuery.Close()
    strCnn.Close()
    
    'BUSCAR TIPO DE USUARIO QUE REALIZO EL PAGO
    myCmd = strCnn.CreateCommand
    SQL = "SELECT Z300001CLU FROM X300ZF001 "
    SQL = SQL & " WHERE "
    SQL = SQL & " Z300001PUS = '" & wPUS & "' "
    myCmd.CommandText = SQL
    strCnn.Open()
    rstQuery = myCmd.ExecuteReader()
    If rstQuery.Read() Then
        wCLU = Trim(rstQuery("Z300001CLU").ToString())
    End If
    rstQuery.Close()
    strCnn.Close()
    
    wECL = ""
    'BUSCAR CORREO DEL CLIENTE
    myCmd = strCnn.CreateCommand
    SQL = "SELECT ISNULL(Z300001EML, '') AS Z300001EML "
    SQL = SQL & " FROM X300ZF001 "
    SQL = SQL & " WHERE "
    SQL = SQL & " Z300001PUS = '" & wCCL & "'"
    myCmd.CommandText = SQL
    strCnn.Open()
    rstQuery = myCmd.ExecuteReader()
    If rstQuery.Read() Then
        wECL = Trim(rstQuery("Z300001EML").ToString())
    End If
    rstQuery.Close()
    strCnn.Close()
    
    wEVE = ""
    'BUSCAR CORREO DEL VENDEDOR
    myCmd = strCnn.CreateCommand
    SQL = "SELECT ISNULL(Z300001EML,'') AS Z300001EML, Z300001PUS FROM X300ZF001 "
    SQL = SQL & " WHERE "
    SQL = SQL & " Z300001CVE = '" & wCLA001 & "' AND "
    SQL = SQL & " (Z300001CLU = 'A' OR "
    SQL = SQL & "  Z300001CLU = 'V' ) "
    myCmd.CommandText = SQL
    strCnn.Open()
    rstQuery = myCmd.ExecuteReader()
    If rstQuery.Read() Then
        wEVE = Trim(rstQuery("Z300001EML").ToString())
        wPUV = Trim(rstQuery("Z300001PUS").ToString())
    Else
        wEVE = "0"
    End If
    rstQuery.Close()
    strCnn.Close()
    
    myCmd = strCnn.CreateCommand
    SQL = "SELECT Z300006PSU "
    SQL = SQL & " FROM X300ZF006 "
    SQL = SQL & " WHERE "
    SQL = SQL & " Z300006PUS = '" & wPUV & "'"
    myCmd.CommandText = SQL
    strCnn.Open()
    rstQuery = myCmd.ExecuteReader()
    If rstQuery.Read() Then
        wPSU = Trim(rstQuery("Z300006PSU").ToString())
    End If
    rstQuery.Close()
    strCnn.Close()
    
    wESU = ""
    myCmd = strCnn.CreateCommand
    SQL = "SELECT ISNULL(Z300001EML,'') AS Z300001EML "
    SQL = SQL & " FROM X300ZF001 "
    SQL = SQL & " WHERE "
    SQL = SQL & " Z300001PUS = '" & wPSU & "'"
    myCmd.CommandText = SQL
    strCnn.Open()
    rstQuery = myCmd.ExecuteReader()
    If rstQuery.Read() Then
        wESU = Trim(rstQuery("Z300001EML").ToString())
    End If
    rstQuery.Close()
    strCnn.Close()
	
    Dim wC300002NFA As String = ""
    Dim wC300002MCO As Double = 0
    
    'Busca facturas
    myCmd = strCnn.CreateCommand
    SQL = " SELECT C300002NFA, C300002MCO "
    SQL = SQL & " FROM X300CF002 "
    SQL = SQL & " WHERE "
    SQL = SQL & " C300002CCI ='" & wCCI & "' AND "
    SQL = SQL & " C300002CIA ='" & wCIA & "' AND "
    SQL = SQL & " C300002NDC ='" & wCLA002 & "' "
    SQL = SQL & " ORDER BY C300002NFA "
    myCmd.CommandText = SQL
    strCnn.Open()
    rstQuery = myCmd.ExecuteReader()
    wTipo = "D" : wCLASS = "TDD"
    wCuenta = 0
    Do While rstQuery.Read()
		
        wC300002NFA = Trim(rstQuery("C300002NFA").ToString())
        wC300002MCO = rstQuery("C300002MCO").ToString()
        
        wFAC += wC300002NFA & " por Bs. " & FormatNumber(wC300002MCO, 2, , , TriState.True) & "<BR>"
      	
        wCuenta = wCuenta + 1
    Loop
    rstQuery.Close()
    strCnn.Close()

    
    '*********************************************************************************************

    'CONFIGURACION DEL CORREO
    Dim correo As New System.Net.Mail.MailMessage
    Dim smtp As New System.Net.Mail.SmtpClient
  
    
    'Email Resumen para el Vendedor
    Dim wHTML As String = ""
            
    wHTML = wHTML & "<font face=""Arial"" size=""2"">El Cliente</font><br>"
    wHTML = wHTML & "<font face=""Arial"" size=""2""><b>" & wCCL & " - " & wDCL & "</b></font><br>"
    If Len(Trim(wOBS)) > 0 Then
        wHTML = wHTML & "<font face=""Arial"" size=""2"">Observaci&oacute;n: <b>" & wOBS & "</b></font><br>"
    End If
    wHTML = wHTML & "<font face=""Arial"" size=""2"">ha cancelado por internet el monto de:</font><br>"
    wHTML = wHTML & "<font face=""Arial"" size=""2""><b>Bs. " & FormatNumber(wMCO, 2, , , TriState.True) & "</b></font><br><br>"
    wHTML = wHTML & "<font face=""Arial"" size=""2"">Correspondiente a los Documentos:</font><br>"
    wHTML = wHTML & "<font face=""Arial"" size=""2""><b>" & wFAC & "</b></font><br>"
    wHTML = wHTML & "<font face=""Arial"" size=""2"">Recibo Electr&oacute;nico Nro.: <b>" & wCLA002 & "</b></font><br>"
    
    If wNRC.Trim.Length > 0 Then
        wHTML = wHTML & "<font face=""Arial"" size=""2"">Nro. de Talonario de Cobranza: <b>" & wNRC & "</b></font><br>"
    End If
    If wNRD.Trim.Length > 0 Then
        wHTML = wHTML & "<font face=""Arial"" size=""2"">Nro. de Talonario de Devoluci&oacute;n: <b>" & wNRD & "</b></font><br>"
    End If
    wHTML = wHTML & "<font face=""Arial"" size=""2"">De Fecha.: <b>" & wFPR & "</b></font><br><br>"
    wHTML = wHTML & "<font face=""Arial"" size=""2"">Gracias</font><br><br>"
    wHTML = wHTML & "<font face=""Arial"" size=""2"">*** Por favor no responda a este mensaje de respuesta autom&aacute;tica ***</font>"
  
    
    If Len(Trim(wEVE)) = 0 Or Trim(wEVE) = "" Or Trim(wEVE) = "0" Then
        wEVE = "apineda@insystech.com.ve"
    End If
   
    
    correo.From = New System.Net.Mail.MailAddress("info@valpartca.com", "Pagos Corporacion Valparts")
    
    
    correo.To.Add(wEVE)
    If wEVE <> "apineda@insystech.com.ve" Then
        correo.CC.Add("apineda@insystech.com.ve")
    End If
    If Len(Trim(wESU)) > 0 Or Trim(wESU) <> "" Then
        correo.CC.Add(wESU)
    End If
            
    correo.Subject = "Pago Procesado Nro. " & wCLA002
    correo.Body = wHTML
    correo.IsBodyHtml = True
    correo.Priority = System.Net.Mail.MailPriority.Normal
     
    
    smtp.Host = "relay-hosting.secureserver.net"
    'smtp.Port = 587
    'smtp.UseDefaultCredentials = True
    'smtp.EnableSsl = True
    'smtp.Credentials = New System.Net.NetworkCredential("info@valpartca.com", "Ep123456")
     
    
    Try
        smtp.Send(correo)
        'Response.Write(wHTML)
        Response.Write("Mensaje enviado satisfactoriamente")
        wError = False
    Catch ex As Exception
        Response.Write("ERROR: " & ex.Message)
        wError = True
    End Try
     
    
    '*********************************************************************************************************
    '***********E-MAIL PARA EL CLIENTE************************************************************************
    '*********************************************************************************************************
    If Len(Trim(wECL)) > 0 And Trim(wECL) <> "@" And wCLU <> "C" Then
        
        Dim correo2 As New System.Net.Mail.MailMessage
        Dim smtp2 As New System.Net.Mail.SmtpClient
        
             
        wHTML = "<font face=""Arial"" size=""2"">Sres.</font><br>"
        wHTML = wHTML & "<font face=""Arial"" size=""2""><b>" & wCCL & " - " & wDCL & "</b></font><br>"
        wHTML = wHTML & "<font face=""Arial"" size=""2"">hemos recibido un pago por internet por el monto de:</font><br>"
        wHTML = wHTML & "<font face=""Arial"" size=""2""><b>Bs. " & FormatNumber(wMCO, 2, , , TriState.True) & "</b></font><br><br>"
        wHTML = wHTML & "<font face=""Arial"" size=""2"">Correspondiente a los Documentos:</font><br>"
        wHTML = wHTML & "<font face=""Arial"" size=""2""><b>" & wFAC & "</b></font><br>"
        wHTML = wHTML & "<font face=""Arial"" size=""2"">Recibo Electr&oacutenico Nro.: <b>" & wCLA002 & "</b></font><br>"
        wHTML = wHTML & "<font face=""Arial"" size=""2"">De Fecha.: <b>" & wFPR & "</b></font><br><br>"
                
        wHTML = wHTML & "<font face=""Arial"" size=""2"">El mismo se encuentra en proceso de conciliaci&oacuten bancanria.</font><br><br>"
        wHTML = wHTML & "<font face=""Arial"" size=""2"">Gracias por su pago.</font><br><br>"
        wHTML = wHTML & "<font face=""Arial"" size=""2"">*** Por favor no responda a este mensaje de respuesta autom&aacute;tica ***</font>"
           
      
        
    
        correo2.From = New System.Net.Mail.MailAddress("info@valpartca.com", "Pagos Corporacion Valparts")
        
        correo2.To.Add(wECL)
    
        correo2.Subject = "Pago Procesado Nro. " & wCLA002
        correo2.Body = wHTML
        correo2.IsBodyHtml = True
        correo2.Priority = System.Net.Mail.MailPriority.Normal
     
    
        smtp2.Host = "relay-hosting.secureserver.net"
        'smtp2.Port = 587
        'smtp2.UseDefaultCredentials = True
        'smtp2.EnableSsl = True
        'smtp2.Credentials = New System.Net.NetworkCredential("info@valpartca.com", "Ep123456")
     
        Try
            smtp2.Send(correo2)
            'Response.Write(wHTML)
            Response.Write("Mensaje enviado satisfactoriamente")
            wError = False
        Catch ex As Exception
            Response.Write("ERROR: " & ex.Message)
            wError = True
        End Try
    
    End If
    
    'REDIRECCIONA A OTRA PAGINA
    If wError = False Then
        Response.Redirect(wURL)
    End If
        
        



%>

</body>

</html>
