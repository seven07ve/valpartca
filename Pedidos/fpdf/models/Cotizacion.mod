this.Header=function Header()
{

    this.Image(wURI,4,4,50);
    this.SetFont('Arial','B',10);
    this.SetY(5);
	this.Cell(50);
    this.Cell(80,3,wEMP,0,0,'C',0);
    this.SetFont('Arial','',7);

    this.Ln(4);  
    this.Cell(50);
 	this.Cell(80,3,'Nit: '+wRIF,0,0,'C',0);

	this.Ln(3);  
    this.Cell(50);
 	this.Cell(80,3,wDIL,0,0,'C',0);

	this.Ln(3);  
    this.Cell(50);
 	this.Cell(80,3,wPAI+', '+wCIU,0,0,'C',0);
 	
 	this.Ln(3);  
    this.Cell(50);
 	this.Cell(80,3,'Tel: '+wTEL+' - Fax: '+wFAX,0,0,'C',0);
	
	this.Ln(3);  
    this.Cell(50);
 	this.Cell(80,3,wWEB,0,0,'C',0);

	this.Ln(3);  
    //this.Cell(50);
 	//this.Cell(80,3,'Oficina de Ventas: '+wOFI+' - '+wTEO,0,0,'C',0);

    this.SetFont('Arial','B',12);
    this.SetY(5);
	this.Cell(130);
    this.MultiCell(60,5,wTFA,0,'R',false);
    this.SetFont('Arial','',7);
	this.Ln(3);  
	
	this.Ln(3);  
    this.Cell(140);
 	this.Cell(50,3,'Fecha / Date: '+wFEC,0,0,'R',0);

	this.Ln(4);  
    this.Cell(143);
 	this.Cell(50,3,'Página / Page '+ this.PageNo()+ ' de / of {nb}',0,0,'R',0);
 	
 	this.Ln(3);  
 	
 	this.Rect(6, 29, 100, 22); 
 	this.Rect(106, 29, 98, 22);  	
 	
 	this.SetFont('Arial','B',8);
 	this.SetFillColor(255,255,255);
 	this.Ln(5);  
 	this.Cell(20,3,'Señores',0,0,'L',1);

    this.Cell(70);
 	//this.Cell(35,3,'Enviado A / Ship to',0,0,'L',1);
 	

 	this.Ln(4);  
 	this.SetFont('Arial','',7);
 	this.Cell(23,3,'Cliente: ',0,0,'L',0);
 	this.SetFont('Arial','B',7);
 	this.Cell(72,3,wCCL+'-'+wRSO,0,0,'L',0); 	
	
	this.Cell(4)
 	this.SetFont('Arial','',7);
 	this.Cell(23,3,'Valido desde: ',0,0,'L',0);
 	this.SetFont('Arial','B',7);
 	this.Cell(72,3,wFEC,0,0,'L',0); 	

 	
 	this.Ln(4);  
 	this.SetFont('Arial','',7);
 	this.Cell(23,3,'NIT / C.C / ID: ',0,0,'L',0);
 	this.SetFont('Arial','B',7);
 	this.Cell(72,3,wRCL,0,0,'L',0); 	
 	
 	this.Cell(4)
 	this.SetFont('Arial','',7);
 	this.Cell(23,3,'Forma de Pago: ',0,0,'L',0);
 	this.SetFont('Arial','B',7);
 	this.Cell(72,3,wFPA,0,0,'L',0); 	
 	
 	this.Ln(4);  
 	this.SetFont('Arial','',7);
 	this.Cell(23,3,'Dirección / Address: ',0,0,'L',0);
 	this.SetFont('Arial','B',7);
 	this.Cell(72,3,wDCL,0,0,'L',0); 	
 	
 	this.Cell(4)
	this.SetFont('Arial','',7);
 	this.Cell(23,3,'',0,0,'L',0);
 	this.SetFont('Arial','B',7);
 	this.Cell(72,3,"",0,0,'L',0); 	
 	
 	this.Ln(4);  
 	this.SetFont('Arial','',7);
 	this.Cell(23,3,'Teléfono / Phone: ',0,0,'L',0);
 	this.SetFont('Arial','B',7);
 	this.Cell(72,3,wTCL,0,0,'L',0); 	
 	
 	this.Cell(4)
 	this.SetFont('Arial','',7);
 	this.Cell(23,3,'',0,0,'L',0);
 	this.SetFont('Arial','B',7);
 	this.Cell(72,3,"",0,0,'L',0); 	
 	
 	this.Ln(4);  
 	this.SetFont('Arial','',7);
 	this.Cell(23,3,'E-mail: ',0,0,'L',0);
 	this.SetFont('Arial','B',7);
 	this.Cell(72,3,wECL,0,0,'L',0); 	
 	
 	this.Cell(4)
 	this.SetFont('Arial','',7);
 	this.Cell(23,3,'',0,0,'L',0);
 	this.SetFont('Arial','B',7);
 	this.Cell(72,3,"",0,0,'L',0); 	
 	
 	////////////////////////////////////////////////////////////////////
 	this.Ln(5);  
 	this.SetX(6);
 	this.SetFont('Arial','B',7);
 	//this.Cell(43,5,'N° Pedido Cliente \n Customer Order N°',1,2,'C',0);
 	/*this.MultiCell(40,3,'N° Pedido Cliente\n Customer Order N°',1,'C',true);
 	this.SetY(52);
 	this.SetX(45);
 	this.MultiCell(48,3,'Vendedor\n Salesman',1,'C',true);
 	this.SetY(52);
 	this.SetX(92);
 	this.MultiCell(28,3,'Condiciones de pago\n Payment Conditions',1,'C',true);
 	this.SetY(52);
 	this.SetX(120);
 	this.MultiCell(27,3,'Moneda Negociación\n Currency',1,'C',true);
 	this.SetY(52);
 	this.SetX(147);
 	this.MultiCell(38,3,'Incoterms\n ',1,'C',true);
 	this.SetY(52);
 	this.SetX(185);
 	this.MultiCell(19,3,'Fecha de\n Vencimiento',1,'C',true);
 	
 	this.SetFont('Arial','',7);
 	this.SetX(6);
 	this.Cell(39,5,wOCO,1,0,'C',0);
 	this.Cell(47,5,wVEN,1,0,'C',0);
	this.Cell(28,5,wCPA,1,0,'C',0);
	this.Cell(27,5,wMND,1,0,'C',0);
	this.Cell(38,5,wTER,1,0,'C',0);
	this.Cell(19,5,wFVE,1,0,'C',0);
	*/	
	/////////////////////////////////////////////////////////////////////
 	

}
this.Footer=function Footer()
{
	
	this.SetY(234);
	this.SetX(6);
	this.SetFont('Arial','B',7);
	this.Cell(198,5,'VALOR EN LETRA: ',1,0,'L');
	this.SetFont('Arial','',7);
	this.SetX(30);
	this.Cell(100,5,CONVERTIR(wTOT2),0,0,'L');

	
	this.SetY(205);
	
	/////////////////////Observaciones///////////////////////////////////////
	this.Rect(6, 204, 100, 30); 
	this.SetX(6); 
	this.SetFont('Arial','B',7);
	this.Cell(40,5,'Comentarios',0,0,'L');

	this.SetY(210);
	this.SetX(6); 
	this.SetFont('Arial','',5);
	this.MultiCell(99,2,wCPE,0,'J',false);
	//////////////////////////////////////////////////////////////////

	
	
 	this.Rect(106, 204, 98, 30);  	


	/////////////////////Condiciones de Pago//////////////////////////
	this.SetY(204);
	this.SetX(106);
	this.SetFont('Arial','B',7);
	//this.MultiCell(48,3,'Condiciones de Pago /Payment conditions \n (fechas y valores) / (amount, date)',1,'C',false);
	this.Cell(48,7,'Subtotal',1,0,'R');
	this.Cell(50,7,wBBR,1,1,'R');
	this.SetX(106);
	this.Cell(48,7,'Descuentos',1,0,'R');
	this.Cell(50,7,wBDP,1,1,'R');
	this.SetX(106);
	this.Cell(48,8,'Subtotal antes IVA',1,0,'R');
	this.Cell(50,8,wMNE,1,1,'R');
	this.SetX(106);
	this.Cell(48,8,'TOTAL',1,0,'R');
	this.Cell(50,8,wTOT,1,1,'R');

	this.SetY(199);
	this.SetX(110); 
	this.SetFont('Arial','',5);
	this.MultiCell(80,2,wCON,0,'L',false);
	//////////////////////////////////////////////////////////////////


	
	
	
	

	//////////////////////Firma - Nombre - Firma//////////////////////
	this.Rect(6, 240, 198, 40); 
	this.SetY(253);
 	this.SetX(6);
	//this.SetFont('Arial','B',7);
	//this.Cell(40,5,'Firma Autorizada',0,0,'L');

	this.SetY(264);
 	this.SetX(6);
	this.SetFont('Arial','',7);
	this.Rect(14, 264, 42, 0); 
	this.Cell(60,10,'Firma del Asesor',0,0,'C');
	this.Ln(3)
	this.Cell(50,15,wNUS,0,0,'C');
	
	
 	/*this.Rect(66, 250, 65, 20);
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
	this.Rect(92, 268, 36, 0); */

	
	/*this.Rect(131, 250, 73, 20);
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
	this.Cell(60,2,'Firma y Sello',0,0,'C');*/

	
	///////////////////////////////////////////////
	
	
	/*this.SetY(270);
	this.SetX(5);
	this.SetFont('Arial','B',9);
	this.SetTextColor(255,0,0);
	this.Cell(198,5,'COPIA ELECTRÓNICA - SIN DERECHO A CREDITO FISCAL',0,0,'C');*/

	
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
