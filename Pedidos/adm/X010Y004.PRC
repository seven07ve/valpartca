<SCRIPT LANGUAGE="VBScript">
Function Inicio(wCL1, wURL)

	if wCL1 = "" then
		document.frmGral.wDES.focus()
	  else
	    document.frmGral.wDES.focus()
	end if  	

	window.status = wURL

End Function

'Validar Eliminar
Sub cmdEliminar_onClick()

	Dim wSN
	wSN = MsgBox ("¿Seguro de Eliminar este Registro?", vbYesNo) 
        
	If wSN = 6 then
		document.frmGral.PROCESO.VALUE = "Eliminar"
		document.frmgral.submit
	end if	
	
end sub



</SCRIPT>
