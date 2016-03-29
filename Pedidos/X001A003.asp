
<%@ Language=VBScript %>
<% Response.Expires = 0 %>
<!DOCTYPE html>

<html >  
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8"/>

<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<link rel="stylesheet" type="text/css" href="../X001Z900.css">
<base target="main">

<!--#include file="X001Z001.INC"-->





</head>

<%

	strCnn	= Application("XDTA300_ConnectionString")

	set XDTA300 = Server.CreateObject("ADODB.Connection")
	XDTA300.ConnectionTimeout = 15
	XDTA300.CommandTimeout = 30
	XDTA300.Open StrCnn
	SQL = "EXEC X300ZX003 '" & Session("glCiaInternet") & "'"  			
	'SQL = "EXEC X300ZX003 'CAR'"  			
	Set Rs = XDTA300.Execute(SQL)
		wVDIA01 = Rs("DIA01"):	wVDIA02 = Rs("DIA02"): wVDIA03 = Rs("DIA03")
		wVDIA04 = Rs("DIA04"):	wVDIA05 = Rs("DIA05"): wVDIA06 = Rs("DIA06")
		wVDIA07 = Rs("DIA07"):  wVDIA08 = Rs("DIA08"): wVDIA09 = Rs("DIA09")
		wVDIA10 = Rs("DIA10"):	wVDIA11 = Rs("DIA11"): wVDIA12 = Rs("DIA12")	
		wVDIA13 = Rs("DIA13"):	wVDIA14 = Rs("DIA14"): wVDIA15 = Rs("DIA15")
		wVDIA16 = Rs("DIA16"):	wVDIA17 = Rs("DIA17"): wVDIA18 = Rs("DIA18")
		wVDIA19 = Rs("DIA19"):	wVDIA20 = Rs("DIA20"): wVDIA21 = Rs("DIA21")
		wVDIA22 = Rs("DIA22"):	wVDIA23 = Rs("DIA23"): wVDIA24 = Rs("DIA24")
		wVDIA25 = Rs("DIA25"):	wVDIA26 = Rs("DIA26"): wVDIA27 = Rs("DIA27")
		wVDIA28 = Rs("DIA28"):	wVDIA29 = Rs("DIA29"): wVDIA30 = Rs("DIA30")
	Rs.close
	Set Rs = Nothing
	'response.write wVDIA27 
	Function fmtNombredelDia(idate)
		
		Select case (WeekDay(idate))
			Case 1
				wNDIA = "DOM"
			Case 2
				wNDIA = "LUN"
			Case 3
				wNDIA = "MAR"
			Case 4
				wNDIA = "MIE"
			Case 5
				wNDIA = "JUE"
			Case 6
				wNDIA = "VIE"
			Case 7
				wNDIA = "SAB"
		End select
		
		fmtNombredelDia = wNDIA
	
	End Function
	
	wNDIA = fmtNombredelDia(date-29)
	wDIA01 = wNDIA & "-" & Right("00" & day(date-29),2) 
	wNDIA = fmtNombredelDia(date-28)
	wDIA02 = wNDIA & "-" & Right("00" & day(date-28),2) 
	wNDIA = fmtNombredelDia(date-27)
	wDIA03 = wNDIA & "-" & Right("00" & day(date-27),2) 
	wNDIA = fmtNombredelDia(date-26)
	wDIA04 = wNDIA & "-" & Right("00" & day(date-26),2) 
	wNDIA = fmtNombredelDia(date-25)
	wDIA05 = wNDIA & "-" & Right("00" & day(date-25),2) 
	wNDIA = fmtNombredelDia(date-24)
	wDIA06 = wNDIA & "-" & Right("00" & day(date-24),2) 
	wNDIA = fmtNombredelDia(date-23)
	wDIA07 = wNDIA & "-" & Right("00" & day(date-23),2) 
	wNDIA = fmtNombredelDia(date-22)
	wDIA08 = wNDIA & "-" & Right("00" & day(date-22),2) 
	wNDIA = fmtNombredelDia(date-21)
	wDIA09 = wNDIA & "-" & Right("00" & day(date-21),2) 
	wNDIA = fmtNombredelDia(date-20)
	wDIA10 = wNDIA & "-" & Right("00" & day(date-20),2)
	
	wNDIA = fmtNombredelDia(date-19)
	wDIA11 = wNDIA & "-" & Right("00" & day(date-19),2) 
	wNDIA = fmtNombredelDia(date-18)
	wDIA12 = wNDIA & "-" & Right("00" & day(date-18),2) 
	wNDIA = fmtNombredelDia(date-17)
	wDIA13 = wNDIA & "-" & Right("00" & day(date-17),2) 
	wNDIA = fmtNombredelDia(date-16)
	wDIA14 = wNDIA & "-" & Right("00" & day(date-16),2) 
	wNDIA = fmtNombredelDia(date-15)
	wDIA15 = wNDIA & "-" & Right("00" & day(date-15),2) 
	wNDIA = fmtNombredelDia(date-14)
	wDIA16 = wNDIA & "-" & Right("00" & day(date-14),2) 
	wNDIA = fmtNombredelDia(date-13)
	wDIA17 = wNDIA & "-" & Right("00" & day(date-13),2) 
	wNDIA = fmtNombredelDia(date-12)
	wDIA18 = wNDIA & "-" & Right("00" & day(date-12),2) 
	wNDIA = fmtNombredelDia(date-11)
	wDIA19 = wNDIA & "-" & Right("00" & day(date-11),2) 
	wNDIA = fmtNombredelDia(date-10)
	wDIA20 = wNDIA & "-" & Right("00" & day(date-10),2)

	wNDIA = fmtNombredelDia(date-9)
	wDIA21 = wNDIA & "-" & Right("00" & day(date-9),2) 
	wNDIA = fmtNombredelDia(date-8)
	wDIA22 = wNDIA & "-" & Right("00" & day(date-8),2) 
	wNDIA = fmtNombredelDia(date-7)
	wDIA23 = wNDIA & "-" & Right("00" & day(date-7),2) 
	wNDIA = fmtNombredelDia(date-6)
	wDIA24 = wNDIA & "-" & Right("00" & day(date-6),2) 
	wNDIA = fmtNombredelDia(date-5)
	wDIA25 = wNDIA & "-" & Right("00" & day(date-5),2) 
	wNDIA = fmtNombredelDia(date-4)
	wDIA26 = wNDIA & "-" & Right("00" & day(date-4),2) 
	wNDIA = fmtNombredelDia(date-3)
	wDIA27 = wNDIA & "-" & Right("00" & day(date-3),2) 
	wNDIA = fmtNombredelDia(date-2)
	wDIA28 = wNDIA & "-" & Right("00" & day(date-2),2) 
	wNDIA = fmtNombredelDia(date-1)
	wDIA29 = wNDIA & "-" & Right("00" & day(date-1),2) 
	wNDIA = fmtNombredelDia(date)
	wDIA30 = wNDIA & "-" & Right("00" & day(date),2)
	
	
	SQL = "SELECT " 
	SQL = SQL & " Count(*) Usuarios  "
	SQL = SQL & " FROM X300ZF001 "
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300001CCI = '" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " Z300001STS = '1' "			
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	If NOT rstQuery.EOF Then	
		wUsuarios = cdbl(rstQuery.Fields("Usuarios"))
	End If
	rstQuery.CLOSE
	SET rstQuery = NOTHING	

    
    'wUsuariosConectados = Application("ActiveUsers")
    wUsuariosConectados = dOnlineUsers.Count
    
    IF wUsuariosConectados > wUsuarios Then
    	wUsuariosConectados = wUsuarios
	End if 

%>
    <script type="text/javascript" src="http://www.google.com/jsapi"></script>
    <script type="text/javascript">
      //google.load('visualization', '1', {packages: ['imagelinechart']});
      google.load('visualization', '1', {packages: ['piechart','linechart']});
      //google.load('visualization', '1', {packages: ['columnchart']});	
    
    </script>
    <script type="text/javascript">
      function drawVisualization() {
        // Create and populate the data table.
        var data = new google.visualization.DataTable();
       
        data.addColumn('string', 'Dias');
        data.addColumn('number', 'Visitas');
        data.addRows(30);
        data.setCell(0, 0, '<%=wDIA01%>');
        data.setCell(1, 0, '<%=wDIA02%>');
        data.setCell(2, 0, '<%=wDIA03%>');
        data.setCell(3, 0, '<%=wDIA04%>');
        data.setCell(4, 0, '<%=wDIA05%>');
        data.setCell(5, 0, '<%=wDIA06%>');
        data.setCell(6, 0, '<%=wDIA07%>');
        data.setCell(7, 0, '<%=wDIA08%>');
        data.setCell(8, 0, '<%=wDIA09%>');
        data.setCell(9, 0, '<%=wDIA10%>');
		data.setCell(10, 0, '<%=wDIA11%>');
        data.setCell(11, 0, '<%=wDIA12%>');
        data.setCell(12, 0, '<%=wDIA13%>');
        data.setCell(13, 0, '<%=wDIA14%>');
        data.setCell(14, 0, '<%=wDIA15%>');
        data.setCell(15, 0, '<%=wDIA16%>');
        data.setCell(16, 0, '<%=wDIA17%>');
        data.setCell(17, 0, '<%=wDIA18%>');
        data.setCell(18, 0, '<%=wDIA19%>');
        data.setCell(19, 0, '<%=wDIA20%>');
        data.setCell(20, 0, '<%=wDIA21%>');
        data.setCell(21, 0, '<%=wDIA22%>');
        data.setCell(22, 0, '<%=wDIA23%>');
        data.setCell(23, 0, '<%=wDIA24%>');
        data.setCell(24, 0, '<%=wDIA25%>');
        data.setCell(25, 0, '<%=wDIA26%>');
        data.setCell(26, 0, '<%=wDIA27%>');
        data.setCell(27, 0, '<%=wDIA28%>');
        data.setCell(28, 0, '<%=wDIA29%>');
        data.setCell(29, 0, '<%=wDIA30%>');
        
        data.setCell(0, 1, <%=wVDIA01%>);
        data.setCell(1, 1, <%=wVDIA02%>);
        data.setCell(2, 1, <%=wVDIA03%>);
        data.setCell(3, 1, <%=wVDIA04%>);
        data.setCell(4, 1, <%=wVDIA05%>);
        data.setCell(5, 1, <%=wVDIA06%>);
        data.setCell(6, 1, <%=wVDIA07%>);
        data.setCell(7, 1, <%=wVDIA08%>);
        data.setCell(8, 1, <%=wVDIA09%>);
        data.setCell(9, 1, <%=wVDIA10%>);
		data.setCell(10, 1, <%=wVDIA11%>);
        data.setCell(11, 1, <%=wVDIA12%>);
        data.setCell(12, 1, <%=wVDIA13%>);
        data.setCell(13, 1, <%=wVDIA14%>);
        data.setCell(14, 1, <%=wVDIA15%>);
        data.setCell(15, 1, <%=wVDIA16%>);
        data.setCell(16, 1, <%=wVDIA17%>);
        data.setCell(17, 1, <%=wVDIA18%>);
        data.setCell(18, 1, <%=wVDIA19%>);
        data.setCell(19, 1, <%=wVDIA20%>);
		data.setCell(20, 1, <%=wVDIA21%>);
        data.setCell(21, 1, <%=wVDIA22%>);
        data.setCell(22, 1, <%=wVDIA23%>);
        data.setCell(23, 1, <%=wVDIA24%>);
        data.setCell(24, 1, <%=wVDIA25%>);
        data.setCell(25, 1, <%=wVDIA26%>);
        data.setCell(26, 1, <%=wVDIA27%>);
        data.setCell(27, 1, <%=wVDIA28%>);
        data.setCell(28, 1, <%=wVDIA29%>);
        data.setCell(29, 1, <%=wVDIA30%>);

      
        // Create and draw the visualization.
        //new google.visualization.ImageLineChart(document.getElementById('visualization')).
        new google.visualization.LineChart(document.getElementById('visualization')).
        //new google.visualization.ColumnChart(document.getElementById('visualization')).
        //draw(data, {colors:[{color:'#0066FF', darker:'#FF6600'}], smoothLine:true ,legend: 'bottom',titleFontSize: '11',title: 'Visitas Registradas'});
        draw(data, {colors:[{color:'#0066FF', darker:'#FF6600'}], smoothLine:true ,legend: 'bottom'});
            
		 
      }
      

      google.setOnLoadCallback(drawVisualization);
    </script>
<body onload=" javascript:window.status='<%=Request.ServerVariables("URL") & " ( Usuario: " & Session("glUsuarioNombre") & " )" %>'" scroll="yes" topmargin="0" leftmargin="18" rightmargin="0" bottommargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>">

<table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" align="center">
<tr>
<td>



<table width="919" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" >
<tr>
<td bgcolor="#FFFFFF">



<p style="margin:1px 75px; " align="justify">
&nbsp;</p>
<p style="margin:1px 20px; " align="justify">



<%

 on error resume next
    response.write "<table cellpadding=""2"" cellspacing=""1"" border=""0"" width=""600"" align=""center"">"        
    response.write "<tr><td></td><td align=""left""><strong><font face=""Tahoma"" style=""font-size: 8pt;"">Usuario</font></strong></td>"
    response.write "<td align=""left""><strong><font face=""Tahoma"" style=""font-size: 8pt;"">Nombre</font></strong></td>"
    'response.write "<td align=""left""><strong><font face=""Tahoma"" style=""font-size: 8pt;"">Visitante Nro.</font></strong></td>"
    response.write "<td align=""left""><strong><font face=""Tahoma"" style=""font-size: 8pt;"">Hora</font></strong></td></tr>"
    sUser2 = ""
    aSessions = dOnlineUsers.Keys
    for iUser = 0 to dOnlineUsers.Count - 1
        sKey = aSessions(iUser)
        sUserInfo = dOnlineUsers.Item(sKey)
        aUserInfo = split(sUserInfo, "<|>")
        
        sUser = aUserInfo(0)
        sUserName = aUserInfo(1)
        sVisitor = aUserInfo(2)
        sLastActionTime = aUserInfo(3)
        sNickName = Replace(Replace(trim(aUserInfo(4)), " ", ""), ".", "_")
        sCCI = trim(aUserInfo(5))
        
        IF len(trim(sNickName)) = 0 THEN
        	sNickName = sUser 
        END IF 
        
        If sUserInfo <> "" AND Session("glCiaInternet") = sCCI AND sUser <> sUser2 Then  
        	iUsrCount = iUsrCount + 1
        	response.write "<tr><td align=""right""><font face=""Tahoma"" style=""font-size: 8pt;"">" & iUsrCount & ".</font></td>"
        	response.write "<td align=""left""><font face=""Tahoma"" style=""font-size: 8pt;"">" & sUser & "</font></td>"
        	response.write "<td align=""left""><font face=""Tahoma"" style=""font-size: 8pt;"">" & sUserName & "</font></td>"
        	'response.write "<td><font face=""Tahoma"" style=""font-size: 8pt;"">" & sVisitor & "</font></td>"
        	response.write "<td align=""left""><font face=""Tahoma"" style=""font-size: 8pt;"">" & sLastActionTime & "</font></td></tr>"
			sUser2 = sUser	       
   	    End If
        sNickName = ""
         
    next
    response.write "</table>"
    %>


<p style="margin-top: 10px; margin-bottom: 1px">


<table align="center" >
<tr>
		<td>
		<img src="images/Usuario.jpg" >
		</td>
      <td valign="center"  >
      <font face="Tahoma" style="font-size: 9pt; font-weight:700" >Usuarios 
	  Conectados <%= iUsrCount %> de <%= wUsuarios %> </font> 
      </td>
      </tr>
      
      
</table>
</p>

<p align="center"  >
<table align="center" width="606" >

<tr>
<td align="center" colspan="2" >
<font face="Tahoma" style="font-size: 9pt; font-weight:700" >Visitas Registradas 
los Últimos 30 días</font> 
</td> 
</tr>
<tr> 
 <td align="center" colspan="2" >
 <div id="visualization" style="width: 600px; height: 210px;" align="center"  ></div>
</td> </tr>
<tr>
<td align="right"  >

<img border="0" src="images/Punto.jpg" width="8" height="8" align="right"></td>
<td align="left" > <font face="Tahoma" style="font-size: 8pt; font-weight:500" >
Si hace doble Click sobre los puntos Naranja verá el total de usuarios que 
ingresaron a la Web en la fecha seleccionada.</font></td>
</tr>
<tr>
<td align="center"  colspan="2">
<hr>
</td>
</tr>

<tr>
<td align="center"  colspan="2">
<p style="margin-top: 10px"><font face="Tahoma" style="font-size: 9pt; font-weight:700" >
Usuarios</font> 
</td>
</tr>
<!--
<tr><td align="center"  colspan="2" >
 <div id="visualization2" style="width: 400px; height: 210px;" align="center"  ></div>
 </td>  
</tr> 
 </table> 
<p>
<img src="http://chart.apis.google.com/chart?chxt=x,y&chxl=0:<%=wVISITAS%>,1:<%=wDIAS%>"></img>
</p>--> 





	<p style="margin-top: 20px" align="center">
	<input type="button" value="Regresar" name="Regresar" onclick="window.history.back()"></p>


		</td>
        </tr>
                
        
        
        
        
        
               </table>
 
		
</body>
</html>