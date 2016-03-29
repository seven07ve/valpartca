<!DOCTYPE html><html xmlns="http://www.w3.org/1999/xhtml">  
<head>    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>    
<title>      Google Visualization API Sample    </title>
    <script type="text/javascript"  src="http://www.google.com/jsapi">
    </script>    
    <script type="text/javascript">      
    google.load('visualization', '1', {packages: ['piechart','linechart']});    
    </script>  
      <script type="text/javascript">   
         function drawVisualization() { 
                // Create and populate the data table.     
                   var data = new google.visualization.DataTable();     
                      data.addColumn('string', 'Month');       
                       data.addColumn('number', 'Sales'); 
                             data.addRows([          
                             	['January',{v:20, f:'$20M'}],     
                             	['February',{v:31, f:'$31M'}],          
                             	['March',{v:61, f:'$61M'}],          
                             	['April',{v:26, f:'$26M'}]        
                             	]);           
                                // Create and draw the visualization.      
            new google.visualization.PieChart(document.getElementById('visualization')).
            draw(data, {is3D:true});     
         }    
        google.setOnLoadCallback(drawVisualization);   
       </script>  
       
       </head>  <body style="font-family: Arial;border: 0 none;">    <div id="visualization" 
     style="width: 300px; height: 300px;">
    </div>  
    
    
    
<style type="text/css">
 body{
  margin:0;
  padding:0 <length> 0 0;
 }
 div#right-sidebar{
  position:absolute;
  top:0;
  right:0;
  width:<length>;
  height:100%;
 }
 @media screen{
  body>div#right-sidebar{
   position:fixed;
  }
 }
 * html body{
  overflow:hidden;
 } 
 * html div#content{
  height:100%;
  overflow:auto;
 }
</style>
<div id="right-sidebar"> 

<!-- Begin ParaChat Evaluation Applet Code -->
<APPLET CODEBASE="http://host7.parachat.com/pchat/applet"
 ARCHIVE=papplet.jar CODE=pclient.main.ChatClient.class HEIGHT=102 WIDTH=583>
<param name="Net.Site" value="11379">
<param name="Net.Room" value="Lobby">
<param name="Ctrl.AutoLogin" value="true"> 
<param name="Ctrl.Language" value="es">
<param name="Op.Tun" value="true"> 
<param name="Net.User" value="<%=Session("glNickName")%>">
<param name="Mn.Nt.Prv" value="Notificar Mensajes Privados"> 
<param name="Msg.Nt.Prv" value="Número de nuevos mensajes privados recientemente publicado en la sala de chat:"> 
<!--<param name="Net.UserPass" value=""> -->
<param name="cmd.BeepEnter" value="true"> 
<param name="cmd.BeepLeave" value="true"> 
<param name="cabbase" value="papplet.cab">
Disculpa, tu navegador no tiene Java Habilitado, espera por favor
<a href="http://www.parachat.com/faq/java.html">Visita la Pagina de Soporte para Java</a>
</applet>


</div>

    
    </body></html>