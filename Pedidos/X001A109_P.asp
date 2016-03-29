<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 12.0">
<title></title>
<link rel=stylesheet type="text/css" href="X001Z900.CSS">
</head>



<script language="Javascript">

function enviar() {

	
	if (document.FrmBuscar.FAMILIA.value == '000') {
		alert('Seleccione una Familia');
	}
	else{
		document.FrmBuscar.submit(); 
	}
	
	
}


function OpenBrWindow(theURL,winName,features, myWidth, myHeight, isCenter) { //v3.0
	if(window.screen)if(isCenter)if(isCenter=="true"){
		var myLeft = (screen.width-myWidth)/2;
		var myTop = (screen.height-myHeight)/2;
		features+=(features!='')?',':'';
		features+=',left='+myLeft+',top='+myTop;
	}
	window.open(theURL,winName,features+((features!='')?',':'')+'width='+myWidth+',height='+myHeight);
}


</script>


<%

	wURLACT = Request.QueryString("URLACT")
	wURLIMP = Request.QueryString("URLIMP")
	wURLPRI = Request.QueryString("URLPRI")
	wURLTIT = Request.QueryString("URLTIT")
	wCAMC01 = Request.QueryString("CAMC01")
	wCAMC02 = Request.QueryString("CAMC02")
	wCAMC03 = Request.QueryString("CAMC03")
	wMES = trim(Request.QueryString("MES"))
	
	wURL = wURLACT & "?CLA001=" & wCAMC01 & "&CLA002=" & wCAMC02 & "&CLA003="
	
	wURLX = wURLIMP 
	wURLX = wURLX & "?URLTIT=" & wURLTIT
	wURLX = wURLX & "&CAMC01=" & wCAMC01
	wURLX = wURLX & "&CAMC02=" & wCAMC02


	'wURLI = wURLIMP & "?STSIMP=S&URLTIT=" & wURLTIT
	wURLI = "X001A101_PRINT.asp?CAMC01=" & wCAMC01 & "&CAMC02=" & wCAMC02
	wURLT = wURLX & "&STSIMP=E" 

	
	wURLP = wURLPRI & "&PARBUS=S"
	
	wURLP = "X001A103B.ASP" & "?URLTIT=" & wURLTIT	
	wURLP = wURLP & "&CLA001=" & wCAMC01 & "&CLA002=" & wCAMC02
	
	'wURLPS = "X001A102_01.ASP" & "?CLA001=" & wCAMC01 & "&CLA002=" & wCAMC02 	 
	'wURLPSP = "X001A102_03.ASP" & "?CLA001=" & wCAMC01 & "&CLA002=" & wCAMC02 	 
	
	wURLR = Session("glUrlRegresar") & "&MES=" & wMES '"X001A108_S.ASP?NOMTAB=" & wNOMTAB
	
	
	'wURLTIT = Request.QueryString("URLTIT") 
	'wCLA001 = Request.QueryString("CLA001") 
	'wCLA002 = Request.QueryString("CLA002") 
	'wTITULO = "Busqueda de Productos"

	wURLB = "X001A103BS.ASP?URLTIT=" & wURLTIT
	'wURLB = "X001A101_F.ASP?URLTIT=" & wURLTIT
	wURLB = wURLB & "&CAMC01=" & wCAMC01
	wURLB = wURLB & "&CAMC02=" & wCAMC02  
	wURLB = wURLB & "&URLD=" & "X001A103BS.ASP"  

	
 	wCLA005 = trim(Request.QueryString("CLA005"))
 	'response.write "Familia: " & wCLA005
	
	%>
	 
<FORM NAME="FrmBuscar" METHOD="post" ACTION="<%=wURLB%>" target="main" >	 
	 <BODY   topmargin="0" leftmargin="0" rightmargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>">
  

 <table width="919" bgcolor="#ffffff" border="0"  cellpadding="0" align="center" height="100%" >
<tr>
<td valign="top"  >

<table width="920" bgcolor="#FFFFFF" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF">



<table width="100%" align="center"  border="0" cellpadding="0" cellspacing="0"  >


<tr>
<td align="center">


<table border="0" width="919" cellspacing="0" cellpadding="0" bordercolor="#0066CC" bgcolor="#FFFFFF" align="center">

   
 <tr>
    <td width="99%" align= "center" style="border-left:1px solid #0066CC; border-right:1px solid #0066CC; border-top:1px solid #0066CC; ">
      <table border="0" width="920" bgcolor="#E9E9E9" style="border-width: 0px">
     

<tr>
          <td width="100%" style="border-style: none; border-width: medium; " height="25">
            <p align="center">
			<font color="#000000" style="font-size: 8pt; font-weight:700"><!--*Si desea Agregar o Modificar las Facturas debe Generar un Nuevo Pago--></font></p>
          </td>
                  
                  </tr>



      </table>
    </td>
  </tr>
  <tr>
<td align= "center" >
    <table bordercolor="#CACACA" bgcolor="#297D39" cellspacing="0" BORDER="1" WIDTH="920" height="30"   style="border-style: inset; border-width: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px"  >
    <TR>
		<td CLASS="TDP" width="50%" align="center"><A href="<%=wURLR %>" target="_parent">Regresar</A></td>	
		<% IF wCAMC03 = "1" THEN %>
		<td CLASS="TDP" width="50%" align="center"><a href="#" > <font onclick="javascript:OpenBrWindow('X001A110.asp?CLA001=<%=wCAMC02%>','Imprimir','menubar=0,resizable=0,location=0,status=0,scrollbars=1,directories=0,width=750,height=700','750','700','true')" style="CURSOR: pointer">Imprimir</font> </a></td>		  					
    	<% ELSE %>
    	<td CLASS="TDP" width="50%" align="center">Imprimir</font> </a></td>
    	<% END IF %>
    </TR>	
	</table>	
	
	</td> 
</tr>
</table>


	
	
</td> 
</tr> 
</table>
 
</td>
</tr> 

</tr> 
</p> 

</td>

        </tr>
        
        
        
        
               </table>

    </td>				
  </tr>
</table>



</FORM> 	
</body>




<% 
'RESPONSE.WRITE Session("glBusqueda3") & "##"
%>

</HTML>
