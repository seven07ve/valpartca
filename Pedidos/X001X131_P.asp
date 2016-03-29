<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 6.0">
<title></title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
</head>

<script language="javascript"  src="Jscript.js">
</script> 

<%

	wURLACT = Request.QueryString("URLACT")
	wURLIMP = Request.QueryString("URLIMP")
	wURLPRI = Request.QueryString("URLPRI")
	wURLTIT = Request.QueryString("URLTIT")
	wCAMC01 = Request.QueryString("CAMC01")
	wCAMC02 = Request.QueryString("CAMC02")
	


	
	%>
	 

	 	 <BODY   topmargin="0" leftmargin="0" rightmargin="0" bgcolor="#000000">
  

 <table width="790" bgcolor="#000000" border="0"  cellpadding="0" align="center"  >
<tr>
<td>

<table width="790" bgcolor="#FFFFFF" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF">



<table width="100%" align="center"  border="0" cellpadding="0" cellspacing="0"  >


<tr>



    <!--<td width="100%" >
     
      <table border="0" width="100%" bgcolor="#FE9900">
        <tr>
        <td width="10%" align="right">
		<IMG alt ="" border=0 src="images/Buscar2.ico" >
		</td>
		<td width="90%" >
		<p align="left"><font color="white">
		<%=wTITULO%></font></p>
		</td>
		</tr>
		</table>
	</td>
	</tr>		-->
 
<td align= "center" valign="bottom"  >
    <table bordercolor="#CACACA" bgcolor="#990000" cellspacing="0" BORDER="0" WIDTH="780" height="25"   WIDTH="760" >
    <TR>
		<td CLASS="TDP" width="20%" align="center"><font color="#0000FF" onclick="history.back();" style="CURSOR: pointer;">Regresar</font> </td>		  			
    </TR>	
	</table>	
	
	</td> 
</tr>
</table>



 
</td>
</tr> 
<td>
<img src="../images/index/bottom.jpg" width="790" height="15" /></td>
</tr> 
</p> 

</td>

        </tr>
        
        
        
        
               </table>

    </td>				
  </tr>
</table>




</body>




<% 
'RESPONSE.WRITE Session("glBusqueda3") & "##"
%>

</HTML>
