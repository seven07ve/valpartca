
<%@ Language=VBScript %>

<%

Response.Expires = -1
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
	<!--#include file="X001Z001.INC"-->

<%
	Datos_Compania wDEL, wURI			
	
	strCnn	= Application("XDTA300_ConnectionString")
	
	SQL = "SELECT Z300002PR1, Z300002PR2, Z300002PR3, Z300002PR4 FROM X300ZF002 " 
	SQL = SQL & " WHERE "
	SQL = SQL & " Z300002CCI = '" & Session("glCiaInternet") & "' "
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	if NOT rstQuery.EOF then
		wPR1 = trim(rstQuery.Fields("Z300002PR1"))
		wPR2 = trim(rstQuery.Fields("Z300002PR2"))
		wPR3 = trim(rstQuery.Fields("Z300002PR3"))
		wPR4 = trim(rstQuery.Fields("Z300002PR4"))
	end if
	rstQuery.CLOSE
	SET rstQuery = NOTHING	
	
	SQL = "SELECT Z300001NUS " 
	SQL = SQL & " FROM X300ZF001 WHERE "
	SQL = SQL & " Z300001CCI = '" & Session("glCiaInternet") & "' AND "
	SQL = SQL & " Z300001PUS = '" & Session("glUsuario") & "'"
	Set rstQuery = Server.CreateObject("ADODB.Recordset")
	rstQuery.Open sql , strCnn
	if NOT rstQuery.EOF then
		wNUS = trim(rstQuery.Fields("Z300001NUS"))
	end if
	rstQuery.CLOSE
	SET rstQuery = NOTHING	

	

%>

<html>
<head>
	<title>.:Web Site - <%=wDEL%>:.</title>
	<meta http-equiv="Window-target" content="_top">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="shortcut icon" href="../favicon.ico"/>
	<base target="main">
	

</head>


<style type="text/css">
<!--
body,td,th {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	
}
a {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #000000;
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #000000;
}
a:hover {
	text-decoration: none;
	color: #0077C0;
}
a:active {
	text-decoration: none;
	color: #000000;
}
.Estilo2 {color: #FFFFFF;
	font-weight: bold;
	font-size: 14px;
}
.Estilo3 {	font-size: 16px;
	font-weight: bold;
	color: #CCCCCC;
}
.Estilo5 {color: #000000; font-weight: bold; font-size: 14px; }
.Estilo7 {color: #F0AA17; font-weight: bold; font-size: 14px; }
.auto-style1 {
	background-repeat:no-repeat;
}
-->
</style>



<script language="javascript" >

function OpenBrWindow(theURL,winName,features, myWidth, myHeight, isCenter) { //v3.0
	if(window.screen)if(isCenter)if(isCenter=="true"){
		var myLeft = (screen.width-myWidth)/2;
		var myTop = (screen.height-myHeight)/2;
		features+=(features!='')?',':'';
		features+=',left='+myLeft+',top='+myTop;
	}
	window.open(theURL,winName,features+((features!='')?',':'')+'width='+myWidth+',height='+myHeight);
}


function Salir() {

	if (confirm('¿Esta Seguro que Desea Salir del Portal de <%= wDEL%>?')) {
	// Respuesta afirmativa...
	window.open('Salir.asp','_top') 
	}
}

function loadOut()
{
	closepopup();
	//alert("Esta Saliendo de Carvica");
	window.location="Salir.asp?CL1=0";
} 

</script>


<body onBeforeUnload="loadOut()"  leftmargin=0 topmargin=0 marginheight="0" marginwidth="0" bgcolor="#ffffff" onload=";" scroll="no" >

  
<table width="919" border="0" cellspacing="0" cellpadding="0" align="center" class="auto-style1"  >
        <tr>
          <td width="274" rowspan="2">
		  <img src="<%=wURI%>" alt="Bienvenidos a <%= wDEL%>" border="0"  /></td>
          <td width="645" height="77" align="right" >
          
              <p style="margin-right: 14px; margin-bottom: 20px; margin-top: 20px"><strong> <img border="0" src="images/user.jpg" alt="Usuario" width="15" height="15"> <%=wNUS%></strong></p>
              <!--<hr color="<%=Request.Cookies("CAR")("Color2")%>">-->
              </td>
        </tr>
        <tr>
          <td height="44" valign="bottom" ><div align="right">
          
          <%IF Session("glTipoUsuario") <> "D" AND Session("glTipoUsuario") <> "EG" AND Session("glTipoUsuario") <> "CP" AND Session("glTipoUsuario") <> "UA" THEN%>
          <% IF Session("glEstatusUsuario") <> "2" THEN %>
           <% IF wPR1 = "1" THEN %>
          <a  target="main"href="X001A001.asp"><strong>VENTAS</strong></a><strong> 
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <% END IF %>
          <% END IF %>
          
          <% IF wPR2 = "1" AND Session("glTipoUsuario") <> "EG" AND Session("glTipoUsuario") <> "CP" AND Session("glTipoUsuario") <> "UA" THEN 'IF Session("glTipoUsuario") <> "C" and Session("glTipoUsuario") <> "V" AND Session("glTipoUsuario") <> "EG" THEN%>
          	</strong>
          <a target="main" href="X001A005.asp"><strong>SUG. Y RECLAMOS</strong></a><strong> 
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
          <% END IF %>

          <% IF wPR2 = "1" AND Session("glTipoUsuario") <> "EG" AND Session("glTipoUsuario") <> "CP" AND Session("glTipoUsuario") <> "UA" THEN 'IF Session("glTipoUsuario") <> "C" and Session("glTipoUsuario") <> "V" AND Session("glTipoUsuario") <> "EG" THEN%>
          	</strong>
          <a target="main" href="X001A004.asp"><strong>PAGOS</strong></a><strong> 
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
          <% END IF %>
          <% END IF %>
          
          
          <% IF wPR3 = "1" THEN %>
          
          	  </strong>
          
          	<a href="X001A005.asp"><strong>PQR</strong></a><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
          
          <% END IF %>
          
          <% IF wPR4 = "1" AND Session("glTipoUsuario") <> "EG" AND Session("glTipoUsuario") <> "CP" AND Session("glTipoUsuario") <> "UA" THEN 'IF Session("glTipoUsuario") <> "C" THEN %>
          
          	  </strong>
          
          	<a href="X001A006.asp"><strong>SALES PRO</strong></a><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
          
          <% END IF %>

          
          <% SELECT CASE Session("glTipoUsuario")
			CASE "D" %>       
			  </strong>       
			<a target="main" href="X001X003.asp"><strong>CONSULTAS</strong></a><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		 
		 <%  CASE "EG" %>
		 	  </strong>
		 	<a target="main" href="X001X004.asp"><strong>CONSULTAS</strong></a><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		 
		 <%  CASE "CP" %>
		 	  </strong>
		 	<a target="main" href="X001X005.asp"><strong>CONSULTAS</strong></a><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		 
		 <% CASE ELSE %>
		 	  </strong>
		 	<a target="main" href="X001X001.asp"><strong>CONSULTAS</strong></a><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		 
		 <% END SELECT %>
		 
		 <%IF Session("glTipoUsuario")= "A" OR Session("glTipoUsuario")="G" THEN%>

          	</strong>

          <a href="X001X002.asp"><strong>MAESTROS</strong></a><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
          
          <% END IF %>
          
          <%IF Session("glTipoUsuario") <> "EG" THEN%>

          	</strong>

          <a href="X001X108.asp"><strong>MIS DATOS</strong></a><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
          <% END IF %>
          
		          
          	</strong>
          
		          
          <a onclick="Salir();" style="CURSOR: pointer"><strong>SALIR</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;
          
          </div></td>
        </tr>
      </table>
    <table border="0" ><tr><td>
   
    </td> 
    </tr> 
    </table> 
    <script type="text/javascript">
    
   function closepopup()
   {
      if(false == my_window.closed)
      {
         my_window.close ();
      }
      else
      {
         //alert('Window already closed!');
      }
   }

</script>
 <!--#include file="X001Y007.PRC"-->
   
</body>
</html>