Imports System.Data
Imports System.Data.SqlClient

Partial Class C001M002
    Inherits System.Web.UI.Page

    Dim strCnn As SqlConnection
    Dim myCmd As SqlCommand
    Dim rstQuery As SqlDataReader
    Dim SQL As String


    Protected Sub btnEnviar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEnviar.Click

        If Validar_Campos() = False Then

            'btnEnviar.Enable = False

            Enviar_Correo()
            Blanquear_Campos()

            'btnEnviar.Enable = True

        End If


    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        txEmpresa.Focus()

        strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)

        myCmd = strCnn.CreateCommand
        SQL = "SELECT Z300850COD, Z300850DES "
        SQL = SQL & " FROM X300ZF850 "
        myCmd.CommandText = SQL
        strCnn.Open()
        ddlPais.Items.Clear()
        rstQuery = myCmd.ExecuteReader()
        Do While rstQuery.Read()
            ddlPais.Items.Add(New ListItem(Trim(rstQuery("Z300850DES").ToString()), Trim(rstQuery("Z300850COD").ToString())))
        Loop
        rstQuery.Close()
        strCnn.Close()

        ddlPais.SelectedValue = "212"

        Cargar_Estados(ddlPais.SelectedItem.Value)

    End Sub

    Sub Cargar_Estados(ByVal wPAIS As String)

        Dim wCuenta As Integer = 0

        strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)

        myCmd = strCnn.CreateCommand
        SQL = "SELECT Z300851DES "
        SQL = SQL & " FROM X300ZF851 "
        SQL = SQL & " WHERE "
        SQL = SQL & " Z300851COD = '" & wPAIS & "'"
        myCmd.CommandText = SQL
        strCnn.Open()
        ddlEstado.Items.Clear()
        ddlEstado.Items.Add(New ListItem("Seleccione...", "0"))
        rstQuery = myCmd.ExecuteReader()
        Do While rstQuery.Read()
            ddlEstado.Items.Add(New ListItem(Trim(rstQuery("Z300851DES").ToString()), Trim(rstQuery("Z300851DES").ToString())))
            wCuenta += wCuenta
        Loop
        rstQuery.Close()
        strCnn.Close()


        If wCuenta = 0 Then
            ddlEstado.Items.Add(New ListItem("Otro", "9"))
        End If

        ddlEstado.SelectedValue = "0"


    End Sub

    Function Validar_Campos() As Boolean

        Dim wMensaje As String = ""

        lbMensaje.Visible = False
        Validar_Campos = False


        If Len(Trim(txEmail.Text)) = 0 Then

            Validar_Campos = True
            wMensaje = "Debe Ingresar Correo Electrónico"
            txEmail.Focus()

        End If


        If Len(Trim(txTelefono.Text)) = 0 Then

            Validar_Campos = True
            wMensaje = "Debe Ingresar Teléfono Contacto"
            txTelefono.Focus()

        End If


        If Len(Trim(txPersona.Text)) = 0 Then

            Validar_Campos = True
            wMensaje = "Debe Ingresar Nombre y Apellido"
            txPersona.Focus()

        End If

        If Len(Trim(txEmpresa.Text)) = 0 Then

            Validar_Campos = True
            wMensaje = "Debe Ingresar Empresa"
            txEmpresa.Focus()

        End If

        If Len(Trim(txRif.Text)) = 0 Then

            Validar_Campos = True
            wMensaje = "Debe Ingresar RIF"
            txRif.Focus()

        End If

        If Validar_Campos = True Then

            lbMensaje.Visible = True
            lbMensaje.ForeColor = Drawing.Color.Red
            lbMensaje.Text = wMensaje

        End If



    End Function

    Sub Blanquear_Campos()

        txPersona.Text = ""
        txEmpresa.Text = ""
        txRif.Text = ""
        txTelefono.Text = ""
        txEmail.Text = ""
        txComentario.Text = ""
        txCiudad.Text = ""

    End Sub

    Sub Enviar_Correo()

        Dim wDHTML As String

        wDHTML = "<B>Empresa: </B>" & Trim(txEmpresa.Text) & "<BR>"
        wDHTML = wDHTML & "<B>RIF: </B>" & Trim(txRif.Text) & "<BR>"
        wDHTML = wDHTML & "<B>Nombre y Apellido: </B>" & Trim(txPersona.Text) & "<BR>"
        wDHTML = wDHTML & "<B>Pais: </B>" & Trim(ddlPais.SelectedItem.Text) & "<BR>"
        wDHTML = wDHTML & "<B>Estado: </B>" & Trim(ddlEstado.SelectedItem.Text) & " " & Trim(txEstado.Text) & "<BR>"
        wDHTML = wDHTML & "<B>Ciudad: </B>" & Trim(txCiudad.Text) & "<BR>"
        wDHTML = wDHTML & "<B>Teléfono Contacto: </B>" & Trim(txTelefono.Text) & "<BR>"
        'wDHTML = wDHTML & "<B>Movil: </B>" & Trim(txMovil.Text) & "<BR>"
        wDHTML = wDHTML & "<B>Correo Electrónico: </B>" & Trim(txEmail.Text) & "<BR>"
        wDHTML = wDHTML & "<B>Comentario: </B>" & Trim(txComentario.Text)


        'CONFIGURACION DEL CORREO
        Dim correo As New System.Net.Mail.MailMessage
        Dim smtp As New System.Net.Mail.SmtpClient

        correo.From = New System.Net.Mail.MailAddress("info@granimportcaracas.co.ve", "Sección Contáctenos Gran Import Caracas")
        correo.To.Add("ventas@granimportcaracas.co.ve")
        correo.Bcc.Add("apineda@insystech.com.ve")
        correo.Subject = Trim(txEmpresa.Text)
        correo.Body = wDHTML
        correo.IsBodyHtml = True
        correo.Priority = System.Net.Mail.MailPriority.Normal



        smtp.Host = "mail.granimportcaracas.co.ve"
        smtp.Port = 2640
        smtp.UseDefaultCredentials = True
        'smtp.EnableSsl = False
        smtp.Credentials = New System.Net.NetworkCredential("info@granimportcaracas.co.ve", "Ep123456")

        Try
            smtp.Send(correo)
            'Response.Write(wDHTML)
            'lbMensaje.Visible = True
            'lbMensaje.ForeColor = Drawing.Color.Blue
            'lbMensaje.Text = "Mensaje Enviado Correctamente"
            'Response.Write("Mensaje enviado satisfactoriamente")
            Response.Write("<script>alert('Mensaje Enviado Satisfactoriamente.');")
            'window.open('../','_parent')
            Response.Write("</script>")
        Catch ex As Exception
            Response.Write("ERROR: " & ex.Message)
        End Try

    End Sub

    Protected Sub ddlPais_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlPais.SelectedIndexChanged

        Cargar_Estados(ddlPais.SelectedItem.Value)

    End Sub

    Protected Sub ddlEstado_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)

        If ddlEstado.SelectedItem.Value = "9" Then
            txEstado.Visible = True
        Else
            txEstado.Visible = False
        End If

    End Sub

End Class
