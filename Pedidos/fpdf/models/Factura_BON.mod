this.Header=function Header()
{

    this.Image(wURI,6,10,70);
    this.SetFont('Arial','B',10);
    this.SetY(5);
    
	/*this.Cell(50);
    this.Cell(80,3,wEMP,0,0,'C',0);*/
    this.SetFont('Arial','',7);

    this.SetY(27);
    this.SetX(3);
    this.Cell(50,3,'Nit: '+wRIF,0,0,'C',0);
	
	this.SetY(5);
	
	this.Ln(3);  
    this.Cell(110);
 	this.Cell(80,3,'Apartado Aéreo: Medellin - Colombia',0,0,'R',0);

	this.Ln(3);  
    this.Cell(110);
 	this.Cell(80,3,wDIL,0,0,'R',0);

	this.Ln(3);  
    this.Cell(110);
 	this.Cell(80,3,'Tel: '+wTEL+' - Fax: '+wFAX,0,0,'R',0);
	
	this.Ln(6);  
    this.Cell(110);
 	this.Cell(80,3,wCIU,0,0,'R',0);
	
	this.Ln(3);  
    this.Cell(110);
 	this.Cell(80,3,wWEB,0,0,'R',0);

	this.Ln(3);  
    this.Cell(110);
 	this.Cell(80,3,wEMA,0,0,'R',0);
	
	this.Ln(3);  
    this.Cell(110);
 	this.Cell(80,3,wOFI,0,0,'R',0);


    this.SetFont('Arial','B',12);
    this.SetY(35);
    this.SetX(5);
	this.MultiCell(100,5,wTFA,0,'L',false);
    this.SetFont('Arial','',7);

	this.SetY(35);
	
	this.Cell(160);
	this.Cell(8,3,'DIA',0,0,'C',0);
	this.Cell(8,3,'MES',0,0,'C',0);
	this.Cell(8,3,'AÑO',0,0,'C',0);


	this.Ln(3);  
    this.Cell(130);
 	this.Cell(30,3,'FECHA / DATE',0,0,'L',0);
	this.Cell(8,3,wDIA,0,0,'C',0);
	this.Cell(8,3,wMES,0,0,'C',0);
	this.Cell(8,3,wANO,0,0,'C',0);


	/*this.Ln(4);  
    	this.Cell(143);
 	this.Cell(50,3,'Página / Page '+ this.PageNo()+ ' de / of {nb}',0,0,'R',0);*/
 	
 	this.Rect(5, 34, 196, 0); 
 	//this.Rect(106, 29, 98, 22);  	
 	
 	this.SetFont('Arial','B',8);
 	this.SetFillColor(255,255,255);
 	this.Ln(5);  
 	this.Cell(30,3,'Facturado a: / Sold To',0,0,'L',1);

    this.Cell(70);
 	this.Cell(35,3,'Despachado a: / Shipped to',0,0,'L',1);
 	

 	this.Ln(4);  
 	this.SetFont('Arial','',7);
 	this.Cell(23,3,'Cod. ',0,0,'L',0);
 	this.SetFont('Arial','B',7);
 	this.Cell(72,3,wCCL,0,0,'L',0); 
 	
	
	
	this.Cell(4)
 	this.SetFont('Arial','',7);
 	this.Cell(23,3,wNDE,0,0,'L',0);
 	this.SetFont('Arial','B',7);
 	//this.Cell(72,3,wNDE,0,0,'L',0); 	

 	
 	this.Ln(4);  
 	this.SetFont('Arial','',7);
 	this.Cell(23,3,'Nit: ',0,0,'L',0);
 	this.SetFont('Arial','B',7);
 	this.Cell(72,3,wRCL,0,0,'L',0); 	
 	
 	this.Ln(4);  
 	this.SetFont('Arial','',7);
 	this.Cell(23,3,wRSO,0,0,'L',0);	
 	
 	this.Cell(4)
 	this.SetFont('Arial','',7);
 	this.Cell(23,3,' ',0,0,'L',0);
 	this.SetFont('Arial','B',7);
 	this.Cell(72,3,' ',0,0,'L',0); 	
 	
 	this.Ln(4);  
 	this.SetFont('Arial','',7);
 	this.Cell(23,3,wDCL,0,0,'L',0);
 	this.SetFont('Arial','B',7);
 	this.Cell(72,3,' ',0,0,'L',0); 	
 	
 	this.Cell(4)
	this.SetFont('Arial','',7);
 	this.Cell(23,3,wDDE,0,0,'L',0);
 	this.SetFont('Arial','B',7);
 	this.Cell(72,3,' ',0,0,'L',0); 	
 	
 	this.Ln(4);  
 	this.SetFont('Arial','',7);
 	this.Cell(23,3,wTCL,0,0,'L',0);
 	this.SetFont('Arial','B',7);
 	this.Cell(72,3,wECL,0,0,'L',0); 	
 	
 	this.Cell(4)
 	this.SetFont('Arial','',7);
 	this.Cell(23,3,wTDE,0,0,'L',0);
 	this.SetFont('Arial','B',7);
 	this.Cell(72,3,wEDE,0,0,'L',0); 	
 	
 	/*	this.Ln(4);  
 	this.SetFont('Arial','',7);
 	this.Cell(23,3,'E-mail: ',0,0,'L',0);
 	this.SetFont('Arial','B',7);
 	this.Cell(72,3,wECL,0,0,'L',0); 	
 	
 	this.Cell(4)
 	this.SetFont('Arial','',7);
 	this.Cell(23,3,'E-mail: ',0,0,'L',0);
 	this.SetFont('Arial','B',7);
 	this.Cell(72,3,wEDE,0,0,'L',0); 	*/
 	
 	////////////////////////////////////////////////////////////////////
 	this.Ln(5);  
 	this.SetY(72);
 	this.SetX(6);
 	this.SetFont('Arial','B',7);
 	this.Cell(60,5,'Términos de Pago / Terms of Payment:',1,0,'C',0);
 	this.Cell(68,5,'Términos de Entrega / Terms of Delivery:',1,0,'C',0);
 	this.Cell(38,5,'Marcas / Shipping Marks:',1,0,'C',0);
 	this.Cell(32,5,'Puerto / Port:',1,0,'C',0);
 	
 	this.Ln(5);
 	this.SetFont('Arial','',7);
 	this.SetX(6);
 	this.Cell(60,5,wCON,1,0,'C',0);
 	this.Cell(68,5,wTER,1,0,'C',0);
	this.Cell(38,5,wCPA,1,0,'C',0);
	this.Cell(32,5,' ',1,0,'C',0);
		
	/////////////////////////////////////////////////////////////////////
 	

}
this.Footer=function Footer()
{
	/*
	this.SetY(175);
	this.SetX(6);
	this.SetFont('Arial','B',7);
	this.Cell(198,5,'VALOR EN LETRA: ',1,0,'L');
	this.SetFont('Arial','',7);
	this.SetX(30);
	this.Cell(100,5,CONVERTIR(wMSU),0,0,'L');

	
	this.SetY(181);
	
	/////////////////////Observaciones///////////////////////////////////////
	this.Rect(6, 181, 100, 30); 
	this.SetX(6); 
	this.SetFont('Arial','B',7);
	this.Cell(40,5,'Observaciones / Comments',0,0,'L');

	this.SetY(187);
	this.SetX(6); 
	this.SetFont('Arial','',5);
	this.MultiCell(99,2,wOBS,0,'J',false);
	//////////////////////////////////////////////////////////////////

	
	
 	this.Rect(106, 181, 98, 30);  	
 	/////////////////////Peso-Unidades////////////////////////////////
	this.SetY(181);
	this.SetX(106);
	this.SetFont('Arial','B',7);
	this.MultiCell(33,3,'Peso Neto \n Net Weight',1,'C',false);
		
	this.SetY(181);
	this.SetX(139);
	this.MultiCell(33,3,'Peso Bruto \n Gross Weight',1,'C',false);

	this.SetY(181);
	this.SetX(172);
	this.MultiCell(32,3,'Total Unidades \n Units Total',1,'C',false);
	
	this.SetFont('Arial','',6);
	this.Cell(96)
	this.Cell(33,5,wPNT+' KG',1,0,'C');
	this.Cell(33,5,wPBR+' KG',1,0,'C');
	this.Cell(32,5,wTC03,1,0,'C');

	//////////////////////////////////////////////////////////////////


	/////////////////////Condiciones de Pago//////////////////////////
	this.SetY(192);
	this.SetX(106);
	this.SetFont('Arial','B',7);
	this.MultiCell(98,3,'Condiciones de Pago /Payment conditions \n (fechas y valores) / (amount, date)',1,'C',false);
	this.SetY(199);
	this.SetX(110); 
	this.SetFont('Arial','',5);
	this.MultiCell(80,2,wCON,0,'L',false);
	//////////////////////////////////////////////////////////////////


	/////////////////////Somos///////////////////////////////////////
	this.SetY(212);
 	this.SetX(100); 
	this.SetFont('Arial','B',7);
	this.Cell(40,5,'Somos',0,0,'L');

	this.SetY(212); 	
 	this.SetX(6);
	this.SetFont('Arial','',6);
	this.Cell(198,10,wSOM,1,0,'L');
	//////////////////////////////////////////////////////////////////
	
	
	
	//////////////////////Importante - Important//////////////////////
	this.Rect(6, 223, 99, 26); 
	this.SetY(223);
 	this.SetX(6); 
	this.SetFont('Arial','B',7);
	this.Cell(40,5,'Importante',0,1,'L');
	//this.Ln();
	this.SetY(227);
	this.SetX(6); 
	this.SetFont('Arial','',5);
	this.MultiCell(99,2,wIMPE,0,'J',false);

	
 	this.Rect(105, 223, 99, 26);  	
 	this.SetY(223);
 	this.SetX(105); 
	this.SetFont('Arial','B',7);
	this.Cell(40,5,'Important',0,1,'L');
	this.SetY(227);
	this.SetX(105); 
	this.SetFont('Arial','',5);
	this.MultiCell(99,2,wIMPI,0,'J',false);
	
	//////////////////////////////////////////////////////////////////



	//////////////////////Firma - Nombre - Firma//////////////////////
	this.Rect(6, 250, 60, 20); 
	this.SetY(253);
 	this.SetX(6);
	this.SetFont('Arial','B',7);
	this.Cell(40,5,'Firma Autorizada',0,0,'L');

	this.SetY(264);
 	this.SetX(6);
	this.SetFont('Arial','',7);
	this.Rect(14, 264, 42, 0); 
	this.Cell(60,5,wEMP,0,0,'C');
	
 	this.Rect(66, 250, 65, 20);
	this.SetY(253);
 	this.SetX(68);
	this.SetFont('Arial','B',7);
	this.Cell(40,5,'Nombre:',0,0,'L');
	this.Rect(80, 256, 48, 0); 
	this.Ln();
 	this.SetX(68);
	this.Cell(37,5,'CC No.:',0,0,'L');
	this.Rect(80, 261, 25, 0); 
	this.Rect(110, 261, 18, 0); 
	this.Cell(40,5,'de',0,0,'L');
	this.Ln(7);
 	this.SetX(68);
	this.Cell(40,5,'Fecha de Recibido:',0,0,'L');
	this.Rect(92, 268, 36, 0); 


	this.Rect(131, 250, 73, 20);
	this.SetFont('Arial','',5);
	this.SetY(251);
 	this.SetX(135);
	this.Cell(65,3,'ACEPTO EL CONTENIDO DE LA PRESENTE FACTURA Y HAGO CONSTAR',0,0,'C');
	this.Ln();
	this.SetX(135);
	this.Cell(65,3,'EL RECIBO CONFORME DE LA MERCANCIA EN ELLA DESCRIMINADA.',0,0,'C');
	this.SetFont('Arial','',7);
	this.SetY(267);
 	this.SetX(140);
	this.Rect(148, 265, 42, 0); 
	this.Cell(60,2,'Firma y Sello',0,0,'C');

	
	///////////////////////////////////////////////
	
	*/
	this.SetY(270);
	this.SetX(5);
	this.SetFont('Arial','B',9);
	this.SetTextColor(255,0,0);
	this.Cell(198,5,'COPIA ELECTRÓNICA - SIN DERECHO A CREDITO FISCAL',0,0,'C');

	this.Ln(4);  
    this.Cell(143);
	this.SetFont('Arial','',9);
	this.SetTextColor(0,0,0);
 	this.Cell(50,3,'Página '+ this.PageNo()+ ' / {nb}',0,0,'R',0);

	
	//this.SetTextColor(0,0,0);
    //this.SetY(-55);
    //this.SetFont('Arial','B',7);
    //this.Cell(0,10,'NOTA:',0,0,'L');	

    
    //this.SetY(-50);
    //this.SetFont('Arial','',7);
    //this.Ln(2);	
    //this.MultiCell(0,3,'- SE CONSIDERA PAGADO CUANDO EL CLIENTE POSEA LA FACTURA Y EL RECIBO DE COBRO \n EN ORIGINALES. TODO CHEQUE DEVUELTO GENERA UNA NOTA DE DEBITO DE Bs.: \n',0,0,'J');	
    //this.MultiCell(0,3,'- Los bienes relacionados en este documento son nuevos y no presentan vicios o daños ocultos que impidan \n su normal y útil funcionamiento, de presentarse  vicios o daños ocultos propios del bien, no por la mala \n inatalación o manejo del mismo, se aplicará la garantia prevista para los bienes y nos obligamos al \n saneamiento de los vicios o defectos ocultos del bien.',0,0,'J');	
	//this.MultiCell(0,3,'- Todos los productos facturados cumplen lo establecido en la resolusión 629 o en la norma COVENIN',0,0,'J');	

    //this.SetY(-25);
    //this.SetFont('Arial','B',8);
    //this.Cell(0,10,'NO SE ACEPTAN RECLAMOS PASADOS 5 DIAS HABILES',0,0,'L');
    //this.Cell(0,10,'Page '+ this.PageNo()+ '/{nb}',0,0,'C');	
}

