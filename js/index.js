$(document).ready(function() {
	LoadContentAjax(main_source, main_destination); // Main	
});

function LoadContentAjax(source, destination) {
	console.log('Cargando contenido: ' + source);
	
	$.ajax({
		url: source,
		dataType: 'html',
		type: 'GET',
		beforeSend: function( xhr ) { xhr.overrideMimeType( "text/plain; charset=UTF-8" ); },
		success: function(data) {
			$(destination).html(data);
		}
	});
};