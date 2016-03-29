Imports System.Data.SqlClient
Imports System.Data

Partial Class C001D003
    Inherits System.Web.UI.Page

    Dim strCnn As SqlConnection
    Dim myCmd As SqlCommand
    Dim rstQuery As SqlDataReader
    Dim SQL As String

    Protected Sub btnRegresar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRegresar.Click

        Response.Redirect("../Pedidos/X001X002.asp")

    End Sub

    Protected Sub btnActualizar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnActualizar.Click

        Dim wCCI As String
        Dim wPUS As String
       
        Dim wOBS As String
        
        		
        wCCI = Request.QueryString("CCI")
        wPUS = Request.QueryString("PUS")

        
     

        wOBS = Trim(txOBS.text)
		wOBS = Replace(wOBS, "'", "")
		
        strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)

        myCmd = strCnn.CreateCommand
        SQL = "UPDATE X300ZF002 SET "
        SQL = SQL & " Z300002OBS = '" & wOBS & "',"
        SQL = SQL & " Z300002PU1 = '" & wPUS & "',"
        SQL = SQL & " Z300002FA1 = getdate() "
        SQL = SQL & " WHERE "
        SQL = SQL & " Z300002CCI = '" & wCCI & "' "
        myCmd.CommandText = SQL
        strCnn.Open()
        myCmd.ExecuteNonQuery()
        strCnn.Close()

        Response.Redirect("../Pedidos/X001X002.asp")

    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        Dim wCCI As String
        Dim wDEL As String
       	Dim wOBS As String
        Dim wPUS As String
        Dim wFAC, wDIA_FED, wMES_FED, wANO_FED As String
        Dim wCO1, wCO2 as string
	
		
        wCCI = trim(Request.QueryString("CCI"))

        strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)

        myCmd = strCnn.CreateCommand
        SQL = "SELECT Z300002OBS, "
        SQL = SQL & " Z300002FA1, Z300002PU1, "
        SQL = SQL & " Z300002DEL, Z300002CCI, Z300002CO1, Z300002CO2 "
        SQL = SQL & " FROM X300ZF002 "
        SQL = SQL & " WHERE "
        SQL = SQL & " Z300002CCI = '" & wCCI & "' "
        myCmd.CommandText = SQL
        strCnn.Open()
        rstQuery = myCmd.ExecuteReader()
        If rstQuery.Read() Then
            wCCI = trim(rstQuery("Z300002CCI").ToString())
            wDEL = trim(rstQuery("Z300002DEL").ToString())
            wOBS = trim(rstQuery("Z300002OBS").ToString())
            wPUS = trim(rstQuery("Z300002PU1").ToString())
            wFAC = trim(rstQuery("Z300002FA1").ToString())
            wCO1 = trim(rstQuery("Z300002CO1").ToString())
            wCO2 = trim(rstQuery("Z300002CO2").ToString())
        End If
        rstQuery.Close()
        strCnn.Close()
		
        lbCCI.text = wCCI
		lbDEL.text = wDEL
	    txOBS.text = wOBS
		
		txCO1.text = wCO1
	    txCO2.text = wCO2

    	
		 wDIA_FED = Day(wFAC)
        If Len(Trim(wDIA_FED)) = "1" Then : wDIA_FED = "0" & wDIA_FED : End If
        wMES_FED = Month(wFAC)
        If Len(Trim(wMES_FED)) = "1" Then : wMES_FED = "0" & wMES_FED : End If
        wANO_FED = Year(wFAC)
        wFAC = wDIA_FED & "/" & wMES_FED & "/" & wANO_FED & "  " & TimeValue(wFAC)

		
        'ddlSTS.selectedvalue = 0
        lbFAC.text = wFAC & " por " & wPUS

        
    End Sub

    Protected Sub btnSubirIm1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubirIm1.Click

        Dim fileName1 As String = FileUpload1.PostedFile.FileName


        If Len(Trim(FileUpload1.PostedFile.FileName.ToString)) > 0 Then

            Dim ext As String = fileName1.Substring(fileName1.LastIndexOf("."))


            ext = ext.ToLower


            If ext = ".gif" Or ext = ".jpg" Then

                Subir_Foto1()

            Else

                lbEstatus.Visible = True
                lbEstatus.Text = "Solo debe Seleccionar Imagenes con el formato: .gif o .jpg"

                Exit Sub
            End If

        End If

    End Sub


    Sub Subir_Foto1()


        Dim strBLOBFilePath As String = ""
        Dim sPath As String
        Dim sFile As String
        Dim sFullPath As String
        Dim sSplit() As String
        Dim sPathFriendly As String
		Dim wCCI As String

		wCCI = trim(Request.QueryString("CCI"))


        lbEstatus.Visible = False

        strBLOBFilePath = FileUpload1.PostedFile.FileName.ToString
        sPath = Server.MapPath(".")
        If Right(sPath, 1) <> "\" Then
            sPathFriendly = sPath 'Friendly path name for display
            sPath = sPath & "\Imagenes\" & wCCI & "_" 
        Else
            sPathFriendly = Left(sPath, Len(sPath) - 1)
        End If
        sFile = FileUpload1.PostedFile.FileName
        sSplit = Split(sFile, "\")
        sFile = sSplit(UBound(sSplit))
        sFullPath = sPath & sFile

        Try
            FileUpload1.PostedFile.SaveAs(sFullPath)

            Actualizar_Producto_Imagen1(sFile, sFullPath)

        Catch Ex As Exception

            lbEstatus.Visible = True
            lbEstatus.Text = "Error al tratar de Subir el Archivo " & Ex.Message

        Finally

            FileUpload1.dispose()

        End Try



    End Sub


    Sub Actualizar_Producto_Imagen1(ByVal sFile As String, ByVal sFullPath As String)

        Dim wCCI As String = Trim(Request.QueryString("CCI"))
        Dim wPUS As String = Trim(Request.QueryString("PUS"))
        Dim wExiste As Boolean = False

        strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)

     
        sFile = "Imagenes/" & wCCI & "_" & sFile


        myCmd = strCnn.CreateCommand
        SQL = "UPDATE X300ZF002 SET "
        SQL = SQL & " Z300002UR1 = '" & Trim(sFile) & "'"
        SQL = SQL & " WHERE "
        SQL = SQL & " Z300002CCI = '" & wCCI & "' "
        myCmd.CommandText = SQL
        strCnn.Open()
        myCmd.ExecuteNonQuery()
        strCnn.Close()

        'ImFoto.ImageUrl = sFile
        lbEstatus.ForeColor = Drawing.Color.Blue
        lbEstatus.Visible = True
        lbEstatus.Text = "Imagen Actualizada..."

    End Sub

    Protected Sub btnSubirIm2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubirIm2.Click

        Dim wCCI As String = Trim(Request.QueryString("CCI"))
        Dim sPath As String
        Dim sFile As String
        Dim sFile2 As String


        sPath = Server.MapPath(".")

        strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)

        myCmd = strCnn.CreateCommand
        SQL = "SELECT Z300002UR1 "
        SQL = SQL & " FROM X300ZF002 "
        SQL = SQL & " WHERE "
        SQL = SQL & " Z300002CCI = '" & wCCI & "'"
        myCmd.CommandText = SQL
        strCnn.Open()
        rstQuery = myCmd.ExecuteReader()
        If rstQuery.Read() Then
            sFile = trim(rstQuery("Z300002UR1").ToString())
        End If
        rstQuery.Close()
        strCnn.Close()

        sFile2 = sFile

        sFile = sPath & sFile
        If IO.File.Exists(sFile) = True Then
            IO.File.Delete(sFile)
        End If

        myCmd = strCnn.CreateCommand
        SQL = "UPDATE X300ZF002 SET "
        SQL = SQL & " Z300002UR1 = ''"
        SQL = SQL & " WHERE "
        SQL = SQL & " Z300002CCI = '" & wCCI & "' "
        myCmd.CommandText = SQL
        strCnn.Open()
        myCmd.ExecuteNonQuery()
        strCnn.Close()

        lbEstatus.ForeColor = Drawing.Color.Blue
        lbEstatus.Visible = True
        lbEstatus.Text = "Imagen " & sFile2 & " Eliminada..."

    End Sub
End Class
