
	// lang
	var lang = 'es';
	if ($('div#encabeza').hasClass('langen'))
		lang = 'en'

	//SABER SI UN ELEMENTO EXISTE
	var $frase = $('#frase');
	if($frase.size() > 0)
	{
		// **** PORTADA ****
		//var $frase = $('#frase');
		if ($frase.val() == '')
		{
			var escribe = 'Escribe algo que a tus amigos les pueda gustar...';
			if (lang == 'en')
				escribe = 'Write something that you enjoy your friends...';

			$frase
				.bind ('focus', function() {
					$(this)
						.val('')
						.css('color', '#000')
						.unbind('focus');
				})
				.css('color', '#888')
				.val(escribe)
				;
			$('#agregarfrase').bind ('submit', function() {
					if ($frase.val() == escribe)
					{
						return false;
					}
				});
		}
	}


	// Ver mas frases
	$('ul.frases').each( function (i) {
		var $ul = $(this);

		var vermas = 'ver m&aacute;s mensajes';
		if (lang == 'en')
			vermas = 'show more messages'

		var $a = $('<a href="#">'+vermas+'</a>')
				.bind('click', function() {
					// ** ver mas click
					var $ul = $($(this).parents('ul')[0]);

					if($ul.data('loading') == false)
					{
						$ul.data('loading', true);
						var $loader = $('<span>');
						$loader
							.data('ul', $ul)
							.load('/masfrases/', { pagina : ($ul.data('pagina') + 1), dias : $ul.attr('rel') }, function () {
								var $ul = $(this).data('ul');
								$ul
									.data('loading', false)
									.data('pagina', ($ul.data('pagina') + 1))
									;
								$ul.find('li:last').before($(this).html());
							})
							;
						
					} else {
						//alert('Espera, estamos cargando mas mensajes...');
					}
					return false;
				})
				;
		
		var $li = $('<li></li>')
				.attr('class', 'vermas')
				.append($a)
				;
		$ul
			.append($li)
			.data('loading', false)
			.data('pagina', 0)
			;
	});


	var $chata = $('#chata');
	if($chata.size() > 0)
	{
		var $chat = $('#chat');
		$chata.bind('click', function(){
			$chat.toggle();
		});
	}
