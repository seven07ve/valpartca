<%@ WebHandler Language="VB" Class="Handler" %>

Imports System
Imports System.Web
Imports System.Data.SqlClient
Imports System.Data
Imports System.Drawing.Imaging
Imports System.IO

Public Class Handler : Implements IHttpHandler
    Dim strCnn As SqlConnection
    Dim myCmd As SqlCommand
    Dim rstQuery As SqlDataReader
    Dim SQL As String
    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        
        Dim wCDN As String
        
        wCDN = context.Request.QueryString("CDN")
        
        strCnn = New SqlConnection(ConfigurationManager.ConnectionStrings("XDTA300").ConnectionString)
        
        myCmd = strCnn.CreateCommand
        SQL = "SELECT Z300050FOT FROM X300ZF050 "
        SQL = SQL & " WHERE "
        SQL = SQL & " Z300050CDN = '" & wCDN & "'"
        myCmd.CommandText = SQL
        strCnn.Open()
        rstQuery = myCmd.ExecuteReader()
        If rstQuery.Read() Then

            Dim bytBLOBData2(rstQuery.GetBytes(0, 0, Nothing, 0, Integer.MaxValue) - 1) As Byte
            rstQuery.GetBytes(0, 0, bytBLOBData2, 0, bytBLOBData2.Length)

            'Dim stmBLOBData As New MemoryStream(bytBLOBData2)

            context.Response.ContentType = "text/plain"
            'context.Response.Write("Hello World")
            context.Response.BinaryWrite(bytBLOBData2)
        End If
        rstQuery.Close()
        strCnn.Close()
        
        
        
    End Sub
 
    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

End Class