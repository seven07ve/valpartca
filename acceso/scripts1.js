// JavaScript Document

//funcion para establecer la longitud de una cadena, informar de los caracteres restantes y avisar cuando se ha llegado al limite
 function longitud(cadena, maximo)   
 {
	 var maximo;
	 if (document.form1.titulo.value.length == maximo)
	 {
		document.form1.resta.value = 0;
		document.getElementById('not-tit-long').style.display ='inline';
		document.getElementById('not-tit-long').style.visibility='visible';
	 }
	 else
	 {
		document.form1.titulo.style.backgroundColor='none';
		document.form1.resta.value = maximo - document.form1.titulo.value.length;
		document.form1.resta.type = "visible";
		document.getElementById('not-tit-restantes').style.display='inline';		
		document.getElementById('not-tit-restantes').style.visibility='visible';
		document.getElementById('not-tit-long').style.visibility='hidden';	

		if (document.form1.titulo.value.length > 0)
		{
			document.form1.publicar.disabled=false;
//			document.getElementById('aviso').style.visibility='hidden'			
			document.getElementById('aviso').style.display='none'			
		}
	 }
 }
 
 //funcion para determinar si el campo esta vacio
 function vacio(contenido)
 {
	 var nombre;
//	 document.form1.titulo.value  = contenido.length;
	 if (contenido.length == 0){
		document.getElementById('aviso').style.display='inline';
		document.getElementById('aviso').style.visibility='visible';		 
		document.form1.publicar.disabled=true;
		document.form1.titulo.style.backgroundColor='#E41316';
	 }
	 else{
		 document.getElementById('aviso').style.display='none';
		 document.form1.publicar.disabled=false;
	 }
 }
//chequear valores para dia mes y ano
function checkfecha(fecha,idfecha){
	if (idfecha == 'dia'){
		if (isNaN(fecha) || fecha > 31 || fecha == 0){
			//entonces (no es numero) devuelvo el valor cadena vacia
			document.form1.dia.value = '';
			document.form1.dia.style.backgroundColor='#f66';
		}
		else{
			//En caso contrario (Si era un número) devuelvo el valor
			if (fecha < 10){
				if (fecha.length == 1){
					document.form1.dia.value = '0' + fecha;
					document.form1.dia.style.backgroundColor='#fff';					
				}
				else{
					document.form1.dia.value = fecha;
					document.form1.dia.style.backgroundColor='#fff';					
				}
			}
			else{
				document.form1.dia.style.backgroundColor='#fff';
			}
		}
	}
	if (idfecha == 'mes'){
		if (isNaN(fecha) || fecha > 31 || fecha == 0){
			//entonces (no es numero) devuelvo el valor cadena vacia
			document.form1.mes.value = '';
			document.form1.mes.style.backgroundColor='#f66';
		}
		else{
			//En caso contrario (Si era un número) devuelvo el valor
			if (fecha < 10){
				if (fecha.length == 1){
					document.form1.mes.value = '0' + fecha;
					document.form1.mes.style.backgroundColor='#fff';					
				}
				else{
					document.form1.mes.value = fecha;
					document.form1.mes.style.backgroundColor='#fff';					
				}
			}
			else{
				document.form1.mes.style.backgroundColor='#fff';
			}
		}
	}
	if (idfecha == 'ano'){
		if (isNaN(fecha) || fecha == 0 || fecha.length == 3){
			//entonces (no es numero) devuelvo el valor cadena vacia
			document.form1.ano.value = '';
			document.form1.ano.style.backgroundColor='#f66';
		}
		else{
			//En caso contrario (Si era un número) devuelvo el valor
			if (fecha.length == 1){
				document.form1.ano.value = '200' + fecha;
				document.form1.ano.style.backgroundColor='#fff';					
			}
			else if (fecha.length == 2){
				document.form1.ano.value = '20' + fecha;
				document.form1.ano.style.backgroundColor='#fff';					
			}
			else{
				document.form1.ano.value = fecha;
				document.form1.ano.style.backgroundColor='#fff';					
			}
		}
	}
}

//direccion de imagen montada
 function imgdir(dir,id)
 {
	 if (id == 'img1')
	 {
		 document.form1.img1_inf.value = '..\\imagenes\\' + dir;
		 document.form1.img1_inf.type = 'visible'
	 }
	 if (id == 'img2')
	 {
		 document.form1.img2_inf.value = dir;
		 document.form1.img2_inf.type = 'visible'
	 }	 
 }