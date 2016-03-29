<SCRIPT LANGUAGE="JavaScript">

function Inicio(wCL1, wURL){

	if (wCL1 == ""){
		document.frmGral.wCLA.focus()
	  }else{
	    document.frmGral.wDES.focus()
	}	

	window.status = wURL

}


function cmdEliminar_onclick(){

	if (confirm("¿Esta Seguro de Eliminar este Registro?")){ 
		document.frmGral.PROCESO.value = "Eliminar";
		document.frmGral.submit()
	}	
	
}



</SCRIPT>
