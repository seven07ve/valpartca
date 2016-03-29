<!--#include file="X001Z001.INC"-->

<script language="Javascript">


function OpenBrWindow(theURL,winName,features, myWidth, myHeight, isCenter) { //v3.0
	if(window.screen)if(isCenter)if(isCenter=="true"){
		var myLeft = (screen.width-myWidth)/2;
		var myTop = (screen.height-myHeight)/2;
		features+=(features!='')?',':'';
		features+=',left='+myLeft+',top='+myTop;
	}
	window.open(theURL,winName,features+((features!='')?',':'')+'width='+myWidth+',height='+myHeight);
}


document.oncontextmenu = function(){return false}

</script>
<%
	
	
	wCLA001 = Request.QueryString("CLA001")	
	
	 
%>

<HTML>
<HEAD>


<META NAME="GENERATOR" Content="Microsoft FrontPage 12.0">

<link rel=stylesheet type="text/css" href="X001Z900.CSS">
</HEAD>

<script language="javascript"  >

	//alert("Pago Procesado Satisfactoriamente.");
	//window.open('X001A004.asp','main');

</script>

<body bgcolor="<%=Request.Cookies("CAR")("Color1")%>" leftmargin="17" rightmargin="0"   topmargin="0" bottommargin="0">

<table width="840" bgcolor="#FFFFFF" border="0"  cellpadding="0" cellspacing="0" align="center" >
<tr>
<td bgcolor="#FFFFFF">

&nbsp;<table BORDER="1" WIDTH="650" cellspacing="0" align="center"   cellpadding="0"  bordercolor="#CACACA" bgcolor="<%=Request.Cookies("CAR")("Color2")%>"   style="border-style: inset; border-width: 2px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" >
		 <TR>
		 <td CLASS="TDT" colspan=5 height="22">&nbsp;<p><u><font size="3">Pagos</font></u></p>
			<p><span style="font-weight: 400"><font size="4">Pago Procesado 
			Satisfactoriamente.</font></span></p>
			<p>&nbsp;</p>
			
				<p>
				<input type="button" value="Imprimir Comprobante" name="Imprimir" style="width: 180; height:23" onclick="javascript:OpenBrWindow('X001A110.asp?CLA001=<%=wCLA001%>','Imprimir','menubar=0,resizable=0,location=0,status=0,scrollbars=1,directories=0,width=750,height=700','750','700','true')">
				<input type="button" value="Finalizar" name="Finalizar" style="width: 84; height:23" onclick="javascript:window.open('X001A004.asp','main')"></p>
			</form>
			<p>&nbsp;</td>		  
		 </TR>	

</table>
</td>
</tr>
</table>
<p>&nbsp;</td>
</tr>
<tr>

</tr>
</table>

</body>
</html>
