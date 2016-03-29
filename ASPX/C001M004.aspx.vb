Imports System.Data.SqlClient
Imports System.Data
Imports System.Data.OleDb
Imports System.Drawing.Imaging
Imports System.IO

Partial Class C001M004
    Inherits System.Web.UI.Page

    Dim strCnn As SqlConnection
    Dim myCmd As SqlCommand
    Dim rstQuery As SqlDataReader
    
    Dim SQL As String




    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        lbTitulo.Text = "Actualizar Objetivo de Ventas por Vendedor"

    End Sub

    Sub Subir_Archivo()

        Dim strBLOBFilePath As String = ""
        Dim sPath As String
        Dim sFile As String
        Dim sFullPath As String
        Dim sSplit() As String
        Dim sPathFriendly As String

        lbMensaje.Visible = False

        strBLOBFilePath = fuProductos.PostedFile.FileName.ToString

        sPath = Server.MapPath(".")
        If Right(sPath, 1) <> "\" Then
            sPathFriendly = sPath 'Friendly path name for display
            sPath = sPath & "\"
        Else
            sPathFriendly = Left(sPath, Len(sPath) - 1)
        End If

        sFile = fuProductos.PostedFile.FileName
        sSplit = Split(sFile, "\")
        sFile = sSplit(UBound(sSplit))

        sFullPath = sPath & sFile

        Try
            fuProductos.PostedFile.SaveAs(sFullPath)


            Actualizar_Productos(sFullPath)


            'lblResults.Text = "Upload of File " & sFile & " to " & sPathFriendly & " succeeded"

        Catch Ex As Exception

            lbMensaje.Visible = True
            lbMensaje.Text = "Error al tratar de Subir el Archivo " & Ex.Message
            'lblResults.Text = "Upload of File " & sFile & " to " & sPathFriendly & " failed for the following reason: " & Ex.Message
        Finally
            'lblResults.Font.Bold = True
            'lblResults.Visible = True

        End Try




    End Sub

    Sub Actualizar_Productos(ByVal sFullPath2 As String)

        Dim wCuenta As Double = 0
        Dim wCVE As String = ""
        Dim wFAM As String
        Dim wUNI As String
        Dim wPRE As String
        Dim wFEI As String = Year(Now) & "-" & Right("00" & Month(Now), 2) & "-" & "01 00:00:00"
        Dim wFEF As String = Year(Now) & "-" & Right("00" & Month(Now), 2) & "-" & Day(UltimoDiaDelMes(Now)) & " 23:59:59"
        Dim wCCI As String = Trim(Request.QueryString("CCI"))
        Dim wPUS As String = Trim(Request.QueryString("PUS"))
        
        Dim wExiste As String = "N"

        Dim textdelimiter As String
        Dim i As Integer = 0

        Dim splitout As Array
        Dim filestream As StreamReader
        Dim readcontents As String

        textdelimiter = Chr(9)

        strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)
        'strCnn2 = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & sFullPath2 & "; Extended Properties=Excel 8.0;")

        'Response.Write(sFullPath & "<br>")

        Try

            filestream = File.OpenText(sFullPath2)
            readcontents = filestream.ReadLine()

            strCnn.Open()

            myCmd = strCnn.CreateCommand
            SQL = "DELETE FROM X300DF007 "
            SQL = SQL & " WHERE "
            SQL = SQL & " D300007CCI = '" & wCCI & "' AND "
            SQL = SQL & " D300007FEI >= '" & wFEI & "' AND "
            SQL = SQL & " D300007FEF <= '" & wFEF & "'"

            myCmd.CommandText = SQL
            myCmd.ExecuteNonQuery()


            While Not readcontents Is Nothing

                splitout = Split(readcontents, textdelimiter)



                If splitout(0) <> "Asesor" Then

                    wCVE = splitout(0)
                    wFAM = splitout(1)
                    wUNI = Replace(splitout(2), ",", "")
                    wPRE = 0

                    'wPRE = Replace(wPRE, ".", "")

                    'wPRE = Replace(splitout(2), ",", "")
                    'wPRE = Replace(wPRE, ".", "")


                    'Response.Write(wCPR & " - " & wDEL & " - " & wREF & "<BR>")


                    If Len(Trim(wCVE)) > 0 Then

                        myCmd = strCnn.CreateCommand
                        SQL = "INSERT INTO X300DF007 ("
                        SQL = SQL & " D300007CCI, D300007CIA, D300007CVE, D300007REG, D300007FAM, "
                        SQL = SQL & " D300007UNI, D300007PRE, D300007FEI, D300007FEF, D300007PUS )"
                        SQL = SQL & " VALUES ( "
                        SQL = SQL & "'" & wCCI & "',"
                        SQL = SQL & "'01',"
                        SQL = SQL & "'" & wCVE & "',"
                        SQL = SQL & "'0',"
                        SQL = SQL & "'" & wFAM & "',"
                        SQL = SQL & "'" & wUNI & "',"
                        SQL = SQL & "'" & wPRE & "',"
                        SQL = SQL & "'" & wFEI & "',"
                        SQL = SQL & "'" & wFEF & "',"
                        SQL = SQL & "'" & wPUS & "')"
                        myCmd.CommandText = SQL
                        myCmd.ExecuteNonQuery()

                        wCuenta = wCuenta + 1

                    End If

                End If

                readcontents = filestream.ReadLine()

            End While


            strCnn.Close()

            myCmd = strCnn.CreateCommand
            SQL = "UPDATE X300ZF002 SET "
            SQL = SQL & " Z300002FAP = getdate() "
            SQL = SQL & " WHERE "
            SQL = SQL & " Z300002CCI = '" & wCCI & "' "
            myCmd.CommandText = SQL
            strCnn.Open()
            myCmd.ExecuteNonQuery()
            strCnn.Close()

            lbEstatus.Visible = True
            lbEstatus.Text = "Proceso Culminado. <br> Nro. de Registros: " & wCuenta

        Catch ex As Exception

            Response.Write(ex.Message) '& "<BR>" & SQL)

        Finally


            filestream.Dispose()

        End Try




    End Sub

    Function UltimoDiaDelMes(ByVal dtmFecha As Date) As Date
        UltimoDiaDelMes = DateSerial(Year(dtmFecha), Month(dtmFecha) + 1, 0)
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim wCCI As String = Trim(Request.QueryString("CCI"))

        Dim wFAP As String = Now
        Dim wCO1, wCO2 As String

        strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)

        myCmd = strCnn.CreateCommand
        SQL = SQL & " SELECT Z300002DEL, Z300002CO1, Z300002CO2 "
        SQL = SQL & " FROM X300ZF002 "
        SQL = SQL & " WHERE "
        SQL = SQL & " Z300002CCI = '" & wCCI & "' "
        myCmd.CommandText = SQL
        strCnn.Open()
        rstQuery = myCmd.ExecuteReader()
        If rstQuery.Read() Then
            wCO1 = Trim(rstQuery("Z300002CO1").ToString())
            wCO2 = Trim(rstQuery("Z300002CO2").ToString())
        End If
        rstQuery.Close()
        strCnn.Close()


        txCO1.text = wCO1
        txCO2.text = wCO2

        myCmd = strCnn.CreateCommand
        SQL = " SELECT isnull(Z300002FAP,getdate()) AS Z300002FAP "
        SQL = SQL & " FROM X300ZF002 "
        SQL = SQL & " WHERE Z300002CCI = '" & wCCI & "'"
        myCmd.CommandText = SQL
        strCnn.Open()
        rstQuery = myCmd.ExecuteReader()
        If rstQuery.Read() Then
            wFAP = Trim(rstQuery("Z300002FAP").ToString())
        End If
        rstQuery.Close()
        strCnn.Close()

        lbZ300002FAP.Text = Right("00" & Day(wFAP), 2) & "-" & Right("00" & Month(wFAP), 2) & "-" & Year(wFAP)



    End Sub

    Protected Sub BtnActualizar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnActualizar.Click


        Dim fileName As String = fuProductos.PostedFile.FileName

        lbMensaje.Visible = False
        lbEstatus.Visible = False

        If Len(Trim(fuProductos.PostedFile.FileName.ToString)) > 0 Then

            Dim ext As String = fileName.Substring(fileName.LastIndexOf("."))

            ext = ext.ToLower

            If ext = ".txt" Then

                'ElseIf ext = ".bmp" Then

                'ElseIf ext = ".gif" Then

                'ElseIf ext = ".jpg" Then

                'ElseIf ext = "bmp" Then

                'ElseIf ext = "gif" Then

                Subir_Archivo()


            Else

                Me.lbMensaje.Visible = True
                Me.lbMensaje.Text = "Solo debe Seleccionar documentos de texto con el formato: .txt"


            End If

        End If



    End Sub
End Class
