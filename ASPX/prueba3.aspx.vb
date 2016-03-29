Imports System.Net
Partial Class prueba3
    Inherits System.Web.UI.Page
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim item

        'For Each item In Request.ServerVariables
        'Response.Write(item & "= " & Request.ServerVariables(item) & "<br>")
        'Next


        'item = System.Net.IPHostEntry(hostEntry = System.Net.Dns.GetHostByName(Request.UserHostAddress))

        Dim hostInfo As IPHostEntry = Dns.GetHostByName(Request.UserHostAddress)

        'Response.Write(hostInfo.HostName)
        GetIpAddressList(Request.UserHostAddress)

    End Sub

    Public Sub GetIpAddressList(ByVal hostString As [String])
        Try
            ' Get 'IPHostEntry' object which contains information like host name, IP addresses, aliases
            ' for specified url
            Dim hostInfo As IPHostEntry = Dns.GetHostByName(hostString)
            Response.Write(("Host name : " + hostInfo.HostName))
            Response.Write("IP address List : ")
            Dim index As Integer
            For index = 0 To hostInfo.AddressList.Length - 1
                Response.Write(hostInfo.AddressList(index))
            Next index
        Catch e As WebException
            Response.Write("SocketException caught!!!")
            Response.Write(("Source : " + e.Source))
            Response.Write(("Message : " + e.Message))
        
        End Try
    End Sub 'GetIpAddressList
End Class


