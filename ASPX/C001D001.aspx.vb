Imports System.Data.SqlClient
Imports System.Data
Imports System.Drawing.Imaging
Imports System.IO


Partial Class C001D001
    Inherits System.Web.UI.Page
    Dim strCnn As SqlConnection
    Dim myCmd As SqlCommand
    Dim rstQuery As SqlDataReader
    Dim SQL As String
    Dim wProcesoI As String = "Agregar"
    'Dim Enviar As xmlHttpRequest

    Protected Sub btnAceptar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAceptar.Click


        Dim fileName As String = fuZ300050FOT.PostedFile.FileName
        If Len(Trim(fuZ300050FOT.PostedFile.FileName.ToString)) > 0 Then

            Dim ext As String = fileName.Substring(fileName.LastIndexOf("."))

            ext = ext.ToLower

            If ext = ".jpg" Then

            ElseIf ext = ".bmp" Then

            ElseIf ext = ".gif" Then

            ElseIf ext = "jpg" Then

            ElseIf ext = "bmp" Then

            ElseIf ext = "gif" Then

            Else

                lbEstatus.Text = "Solo debe Seleccionar imagenes en el formato siguiente: gif, bmp, or jpg."

                Exit Sub
            End If

        End If

        Proceso(wProcesoI)
        'Button1.Attributes.Add("onclick", "alert('" & FreeTextBox1.Text & "');")

    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        Dim wCLA001 As String
        Dim wZ300050TIL As String = ""
        Dim wZ300050DNL As String = ""
        Dim wZ300050STS As String = ""
        Dim wZ300050FOG As String = ""
        Dim wANO As String
        Dim wMES As String
        Dim wDIA As String
        Dim wHOR As String
        Dim wMIN As String

        wCLA001 = Request.QueryString("CODCOR")

        strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)

        If Len(Trim(wCLA001)) > 0 Then

            myCmd = strCnn.CreateCommand
            SQL = "SELECT * FROM X300ZF050 "
            SQL = SQL & " WHERE "
            SQL = SQL & " Z300050CDN ='" & wCLA001 & "'"
            myCmd.CommandText = SQL
            strCnn.Open()
            rstQuery = myCmd.ExecuteReader()
            If rstQuery.Read() Then
                wZ300050TIL = Trim(rstQuery("Z300050TIL").ToString())
                wZ300050DNL = Trim(rstQuery("Z300050DNL").ToString())
                wZ300050STS = Trim(rstQuery("Z300050STS").ToString())
                wZ300050FOG = Trim(rstQuery("Z300050FOG").ToString())
            End If
            rstQuery.Close()
            strCnn.Close()

            txZ300050CDN.Text = wCLA001
            txZ300050TIL.Text = wZ300050TIL
            txZ300050DNL.Text = wZ300050DNL
            ddlZ300050STS.Items.Clear()
            ddlZ300050STS.Items.Add("Activa")
            ddlZ300050STS.Items.Add("Inactiva")

            If wZ300050STS = "1" Then
                ddlZ300050STS.Text = "Activa"
            Else
                ddlZ300050STS.Text = "Inactiva"
            End If
            'txZ300050TIL.Focus()
            wProcesoI = "Actualizar"

            'Mostrar Imagen
            'Image.ImageUrl = "C001D001.ashx?CDN=" & wCLA001
            Image.ImageUrl = "\ASPX\IMG\" & wZ300050FOG

        Else

            wANO = Year(Now)
            wMES = Month(Now)
            If Len(Trim(wMES)) = "1" Then
                wMES = "0" & wMES
            End If

            wDIA = Day(Now)
            If Len(Trim(wDIA)) = "1" Then
                wDIA = "0" & wDIA
            End If

            wHOR = Hour(Now)
            If Len(Trim(wHOR)) = "1" Then
                wHOR = "0" & wHOR
            End If

            wMIN = Minute(Now)
            If Len(Trim(wMIN)) = "1" Then
                wMIN = "0" & wMIN
            End If

            wCLA001 = wANO & wMES & wDIA & wHOR & wMIN
            txZ300050CDN.Text = wCLA001

            ddlZ300050STS.Items.Clear()
            ddlZ300050STS.Items.Add("Activa")
            ddlZ300050STS.Items.Add("Inactiva")
            ddlZ300050STS.Text = "Activa"
            'txZ300050TIL.Focus()
            wProcesoI = "Agregar"

        End If

    End Sub


    Protected Sub btnCancelar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelar.Click

        'btnCancelar.Attributes.Add("onclick", "history.back();")
        Response.Redirect("../Pedidos/ADM/X010Z300FI.ASP")


    End Sub

    Sub Proceso(ByVal wProcesoI As String)

        Dim wZ300050CDN As String
        Dim wZ300050TIL, wZ300050DNL, wZ300050STS As String
        Dim strBLOBFilePath As String = ""
        Dim sPath As String
        Dim sFile As String
        Dim sFullPath As String
        Dim sSplit() As String
        Dim sPathFriendly As String


        wZ300050CDN = txZ300050CDN.Text
        wZ300050TIL = txZ300050TIL.Text
        wZ300050DNL = txZ300050DNL.Text
        wZ300050STS = ddlZ300050STS.SelectedItem.Text
        strBLOBFilePath = fuZ300050FOT.PostedFile.FileName.ToString

        If wZ300050STS = "Activa" Then
            wZ300050STS = "1"
        Else
            wZ300050STS = "0"
        End If

        sPath = Server.MapPath(".")
        If Right(sPath, 1) <> "\" Then
            sPathFriendly = sPath 'Friendly path name for display
            sPath = sPath & "\IMG\"
        Else
            sPathFriendly = Left(sPath, Len(sPath) - 1)
        End If

        sFile = fuZ300050FOT.PostedFile.FileName
        sSplit = Split(sFile, "\")
        sFile = sSplit(UBound(sSplit))

        sFullPath = sPath & sFile

        'Dim fsBLOBFile As New FileStream(strBLOBFilePath, FileMode.Open, FileAccess.Read)
        'Dim bytBLOBData(fsBLOBFile.Length() - 1) As Byte
        'fsBLOBFile.Read(bytBLOBData, 0, bytBLOBData.Length)
        'fsBLOBFile.Close()

        'Dim wPAR As New SqlParameter("@Z300050FOT", SqlDbType.VarBinary, _
        '  bytBLOBData.Length, ParameterDirection.Input, False, 0, 0, Nothing, DataRowVersion.Current, bytBLOBData)


        strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)
        myCmd = strCnn.CreateCommand
        If wProcesoI = "Agregar" Then
            SQL = "INSERT INTO X300ZF050 ("
            SQL = SQL & " Z300050CDN, Z300050TIL, Z300050DNC, Z300050DNL, "
            SQL = SQL & " Z300050STS, Z300050FEC, Z300050PUS, Z300050FOG) " ', Z300050FOT
            SQL = SQL & " VALUES ( "
            SQL = SQL & "'" & wZ300050CDN & "',"
            SQL = SQL & "'" & wZ300050TIL & "',"
            SQL = SQL & "' ',"
            SQL = SQL & "'" & wZ300050DNL & "',"
            SQL = SQL & "'" & wZ300050STS & "',"
            SQL = SQL & "getdate(),"
            SQL = SQL & "' ',"
            SQL = SQL & "'" & sFile & "')"
            'SQL = SQL & "@Z300050FOT)"
            'myCmd.Parameters.Add(wPAR)
        End If

        If wProcesoI = "Actualizar" Or wProcesoI = "Eliminar" Then
            If wProcesoI = "Eliminar" Then
                SQL = "DELETE FROM X300ZF050  "
            Else
                SQL = "UPDATE X300ZF050 SET "
                SQL = SQL & " Z300050TIL = '" & wZ300050TIL & "',"
                SQL = SQL & " Z300050DNL = '" & wZ300050DNL & "',"
                SQL = SQL & " Z300050STS = '" & wZ300050STS & "',"
                SQL = SQL & " Z300050FEC = getdate(), "
                SQL = SQL & " Z300050PUS = ' ',"
                SQL = SQL & " Z300050FOG = '" & sFile & "'"
                'SQL = SQL & " Z300050FOT = @Z300050FOT "
                'myCmd.Parameters.Add(wPAR)
            End If
            SQL = SQL & " WHERE "
            SQL = SQL & " Z300050CDN = '" & wZ300050CDN & "' "
        End If
        'Response.Write(SQL)
        myCmd.CommandText = SQL
        strCnn.Open()
        myCmd.ExecuteNonQuery()
        strCnn.Close()


        Try
            fuZ300050FOT.PostedFile.SaveAs(sFullPath)
            'lblResults.Text = "Upload of File " & sFile & " to " & sPathFriendly & " succeeded"

        Catch Ex As Exception

            'lblResults.Text = "Upload of File " & sFile & " to " & sPathFriendly & " failed for the following reason: " & Ex.Message
        Finally
            'lblResults.Font.Bold = True
            'lblResults.Visible = True
        End Try

        Response.Redirect("../Pedidos/ADM/X010Z300FI.ASP")

    End Sub

    Protected Sub btnEliminar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEliminar.Click

        Proceso("Eliminar")

    End Sub


   
End Class
