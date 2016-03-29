<%@ Language=VBScript %>
<%

Response.Expires = -1
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"

%>

<HTML>
<HEAD>


<link rel=stylesheet type="text/css" href="X001Z900.CSS">
<style type="text/css" >

html{overflow-y:scroll} 

</style>

<!--#include file="X001Z001.INC"-->
<!--#include file="X001Y004.PRC"-->

<SCRIPT LANGUAGE="javascript" type="text/javascript">

	function cmdSubmit_onclick(){
		if (document.frmGral.wDES.value.length==0){ 
			alert('Debe Indicar la descripción.');
			document.frmGral.wDES.focus()
		}else{
			document.frmGral.submit();
		}
	}
	
</SCRIPT> 


</HEAD>

	<%


	wCLA001 = trim(Request.QueryString("CLA001"))
	wURLW = Request.ServerVariables("URL")
	
	wTIT = "Sector / Canal" 
	wCLA001 = trim(Request.QueryString("CLA001"))
	wCCI = Session("glCiaInternet") 
	wCIA = Session("glCia") 

	
	wDEL =""
	wKPC ="0"
	wPIM ="0"
	wSTS ="1"	
	wDisabled = "DISABLED"
	wProceso = "Agregar"
    IF len(wCLA001) > 0 then	 
		
		wProceso = "Actualizar"
		
		wDisabled = "DISABLED"
    
		strCnn	= Application("XDTA300_ConnectionString")
	
		SQL = "SELECT * FROM X300PF702 " 
		SQL = SQL & " WHERE "
		SQL = SQL & " P300702CCI = '" & wCCI & "' AND "
		SQL = SQL & " P300702CON ='" &  wCLA001 & "'" 	

		wACT = ""
		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wDEL = trim(rstQuery.Fields("P300702DES"))
			wPUS = trim(rstQuery.Fields("P300702PUS"))
			wFAC = trim(rstQuery.Fields("P300702FAC"))
			'wACT =  wPUS & " el " & wFAC & "   ( Creado el " & wFPR & " ) "
		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING	
		
		IF NOT ISNULL(wFAC) THEN	
			wDIA_FED = Day(wFAC)
        	If Len(Trim(wDIA_FED)) = "1" Then: wDIA_FED = "0" & wDIA_FED: End If
        	wMES_FED = Month(wFAC)
        	If Len(Trim(wMES_FED)) = "1" Then: wMES_FED = "0" & wMES_FED: End If
        	wANO_FED = Year(wFAC)
        	wFAC = wDIA_FED & "/" & wMES_FED & "/" & wANO_FED & "  " & TimeValue(wFAC) & " por " & wPUS
        	ELSE
        	wFAC = "NO DISPONIBLE"
		END IF

   	ELSE
   		
   		wCLA001 = "Nuevo"

    end if
	
	wTIT = wProceso & " " & wTIT   

	wURL = "X001X166S"
	wURLP = wURL & ".ASP?CLA001=" & wCLA001
	%>
	<body topmargin="0" leftmargin="18" rightmargin="0" bottommargin="0" bgcolor="<%=Request.Cookies("CAR")("Color1")%>" onload="javascript: frmGral.wDES.focus();">
	
	
 <table width="919" bgcolor="#ffffff" border="0" cellspacing="0"  cellpadding="0" align="center" height="100%" >
<tr>
<td valign="top"  >
<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURLP%>" >
<br>
<br>
   <table align="center" BORDER="1" WIDTH="650" cellspacing="0" cellpadding="0"  bordercolor="#FFFF" bgcolor="<%=Request.Cookies("CAR")("Color2")%>" style="border-style: inset; border-width: 1px; padding-left: 1px; padding-right: 1px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" cellpadding="5" >
		 <TR>
		 <td CLASS="TDT" colspan=3 height="30"><%= wTIT %></td>		  
		 </TR>	
		 
		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Codigo:</p></td>
          <td class="TDD" width="80%" ><p CLASS="P1"><INPUT NAME="wCLA" <%= wDisabled %> size=15 value="<%=wCLA001%>" maxlength="20"></P></td>
         </tr>

		 <tr>
          <td class="TDS" width="20%" ><p CLASS="P1" align="left">Descripción:</td>
          <td class="TDD" width="80%" ><INPUT NAME="wDES" size=50 value="<%=wDEL%>" maxlength="50"></td>
         </tr>

		 
		 <tr>
          <td class="TDS" width="20%" height="25"><p CLASS="P1" align="left">Actualizado 
		  el:</td>
          <td class="TDD" width="80%" ><b><%=wFAC%></b></td>
         </tr>

		 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center" >
		  <!--#include file="X001Y005.PRC"-->  </td>
         </tr>

	</table>
	</td>	
	</TR>	
	</table>
</FORM>

		</td>	
	</TR>	
	</table>


</BODY>
</HTML>
