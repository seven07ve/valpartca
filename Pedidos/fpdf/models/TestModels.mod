this.Header=function Header()
{

    this.Image('lambdaWeb.jpg',10,8,33);
    this.SetFont('Arial','B',15);
    this.Cell(80);
    this.Cell(30,10,'Title',1,0,'C');
    this.Ln(20);
}
this.Footer=function Footer()
{
    this.SetY(-15);
    this.SetFont('Arial','I',8);
    this.Cell(0,10,'Page '+ this.PageNo()+ '/{nb}',0,0,'C');
}