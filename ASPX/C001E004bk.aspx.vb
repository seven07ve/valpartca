Imports System.Data
Imports System.Data.SqlClient

Partial Class C001E004
    Inherits System.Web.UI.Page

    Dim strCnn As SqlConnection
    Dim myCmd As SqlCommand
    Dim rstQuery As SqlDataReader
    Dim SQL As String

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init


        lbTitulo.Text = "Sugerencias y Reclamos"


        Dim wCCL As String = Trim(Request.QueryString("CCL"))
        Dim wNRO As String = Trim(Request.QueryString("NRO"))
        Dim wCLU As String = Trim(Request.QueryString("CLU"))
        Dim wPUS1 As String = Trim(Request.QueryString("PUS"))

        Dim wZ300001NUS As String = ""
        Dim wZ300001EML As String = ""
        Dim wA300050CTR As String = ""
        Dim wA300050DEL As String

        Dim wCTR As String = ""
        Dim wOBS As String = ""
        Dim wFPR As Date = Now
        Dim wSTS As String = ""
        Dim wCRE As String = ""

        If Len(Trim(wNRO)) = 0 Then
            lbReclamo.Text = "Nuevo"
            lbFecha.Text = Right("00" & Day(wFPR), 2) & "-" & Right("00" & Month(wFPR), 2) & "-" & Year(wFPR)
        End If

        strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)

        myCmd = strCnn.CreateCommand
        SQL = "SELECT A300050CTR, A300050DEL "
        SQL = SQL & " FROM X300AF050 "
        SQL = SQL & " WHERE "
        SQL = SQL & " A300050STS ='1'"
        myCmd.CommandText = SQL
        strCnn.Open()
        ddlMotivo.Items.Clear()
        rstQuery = myCmd.ExecuteReader()
        Do While rstQuery.Read()
            wA300050CTR = Trim(rstQuery("A300050CTR").ToString())
            wA300050DEL = Trim(rstQuery("A300050DEL").ToString())
            ddlMotivo.Items.Add(New ListItem(wA300050DEL, wA300050CTR))
        Loop
        rstQuery.Close()
        strCnn.Close()


        myCmd = strCnn.CreateCommand
        SQL = "SELECT A300002RSO, A300002EMA "
        SQL = SQL & " FROM X300AF002 "
        SQL = SQL & " WHERE "
        SQL = SQL & " A300002CCL ='" & wCCL & "'"
        myCmd.CommandText = SQL
        strCnn.Open()
        rstQuery = myCmd.ExecuteReader()
        If rstQuery.Read() Then
            wZ300001NUS = Trim(rstQuery("A300002RSO").ToString())
            wZ300001EML = Trim(rstQuery("A300002EMA").ToString())
        End If
        rstQuery.Close()
        strCnn.Close()

        If Len(Trim(wNRO)) = 0 And wCLU <> "C" Then

            Dim wZ300001CVE As String = ""
            Dim wPUS As String = ""
            Dim wNUS As String = ""

            myCmd = strCnn.CreateCommand
            SQL = "SELECT Z300001CVE "
            SQL = SQL & " FROM X300ZF001 "
            SQL = SQL & " WHERE "
            SQL = SQL & " Z300001PUS ='" & wCCL & "'"
            myCmd.CommandText = SQL
            strCnn.Open()
            rstQuery = myCmd.ExecuteReader()
            If rstQuery.Read() Then
                wZ300001CVE = Trim(rstQuery("Z300001CVE").ToString())
            End If
            rstQuery.Close()
            strCnn.Close()


            myCmd = strCnn.CreateCommand
            SQL = "SELECT A300002CCL, A300002RSO "
            SQL = SQL & " FROM X300AQ002 "
            If wCLU = "V" Then
                SQL = SQL & " WHERE "
                SQL = SQL & " A300002CVE = '" & wZ300001CVE & "'"
            End If
            If wCLU = "S" Then
                SQL = SQL & " WHERE "
                SQL = SQL & "  Z300006PSU = '" & wPUS1 & "' "
            End If
            SQL = SQL & " GROUP BY A300002CCL, A300002RSO "
            SQL = SQL & " ORDER BY A300002CCL "
            myCmd.CommandText = SQL
            strCnn.Open()
            ddlCliente.Items.Clear()
            rstQuery = myCmd.ExecuteReader()
            Do While rstQuery.Read()
                wPUS = Trim(rstQuery("A300002CCL").ToString())
                wNUS = Trim(rstQuery("A300002RSO").ToString())
                wA300050DEL = Trim(rstQuery("A300002RSO").ToString())
                ddlCliente.Items.Add(New ListItem(wPUS & "-" & wNUS, wPUS))
            Loop
            rstQuery.Close()
            strCnn.Close()

            lbCliente.Visible = False
            ddlCliente.Visible = True

        End If


        If Len(Trim(wNRO)) > 0 Then

            myCmd = strCnn.CreateCommand
            SQL = "SELECT E300001CTR, E300001OBS, E300001FPR, E300001STS, "
            SQL = SQL & " E300001CRE "
            SQL = SQL & " FROM X300EF001 "
            SQL = SQL & " WHERE "
            SQL = SQL & " E300001COD ='" & wNRO & "'"
            myCmd.CommandText = SQL
            strCnn.Open()
            rstQuery = myCmd.ExecuteReader()
            If rstQuery.Read() Then
                wCTR = Trim(rstQuery("E300001CTR").ToString())
                'wOBS = Trim(rstQuery("E300001OBS").ToString())
                wFPR = Trim(rstQuery("E300001FPR").ToString())
                wSTS = Trim(rstQuery("E300001STS").ToString())
                wCRE = Trim(rstQuery("E300001CRE").ToString())
            End If
            rstQuery.Close()
            strCnn.Close()

            Dim wCuenta As Integer = 1

            myCmd = strCnn.CreateCommand
            SQL = "SELECT E300002NFA, E300002CPR, E300002CAN, E300002TRE, "
            SQL = SQL & " E300002OBS "
            SQL = SQL & " FROM X300EF002 "
            SQL = SQL & " WHERE "
            SQL = SQL & " E300002COD ='" & wNRO & "'"
            myCmd.CommandText = SQL
            strCnn.Open()
            rstQuery = myCmd.ExecuteReader()
            Do While rstQuery.Read()

                If wCuenta = 1 Then
                    txFactura_01.Text = Trim(rstQuery("E300002NFA").ToString())
                    txFactura_01.ReadOnly = True
                    txProducto_01.Text = Trim(rstQuery("E300002CPR").ToString())
                    txProducto_01.ReadOnly = True
                    txcantidad_01.Text = Trim(rstQuery("E300002CAN").ToString())
                    txcantidad_01.ReadOnly = True
                    ddlMotivo_01.SelectedValue = Trim(rstQuery("E300002TRE").ToString())
                    ddlMotivo_01.Enabled = False
                    txObservacion_01.Text = Trim(rstQuery("E300002OBS").ToString())
                    txObservacion_01.ReadOnly = True
                End If

                If wCuenta = 2 Then
                    txFactura_02.Text = Trim(rstQuery("E300002NFA").ToString())
                    txFactura_02.ReadOnly = True
                    txProducto_02.Text = Trim(rstQuery("E300002CPR").ToString())
                    txProducto_02.ReadOnly = True
                    txCantidad_02.Text = Trim(rstQuery("E300002CAN").ToString())
                    txCantidad_02.ReadOnly = True
                    ddlMotivo_02.SelectedValue = Trim(rstQuery("E300002TRE").ToString())
                    ddlMotivo_02.Enabled = False
                    txObservacion_02.Text = Trim(rstQuery("E300002OBS").ToString())
                    txObservacion_02.ReadOnly = True
                End If

                If wCuenta = 3 Then
                    txFactura_03.Text = Trim(rstQuery("E300002NFA").ToString())
                    txFactura_03.ReadOnly = True
                    txProducto_03.Text = Trim(rstQuery("E300002CPR").ToString())
                    txProducto_03.ReadOnly = True
                    txCantidad_03.Text = Trim(rstQuery("E300002CAN").ToString())
                    txCantidad_03.ReadOnly = True
                    ddlMotivo_03.SelectedValue = Trim(rstQuery("E300002TRE").ToString())
                    ddlMotivo_03.Enabled = False
                    txObservacion_03.Text = Trim(rstQuery("E300002OBS").ToString())
                    txObservacion_03.ReadOnly = True
                End If

                If wCuenta = 4 Then
                    txFactura_04.Text = Trim(rstQuery("E300002NFA").ToString())
                    txFactura_04.ReadOnly = True
                    txProducto_04.Text = Trim(rstQuery("E300002CPR").ToString())
                    txProducto_04.ReadOnly = True
                    txCantidad_04.Text = Trim(rstQuery("E300002CAN").ToString())
                    txCantidad_04.ReadOnly = True
                    ddlMotivo_04.SelectedValue = Trim(rstQuery("E300002TRE").ToString())
                    ddlMotivo_04.Enabled = False
                    txObservacion_04.Text = Trim(rstQuery("E300002OBS").ToString())
                    txObservacion_04.ReadOnly = True
                End If

                If wCuenta = 5 Then
                    txFactura_05.Text = Trim(rstQuery("E300002NFA").ToString())
                    txFactura_05.ReadOnly = True
                    txProducto_05.Text = Trim(rstQuery("E300002CPR").ToString())
                    txProducto_05.ReadOnly = True
                    txCantidad_05.Text = Trim(rstQuery("E300002CAN").ToString())
                    txCantidad_05.ReadOnly = True
                    ddlMotivo_05.SelectedValue = Trim(rstQuery("E300002TRE").ToString())
                    ddlMotivo_05.Enabled = False
                    txObservacion_05.Text = Trim(rstQuery("E300002OBS").ToString())
                    txObservacion_05.ReadOnly = True
                End If

                wCuenta = wCuenta + 1
            Loop
            rstQuery.Close()
            strCnn.Close()

            lbReclamo.Text = wNRO
            ddlMotivo.SelectedValue = wCTR
            ddlMotivo.Enabled = False
            'txObservaciones.Text = wOBS

            Select Case wSTS
                Case "1"
                    lbEstatus.Text = "Abierto"
                Case "2"
                    lbEstatus.Text = "Proceso"
                Case Else
                    lbEstatus.Text = "Cerrado"
            End Select

            lbSTS.Text = wSTS

            If wCLU <> "C" Then

                lbEstatus.Visible = False

                ddlEstatus.Items.Clear()
                If wSTS = "1" Then
                    ddlEstatus.Items.Add(New ListItem("Abierto", "1"))
                End If
                ddlEstatus.Items.Add(New ListItem("Proceso", "2"))
                ddlEstatus.Items.Add(New ListItem("Cerrado", "3"))
                ddlEstatus.SelectedValue = wSTS
                ddlEstatus.Visible = True

                txComentario.ReadOnly = False


            End If

            txComentario.Text = wCRE

            lbFecha.Text = Right("00" & Day(wFPR), 2) & "-" & Right("00" & Month(wFPR), 2) & "-" & Year(wFPR)
            btnEnviar.Visible = False
            If wCLU = "A" Then

                btnActualizar.Visible = True
                btnEliminar.Visible = True
                btnCancelar.Visible = True
            End If

            If wCLU = "G" Then
                btnActualizar.Visible = True
                btnCancelar.Visible = True
            End If



        End If

        lbCliente.Text = wCCL & " - " & wZ300001NUS
        lbCCL.Text = wCCL

        Dim wCO1, wCO2 As String

        myCmd = strCnn.CreateCommand
        SQL = "SELECT Z300002CO1, Z300002CO2 "
        SQL = SQL & " FROM X300ZF002 "
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


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Sub Buscar_Correlativo()

        Dim wNRO As String
        Dim wCCI As String = Trim(Request.QueryString("CCI"))

        strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)

        myCmd = strCnn.CreateCommand

        'Ubicar Correlativo de Reclamo
        SQL = "SELECT Z300003CAC, Z300003NCH, Z300003NCD "
        SQL = SQL & " FROM X300ZF003 WHERE "
        SQL = SQL & " Z300003CCI = '" & wCCI & "' AND "
        SQL = SQL & " Z300003IDP = 'RE' AND "
        SQL = SQL & " Z300003CIA = '01' "
        myCmd.CommandText = SQL
        strCnn.Open()
        rstQuery = myCmd.ExecuteReader()
        If rstQuery.Read() Then
            wNRO = CLng(rstQuery("Z300003CAC").ToString()) + 1
            If wNRO > CLng(rstQuery("Z300003NCH").ToString()) Then
                wNRO = CLng(rstQuery("Z300003NCD").ToString())
            End If
        Else
            wNRO = 1
        End If
        rstQuery.Close()
        strCnn.Close()
        wNRO = Right(("000000" & wNRO), 6)
        'Fin de ubicar correlativo de pedido

        lbReclamo.Text = wNRO

    End Sub


    Protected Sub btnCancelar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelar.Click

        Response.Redirect("../Pedidos/X001A104_S.asp?NOMTAB=X300BQ100")

    End Sub

    Function Validar_Observacion()


        Dim wMSG As String = ""
        Dim wOBS As String = ""
        Dim wCTR As String = ddlMotivo.SelectedValue


        Response.Write("<script languaje=javascript>")

        wOBS = "<table border=""0"" with=""70%"">"
        wOBS = wOBS & "<tr>"
        wOBS = wOBS & "<td><font face=""Arial"" size=""2""><b>#</b></td><td><b><font face=""Arial"" size=""2"">Factura<b></td>"
        wOBS = wOBS & "<td><b><font face=""Arial"" size=""2"">Producto<b></td>"
        wOBS = wOBS & "<td><font face=""Arial"" size=""2""><b>Cantidad<b></td>"
        wOBS = wOBS & "<td><font face=""Arial"" size=""2""><b>Motivo<b></td>"
        wOBS = wOBS & "<td><font face=""Arial"" size=""2""><b>Observación<b></td>"
        wOBS = wOBS & "</tr>"

        wOBS = wOBS & "<tr>"
        wOBS = wOBS & "<td><font face=""Arial"" size=""2""> 1 </td><td><font face=""Arial"" size=""2"">"
        wOBS = wOBS & Trim(txFactura_01.Text)
        wOBS = wOBS & "</td>"

        If Len(Trim(txFactura_01.Text)) = 0 Then
            wMSG = "Indique Factura."
            Response.Write("alert('" & wMSG & "');history.back();</script>")
            Response.End()
        End If
        'If Len(Trim(txProducto_01.Text)) > 0 Then
        wOBS = wOBS & "<td><font face=""Arial"" size=""2"">"
        wOBS = wOBS & Trim(txProducto_01.Text)
        wOBS = wOBS & "</td>"
        'End If

        If wCTR <> "1" And Len(Trim(txProducto_01.Text)) = 0 And Len(Trim(txFactura_01.Text)) > 0 Then
            wMSG = "Indique el Codigo del Producto."
            Response.Write("alert('" & wMSG & "');history.back();</script>")
            Response.End()
        End If

        'If Len(Trim(txcantidad_01.Text)) > 0 Then
        wOBS = wOBS & "<td><font face=""Arial"" size=""2"">"
        wOBS = wOBS & Trim(txcantidad_01.Text)
        wOBS = wOBS & "</td>"
        'End If

        If wCTR <> "1" And Len(Trim(txcantidad_01.Text)) = 0 And Len(Trim(txFactura_01.Text)) > 0 Then
            wMSG = "Indique la Cantidad."
            Response.Write("alert('" & wMSG & "');history.back();</script>")
            Response.End()
        End If


        wOBS = wOBS & "<td><font face=""Arial"" size=""2"">"
        If ddlMotivo_01.SelectedValue <> "0" Then
            wOBS = wOBS & Trim(ddlMotivo_01.SelectedValue)
        End If
        wOBS = wOBS & "</td>"


        If wCTR <> "1" And ddlMotivo_01.SelectedValue = "0" And Len(Trim(txFactura_01.Text)) > 0 Then
            wMSG = "Debe Seleccionar el Motivo."
            Response.Write("alert('" & wMSG & "');history.back();</script>")
            Response.End()
        End If

        'If Len(Trim(txObservacion_01.Text)) > 0 Then
        wOBS = wOBS & "<td><font face=""Arial"" size=""2"">"
        wOBS = wOBS & Trim(txObservacion_01.Text)
        wOBS = wOBS & "</td>"
        'End If

        If Len(Trim(txObservacion_01.Text)) = 0 And Len(Trim(txFactura_01.Text)) > 0 Then
            wMSG = "Indique la Observación."
            Response.Write("alert('" & wMSG & "');history.back();</script>")
            Response.End()
        End If

        wOBS = wOBS & "</tr>"

        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''


        If Len(Trim(txFactura_02.Text)) > 0 Then
            'wOBS = wOBS & vbCrLf & Chr(13)
            wOBS = wOBS & "<tr>"
            wOBS = wOBS & "<td><font face=""Arial"" size=""2""> 2 </td><td><font face=""Arial"" size=""2"">"
            wOBS = wOBS & Trim(txFactura_02.Text)
            wOBS = wOBS & "</td>"
        End If
        'If Len(Trim(txProducto_02.Text)) > 0 Then
        wOBS = wOBS & "<td><font face=""Arial"" size=""2"">"
        wOBS = wOBS & Trim(txProducto_02.Text)
        wOBS = wOBS & "</td>"
        'End If
        If wCTR <> "1" And Len(Trim(txProducto_02.Text)) = 0 And Len(Trim(txFactura_02.Text)) > 0 Then
            wMSG = "Indique el Codigo del Producto."
            Response.Write("alert('" & wMSG & "');history.back();</script>")
            Response.End()
        End If
        'If Len(Trim(txCantidad_02.Text)) > 0 Then
        wOBS = wOBS & "<td><font face=""Arial"" size=""2"">"
        wOBS = wOBS & Trim(txCantidad_02.Text)
        wOBS = wOBS & "</td>"
        'End If
        If wCTR <> "1" And Len(Trim(txCantidad_02.Text)) = 0 And Len(Trim(txFactura_02.Text)) > 0 Then
            wMSG = "Indique la Cantidad."
            Response.Write("alert('" & wMSG & "');history.back();</script>")
            Response.End()
        End If

        wOBS = wOBS & "<td><font face=""Arial"" size=""2"">"
        If ddlMotivo_02.SelectedValue <> "0" Then
            wOBS = wOBS & Trim(ddlMotivo_02.SelectedValue)
        End If
        wOBS = wOBS & "</td>"

        If wCTR <> "1" And ddlMotivo_02.SelectedValue = "0" And Len(Trim(txFactura_02.Text)) > 0 Then
            wMSG = "Debe Seleccionar el Motivo."
            Response.Write("alert('" & wMSG & "');history.back();</script>")
            Response.End()
        End If
        'If Len(Trim(txObservacion_02.Text)) > 0 Then
        wOBS = wOBS & "<td><font face=""Arial"" size=""2"">"
        wOBS = wOBS & Trim(txObservacion_02.Text)
        wOBS = wOBS & "</td>"
        'End If
        If Len(Trim(txObservacion_02.Text)) = 0 And Len(Trim(txFactura_02.Text)) > 0 Then
            wMSG = "Indique la Observación."
            Response.Write("alert('" & wMSG & "');history.back();</script>")
            Response.End()
        End If

        wOBS = wOBS & "</tr>"

        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''


        If Len(Trim(txFactura_03.Text)) > 0 Then
            'wOBS = wOBS & vbCrLf & Chr(13)
            wOBS = wOBS & "<tr>"
            wOBS = wOBS & "<td><font face=""Arial"" size=""2""> 3 </td><td><font face=""Arial"" size=""2"">"
            wOBS = wOBS & Trim(txFactura_03.Text)
            wOBS = wOBS & "</td>"
        End If
        'If Len(Trim(txProducto_03.Text)) > 0 Then
        wOBS = wOBS & "<td><font face=""Arial"" size=""2"">"
        wOBS = wOBS & Trim(txProducto_03.Text)
        wOBS = wOBS & "</td>"
        'End If
        If wCTR <> "1" And Len(Trim(txProducto_03.Text)) = 0 And Len(Trim(txFactura_03.Text)) > 0 Then
            wMSG = "Indique el Codigo del Producto."
            Response.Write("alert('" & wMSG & "');history.back();</script>")
            Response.End()
        End If
        'If Len(Trim(txCantidad_03.Text)) > 0 Then
        wOBS = wOBS & "<td><font face=""Arial"" size=""2"">"
        wOBS = wOBS & Trim(txCantidad_03.Text)
        wOBS = wOBS & "</td>"
        'End If
        If wCTR <> "1" And Len(Trim(txCantidad_03.Text)) = 0 And Len(Trim(txFactura_03.Text)) > 0 Then
            wMSG = "Indique la Cantidad."
            Response.Write("alert('" & wMSG & "');history.back();</script>")
            Response.End()
        End If
        wOBS = wOBS & "<td><font face=""Arial"" size=""2"">"
        If ddlMotivo_03.SelectedValue <> "0" Then
            wOBS = wOBS & Trim(ddlMotivo_03.SelectedValue)
        End If
        wOBS = wOBS & "</td>"
        If wCTR <> "1" And ddlMotivo_03.SelectedValue = "0" And Len(Trim(txFactura_03.Text)) > 0 Then
            wMSG = "Debe Seleccionar el Motivo."
            Response.Write("alert('" & wMSG & "');history.back();</script>")
            Response.End()
        End If
        'If Len(Trim(txObservacion_03.Text)) > 0 Then
        wOBS = wOBS & "<td><font face=""Arial"" size=""2"">"
        wOBS = wOBS & Trim(txObservacion_03.Text)
        wOBS = wOBS & "</td>"
        'End If
        If Len(Trim(txObservacion_03.Text)) = 0 And Len(Trim(txFactura_03.Text)) > 0 Then
            wMSG = "Indique la Observación."
            Response.Write("alert('" & wMSG & "');history.back();</script>")
            Response.End()
        End If

        wOBS = wOBS & "</tr>"

        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

        If Len(Trim(txFactura_04.Text)) > 0 Then
            'wOBS = wOBS & vbCrLf & Chr(13)
            wOBS = wOBS & "<tr>"
            wOBS = wOBS & "<td><font face=""Arial"" size=""2""> 4 </td><td><font face=""Arial"" size=""2"">"
            wOBS = wOBS & Trim(txFactura_04.Text)
            wOBS = wOBS & "</td>"
        End If
        'If Len(Trim(txProducto_04.Text)) > 0 Then
        wOBS = wOBS & "<td><font face=""Arial"" size=""2"">"
        wOBS = wOBS & Trim(txProducto_04.Text)
        wOBS = wOBS & "</td>"
        'End If
        If wCTR <> "1" And Len(Trim(txProducto_04.Text)) = 0 And Len(Trim(txFactura_04.Text)) > 0 Then
            wMSG = "Indique el Codigo del Producto."
            Response.Write("alert('" & wMSG & "');history.back();</script>")
            Response.End()
        End If
        'If Len(Trim(txCantidad_04.Text)) > 0 Then
        wOBS = wOBS & "<td><font face=""Arial"" size=""2"">"
        wOBS = wOBS & Trim(txCantidad_04.Text)
        wOBS = wOBS & "</td>"
        'End If
        If wCTR <> "1" And Len(Trim(txCantidad_04.Text)) = 0 And Len(Trim(txFactura_04.Text)) > 0 Then
            wMSG = "Indique la Cantidad."
            Response.Write("alert('" & wMSG & "');history.back();</script>")
            Response.End()
        End If
        wOBS = wOBS & "<td><font face=""Arial"" size=""2"">"
        If ddlMotivo_04.SelectedValue <> "0" Then
            wOBS = wOBS & Trim(ddlMotivo_04.SelectedValue)
        End If
        wOBS = wOBS & "</td>"
        If wCTR <> "1" And ddlMotivo_04.SelectedValue = "0" And Len(Trim(txFactura_04.Text)) > 0 Then
            wMSG = "Debe Seleccionar el Motivo."
            Response.Write("alert('" & wMSG & "');history.back();</script>")
            Response.End()
        End If
        'If Len(Trim(txObservacion_04.Text)) > 0 Then
        wOBS = wOBS & "<td><font face=""Arial"" size=""2"">"
        wOBS = wOBS & Trim(txObservacion_04.Text)
        wOBS = wOBS & "</td>"
        'End If
        If Len(Trim(txObservacion_04.Text)) = 0 And Len(Trim(txFactura_04.Text)) > 0 Then
            wMSG = "Indique la Observación."
            Response.Write("alert('" & wMSG & "');history.back();</script>")
            Response.End()
        End If

        wOBS = wOBS & "</tr>"
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

        If Len(Trim(txFactura_05.Text)) > 0 Then
            'wOBS = wOBS & vbCrLf & Chr(13)
            wOBS = wOBS & "<tr>"
            wOBS = wOBS & "<td><font face=""Arial"" size=""2""> 5 </td><td><font face=""Arial"" size=""2"">"
            wOBS = wOBS & Trim(txFactura_05.Text)
            wOBS = wOBS & "</td>"
        End If
        'If Len(Trim(txProducto_05.Text)) > 0 Then
        wOBS = wOBS & "<td><font face=""Arial"" size=""2"">"
        wOBS = wOBS & Trim(txProducto_05.Text)
        wOBS = wOBS & "</td>"
        'End If
        If wCTR <> "1" And Len(Trim(txProducto_05.Text)) = 0 And Len(Trim(txFactura_05.Text)) > 0 Then
            wMSG = "Indique el Codigo del Producto."
            Response.Write("alert('" & wMSG & "');history.back();</script>")
            Response.End()
        End If
        'If Len(Trim(txCantidad_05.Text)) > 0 Then
        wOBS = wOBS & "<td><font face=""Arial"" size=""2"">"
        wOBS = wOBS & Trim(txCantidad_05.Text)
        wOBS = wOBS & "</td>"
        'End If
        If wCTR <> "1" And Len(Trim(txCantidad_05.Text)) = 0 And Len(Trim(txFactura_05.Text)) > 0 Then
            wMSG = "Indique la Cantidad."
            Response.Write("alert('" & wMSG & "');history.back();</script>")
            Response.End()
        End If
        wOBS = wOBS & "<td><font face=""Arial"" size=""2"">"
        If ddlMotivo_05.SelectedValue <> "0" Then
            wOBS = wOBS & Trim(ddlMotivo_05.SelectedValue)
        End If
        wOBS = wOBS & "</td>"
        If wCTR <> "1" And ddlMotivo_05.SelectedValue = "0" And Len(Trim(txFactura_05.Text)) > 0 Then
            wMSG = "Debe Seleccionar el Motivo."
            Response.Write("alert('" & wMSG & "');history.back();</script>")
            Response.End()
        End If
        'If Len(Trim(txObservacion_05.Text)) > 0 Then
        wOBS = wOBS & "<td><font face=""Arial"" size=""2"">"
        wOBS = wOBS & Trim(txObservacion_05.Text)
        wOBS = wOBS & "</td>"
        'End If
        If Len(Trim(txObservacion_05.Text)) = 0 And Len(Trim(txFactura_05.Text)) > 0 Then
            wMSG = "Indique la Observación."
            Response.Write("alert('" & wMSG & "');history.back();</script>")
            Response.End()
        End If

        wOBS = wOBS & "</tr>"
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

        wOBS = wOBS & "</table>"


        Validar_Observacion = wOBS

    End Function
    Sub Enviar_Correo()

        'CONFIGURACION DEL CORREO
        Dim correo As New System.Net.Mail.MailMessage
        Dim smtp As New System.Net.Mail.SmtpClient
        Dim wEMC As String = ""
        Dim wBody As String
        Dim wNRO As String
        Dim wCCL As String = Trim(Request.QueryString("CCL"))
        Dim wNUS As String = ""
        Dim wCLU As String = Trim(Request.QueryString("CLU"))
        Dim wPUS As String = Trim(Request.QueryString("PUS"))
        Dim wCTR As String = ddlMotivo.SelectedValue
        Dim wOBS As String '= Trim(txObservaciones.Text)
        Dim wMSG As String = ""
        Dim wError As Boolean = False
        Dim wOBJ As String = ""
        Dim wCCI As String


        wCCI = Request.QueryString("CCI")
        wOBS = Validar_Observacion()
        


        If wCLU <> "C" Then
            wCCL = ddlCliente.SelectedValue
        End If

        strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)

        myCmd = strCnn.CreateCommand
        SQL = "SELECT A300002RSO, A300002EMA "
        SQL = SQL & " FROM X300AF002 "
        SQL = SQL & " WHERE "
        SQL = SQL & " A300002CCL ='" & wCCL & "'"
        myCmd.CommandText = SQL
        strCnn.Open()
        rstQuery = myCmd.ExecuteReader()
        If rstQuery.Read() Then
            wNUS = Trim(rstQuery("A300002RSO").ToString())
            wEMC = Trim(rstQuery("A300002EMA").ToString())
        End If
        rstQuery.Close()
        strCnn.Close()

        Buscar_Correlativo()

        wNRO = Trim(lbReclamo.Text)

        wBody = "<font face=""Arial"" size=""2""><b>Nro.: </b>" & wNRO & "<br></font>"
        wBody += "<font face=""Arial"" size=""2""><b>Cliente: </b>" & wCCL & " - " & wNUS & "<br></font>"
        wBody += "<font face=""Arial"" size=""2""><b>Tipo: </b>" & ddlMotivo.SelectedItem.Text & "<br></font>"
        wBody += "<font face=""Arial"" size=""2""><b>Detalle</b></font><br>" & wOBS & "<br>"

        wBody += "<br><br><font face=""Arial"" size=""2"">Info-Gran Import</font><br><br>"
        wBody += "<font face=""Arial"" size=""2"">*** Por favor no responda a este mensaje de respuesta automática ***</font>"

        correo.From = New System.Net.Mail.MailAddress("info@granimportcaracas.co.ve", "Reclamos")

        correo.To.Add("ventas@granimportcaracas.co.ve")
        If Len(Trim(wEMC)) > 0 Then
            correo.To.Add(wEMC)
            correo.CC.Add("ventas@granimportcaracas.co.ve")
            'correo.Bcc.Add("eparedes@insystech.com.ve")
        Else
            correo.To.Add("ventas@granimportcaracas.co.ve")
            'correo.Bcc.Add("eparedes@insystech.com.ve")
        End If



        correo.Subject = ddlMotivo.SelectedItem.Text & " Nro. " & wNRO
        correo.Body = wBody
        correo.IsBodyHtml = True
        correo.Priority = System.Net.Mail.MailPriority.Normal


        smtp.Host = "mail.granimportcaracas.co.ve"
        smtp.Port = 2640
        smtp.UseDefaultCredentials = True
        'smtp.EnableSsl = True
        smtp.Credentials = New System.Net.NetworkCredential("info@granimportcaracas.co.ve", "Ep123456")

        Try

            smtp.Send(correo)

            'Response.Write("Mensaje Enviado Satisfactoriamente")

        Catch ex As Exception

            'Response.Write("ERROR: " & ex.Message)

        Finally


            Try

                myCmd = strCnn.CreateCommand
                SQL = " INSERT INTO X300EF001 ( "
                SQL = SQL & " E300001CCI, E300001CIA, E300001COD, E300001CTR, "
                SQL = SQL & " E300001CCL, E300001STS, E300001OBS, E300001FPR, "
                SQL = SQL & " E300001FAC, E300001PUS ) "
                SQL = SQL & " VALUES ( "
                SQL = SQL & "'" & wCCI & "',"
                SQL = SQL & "'01',"
                SQL = SQL & "'" & wNRO & "',"
                SQL = SQL & "'" & wCTR & "',"
                SQL = SQL & "'" & wCCL & "',"
                SQL = SQL & "'1',"
                SQL = SQL & "'" & wOBS & "',"
                SQL = SQL & "getdate(),"
                SQL = SQL & "getdate(),"
                SQL = SQL & "'" & wPUS & "')"
                myCmd.CommandText = SQL
                strCnn.Open()
                myCmd.ExecuteNonQuery()
                strCnn.Close()

                Incluir_Detalle_Reclamo(wNRO)


                myCmd = strCnn.CreateCommand
                SQL = "UPDATE X300ZF003 SET "
                SQL = SQL & " Z300003CAC = " & wNRO & " "  'Correlativo actual
                SQL = SQL & " WHERE "
                SQL = SQL & " Z300003CCI = '" & wCCI & "' AND "
                SQL = SQL & " Z300003IDP = 'RE' AND "
                SQL = SQL & " Z300003CIA = '01' "
                'Response.Write SQL
                myCmd.CommandText = SQL
                strCnn.Open()
                myCmd.ExecuteNonQuery()
                strCnn.Close()

                Response.Redirect("../Pedidos/X001A002.asp")

            Catch ex As Exception

                '  Response.Write(ex.Message)

            End Try

        End Try

    End Sub

    Sub Incluir_Detalle_Reclamo(ByVal wNRO As String)

        Dim wCCI As String


        wCCI = Request.QueryString("CCI")

        Dim wNFA_01 As String = Trim(txFactura_01.Text)
        Dim wCPR_01 As String = Trim(txProducto_01.Text)
        Dim wCAN_01 As String = Trim(txcantidad_01.Text)
        Dim wTRE_01 As String = Trim(ddlMotivo_01.SelectedValue)
        Dim wOBS_01 As String = Trim(txObservacion_01.Text)

        Dim wNFA_02 As String = Trim(txFactura_02.Text)
        Dim wCPR_02 As String = Trim(txProducto_02.Text)
        Dim wCAN_02 As String = Trim(txCantidad_02.Text)
        Dim wTRE_02 As String = Trim(ddlMotivo_02.SelectedValue)
        Dim wOBS_02 As String = Trim(txObservacion_02.Text)

        Dim wNFA_03 As String = Trim(txFactura_03.Text)
        Dim wCPR_03 As String = Trim(txProducto_03.Text)
        Dim wCAN_03 As String = Trim(txCantidad_03.Text)
        Dim wTRE_03 As String = Trim(ddlMotivo_03.SelectedValue)
        Dim wOBS_03 As String = Trim(txObservacion_03.Text)

        Dim wNFA_04 As String = Trim(txFactura_04.Text)
        Dim wCPR_04 As String = Trim(txProducto_04.Text)
        Dim wCAN_04 As String = Trim(txCantidad_04.Text)
        Dim wTRE_04 As String = Trim(ddlMotivo_04.SelectedValue)
        Dim wOBS_04 As String = Trim(txObservacion_04.Text)

        Dim wNFA_05 As String = Trim(txFactura_05.Text)
        Dim wCPR_05 As String = Trim(txProducto_05.Text)
        Dim wCAN_05 As String = Trim(txCantidad_05.Text)
        Dim wTRE_05 As String = Trim(ddlMotivo_05.SelectedValue)
        Dim wOBS_05 As String = Trim(txObservacion_05.Text)

        If wTRE_01 = "0" Then wTRE_01 = ""
        If wTRE_02 = "0" Then wTRE_02 = ""
        If wTRE_03 = "0" Then wTRE_03 = ""
        If wTRE_04 = "0" Then wTRE_04 = ""
        If wTRE_05 = "0" Then wTRE_05 = ""

        strCnn.Open()

        myCmd = strCnn.CreateCommand



        SQL = " INSERT INTO X300EF002 ( "
        SQL = SQL & " E300002CCI, E300002CIA, E300002COD, E300002NFA, "
        SQL = SQL & " E300002CPR, E300002CAN, E300002TRE, E300002OBS, "
        SQL = SQL & " E300002FPR )"
        SQL = SQL & " VALUES ( "
        SQL = SQL & "'" & wCCI & "',"
        SQL = SQL & "'01',"
        SQL = SQL & "'" & wNRO & "',"
        SQL = SQL & "'" & wNFA_01 & "',"
        SQL = SQL & "'" & wCPR_01 & "',"
        SQL = SQL & "'" & wCAN_01 & "',"
        SQL = SQL & "'" & wTRE_01 & "',"
        SQL = SQL & "'" & wOBS_01 & "',"
        SQL = SQL & "getdate() )"
        myCmd.CommandText = SQL
        myCmd.ExecuteNonQuery()


        If Len(Trim(wNFA_02)) > 0 Then

            SQL = " INSERT INTO X300EF002 ( "
            SQL = SQL & " E300002CCI, E300002CIA, E300002COD, E300002NFA, "
            SQL = SQL & " E300002CPR, E300002CAN, E300002TRE, E300002OBS, "
            SQL = SQL & " E300002FPR )"
            SQL = SQL & " VALUES ( "
            SQL = SQL & "'" & wCCI & "',"
            SQL = SQL & "'01',"
            SQL = SQL & "'" & wNRO & "',"
            SQL = SQL & "'" & wNFA_02 & "',"
            SQL = SQL & "'" & wCPR_02 & "',"
            SQL = SQL & "'" & wCAN_02 & "',"
            SQL = SQL & "'" & wTRE_02 & "',"
            SQL = SQL & "'" & wOBS_02 & "',"
            SQL = SQL & "getdate() )"
            myCmd.CommandText = SQL
            myCmd.ExecuteNonQuery()

        End If

        If Len(Trim(wNFA_03)) > 0 Then

            SQL = " INSERT INTO X300EF002 ( "
            SQL = SQL & " E300002CCI, E300002CIA, E300002COD, E300002NFA, "
            SQL = SQL & " E300002CPR, E300002CAN, E300002TRE, E300002OBS, "
            SQL = SQL & " E300002FPR )"
            SQL = SQL & " VALUES ( "
            SQL = SQL & "'" & wCCI & "',"
            SQL = SQL & "'01',"
            SQL = SQL & "'" & wNRO & "',"
            SQL = SQL & "'" & wNFA_03 & "',"
            SQL = SQL & "'" & wCPR_03 & "',"
            SQL = SQL & "'" & wCAN_03 & "',"
            SQL = SQL & "'" & wTRE_03 & "',"
            SQL = SQL & "'" & wOBS_03 & "',"
            SQL = SQL & "getdate() )"
            myCmd.CommandText = SQL
            myCmd.ExecuteNonQuery()

        End If

        If Len(Trim(wNFA_04)) > 0 Then

            SQL = " INSERT INTO X300EF002 ( "
            SQL = SQL & " E300002CCI, E300002CIA, E300002COD, E300002NFA, "
            SQL = SQL & " E300002CPR, E300002CAN, E300002TRE, E300002OBS, "
            SQL = SQL & " E300002FPR )"
            SQL = SQL & " VALUES ( "
            SQL = SQL & "'" & wCCI & "',"
            SQL = SQL & "'01',"
            SQL = SQL & "'" & wNRO & "',"
            SQL = SQL & "'" & wNFA_04 & "',"
            SQL = SQL & "'" & wCPR_04 & "',"
            SQL = SQL & "'" & wCAN_04 & "',"
            SQL = SQL & "'" & wTRE_04 & "',"
            SQL = SQL & "'" & wOBS_04 & "',"
            SQL = SQL & "getdate() )"
            myCmd.CommandText = SQL
            myCmd.ExecuteNonQuery()

        End If

        If Len(Trim(wNFA_05)) > 0 Then

            SQL = " INSERT INTO X300EF002 ( "
            SQL = SQL & " E300002CCI, E300002CIA, E300002COD, E300002NFA, "
            SQL = SQL & " E300002CPR, E300002CAN, E300002TRE, E300002OBS, "
            SQL = SQL & " E300002FPR )"
            SQL = SQL & " VALUES ( "
            SQL = SQL & "'" & wCCI & "',"
            SQL = SQL & "'01',"
            SQL = SQL & "'" & wNRO & "',"
            SQL = SQL & "'" & wNFA_05 & "',"
            SQL = SQL & "'" & wCPR_05 & "',"
            SQL = SQL & "'" & wCAN_05 & "',"
            SQL = SQL & "'" & wTRE_05 & "',"
            SQL = SQL & "'" & wOBS_05 & "',"
            SQL = SQL & "getdate() )"
            myCmd.CommandText = SQL
            myCmd.ExecuteNonQuery()

        End If

        strCnn.Close()

    End Sub


    Sub Actualizar_Reclamo()

        'CONFIGURACION DEL CORREO
        Dim correo As New System.Net.Mail.MailMessage
        Dim smtp As New System.Net.Mail.SmtpClient
        Dim wEMC As String = ""
        Dim wBody As String
        Dim wNRO As String
        Dim wCCL As String = Trim(lbCCL.Text)
        Dim wSTS As String = ddlEstatus.SelectedValue
        Dim wSTSC As String = Trim(lbSTS.Text)
        Dim wDST As String = ddlEstatus.SelectedItem.Text
        Dim wNUS As String = ""
        Dim wOBS As String = "" ' Trim(txObservaciones.Text)
        Dim wCRE As String = Trim(txComentario.Text)
        Dim wPUS As String = Trim(Request.QueryString("PUS"))

        Dim wCCI As String

        wCCI = Request.QueryString("CCI")


        strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)

        myCmd = strCnn.CreateCommand
        SQL = "SELECT A300002EMA "
        SQL = SQL & " FROM X300AF002 "
        SQL = SQL & " WHERE "
        SQL = SQL & " A300002CCL ='" & wCCL & "'"
        myCmd.CommandText = SQL
        strCnn.Open()
        rstQuery = myCmd.ExecuteReader()
        If rstQuery.Read() Then
            wEMC = Trim(rstQuery("A300002EMA").ToString())
        End If
        rstQuery.Close()
        strCnn.Close()

        wNRO = Trim(lbReclamo.Text)


        myCmd = strCnn.CreateCommand
        SQL = "SELECT E300001OBS "
        SQL = SQL & " FROM X300EF001 "
        SQL = SQL & " WHERE "
        SQL = SQL & " E300001COD ='" & wNRO & "'"
        myCmd.CommandText = SQL
        strCnn.Open()
        rstQuery = myCmd.ExecuteReader()
        If rstQuery.Read() Then
            wOBS = Trim(rstQuery("E300001OBS").ToString())
        End If
        rstQuery.Close()
        strCnn.Close()


        wBody = "<font face=""Arial"" size=""2""><b>Nro.: </b>" & wNRO & "<br></font>"
        wBody += "<font face=""Arial"" size=""2""><b>Cliente: </b>" & Trim(lbCliente.Text) & "<br></font>"
        wBody += "<font face=""Arial"" size=""2""><b>Motivo: </b>" & ddlMotivo.SelectedItem.Text & "<br></font>"
        wBody += "<font face=""Arial"" size=""2""><b>Detalle </b><br>" & wOBS & "</font>"
        wBody += "<font face=""Arial"" size=""2""><br><br><b>Estatus: </b>" & wDST & "</font>"
        wBody += "<font face=""Arial"" size=""2""><br><b>Comentarios: </b>" & wCRE & "</font>"

        If wSTS = "3" Then
            'wBody += "<font face=""Arial"" size=""2""><br><br>Estimado Cliente Pulse<a href=http://www.lacordialidad.com.com/pedidos/X001A104as.asp?NRO=" & wNRO & "> Aquí </a>si esta conforme con la solución dada a su reclamo.</font>"
        End If

        wBody += "<br><br><font face=""Arial"" size=""2"">Info-Gran Import</font><br><br>"
        wBody += "<font face=""Arial"" size=""2"">*** Por favor no responda a este mensaje de respuesta automática ***</font>"

        correo.From = New System.Net.Mail.MailAddress("info@granimportcaracas.co.ve", "Reclamos")

        correo.To.Add("ventas@granimportcaracas.co.ve")

        If Len(Trim(wEMC)) > 0 Then
            correo.To.Add(wEMC)
            correo.CC.Add("ventas@granimportcaracas.co.ve")
            'correo.Bcc.Add("eparedes@insystech.com.ve")

        Else
            correo.To.Add("ventas@granimportcaracas.co.ve")
            'correo.Bcc.Add("eparedes@insystech.com.ve")

        End If

        correo.Subject = ddlMotivo.SelectedItem.Text & " Nro. " & wNRO & " Cambio de ESTATUS"
        correo.Body = wBody
        correo.IsBodyHtml = True
        correo.Priority = System.Net.Mail.MailPriority.Normal


        smtp.Host = "mail.granimportcaracas.co.ve"
        smtp.Port = 2640
        smtp.UseDefaultCredentials = True
        'smtp.EnableSsl = True
        smtp.Credentials = New System.Net.NetworkCredential("info@granimportcaracas.co.ve", "Ep123456")

        Try

            If wSTS <> wSTSC Then

                smtp.Send(correo)

            End If


            'Response.Write("Mensaje Enviado Satisfactoriamente")

        Catch ex As Exception

            Response.Write("ERROR: " & ex.Message)

        Finally


            Try


                myCmd = strCnn.CreateCommand
                SQL = "UPDATE X300EF001 SET "
                SQL = SQL & " E300001STS = '" & wSTS & "',"
                SQL = SQL & " E300001CRE = '" & wCRE & "',"
                SQL = SQL & " E300001PUS = '" & wPUS & "',"
                SQL = SQL & " e300001FAC = getdate()"
                SQL = SQL & " WHERE "
                SQL = SQL & " E300001CCI ='" & wCCI & "' AND "
                SQL = SQL & " E300001CIA = '01'AND "
                SQL = SQL & " E300001COD = '" & wNRO & "' "
                'Response.Write SQL
                myCmd.CommandText = SQL
                strCnn.Open()
                myCmd.ExecuteNonQuery()
                strCnn.Close()

                Response.Redirect("../Pedidos/X001A104_S.asp?NOMTAB=X300BQ100")


            Catch ex As Exception

                Response.Write(ex.Message)

            End Try

        End Try




    End Sub


    Sub Eliminar_Reclamo()

        Dim wNRO As String = Trim(lbReclamo.Text)
        Dim wPUS As String = Trim(Request.QueryString("PUS"))
        Dim wCCI As String

        wCCI = Request.QueryString("CCI")



        Try

            strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)


            myCmd = strCnn.CreateCommand
            SQL = "UPDATE X300EF001 SET "
            SQL = SQL & " E300001STS = '9',"
            SQL = SQL & " E300001PUS = '" & wPUS & "',"
            SQL = SQL & " E300001FAC = getdate()"
            SQL = SQL & " WHERE "
            SQL = SQL & " E300001CCI ='" & wCCI & "' AND "
            SQL = SQL & " E300001CIA = '01'AND "
            SQL = SQL & " E300001COD = '" & wNRO & "' "
            'Response.Write SQL
            myCmd.CommandText = SQL
            strCnn.Open()
            myCmd.ExecuteNonQuery()
            strCnn.Close()

            Response.Redirect("../Pedidos/X001A104_S.asp?NOMTAB=X300BQ100")


        Catch ex As Exception

            Response.Write(ex.Message)

        End Try

    End Sub


    Protected Sub btnEnviar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEnviar.Click

        Enviar_Correo()

    End Sub

    Protected Sub btnEliminar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEliminar.Click


        Eliminar_Reclamo()

    End Sub

    Protected Sub btnActualizar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnActualizar.Click

        Actualizar_Reclamo()

    End Sub

    Protected Sub form1_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles form1.Init

    End Sub
End Class
