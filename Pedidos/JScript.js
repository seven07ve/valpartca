// JScript File

function Validar(id){
 
 var valor = id.value;
 
    if( Vacio(valor) == false ) {  
        alert("Introduzca un Valor Numerico.");
        id.focus();  
        return false  
    } else {  
        ValidarNumero(id);
        MayoraCero(id) 
    }
}

function Validar2(id){
 
 var valor = id.value;
 
    if( Vacio(valor) == false ) {  
        //alert("Introduzca un Valor Numerico.");
        id.value=0;
        id.focus();  
        return false  
    } else {  
        ValidarNumero(id);
    }
}

function Vacio(q) {  

    for ( i = 0; i < q.length; i++ ) {  
        if ( q.charAt(i) != " " ) {  
            return true  
         }  
    }  
    return false  
}

function ValidarNumero(id){
    
    var num = id.value 
    num = num.replace(",",".");
    if (isNaN(num) == true) {
        alert("Debe Ingresar un Valor Numerico");
        id.focus();
        return false
    }else{
        MayoraCero(id)
    }
}   

function MayoraCero(id){
    
    var num = id.value 
    num = num.replace(",",".");

    if (num < 0) {
        alert("Debe Ingresar un Valor Mayor que o Igual a 0");
        id.focus();
        return false
    }else{
        return true
    }
}

function Sumar(id){
    
    var num = id.value 
    num = num.replace(",",".");
 
     if (isNaN(num) == false){
        id.value = ++id.value;
     }else{
        id.value = 1
    }
    id.focus()
    return false
    
}

function Restar(id){
    
    if (id.value > 0){
        id.value = id.value - 1;
    }else{
        id.value = 0
    }    
    id.focus()        
    return false

}

function Inicio_X001Z100D(){

	var res = ((screen.height/2))+100
	
	//document.frmGral.C0001.focus()
	//alert()
	if (vIE()<='6'){
		document.getElementById('Facturas').style.height = screen.height-370;
	}else{
		document.getElementById('Facturas').style.height = screen.height-res;  
	}
}

function Inicio_X001X304(){

	var res = ((screen.height/2)) 

	//alert()
	if (vIE()<='6'){
		document.getElementById('Facturas').style.height = screen.height-370;
	}else{
		document.getElementById('Facturas').style.height = screen.height-res;  
	}
}


function vIE(){

    return (navigator.appName=='Microsoft Internet Explorer')?parseFloat((new RegExp("MSIE ([0-9]{1,}[.0-9]{0,})")).exec(navigator.userAgent)[1]):-1;
        
}


function fRight(str, n)
{
    if (n <= 0)
       return "";
    else if (n > String(str).length)
       return str;
    else {
       var iLen = String(str).length;
       return String(str).substring(iLen, iLen - n);
    }
}

function fLeft(str, n)
{
	if (n <= 0)
	    return "";
	else if (n > String(str).length)
	    return str;
	else
	    return String(str).substring(0,n);
}

