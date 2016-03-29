<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"  Namespace="System.Web.UI" TagPrefix="asp" %>   

    <script language="VB" runat=server>

       Sub DoUpload(Sender As Object, e As System.EventArgs)
          Dim sPath as String
          Dim sFile as String
          Dim sFullPath as String
          Dim sSplit() as String
          Dim sPathFriendly as String
          
         
          
          'Upload to same path as script
          'Internet Anonymous User must have write permissions
          
           sPath = Server.MapPath(".")
           If Right(sPath, 1) <> "\" Then
               sPathFriendly = sPath 'Friendly path name for display
               sPath = sPath & "\IMG\"
           Else
               sPathFriendly = Left(sPath, Len(sPath) - 1)
           End If
			
          
          'Save as same file name being posted
          'The code below resolves the file name
          '(removes path info)
          sFile = txtUpload.PostedFile.FileName
          sSplit = Split(sFile, "\")
          sFile = sSplit(Ubound(sSplit))
          
          
          
           sFullPath = sPath & sFile
		  Try
          txtUpload.PostedFile.SaveAs(sFullPath)
         lblResults.Text = "Upload of File " & sFile & " to " & sPathFriendly & " succeeded"
         
         Catch Ex as Exception
			
			lblResults.Text = "Upload of File " & sFile & " to " & sPathFriendly & " failed for the following reason: " & Ex.Message
         Finally
			lblResults.Font.Bold = True
			lblResults.Visible = true
         End Try
		
        End Sub
        
        Sub Prueba(ByVal Sender As Object, ByVal e As System.EventArgs)
            
            Dim sPath As String
            Dim sFile As String
            Dim sFullPath As String
            Dim sSplit() As String
            Dim sPathFriendly As String
          
         
          
            'Upload to same path as script
            'Internet Anonymous User must have write permissions
          
            sPath = Server.MapPath(".")
            If Right(sPath, 1) <> "\" Then
                sPathFriendly = sPath 'Friendly path name for display
                sPath = sPath & "\IMG\"
            Else
                sPathFriendly = Left(sPath, Len(sPath) - 1)
            End If
            
               
            'Save as same file name being posted
            'The code below resolves the file name
            '(removes path info)
            sFile = CStr(txtUpload.PostedFile.FileName)
            'sSplit = Split(sFile, "\")
            'sFile = sSplit(UBound(sSplit))
          
          
          
            'sFullPath = sPath & sFile
        End Sub

                                                    
</script>
<html>



    <body>
       <form id="Form1" enctype="multipart/form-data" runat=server>
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                   <ContentTemplate>
   
			
          <FONT face = +1><B>

           Select File To Upload:</b></FONT>
           <input id="txtUpload" type=file runat=server>
          
			<P align = CENTER>
         
			
          <!--<hr noshade>-->

          <asp:label id="lblResults" Visible=false runat=server/>
            
                    <asp:Button ID="btnUpload" runat="server" OnClick="Prueba" Text="Upload File" /> 
              
              

    
             </ContentTemplate>
        </asp:UpdatePanel>
          
         </form>
   </body>
</html>
