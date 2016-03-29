addMensaje = function(mensaje, clase)
{
	if (clase === undefined) clase = 'error';

	var div = $('#'+this.id);
	if (!fcexist('#'+this.id+' div.'+clase))
	{
		$(div).append('<div class="'+clase+' uno"></div>');
		$(div).children('div.'+clase).append('<ul></ul>');
	} else {
		if ($('#'+this.id+' div.'+clase+' ul li').length == 1)
		{
			$('#'+this.id+' div.'+clase).removeClass('uno');
			$('#'+this.id+' div.'+clase).addClass('dos');
		}
	}

	div = $('#'+this.id+' div.'+clase+' ul');
	$(div).append('<li>'+mensaje+'</li>');
}
reset = function()
{
	var div = $('#'+this.id);
	$(div).empty();
}

Mensaje = function(id_mensaje)	// class
{
	if(fcexist("#"+id_mensaje))
	{
		this.id = id_mensaje;
		this.addMensaje = addMensaje;
		this.reset = reset;
	} else {
		alert("Mensaje('"+id_mensaje+"') no encontrado.");
	}
}

function fcexist (id_o_class_jquery)
{
	if( $(id_o_class_jquery).length > 0 )
		return true;
	else 
		return false;
}