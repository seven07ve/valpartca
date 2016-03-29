<%@ Application Language="VB" %>

<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application startup
        Application("XDTA300_ConnectionString") = "Data Source=sql.dcm.com.ve;Initial Catalog=dcm_com_ve_sql;User ID=SQLUser_dcm;Password=Xml2007;"
        'Application("XDTA300_ConnectionString") = "Data Source=200.74.224.29;Initial Catalog=carvica_com_ve_sql;User ID=SQLUser_ventascarvica.com.ve;Password=Xml2007;"
        Application("XDTA300_ConnectionTimeout") = 120
        Application("XDTA300_CommandTimeout") = 120
        Application("XDTA300_CursorLocation") = 3
        Application("XDTA300_RuntimeUserName") = "SQLUser_dcm"
        Application("XDTA300_RuntimePassword") = "Xml2007"
    End Sub
    
    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown
    End Sub
        
    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when an unhandled error occurs
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a new session is started
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends. 
        ' Note: The Session_End event is raised only when the sessionstate mode
        ' is set to InProc in the Web.config file. If session mode is set to StateServer 
        ' or SQLServer, the event is not raised.
    End Sub
       
</script>