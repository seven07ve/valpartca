Imports System.Data
Imports System.Data.SqlClient


Partial Class C001M003
    Inherits System.Web.UI.Page
    Dim strCnn As SqlConnection
    Dim myCmd As SqlCommand
    Dim rstQuery As SqlDataReader
    Dim SQL As String
    Dim wProcesoI As String = "Agregar"


    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init


        Dim wA300003DEL, wA300003STS, wA300003FAC, wA300003FPR As String
        Dim wCLA001, wCLA002, wCLA003, wA300003PUS, wA300003UME As String
        Dim wA300003NLP, wA300003REF, wA300003MAR As String
        Dim wA300022UR1, wA300022UR2 As String
        Dim wA300003KPC, wA300003UCA, wA300003PUA, wA300003PUB As Double
        Dim wA300003PIM, wA300003CIN, wA300003BCK As Double
        'Dim wB300121NLP, wB300121DEC As String
       

        wA300003PUB = 0
        wA300003DEL = "" : wA300003STS = "" : wA300003UME = "" : wA300003NLP = ""
        wA300003REF = "" : wA300003MAR = ""
        wA300003FAC = "" : wA300003FPR = "" : wA300003PUS = ""
        wA300022UR1 = "" : wA300022UR2 = ""

        wCLA001 = Trim(Request.QueryString("CLA001"))
        wCLA002 = Trim(Request.QueryString("CLA002"))
        wCLA003 = Trim(Request.QueryString("CLA003"))
        
        Dim wCO1, wCO2 as string 

        strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)


        'ddlA300003STS.Items.Clear()
        'ddlA300003STS.Items.Add("SI")
        'ddlA300003STS.Items.Add("NO")

        'ddlA300003ONH.Items.Clear()
        'ddlA300003ONH.Items.Add("SI")
        'ddlA300003ONH.Items.Add("NO")

        'ddlA300003INA.Items.Clear()
        'ddlA300003INA.Items.Add("SI")
        'ddlA300003INA.Items.Add("NO")
		
		 myCmd = strCnn.CreateCommand
        SQL = SQL & " SELECT Z300002DEL, Z300002CO1, Z300002CO2 "
        SQL = SQL & " FROM X300ZF002 "
        SQL = SQL & " WHERE "
        SQL = SQL & " Z300002CCI = '" & wCLA002 & "' "
        myCmd.CommandText = SQL
        strCnn.Open()
        rstQuery = myCmd.ExecuteReader()
        If rstQuery.Read() Then
 			'wDEL = trim(rstQuery("Z300002DEL").ToString())
 			wCO1 = trim(rstQuery("Z300002CO1").ToString())
			wCO2 = trim(rstQuery("Z300002CO2").ToString())
        End If
        rstQuery.Close()
        strCnn.Close()
        
        
		txCO1.text = wCO1
	    txCO2.text = wCO2


       
        If Len(Trim(wCLA001)) > 0 Then
            lbTitulo.Text = "Actualizar Producto"

            myCmd = strCnn.CreateCommand
            SQL = "SELECT A300003DEL, A300003STS, A300003NLP, A300003REF, "
            SQL = SQL & " A300003MAR, A300003FAC, A300003FPR, A300003PUS, "
            SQL = SQL & " A300003KPC, A300003UCA, A300003PUA, A300003PIM, "
            SQL = SQL & " A300003UME, A300003CIN "
            SQL = SQL & " FROM X300AF003 "
            SQL = SQL & " WHERE "
            SQL = SQL & " A300003CPR ='" & wCLA001 & "' AND"
            SQL = SQL & " A300003CCI ='" & wCLA002 & "'"
            myCmd.CommandText = SQL
            strCnn.Open()
            rstQuery = myCmd.ExecuteReader()
            If rstQuery.Read() Then
                wA300003DEL = Trim(rstQuery("A300003DEL").ToString())
                wA300003STS = Trim(rstQuery("A300003STS").ToString())
                wA300003NLP = Trim(rstQuery("A300003NLP").ToString())
                wA300003REF = Trim(rstQuery("A300003REF").ToString())
                wA300003MAR = Trim(rstQuery("A300003MAR").ToString())
                wA300003FAC = Trim(rstQuery("A300003FAC").ToString())
                wA300003FPR = Trim(rstQuery("A300003FPR").ToString())
                wA300003PUS = Trim(rstQuery("A300003PUS").ToString())
                wA300003KPC = rstQuery("A300003KPC").ToString()
                wA300003UCA = rstQuery("A300003UCA").ToString()
                wA300003PUA = rstQuery("A300003PUA").ToString()
                wA300003PIM = rstQuery("A300003PIM").ToString()
                wA300003UME = Trim(rstQuery("A300003UME").ToString())
                wA300003CIN = rstQuery("A300003CIN").ToString()
                
            Else
                wA300003KPC = 0
                wA300003UCA = 0
                wA300003PUA = 0
                wA300003PIM = 0
                wA300003UME = 0
                wA300003CIN = 0
                wA300003BCK = 0
            End If
            rstQuery.Close()
            strCnn.Close()

            wA300003CIN = FormatNumber(wA300003CIN, 0, , , TriState.True)
            'wA300003BCK = FormatNumber(wA300003BCK, 0, , , TriState.True)

            myCmd = strCnn.CreateCommand
            SQL = "SELECT A300022UR1, A300022UR2, A300022FAC, A300022PUS "
            SQL = SQL & " FROM X300AF022 "
            SQL = SQL & " WHERE "
            SQL = SQL & " A300022CPR ='" & wCLA001 & "' AND"
            SQL = SQL & " A300022CCI ='" & wCLA002 & "'"
            myCmd.CommandText = SQL
            strCnn.Open()
            rstQuery = myCmd.ExecuteReader()
            If rstQuery.Read() Then
                wA300022UR1 = Trim(rstQuery("A300022UR1").ToString())
                wA300022UR2 = Trim(rstQuery("A300022UR2").ToString())
                wA300003FAC = Trim(rstQuery("A300022FAC").ToString())
                wA300003PUS = Trim(rstQuery("A300022PUS").ToString()) 
            End If
            rstQuery.Close()
            strCnn.Close()
            
            

            txA300003CPR.ReadOnly = True
            txA300003CPR.Text = wCLA001
            lbCPR.Text = wCLA001
            lbDEL.Text = wA300003DEL
            If Len(Trim(wA300022UR1)) > 0 Then
                ImFoto.ImageUrl = wA300022UR1
            Else
                ImFoto.ImageUrl = "Imagenes/nodisponible.jpg"
            End If
           

            lbCIN.Text = wA300003CIN
            
            IF len(trim(wA300003FAC)) > 0  and NOT Isdbnull(wA300003FAC) THEN
               	lbFAC.Text = Right("00" & Day(wA300003FAC), 2) & "-" & Right("00" & Month(wA300003FAC), 2) & "-" & Year(wA300003FAC) & "  " & Right("00" & Hour(wA300003FAC), 2) & ":" & Right("00" & Minute(wA300003FAC), 2) & ":" & Right("00" & Second(wA300003FAC), 2)
			ELSE
				lbFAC.Text = "No Disponible"	
			END IF 
			
            lbPUS.Text = wA300003PUS

            wProcesoI = "Actualizar"
        Else
            lbTitulo.Text = "Nuevo Producto"
            txA300003CPR.Focus()
            lbFAC.Text = Right("00" & Day(Today), 2) & "-" & Right("00" & Month(Today), 2) & "-" & Year(Today) & "  " & Right("00" & Hour(Today), 2) & ":" & Right("00" & Minute(Today), 2) & ":" & Right("00" & Second(Today), 2)

            lbPUS.Text = wCLA003


            'txA300003PUA.Text = 0
            'txA300003PUB.Text = 0
            'txA300003CIN.Text = 0
            wProcesoI = "Agregar"
        End If



    End Sub

    Sub Proceso(ByVal wProcesoI As String)

        Dim wA300003DEL, wA300003STS As String ', wA300003FAC, wA300003FPR As String
        Dim wA300003PUS, wA300003UME, wA300003NLP, wA300003REF As String
        Dim wA300003MAR, wA300003KPC, wA300003UCA, wA300003PUA As String
        Dim wA300003PIM, wA300003CIN, wA300003CPR, wA300003PUB As String
        Dim wA300003ONH, wA300003INA As String
        Dim wURL As String

        Dim wPARBUS01 As String = Trim(Request.QueryString("PARBUS01"))
        Dim wPARBUS02 As String = Trim(Request.QueryString("PARBUS02"))
        Dim wPARBUS03 As String = Trim(Request.QueryString("PARBUS03"))
        Dim wPARBUS04 As String = Trim(Request.QueryString("PARBUS04"))


        Dim wCLA002, wExiste, wError, wMensaje As String

        wExiste = "N" : wError = "N" : wMensaje = ""

        wCLA002 = Trim(Request.QueryString("CLA002"))

        wA300003CPR = txA300003CPR.Text
        'wA300003DEL = txA300003DEL.Text
        'wA300003UME = txA300003UME.Text
        'wA300003NLP = ddlB300121NLP.SelectedValue
        'wA300003ONH = ddlA300003ONH.SelectedValue
        'wA300003INA = ddlA300003INA.SelectedValue
        'wA300003REF = txA300003REF.Text
        'wA300003MAR = txA300003MAR.Text
        'wA300003KPC = txA300003KPC.Text
        'wA300003UCA = txUCA.Text
        'wA300003PUA = txA300003PUA.Text
        'wA300003PUB = txA300003PUB.Text
        'wA300003PIM = txA300003PIM.Text
        'wA300003CIN = txA300003CIN.Text
        ' wA300003STS = ddlA300003STS.Text
        'If wA300003STS = "NO" Then
        'wA300003STS = "0"
        'Else
        'wA300003STS = "1"
        'End If
        'If wA300003ONH = "NO" Then
        'wA300003ONH = "0"
        'Else
        'wA300003ONH = "1"
        'End If
        'If wA300003INA = "NO" Then
        'wA300003INA = "0"
        'Else
        'wA300003INA = "1"
        'End If
        wA300003PUS = lbPUS.Text

        strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)

        If Len(Trim(wA300003CPR)) = 0 Then
            wError = "S"
            wMensaje = "Debe Ingresar el Codigo de Cliente"
        End If

        If wProcesoI = "Agregar" Then
            myCmd = strCnn.CreateCommand
            SQL = "SELECT A300003PUS  "
            SQL = SQL & " FROM X300AF003 "
            SQL = SQL & " WHERE "
            SQL = SQL & " A300003CPR ='" & wA300003CPR & "' AND "
            SQL = SQL & " A300003CCI ='" & wCLA002 & "'"
            myCmd.CommandText = SQL
            strCnn.Open()
            rstQuery = myCmd.ExecuteReader()
            If rstQuery.Read() Then
                wError = "S"
                wMensaje = "Codigo de Producto ya Existe"
            End If
            rstQuery.Close()
            strCnn.Close()
        End If

        'If IsNumeric(wA300003PUA) = False Or IsNumeric(wA300003PIM) = False Or IsNumeric(wA300003CIN) = False Then
        'wError = "S"
        'wMensaje = "Debe Ingresar Numeros en el % Pronto Pago"
        'End If

        If wError = "N" Then
            myCmd = strCnn.CreateCommand
            If wProcesoI = "Agregar" Then
                SQL = "INSERT INTO X300AF003 ("
                SQL = SQL & " A300003CCI, A300003CIA, A300003CPR, A300003DEL,  "
                SQL = SQL & " A300003KPC, A300003STS, A300003UME, A300003UCA,  "
                SQL = SQL & " A300003NPS, A300003NLP, A300003TPR, A300003STP,  "
                SQL = SQL & " A300003REF, A300003MAR, A300003FAC, A300003FPR,  "
                SQL = SQL & " A300003PUS, A300003PUA, A300003PUB, A300003PIM,  "
                SQL = SQL & " A300003CIN, A300003PPR, A300003BPR, A300003ONH,  "
                SQL = SQL & " A300003INA ) "
                SQL = SQL & " VALUES ( "
                SQL = SQL & "'" & wCLA002 & "',"
                SQL = SQL & "'01',"
                SQL = SQL & "'" & wA300003CPR & "',"
                SQL = SQL & "'" & wA300003DEL & "',"
                SQL = SQL & "'" & wA300003KPC & "',"
                SQL = SQL & "'" & wA300003STS & "',"
                SQL = SQL & "'" & wA300003UME & "',"
                SQL = SQL & "'" & wA300003UCA & "',"
                SQL = SQL & "'001',"
                SQL = SQL & "'" & wA300003NLP & "',"
                SQL = SQL & "'001',"
                SQL = SQL & "'" & wA300003NLP & "',"
                SQL = SQL & "'" & wA300003REF & "',"
                SQL = SQL & "'" & wA300003MAR & "',"
                SQL = SQL & "getdate(),"
                SQL = SQL & "getdate(),"
                SQL = SQL & "'" & wA300003PUS & "',"
                SQL = SQL & "'" & wA300003PUA & "',"
                SQL = SQL & "'" & wA300003PUB & "',"
                SQL = SQL & "'" & wA300003PIM & "',"
                SQL = SQL & "'" & wA300003CIN & "',"
                SQL = SQL & "0,"
                SQL = SQL & "0 ,"
                SQL = SQL & "'" & wA300003ONH & "',"
                SQL = SQL & "'" & wA300003INA & "')"
            End If

            If wProcesoI = "Actualizar" Or wProcesoI = "Eliminar" Then
                If wProcesoI = "Eliminar" Then
                    SQL = "DELETE FROM X300AF003  "
                Else
                    SQL = "UPDATE X300AF003 SET "
                    'SQL = SQL & " A300003DEL = '" & wA300003DEL & "',"

                    'SQL = SQL & " A300003KPC = '" & wA300003KPC & "',"
                    'SQL = SQL & " A300003UME = '" & wA300003UME & "',"
                    SQL = SQL & " A300003UCA = '" & wA300003UCA & "',"
                    SQL = SQL & " A300003NLP = '" & wA300003NLP & "',"
                    SQL = SQL & " A300003STP = '" & wA300003NLP & "',"
                    'SQL = SQL & " A300003REF = '" & wA300003REF & "',"
                    'SQL = SQL & " A300003MAR = '" & wA300003MAR & "',"
                    'SQL = SQL & " A300003PUA = '" & wA300003PUA & "',"
                    'SQL = SQL & " A300003PUB = '" & wA300003PUB & "',"
                    'SQL = SQL & " A300003PIM = '" & wA300003PIM & "',"
                    'SQL = SQL & " A300003CIN = '" & wA300003CIN & "',"
                    SQL = SQL & " A300003STS = '" & wA300003STS & "',"
                    SQL = SQL & " A300003ONH = '" & wA300003ONH & "',"
                    SQL = SQL & " A300003INA = '" & wA300003INA & "',"
                    SQL = SQL & " A300003FAC = getdate(), "
                    SQL = SQL & " A300003PUS = '" & wA300003PUS & "'"
                End If
                SQL = SQL & " WHERE "
                SQL = SQL & " A300003CCI = '" & wCLA002 & "' AND "
                SQL = SQL & " A300003CPR = '" & wA300003CPR & "'  "
            End If
            myCmd.CommandText = SQL
            strCnn.Open()
            myCmd.ExecuteNonQuery()
            strCnn.Close()

        End If


        If wError = "S" Then
            lbMensaje.Visible = True
            lbMensaje.Text = wMensaje
        Else
            'Response.Redirect("../X001X100_S.asp?NOMTAB=X300AF003")

            wURL = "../Pedidos/X001X100_S.asp?NOMTAB=X300AF003"
            wURL = wURL & "&PARBUS01=" & wPARBUS01 & "&PARBUS02=" & wPARBUS02
            wURL = wURL & "&PARBUS03=" & wPARBUS03 & "&PARBUS04=" & wPARBUS04

            Response.Redirect(wURL)
        End If



    End Sub

    Protected Sub btnAceptar_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Proceso(wProcesoI)

    End Sub

    Protected Sub btnCancelar_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim wURL As String
        Dim wPARBUS01 As String = Trim(Request.QueryString("PARBUS01"))
        Dim wPARBUS02 As String = Trim(Request.QueryString("PARBUS02"))
        Dim wPARBUS03 As String = Trim(Request.QueryString("PARBUS03"))
        Dim wPARBUS04 As String = Trim(Request.QueryString("PARBUS04"))


        wURL = "../Pedidos/X001X160_S.asp?NOMTAB=X300AF003"
        wURL = wURL & "&PARBUS01=" & wPARBUS01 & "&PARBUS02=" & wPARBUS02
        wURL = wURL & "&PARBUS03=" & wPARBUS03

        Response.Redirect(wURL)

    End Sub

    Protected Sub btnEliminar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEliminar.Click

        Proceso("Eliminar")

    End Sub
  
     
    
    
    Protected Sub btnSubirFoto_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubirFoto.Click


        Dim fileName As String = FileUpload.PostedFile.FileName


        If Len(Trim(FileUpload.PostedFile.FileName.ToString)) > 0 Then

            Dim ext As String = fileName.Substring(fileName.LastIndexOf("."))


            ext = ext.ToLower


            If ext = ".gif" Or ext = ".jpg" Then

                Subir_Foto()

            Else

                lbMensaje2.Visible = True
                lbMensaje2.Text = "Solo debe Seleccionar Imagenes con el formato: .gif o .jpg"

                Exit Sub
            End If

        End If


    End Sub



    Sub Subir_Foto()


        Dim strBLOBFilePath As String = ""
        Dim sPath As String
        Dim sFile As String
        Dim sFullPath As String
        Dim sSplit() As String
        Dim sPathFriendly As String


        lbMensaje2.Visible = False

        strBLOBFilePath = FileUpload.PostedFile.FileName.ToString
        sPath = Server.MapPath(".")
        If Right(sPath, 1) <> "\" Then
            sPathFriendly = sPath 'Friendly path name for display
            sPath = sPath & "\Imagenes\Productos\"
        Else
            sPathFriendly = Left(sPath, Len(sPath) - 1)
        End If
        sFile = FileUpload.PostedFile.FileName
        sSplit = Split(sFile, "\")
        sFile = sSplit(UBound(sSplit))
        sFullPath = sPath & sFile

        Try
            FileUpload.PostedFile.SaveAs(sFullPath)

            Actualizar_Producto_Imagen(sFile, sFullPath)

        Catch Ex As Exception

            lbMensaje2.Visible = True
            lbMensaje2.Text = "Error al tratar de Subir el Archivo " & Ex.Message

        End Try
    End Sub

    Sub Actualizar_Producto_Imagen(ByVal sFile As String, ByVal sFullPath As String)

        Dim wCCI As String = Trim(Request.QueryString("CLA002"))
        Dim wCPR As String = Trim(txA300003CPR.Text)
        Dim wPUS As String = Trim(Request.QueryString("CLA003"))
        Dim wExiste As Boolean = False

        strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)

        myCmd = strCnn.CreateCommand
        SQL = "SELECT A300022UR1 "
        SQL = SQL & " FROM X300AF022 "
        SQL = SQL & " WHERE "
        SQL = SQL & " A300022CCI = '" & wCCI & "' AND "
        SQL = SQL & " A300022CPR = '" & wCPR & "' "
        myCmd.CommandText = SQL
        strCnn.Open()
        rstQuery = myCmd.ExecuteReader()
        If rstQuery.Read() Then
            wExiste = True
        End If
        rstQuery.Close()
        strCnn.Close()

        sFile = "Imagenes/Productos/" & sFile

        If IO.File.Exists(sFile) = True Then
            IO.File.Delete(sFile)
        End If




        If wExiste = False Then
            SQL = "INSERT INTO X300AF022 ("
            SQL = SQL & " A300022CCI, A300022CIA, A300022CPR, A300022UR1, "
            SQL = SQL & " A300022FAC, A300022PUS )"
            SQL = SQL & " VALUES ( "
            SQL = SQL & "'" & wCCI & "',"
            SQL = SQL & "'01',"
            SQL = SQL & "'" & wCPR & "',"
            SQL = SQL & "'" & Trim(sFile) & "',"
            SQL = SQL & "getdate(),"
            SQL = SQL & "'" & wPUS & "')"
        Else
            SQL = "UPDATE X300AF022 SET "
            SQL = SQL & " A300022FAC = getdate(), "
            SQL = SQL & " A300022UR1 = '" & Trim(sFile) & "'"
            SQL = SQL & " WHERE "
            SQL = SQL & " A300022CCI = '" & wCCI & "' AND "
            SQL = SQL & " A300022CIA = '01' AND "
            SQL = SQL & " A300022CPR = '" & wCPR & "'"
        End If
        myCmd.CommandText = SQL
        strCnn.Open()
        myCmd.ExecuteNonQuery()
        strCnn.Close()

        ImFoto.ImageUrl = sFile
        lbMensaje2.ForeColor = Drawing.Color.Blue
        lbMensaje2.Visible = True
        lbMensaje2.Text = "Imagen Actualizada..."

    End Sub

    Protected Sub btnEliminarFoto_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEliminarFoto.Click

        Dim wCCI As String = Trim(Request.QueryString("CLA002"))
        Dim wCPR As String = Trim(txA300003CPR.Text)
        Dim wA300020UR1 As String = ""

        strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)

        myCmd = strCnn.CreateCommand
        SQL = " DELETE FROM X300AF022 "
        SQL = SQL & " WHERE "
        SQL = SQL & " A300022CCI = '" & wCCI & "' AND "
        SQL = SQL & " A300022CPR = '" & wCPR & "' "
        myCmd.CommandText = SQL
        strCnn.Open()
        myCmd.ExecuteNonQuery()
        strCnn.Close()

        wA300020UR1 = "Imagenes/Productos/" & wA300020UR1

        If Len(Trim(wA300020UR1)) > 0 Then
            If IO.File.Exists(wA300020UR1) = True Then
                IO.File.Delete(wA300020UR1)
            End If
        End If

        ImFoto.ImageUrl = "Imagenes/nodisponible.jpg"

    End Sub

End Class
