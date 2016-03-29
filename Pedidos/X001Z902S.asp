<%

wBUSCAR = TRIM(Request.Form("BUSCAR"))

if len(trim(wBUSCAR)) > 0 then
	Session("glBusqueda") = wBUSCAR
   else	
    Session("glBusqueda") = ""
end if

wURL = Session("glUrlBuscarDetalle")

'response.Write "URL:" & wURL
Response.Redirect wURL

%>