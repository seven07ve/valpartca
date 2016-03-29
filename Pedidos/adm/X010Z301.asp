<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 6.0">
<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.3)">
<link rel=stylesheet type="text/css" href="../X001Z900.CSS">

<!--#include file="X010Y004.PRC"-->


<SCRIPT LANGUAGE="VBScript">
<!--
	Sub cmdSubmit_onClick()

		document.frmgral.submit	
	
	end sub

	-->
 </SCRIPT>

</HEAD>

<%

	'Preparar Etiqueta Body del Formulario
	wCLA001 = trim(Request.QueryString("CODCOR"))
	wURLW = Request.ServerVariables("URL")
	wBody = "<body  topmargin=0 onload=" & chr(34) & "Inicio '" & wCLA001 & "', '" & wURLW & "'" & chr(34) & ">"
	Response.Write wBody
	'Fin Preparar Etiqueta Body del Formulario



	wTIT = "Noticia" 
	wCCI = Session("glCiaInternet") 
	wCIA = Session("glCia") 

		
	wZ300050TNL =""
	wZ300050DNC =""
	wZ300050DNL =""
	wZ300050FOP =""
	wZ300050FOG =""
	wDisabled = "DISABLED"
	wProceso = "Agregar"
	
	
    IF len(wCLA001) > 0 then	 
		
		wProceso = "Actualizar"
		
		wDisabled = "DISABLED"
    
		strCnn	= Application("XDTA300_ConnectionString")
	
		SQL = "SELECT * FROM X300ZF050 " 
		SQL = SQL & " WHERE "				
		SQL = SQL & " Z300050CDN ='" &  wCLA001 & "'" 	

		Set rstQuery = Server.CreateObject("ADODB.Recordset")
		rstQuery.Open sql , strCnn
		if NOT rstQuery.EOF then
			wZ300050TNL = trim(rstQuery.Fields("Z300050TIL"))
			wZ300050DNC = trim(rstQuery.Fields("Z300050DNC"))
			wZ300050DNL = trim(rstQuery.Fields("Z300050DNL"))
			wZ300050FOP = trim(rstQuery.Fields("Z300050FOP"))
			wZ300050FOG = trim(rstQuery.Fields("Z300050FOG"))
			wZ300050STS = trim(rstQuery.Fields("Z300050STS"))						
		end if
		rstQuery.CLOSE
		SET rstQuery = NOTHING	

		wSELUNO = "" : wSELDOS = ""
		IF wZ300050STS = "1" THEN
			wSELUNO = "selected"
		   ELSE
		    wSELDOS = "selected"
		END IF   		
		
		else
		  
		  wSELUNO = "" : wSELDOS = ""		  
		  wSELUNO = "selected"  		 		  
		  wANO = Year(Date)
		  wMES = Month(Date)  
		  If Len(trim(wMES)) = "1" Then			
			wMES = "0" & wMES
		  End If 
		  
		  wDIA = Day(Date)
		  If Len(trim(wDIA)) = "1" Then			
			wDIA = "0" & wDIA
		  End If 	  
		  
		  wHOR = Hour(Now) 
		  If Len(trim(wHOR)) = "1" Then			
			wHOR = "0" & wHOR
		  End If 	  
		  
		  wMIN = Minute(Now) 
		  If Len(trim(wMIN)) = "1" Then			
			wMIN = "0" & wMIN
		  End If 	  
		  
		  wCLA001 = wANO & wMES & wDIA & wHOR & wMIN
		  

    end if
	
	wTIT = wProceso & " " & wTIT   

	wURL = "X010Z301S.ASP?CODACT=A&CLA001=" & wCLA001
	'Response.Write wURL
	


	%>

	<body topmargin="50" bottommargin="0">

	<FORM NAME="frmGral" METHOD="post" ACTION="<%=wURL %>" >

    <div align="center">

    <table BORDER="1" WIDTH="700" cellspacing="0" cellpadding="0"  bordercolor="#0066CC" bgcolor="#FE9900" style="border-style: inset; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
	  <TR>
	  <td>
	  <table BORDER="0" WIDTH="100%" >
		 <TR>
		 <td CLASS="TDT" colspan=2><%= wTIT %></td>		  
		 </TR>	
		 
		 <tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Código:</p></td>
          <td class="TDD" width="70%" ><p CLASS="P1"><INPUT NAME="wCLA" <%= wDisabled %> size=15 value="<%=wCLA001%>"></P></td>
         </tr>

		 <tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Titulo:</p></td>
          <td class="TDD" width="70%" ><INPUT NAME="wDES" size=90 value="<%=wZ300050TNL%>" maxlength="400"></td>
         </tr>

		 <tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Descripción:</p></td>
          <td class="TDD" width="70%" >
          <textarea cols="70" rows="14" name="Z300050DNL"><%=wZ300050DNL%></textarea> 
          <!--<INPUT NAME="Z300050DNL" size=78 value="<%=wZ300050DNL%>" maxlength=5000 type="text" ></td>-->
         </tr>

		 <!--<tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Foto Pequeña:</p></td>
          <td class="TDD" width="70%" ><INPUT NAME="Z300050FOP" size=15 value="<%=wZ300050FOP%>" maxlength=50></td>
         </tr>-->

		 <tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Foto:</p></td>
          <td class="TDD" width="70%" ><INPUT NAME="Z300050FOG" size=40 value="<%=wZ300050FOG%>" maxlength=50></td>
         </tr>
		  

		 <tr>
          <td class="TDS" width="30%" ><p CLASS="P1" align="left">Estatus:</p></td>
          <td class="TDD" width="70%" >
				<select size="1" name="Z300050STS">
				<option value="1" <%=wSELUNO%>>Activa</option>
				<option value="0" <%=wSELDOS%>>Inactiva</option>
          </td>
         </tr>
		 

		 <tr>
          <td CLASS="TDT" width="100%" colspan=2 align="center">
         
          <!--#include file="X010Y005.PRC"-->          
          </td>
         </tr>

	</table>
	</td>	
	</TR>	
	</table>
	</div>
</FORM>

</BODY>
</HTML>
