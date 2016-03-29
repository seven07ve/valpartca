Imports System.Data.SqlClient
Imports System.Data

Partial Class C001D002
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
        Dim wSTS As String
       
        
        Dim wDEL As String
        Dim wRIF As String
        Dim wSOC As String
        Dim wORG As String
        Dim wCLA As String
        Dim wERP As String
        Dim wPAI As String
        Dim wCIU As String
        Dim wDIL As String
        Dim wTEL As String
        Dim wWEB As String
        Dim wPGE As String
        Dim wCO1 As String
        Dim wCO2 As String
        Dim wPR1 As String
        Dim wPR2 As String
        Dim wPR3 As String
        Dim wPR4 As String
        Dim wPMD As String
        Dim wMSP As String

        wCCI = Request.QueryString("CCI")
        wPUS = Request.QueryString("PUS")

        
        If ddlSTS.Text = "NO" Then
            wSTS = "1"
        ElseIf ddlSTS.Text = "SOLO A CLIENTES" Then
            wSTS = "2"
        ElseIf ddlSTS.Text = "TODOS" Then
            wSTS = "3"
        ElseIf ddlSTS.Text = "SOLO A PROVEEDORES" Then
            wSTS = "4"
        ElseIf ddlSTS.Text = "SOLO A VENDEDORES" Then
            wSTS = "5"
        End If

       
        wDEL = Trim(txDEL.text)
        wDEL = Replace(wDEL, "'", "")
        wRIF = Trim(txRIF.text)
        wRIF = Replace(wRIF, "'", "")
        wCLA = Trim(txCLA.text)
        wCO1 = Trim(txCO1.text)
        wCO2 = Trim(txCO2.text)
        wPAI = Trim(ddlPAI.text)
        wDIL = Trim(txDIL.text)
        wCIU = Trim(txCIU.text)
        wTEL = Trim(txTEL.text)
        wWEB = Trim(txWEB.text)
        wPGE = Trim(txPGE.text)

        If chVentas.checked = True Then
            wPR1 = "1"
        Else
            wPR1 = "0"
        End If

        IF chPagos.checked = true THEN
            wPR2 = "1"
        Else
            wPR2 = "0"
        End If
		
        ' If chPqr.checked = True Then
        ' wPR3 = "1"
        ' Else
        wPR3 = "0"
        ' End If

        'If chSalesPro.checked = True Then
        'wPR4 = "1"
        'Else
        wPR4 = "0"
        'End If


        strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)

        myCmd = strCnn.CreateCommand
        SQL = "UPDATE X300ZF002 SET "
        SQL = SQL & " Z300002DEL = '" & wDEL & "',"
        SQL = SQL & " Z300002RIF = '" & wRIF & "',"
        SQL = SQL & " Z300002PUS = '" & wPUS & "',"
        SQL = SQL & " Z300002STS = '" & wSTS & "',"
        SQL = SQL & " Z300002PAI = '" & wPAI & "',"
        SQL = SQL & " Z300002CIU = '" & wCIU & "',"
        SQL = SQL & " Z300002TEL = '" & wTEL & "',"
        SQL = SQL & " Z300002DIL = '" & wDIL & "',"
        SQL = SQL & " Z300002WEB = '" & wWEB & "',"
        SQL = SQL & " Z300002PGE = '" & wPGE & "',"
        SQL = SQL & " Z300002CLA = '" & wCLA & "',"
        SQL = SQL & " Z300002CO1 = '" & wCO1 & "',"
        SQL = SQL & " Z300002CO2 = '" & wCO2 & "',"
        SQL = SQL & " Z300002PR1 = '" & wPR1 & "',"
        SQL = SQL & " Z300002PR2 = '" & wPR2 & "',"
        SQL = SQL & " Z300002PR3 = '" & wPR3 & "',"
        SQL = SQL & " Z300002PR4 = '" & wPR4 & "',"
        SQL = SQL & " Z300002FAC = getdate() "
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
        Dim wRIF As String
        Dim wSOC As String
		Dim wORG As String
        Dim wPAI As String
        Dim wCIU As String
        Dim wTEL As String
        Dim wDIL As String
        Dim wWEB As String
        Dim wPGE As String
        Dim wERP As String
       	Dim wCLA As String
       	Dim wCO1 As String
       	Dim wCO2 As String
       
        Dim wSTS As String
        Dim wPUS As String
        Dim wPR1 As String
        Dim wPR2 As String
        Dim wPR3 As String
        Dim wPR4 As String
        Dim wPMD As String
        Dim wMSP As String
        Dim wFAC, wDIA_FED, wMES_FED, wANO_FED As String
	
		
        wCCI = trim(Request.QueryString("CCI"))

        strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)

        myCmd = strCnn.CreateCommand
        SQL = "SELECT Z300002RIF, Z300002SOC, Z300002ORG, Z300002PAI, "
        SQL = SQL & " Z300002STS, Z300002FAC, Z300002PUS, Z300002ERP, "
        SQL = SQL & " Z300002DEL, Z300002CLA, Z300002CO1, Z300002CO2, "
        SQL = SQL & " Z300002PR2, Z300002PR3, Z300002PR4, Z300002PMD, "
        SQL = SQL & " Z300002CIU, Z300002DIL, Z300002TEL, Z300002WEB, "
        SQL = SQL & " Z300002PGE, Z300002PR1, Z300002MSP "
        SQL = SQL & " FROM X300ZF002 "
        SQL = SQL & " WHERE "
        SQL = SQL & " Z300002CCI = '" & wCCI & "' "
        myCmd.CommandText = SQL
        strCnn.Open()
        rstQuery = myCmd.ExecuteReader()
        If rstQuery.Read() Then
            wRIF = trim(rstQuery("Z300002RIF").ToString())
            wDEL = trim(rstQuery("Z300002DEL").ToString())
            wSOC = trim(rstQuery("Z300002SOC").ToString())
            wORG = trim(rstQuery("Z300002ORG").ToString())
            wPAI = trim(rstQuery("Z300002PAI").ToString())
            wCIU = trim(rstQuery("Z300002CIU").ToString())
            wDIL = trim(rstQuery("Z300002DIL").ToString())
            wTEL = trim(rstQuery("Z300002TEL").ToString())
            wWEB = trim(rstQuery("Z300002WEB").ToString())
            wPGE = trim(rstQuery("Z300002PGE").ToString())
            wERP = trim(rstQuery("Z300002ERP").ToString())
            wSTS = trim(rstQuery("Z300002STS").ToString())
	        wPUS = trim(rstQuery("Z300002PUS").ToString())
        	wFAC = trim(rstQuery("Z300002FAC").ToString())
	        wCLA = trim(rstQuery("Z300002CLA").ToString())
        	wCO1 = trim(rstQuery("Z300002CO1").ToString())
	        wCO2 = trim(rstQuery("Z300002CO2").ToString())
            wPR1 = trim(rstQuery("Z300002PR1").ToString())
            wPR2 = trim(rstQuery("Z300002PR2").ToString())
            wPR3 = trim(rstQuery("Z300002PR3").ToString())
            wPR4 = trim(rstQuery("Z300002PR4").ToString())
            wPMD = trim(rstQuery("Z300002PMD").ToString())
            wMSP = trim(rstQuery("Z300002MSP").ToString())
        End If
        rstQuery.Close()
        strCnn.Close()
		
	
		lbCCI.text = wCCI
		
        If wPR1 = "1" Then
            chVentas.checked = True
        Else
            chVentas.checked = False
        End If

        If wPR2 = "1" Then
            chPagos.checked = True
        Else
            chPagos.checked = False
        End If
		
        'IF wPR3 = "1" THEN
        'chPqr.checked = True
        '	ELSE
        'chPqr.checked = False
        'END IF 

        'If wPR4 = "1" Then
        'chSalesPro.checked = True
        'Else
        'chSalesPro.checked = False
        'End If


        txDEL.text = wDEL
        txRIF.text = wRIF
        txCLA.text = wCLA
        txCO1.text = wCO1
        txCO2.text = wCO2
        txPGE.text = wPGE
        txCIU.text = wCIU
        txDIL.text = wDIL
        txWEB.text = wWEB
        txTEL.text = wTEL

        ddlSTS.Items.Clear()
        ddlSTS.Items.Add("NO")
        ddlSTS.Items.Add("TODOS")
        ddlSTS.Items.Add("SOLO A CLIENTES")
        ddlSTS.Items.Add("SOLO A PROVEEDORES")
        ddlSTS.Items.Add("SOLO A VENDEDORES")



        If wSTS = "1" Then
            ddlSTS.text = "NO"
        ElseIf wSTS = "2" Then
            ddlSTS.Text = "SOLO A CLIENTES"
        ElseIf wSTS = "3" Then
            ddlSTS.Text = "TODOS"
        ElseIf wSTS = "4" Then
            ddlSTS.Text = "SOLO A PROVEEDORES"
        ElseIf wSTS = "5" Then
            ddlSTS.Text = "SOLO A VENDEDORES"
        End If



        ddlPAI.Items.Clear()
        ddlPAI.Items.Add("CO")
        ddlPAI.Items.Add("EC")
        ddlPAI.Items.Add("VE")
        ddlPAI.Items.Add("PA")

        ddlPAI.text = wPAI


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


            If ext = ".gif" Or ext = ".jpg" Or ext = ".png" Then

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
            sPath = sPath & "\Imagenes\Logos\" & wCCI & "_" 
        Else
            sPathFriendly = Left(sPath, Len(sPath) - 1)
        End If
        sFile = FileUpload1.PostedFile.FileName
        sSplit = Split(sFile, "\")
        sFile = sSplit(UBound(sSplit))
        sFullPath = sPath & sFile

        Try
            FileUpload1.PostedFile.SaveAs(sFullPath)

            Actualizar_Logo_Imagen1(sFile, sFullPath)

        Catch Ex As Exception

            lbEstatus.Visible = True
            lbEstatus.Text = "Error al tratar de Subir el Archivo " & Ex.Message

        Finally

            FileUpload1.dispose()

        End Try



    End Sub


    Sub Actualizar_Logo_Imagen1(ByVal sFile As String, ByVal sFullPath As String)

        Dim wCCI As String = Trim(Request.QueryString("CCI"))
        Dim wPUS As String = Trim(Request.QueryString("PUS"))
        Dim wExiste As Boolean = False

        strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)

     
        sFile = "Imagenes/Logos/" & wCCI & "_" & sFile


        myCmd = strCnn.CreateCommand
        SQL = "UPDATE X300ZF002 SET "
        SQL = SQL & " Z300002LOG = '" & Trim(sFile) & "'"
        SQL = SQL & " WHERE "
        SQL = SQL & " Z300002CCI = '" & wCCI & "' "
        myCmd.CommandText = SQL
        strCnn.Open()
        myCmd.ExecuteNonQuery()
        strCnn.Close()

        'ImFoto.ImageUrl = sFile
        lbEstatus.ForeColor = Drawing.Color.Blue
        lbEstatus.Visible = True
        lbEstatus.Text = "Logo Actualizado..."

    End Sub

    Protected Sub btnSubirIm2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubirIm2.Click

        Dim wCCI As String = Trim(Request.QueryString("CCI"))
        Dim sPath As String
        Dim sFile As String
        Dim sFile2 As String


        sPath = Server.MapPath(".")

        strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)

        myCmd = strCnn.CreateCommand
        SQL = "SELECT Z300002LOG "
        SQL = SQL & " FROM X300ZF002 "
        SQL = SQL & " WHERE "
        SQL = SQL & " Z300002CCI = '" & wCCI & "'"
        myCmd.CommandText = SQL
        strCnn.Open()
        rstQuery = myCmd.ExecuteReader()
        If rstQuery.Read() Then
            sFile = trim(rstQuery("Z300002LOG").ToString())
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
        SQL = SQL & " Z300002LOG = ''"
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
