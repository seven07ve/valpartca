this.Header=function Header()
{
    this.Image('images/logo.jpg',8,5,55);
    //this.Image('images/barras.jpg',13,30,188); 
    this.Image('images/engra.jpg',30,80,140);      
    this.SetFont('Arial','B',10);
    this.Ln(4)
    this.Cell(60);   
    this.SetFont('Arial','B',8);
    this.Cell(100,3,'AV. ALFREDO BRICEÑO LOCAL NRO 31 NRO PB',0,'C',0);
    this.Ln()
    this.Cell(63);
    this.SetFont('Arial','B',8);
    this.Cell(100,3,'ZONA INDUSTRIAL, LOS CUROS GALPONCA,',0,'C',0); 
    this.Ln()
    this.Cell(80); 
    this.SetFont('Arial','B',8);
    this.Cell(100,3,'MERIDA EDO MERIDA',0,'C',0);
    this.Ln()
    this.Cell(60);  
    this.SetFont('Arial','B',8);  
    this.Cell(100,3,'TELEFONOS (0274) 271.30.59 - 271.43.01 - (0416) 676.49.24',0,'C',0);   
    this.Ln()
    
    this.SetY(23);
    this.SetX(110);
    this.Cell(60); 
    this.SetTextColor(1,89,139); 
    this.SetFont('Arial','B',9);  
    this.Cell(100,3,'www.valpartca.com',0,'C',0);  

    this.SetY(28);
    this.SetX(95);
    this.Cell(60); 
    this.SetTextColor(0,0,0); 
    this.SetFont('Arial','B',9);  
    this.Cell(100,3,'corporacionvalparts@gmail.com',0,'C',0);  
}
this.Footer=function Footer()
{

    this.SetY(-100);
    this.SetX(10);
    this.SetFont('Arial','B',22);
    this.SetTextColor(255,0,0);
    this.Cell(0,10,'COPIA ELECTRÓNICA',0,1,'C');	
    this.SetFont('Arial','B',18);
    this.Cell(0,10,'SIN DERECHO A CREDITO FISCAL',0,0,'C');
	
    this.SetTextColor(0,0,0);
    this.SetY(-55);
    this.SetFont('Arial','B',10);

}