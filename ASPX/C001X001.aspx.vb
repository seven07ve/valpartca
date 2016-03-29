Imports System.Data
Imports System.Data.SqlClient

Partial Class C001X001
    Inherits System.Web.UI.Page

    Dim strCnn As SqlConnection
    Dim myCmd As SqlCommand
    Dim rstQuery As SqlDataReader
    Dim SQLAdapter As SqlDataAdapter
    Dim SQL As String


    Protected Sub btnAdjuntar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdjuntar.Click

        Dim fileName As String = Me.fuArchivo.PostedFile.FileName

        Me.lbMensaje.Visible = False
        Me.lbEstatus.Visible = False

        If Len(Trim(Me.fuArchivo.PostedFile.FileName.ToString)) > 0 Then

            Dim ext As String = fileName.Substring(fileName.LastIndexOf("."))

            ext = Trim(ext.ToLower)


            If ext = ".jpg" Or ext = ".gif" Or ext = ".pdf" Or ext = ".doc" Or _
                ext = ".docx" Or ext = ".ppt" Or ext = ".ppx" Then

                Me.lbMensaje.Visible = False
                Me.lbMensaje.Text = ""


                Subir_Archivo()




            Else

                Me.lbMensaje.Visible = True
                Me.lbMensaje.Text = "Solo debe Seleccionar documentos de texto con el formato: .jpg, .gif, .pdf"

                Exit Sub
            End If


        Else

            Me.lbMensaje.Visible = True
            Me.lbMensaje.Text = "Debe Seleccionar un documento."

        End If


    End Sub


    Sub Subir_Archivo()

        Dim wCCI As String = Trim(Request.QueryString("CCI"))
        Dim wNDC As String = Trim(Request.QueryString("NDC"))
        Dim wPUS As String = Trim(Request.QueryString("PUS"))

        Dim wNRO As String = ""
        Dim wNAR As String = ""
        Dim wNOR As String = ""

        Dim strBLOBFilePath As String = ""
        Dim sPath As String
        Dim sFile As String
        Dim sFullPath As String
        Dim sSplit() As String
        Dim sPathFriendly As String
        Dim wError As Boolean = False

        Me.lbMensaje.Visible = False


        wNRO = BuscarNumero(wCCI, wNDC)

        
        strBLOBFilePath = Me.fuArchivo.PostedFile.FileName.ToString
        Dim ext As String = strBLOBFilePath.Substring(strBLOBFilePath.LastIndexOf("."))

        ext = ext.ToLower

        sPath = Server.MapPath(".")
        If Right(sPath, 1) <> "\" Then
            sPathFriendly = sPath 'Friendly path name for display
            sPath = sPath & "\CRI\"
        Else
            sPathFriendly = Left(sPath, Len(sPath) - 1)
        End If

        wNAR = wCCI & "_" & wNRO & "_" & wNDC & ext
        wNOR = Me.fuArchivo.PostedFile.FileName
        sFile = wNAR 'Me.fuArchivo.PostedFile.FileName
        'sSplit = Split(sFile, "\")
        sSplit = Split(wNOR, "\")
        'sFile = sSplit(UBound(sSplit))
        wNOR = sSplit(UBound(sSplit))

        sFullPath = sPath & sFile

        'Response.Write(sFullPath)

        Try

            Me.fuArchivo.PostedFile.SaveAs(sFullPath)


        Catch Ex As Exception

            wError = True
            Me.lbMensaje.Visible = True
            Me.lbMensaje.Text = "Error al tratar de Subir el Archivo " & Ex.Message
            'lblResults.Text = "Upload of File " & sFile & " to " & sPathFriendly & " failed for the following reason: " & Ex.Message
        Finally

            If wError = False Then

                Registar_Comprobante(wCCI, wNDC, wNRO, sFile, wNOR, wPUS)
                Cargar_Archivos(wCCI, wNDC)

                Me.lbEstatus.Visible = True
                Me.lbEstatus.Text = "El archivo subio correctamente."


            End If
            'lblResults.Font.Bold = True
            'lblResults.Visible = True

        End Try

    End Sub


    Function BuscarNumero(ByVal wCCI As String, ByVal wNDC As String) As String

        BuscarNumero = ""

        strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)

        Abrir_Conexion()

        myCmd = strCnn.CreateCommand
        SQL = "SELECT ISNULL(MAX(C300004NRO),0) AS C300004NRO "
        SQL = SQL & " FROM X300CF004 "
        SQL = SQL & " WHERE "
        SQL = SQL & " C300004CCI = '" & wCCI & "' AND "
        SQL = SQL & " C300004NDC = '" & wNDC & "' "
        myCmd.CommandText = SQL
        rstQuery = myCmd.ExecuteReader()
        If rstQuery.Read() Then
            BuscarNumero = CInt(rstQuery("C300004NRO").ToString()) + 1
        End If
        rstQuery.Close()
        rstQuery = Nothing

        Cerrar_Conexion()

    End Function


    Sub Registar_Comprobante(ByVal wCCI As String, ByVal wNDC As String, ByVal wNRO As String, ByVal wNAR As String, ByVal wNOR As String, ByVal wPUS As String)



        strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)

        Abrir_Conexion()

        myCmd = strCnn.CreateCommand
        SQL = "INSERT INTO X300CF004 ("
        SQL = SQL & "  C300004CCI, C300004CIA, C300004NDC, C300004NRO, "
        SQL = SQL & "  C300004NAR, C300004NOR, C300004FPR, C300004PUS "
        SQL = SQL & "  )"
        SQL = SQL & " VALUES ( "
        SQL = SQL & "'" & wCCI & "', "
        SQL = SQL & "'01', "
        SQL = SQL & "'" & wNDC & "', "
        SQL = SQL & "'" & wNRO & "', "
        SQL = SQL & "'" & wNAR & "', "
        SQL = SQL & "'" & wNOR & "', "
        SQL = SQL & "getdate(), "
        SQL = SQL & "'" & wPUS & "'"
        SQL = SQL & ")"
        myCmd.CommandText = SQL
        myCmd.ExecuteNonQuery()
        myCmd.Dispose()

        Cerrar_Conexion()

    End Sub

    Sub Cargar_Archivos(ByVal wCCI As String, ByVal wNDC As String)


        Dim ds As New DataSet

        strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)

        SQL = "SELECT C300004NRO, RTRIM(LTRIM(C300004NAR)) AS C300004NAR, RTRIM(LTRIM(C300004NOR)) AS C300004NOR "
        SQL = SQL & " FROM X300CF004 WHERE "
        SQL = SQL & " C300004CCI = '" & wCCI & "' AND "
        SQL = SQL & " C300004NDC = '" & wNDC & "' "
        SQL = SQL & " ORDER BY C300004NRO "

        SQLAdapter = New SqlDataAdapter(SQL, strCnn)
        SQLAdapter.Fill(ds, "X300CF004")
        gvArvhivos.DataSource = ds
        gvArvhivos.DataBind()

        SQLAdapter.Dispose()
        ds.Dispose()

    End Sub

    Sub Abrir_Conexion()

        If strCnn.State = ConnectionState.Closed Then
            strCnn.Open()
        End If

    End Sub

    Sub Cerrar_Conexion()

        If strCnn.State <> ConnectionState.Closed Then
            strCnn.Close()
        End If

    End Sub


    
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        Dim wCCI As String = Trim(Request.QueryString("CCI"))
        Dim wNDC As String = Trim(Request.QueryString("NDC"))

        lbNDC.Text = wNDC
        Cargar_Archivos(wCCI, wNDC)


    End Sub


    Sub Eliminar_Archivo(ByVal wNRO As String)

        Dim wCCI As String = Trim(Request.QueryString("CCI"))
        Dim wNDC As String = Trim(Request.QueryString("NDC"))
        Dim wNAR As String = ""

        strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)

        Try

            Abrir_Conexion()

            myCmd = strCnn.CreateCommand
            SQL = "SELECT C300004NAR "
            SQL = SQL & " FROM X300CF004 "
            SQL = SQL & " WHERE "
            SQL = SQL & " C300004CCI = '" & wCCI & "' AND "
            SQL = SQL & " C300004NDC = '" & wNDC & "' AND "
            SQL = SQL & " C300004NRO = '" & wNRO & "' "
            myCmd.CommandText = SQL
            rstQuery = myCmd.ExecuteReader()
            If rstQuery.Read() Then
                wNAR = Trim(rstQuery("C300004NAR").ToString())
            End If
            rstQuery.Close()
            rstQuery = Nothing

            myCmd = strCnn.CreateCommand
            SQL = "DELETE FROM X300CF004 "
            SQL = SQL & " WHERE "
            SQL = SQL & " C300004CCI = '" & wCCI & "' AND "
            SQL = SQL & " C300004NDC = '" & wNDC & "' AND "
            SQL = SQL & " C300004NRO = '" & wNRO & "' "
            myCmd.CommandText = SQL
            myCmd.ExecuteNonQuery()
            myCmd.Dispose()

        Catch ex As Exception

        Finally

            Cerrar_Conexion()

            Dim wPath As String = Server.MapPath(".")

            If System.IO.File.Exists(wPath & "\CRI\" & wNAR) = True Then
                System.IO.File.Delete(wPath & "\CRI\" & wNAR)
            End If

            Cargar_Archivos(wCCI, wNDC)

        End Try

    End Sub

   
    Protected Sub gvArvhivos_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvArvhivos.RowCommand


        Dim wNRO As String



        wNRO = Trim(e.CommandArgument)

        If e.CommandName = "Select" Then

            'Dim wI As Integer = GridView1.SelectedIndex
            'ScriptManager.RegisterStartupScript(Me, Me.GetType, "key", "alert('" & wI & "');", True)


        End If

        If e.CommandName = "Delete" Then

            'ScriptManager.RegisterStartupScript(Me, Me.GetType, "key", "alert('" & wCPR & "');", True)

            Eliminar_Archivo(wNRO)

        End If




    End Sub

    Protected Sub gvArvhivos_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles gvArvhivos.RowDeleting



    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Response.AddHeader("cache-control", "private")
        Response.AddHeader("pragma", "no-cache")
        Response.AddHeader("Cache-Control", "must-revalidate")
        Response.AddHeader("Cache-Control", "no-cache")

    End Sub

    Protected Sub btnContinuar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContinuar.Click

        Dim wNDC As String = Trim(Request.QueryString("NDC"))

        Response.Redirect("../Pedidos/X001A107.asp?CLA001=" & wNDC)

    End Sub

    Protected Sub btnRegresar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRegresar.Click

        Dim wNDC As String = Trim(Request.QueryString("NDC"))

        Response.Redirect("../Pedidos/X001A109_S.asp?CLA002=" & wNDC & "&CLA003=0")

    End Sub
End Class
