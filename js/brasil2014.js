var LOGIN_ROUTE 			= '../php/login.php';
var MAIN_ROUTE				= '../php/main.php';

var admin_source			= '../php/func/get_admin.php';
var admin_cartones_source	= '../php/func/get_admin_cartones.php';
var admin_results_source	= '../php/func/get_admin_results.php';
var admin_update_results	= '../php/func/post_admin_update_results.php';

var next_games_source		= '../php/func/get_next_games.php';

var ranking_source	 		= '../php/func/get_ranking.php';
var rondas_source	 		= '../php/func/get_rondas.php';
var apuestas_source 		= '../php/func/get_apuestas.php';
var cartones_source 		= '../php/func/get_cartones.php';
var fixture_source 			= '../php/func/get_fixture.php';
var grupos_source 			= '../php/func/get_grupos.php';
var resultados_source		= '../php/func/get_resultados.php';
var selecciones_source 		= '../php/func/get_selecciones.php';
var bases_source			= '../php/func/get_bases.php';

var get_carton_user			= '../php/func/get_carton_user.php';
var get_id_carton_user		= '../php/func/get_id_carton_user.php';
var carton_info_source		= '../php/func/get_carton_info.php';
var new_carton_source		= '../php/func/new_carton_user.php';
var update_carton_source	= '../php/func/update_carton_user.php';
var post_carton_source		= '../php/func/post_carton_user.php';
var update_cartones_pagados = '../php/func/update_cartones_pagados.php';

var admin_destination		= '#divAdmin';
var admin_cartones_dest		= '#AdminUsers';
var admin_results_dest		= '#AdminResults';
var next_games_destination	= '#divProxPartidos';

var ranking_destination		= '#divtblRanking';
var rondas_destination	 	= '#divRondas';
var apuestas_destination 	= '#divApuestasUser';
var cartones_destination 	= '#ListaBtnCartones';
var carton_info_destination = '#InfoCarton';
var fixture_destination 	= '#divtblFixture';
var grupos_destination 		= '#divtblGrupos';
var resultados_destination	= '#divtblResultados';
var selecciones_destination = '#divtblSelecciones div#dropEquipos';
var bases_destination 		= '#divtblBases';

var filaEditando;
var IDCarton;

var LoadingText = "<p class='Loading'>Cargando... <img src='../css/select2-spinner.gif' /></p>";
var LoadingText_simple = "<span class='Loading'>Cargando... <img src='../css/select2-spinner.gif' /></span>";
var SavingText = "<p class='Loading'>Guardando... <img src='../css/select2-spinner.gif' /></p>";

function Login() {
	$("#login_error").hide();
	
	$("#btnLogin").click(function(){	
		var username = $("#username").val();
		var password = $("#password").val();

		$.ajax({
			type: 'POST',
			url: '../php/func/post_login.php',
			data: { name: username, pass: password },
			beforeSend: function() {
				$("#login_error").fadeIn(200).html("Buscando...");
			},
			success: function (data) {
				data = data.trim();
				console.log("### Login: " + username + " - Result: " + data);				
				if (data === 'true') {
					window.location = MAIN_ROUTE;
				}
				else {
					$('#login_error').html('Usuario/Password no encontrado').show('slow');
					$('#username').parent().parent().addClass('has-error has-feedback');
					$('#password').parent().parent().addClass('has-error has-feedback');
				}
			}		
		});
		return false;
	});
}
function LoginLogout() {
	// Login
	$(".btn.login").click(function(){
		window.location = LOGIN_ROUTE;
	});
	
	// Logout
	$('.btn.logout').on('click', function() {
		$.ajax({
			type: 'POST',
			url: '../php/session/session_destroy.php',
			success: function (data) {
				data = data.trim();
				if (data === 'session_out') {
					window.location = LOGIN_ROUTE;
				}
				else {
					alert("No se puede cerrar la sesión");
				}
			}
		});
		return false;
	});
};

/* REGISTER */
function validateText(field) {
	var re = /^([A-Za-záéíóúñ_. ]+)$/;	
    return re.test(field);
}
function validateEmail(email) { 
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}
function RegisterUser() {
	$("#register_error").hide();

	/* $('#registerForm').bootstrapValidator({
        message: 'Este valor no es correcto',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            nombre: {
                message: 'El nombre no es correcto',
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo requerido'
                    },
                    stringLength: {
                        min: 4,
                        max: 30,
                        message: 'El nombre debe tener entre 4 y 30 caracteres'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z]+$/,
                        message: 'El nombre debe contener solo letras'
                    }
                }
            },
			apellido: {
                message: 'El apellido no es correcto',
                validators: {
                    notEmpty: {
                        message: 'El apellido es un campo requerido'
                    },
                    stringLength: {
                        min: 4,
                        max: 30,
                        message: 'El apellido debe tener entre 4 y 30 caracteres'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z]+$/,
                        message: 'El apellido debe contener solo letras'
                    }
                }
            },
			username: {
                message: 'El nombre de usuario no es correcto',
                validators: {
                    notEmpty: {
                        message: 'El nombre de usuario es un campo requerido'
                    },
                    stringLength: {
                        min: 4,
                        max: 30,
                        message: 'El nombre de usuario debe tener entre 4 y 30 caracteres'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9]+$/,
                        message: 'El nombre de usuario debe contener solo letras y/o numeros'
                    }
                }
            },
			password: {
                message: 'El password de usuario no es correcto',
                validators: {
                    notEmpty: {
                        message: 'El password es un campo requerido'
                    },
                    stringLength: {
                        min: 4,
                        max: 10,
                        message: 'El password debe tener entre 4 y 10 caracteres'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9]+$/,
                        message: 'El password debe contener solo letras y/o numeros'
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: 'El email es un campo requerido y no puede estar vacío'
                    },
                    emailAddress: {
                        message: 'El valor ingresado no es una direccion de email válida'
                    } 
                }
            }
        }
    });
	*/
	
	GetCountries();	
	
	$("#register").click(function(){
		var frm_nombre = $('#nombre').val();
		var frm_apellido = $('#apellido').val();
		var frm_username = $("#username").val();
		var frm_email = $("#email").val();
		var frm_password = $("#password").val();
		var frm_pais = $('#selTeamForm').find('option:selected').val();
		
		var okForm = true;
		if (frm_nombre === '' || frm_apellido === '' || frm_email === '' || frm_username === '' || frm_password === '' || frm_pais === '') {
			ShowError("nada");
			okForm = false;
		}
		else if (!validateText(frm_nombre))   { ShowError("nombre"); 	okForm = false; }
		else if (!validateText(frm_apellido)) { ShowError("apellido"); 	okForm = false; }
		else if (!validateText(frm_username)) { ShowError("username"); 	okForm = false; }
		else if (!validateEmail(frm_email))   { ShowError("email"); 	okForm = false; }		
		
		if (okForm) {
			console.log('Registrando usuario: ' + frm_nombre + " " + frm_apellido);
			$.ajax({
				type: 'POST',
				url: '../php/func/post_register.php',
				data: { nombre: frm_nombre, apellido: frm_apellido, pais: frm_pais, username: frm_username, password: frm_password, email: frm_email },
				success: function (html) {
					if (html === 'true') {
						$('#register_error').show()
							.html('¡Usuario correctamente registrado!');
							
							var delay = 1200;
							setTimeout(function() {
								window.location = MAIN_ROUTE;
							}, delay);
					}
					else {
						ShowError("dupe");
					}
				},
				beforeSend: function() { }
			});
		}
		return false;
	});
}
function GetCountries() {
	$.ajax({
		url: "../php/func/get_teams_select.php",
		dataType: 'html',
		type: 'GET',
		beforeSend: function( xhr ) { xhr.overrideMimeType( "text/plain; charset=UTF-8" ); },
		success: function(data) {
			data = data.trim();
			$('#divDropPais').html(data);
		},
		error: function(data) {
			data = data.trim();
			$('#add_err').html(data);
		}
	});
};
function ShowError(tipo) {
	var msg = "";
	
	switch (tipo) {
		case "nombre":
			msg = "Nombre no válido. Ingrese sólo letras.";
			element = $('input#nombre');
			break;
		case "apellido":
			msg = "Apellido no válido. Ingrese sólo letras.";
			element = $('input#apellido');
			break;
		case "username":
			msg = "Nombre de usuario no válido. Ingrese sólo letras.";
			element = $('input#email');
			break;
		case "email": 
			msg = "Email no válido";
			element = $('input#email');
			break;
		case "dupe": 
			msg = "Usuario ya registrado";
			element = $('input#username');
			break;
		default:
			msg = "Complete los campos solicitados";
			element = $('.form-control.form-polla');
			break;	
	}
	// $('.form-control.form-polla').parent().parent().addClass('has-error has-feedback');
	element.parent().parent().addClass('has-error has-feedback');
	$('#register_error').html(msg).show('slow');
	
};
function UsuarioYaExiste() {
	$('#register_error').fadeIn(1000).html('<strong>Usuario ya existe</strong>').fadeOut(1500);
};
/* REGISTER */

/* ADMIN */
function LoadAdmin() {
	console.log('# Cargando contenido: ' + admin_cartones_source);
	
	GetAdmin();
	/*
	// ¿Quiénes han pagado los cartones?
	GetAdminCartones();

	// Para cargar los resultados
	GetAdminResults();
	*/
}
function AjustarAnchoTblAdmin() {
	var w = parseInt($('.divAdminCartones').css('width'));
	$('.divAdminCartones > table').css('width', w + "px");
}
function GetAdmin() {
	$.ajax({
		url: admin_source,
		dataType: 'html',
		type: 'GET',
		beforeSend: function( xhr ) { 
			xhr.overrideMimeType( "text/plain; charset=UTF-8" ); 
			$(admin_destination).html(LoadingText);
		},
		success: function(data) {
			data = data.trim();
			$(admin_destination).html(data);
			// AjustarAnchoTblAdmin();
			
			UpdateCartonesPagados();
			UpdateResults();
		},
		error: function(data) {
			alert("Error");
		}
	});
}
function GetAdminCartones() {
	$.ajax({
		url: admin_cartones_source,
		dataType: 'html',
		type: 'GET',
		beforeSend: function( xhr ) { 
			xhr.overrideMimeType( "text/plain; charset=UTF-8" ); 
			$(admin_cartones_dest).html(LoadingText);
		},
		success: function(data) {
			data = data.trim();
			$(admin_cartones_dest).html(data);
			AjustarAnchoTblAdmin();
			FiltraTabla($('#searchCarton.searchInput'), $('.divAdminCartones > table tr'), '');
			UpdateCartonesPagados();
		},
		error: function(data) {
			alert("Error");
		}
	});
}
function GetAdminResults() {
	$.ajax({
		url: admin_results_source,
		dataType: 'html',
		type: 'GET',
		beforeSend: function( xhr ) { 
			xhr.overrideMimeType( "text/plain; charset=UTF-8" ); 
			$(admin_results_dest).html(LoadingText);
		},
		success: function(data) {
			data = data.trim();
			$(admin_results_dest).html(data);
			UpdateResults();
		},
		error: function(data) {
			alert("Error");
		}
	});
}
function UpdateCartonesPagados() {

	FiltraTabla($('#searchCarton.searchInput'), $('.divAdminCartones > table tr'), '');

	$('#btnUpdateCartonPagado').click(function() {
		$('.divAdminCartones > table tr').each(function(i, row) {
			var $row = $(row);
			var id_carton = $row.find("td.NumRank.hidden").text();
			var pagado = $row.find("td.CartonPagado").children("select").find("option:selected").val(); // 0: no pagado - 1: pagado
			
			$.ajax({
				url: update_cartones_pagados,
				dataType: 'html',
				data: { idc : id_carton, pagado: pagado },
				type: 'POST',
				beforeSend: function( xhr ) { 
					xhr.overrideMimeType( "text/plain; charset=UTF-8" ); 
					$(admin_cartones_dest).html(LoadingText);
				},
				success: function(data) {
					data = data.trim();
					if (data === 'LOGIN') {
						window.location = LOGIN_ROUTE;
					}
					GetAdminCartones();					
				},
				error: function(data) {
					alert("Error");
				}
			});
		});
	});
}
function UpdateResults() {

	FiltraTabla($('#searchRonda.searchInput'), $('.divAdminResults > table tr'), 'tdRondaR');

	$('#btnUpdateResultados').click(function() { 
		$('.divAdminResults > table tr').each(function(i, row) {
			var $row = $(row);
			var GolesLocal      = $row.find("td.GolesLocal > input").val(); 
			var GolesVisita     = $row.find("td.GolesVisita > input").val();
			var MinutoPrimerGol = $row.find("td.tdMinutoR > input").val();
			var GolesLocalPT    = $row.find("td.LocalPTR > input").val();
			var GolesVisitaPT   = $row.find("td.VisitaPTR > input").val();
			var JugPrimerGol    = $row.children("td.tdJugPrimerGolR").children("select").find("option:selected").val();			
			
			var GolesLocalTE	= $row.find("td.LocalTER > input").val();
			var GolesVisitaTE	= $row.find("td.VisitaTER > input").val();
			var PenalesLocal	= $row.find("td.LocalPeR > input").val();
			var PenalesVisita	= $row.find("td.VisitaPeR > input").val();
			
			/* console.log("[RESULTADOS] M: " + (i+1) + " - GL: " + GolesLocal + " - GV: " + GolesVisita + " - GLPT: " + 
				GolesLocalPT + " - GVPT: " + GolesVisitaPT + " - MPG: " + MinutoPrimerGol + " - JPG: " + JugPrimerGol);	*/
			
			$.ajax({
				url: admin_update_results,
				dataType: 'html',
				data: { 
					Match: (i+1), GL: GolesLocal, GV: GolesVisita, GLPT: GolesLocalPT, GVPT: GolesVisitaPT, 
					MPG: MinutoPrimerGol, JPG: JugPrimerGol, GLTE: GolesLocalTE, GVTE: GolesVisitaTE, PL: PenalesLocal, PV: PenalesVisita },
				type: 'POST',
				beforeSend: function( xhr ) { 
					xhr.overrideMimeType( "text/plain; charset=UTF-8" ); 
					$(admin_results_dest).html(LoadingText);
				},
				success: function(data) {
					data = data.trim();
					if (data === 'LOGIN') {
						window.location = LOGIN_ROUTE;
					}
					console.log("[ADMIN] Resultados Actualizados: " + data);
					GetAdminResults();
				},
				error: function(data) {
					alert("Error");
				}
			});
		});
	});
}
/* ADMIN */

/* MAIN */
/* --- NEXT GAMES */
function LoadNextGames() {
	console.log('# Cargando contenido: ' + next_games_source);
	
	$.ajax({
		url: next_games_source,
		dataType: 'html',
		type: 'GET',
		beforeSend: function( xhr ) { 
			xhr.overrideMimeType( "text/plain; charset=UTF-8" ); 
			$(next_games_destination).html(LoadingText);
		},
		success: function(data) {
			data = data.trim();
			$(next_games_destination).html(data);
		},
		error: function(data) {
			alert("Error");
		}
	});
}
/* --- RANKING */
function LoadRanking() {
	console.log('# Cargando contenido: ' + ranking_source);
	
	$.ajax({
		url: ranking_source,
		dataType: 'html',
		type: 'GET',
		beforeSend: function( xhr ) { 
			xhr.overrideMimeType( "text/plain; charset=UTF-8" ); 
			$(ranking_destination).html(LoadingText);
		},
		success: function(data) {
			data = data.trim();
			$(ranking_destination).html(data);
			AjustarAnchoTblRanking();
			FiltraTabla($('#searchRank.searchInput'), $('.divRanking > table tr'), '');
		},
		error: function(data) {
			alert("Error");
		}
	});
}
function FiltraTabla(search, rows, clase) {
	search.keyup(function() {
		var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

		rows.show().filter(function() {
			if (clase !== '') {			
				var text = $(this).find("td." + clase).text().replace(/\s+/g, ' ').toLowerCase();
			} else {
				var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
			}
			return !~text.indexOf(val);
		}).hide();
	});
}
function AjustarAnchoTblRanking() {
	var w = parseInt($('.divRanking').css('width'));
	$('.divRanking > table').css('width', w + "px");
}
/* --- RANKING */

/* SELECCIONES */
function LoadSelecciones() {
	console.log('# Cargando contenido: ' + selecciones_source);
	
	$.ajax({
		url: selecciones_source,
		dataType: 'html',
		type: 'GET',
		beforeSend: function( xhr ) { 
			xhr.overrideMimeType( "text/plain; charset=UTF-8" );
			$(selecciones_destination).html(LoadingText);
		},
		success: function(data) {
			data = data.trim();
			$(selecciones_destination).html('').append(data);
			BindStatsEquipo();
		},
		error: function(data) {
			alert("Error");
		}
	});
};
function AjustarAlto() {
	var h = $('#divtblSelecciones').height();
	var h1 = $('#dropEquipo').height();
	var h2 = $('#statsEquipo').height();
	var a = 35;

	$('#detailsEquipo').height((h - (h1+h2) - a) + "px");
	$('#tblJugadores').height((h - (h1+h2) - a) + 'px');
};
function BindStatsEquipo() {
	$('#divtblSelecciones ul.dropdown-menu li > a').on('click', function() {
		var CodigoPais = $(this).parent().children("span.hidden").text().trim();
		var Pais = $(this).text().trim();
		var img = $(this).html();
		
		/* Activar pestaña de Jugadores */
		$('#statsEquipo > ul > li').removeClass('active');
		$('#statsEquipo > ul > li:first-child').addClass('active');
		
		var currentTeam = "<div style='padding-left: 15px;'>";
		currentTeam = currentTeam + img;
		currentTeam = currentTeam + "</div>";
		
		$('#CurrentTeam').html(currentTeam).addClass('bg-success round-border');

		GetStatsEquipo(CodigoPais);
	});
	AjustarAlto();
};
function GetStatsEquipo(CodigoPais) {
	var statsEquipo = '#statsEquipo';
	var detailsEquipo = '#detailsEquipo';

	$.ajax({
		url: '../php/func/get_stats_equipo.php',
		dataType: 'html',
		data: { pais: CodigoPais },
		type: 'GET',
		beforeSend: function( xhr ) {
			xhr.overrideMimeType( "text/plain; charset=UTF-8" );
			console.log("Buscando datos de la seleccion de código: " + CodigoPais);
		},
		success: function(data) {
			data = data.trim();
			$(statsEquipo).removeClass('hidden');
			$(detailsEquipo).html(data);
		},
		error: function(data) {
			alert("Error");
		}
	});
};
/* SELECCIONES */

function LoadBases() {
	console.log('# Cargando contenido: ' + bases_source);
	
	$.ajax({
		url: bases_source,
		dataType: 'html',
		type: 'GET',
		beforeSend: function( xhr ) { xhr.overrideMimeType( "text/plain; charset=UTF-8" ); },
		success: function(data) {
			data = data.trim();
			$(bases_destination).append(data);
		},
		error: function(data) {
			alert("Error");
		}
	});
};

/* APUESTAS */
function LoadRondas() {
	// console.log('# Cargando contenido: ' + rondas_source);
	
	$.ajax({
		url: rondas_source,
		dataType: 'html',
		type: 'GET',
		beforeSend: function( xhr ) { 
			xhr.overrideMimeType( "text/plain; charset=UTF-8" );
			// $(rondas_destination).html(LoadingText);
		},
		success: function(data) {
			data = data.trim();
			if (data === 'LOGIN') {
				window.location = LOGIN_ROUTE;
			} else { 
				$(rondas_destination).html(data);
			}
		},
		error: function(data) {
			alert("Error");
		}
	});
}
function LoadBtnCartones() {
	// console.log('# Cargando contenido: ' + cartones_source);
	
	$.ajax({
		url: cartones_source,
		dataType: 'html',
		type: 'GET',
		beforeSend: function( xhr ) { 
			xhr.overrideMimeType( "text/plain; charset=UTF-8" );
			$(cartones_destination).html(LoadingText);
		},
		success: function(data) {
			data = data.trim();
			if (data === 'LOGIN') {
				window.location = LOGIN_ROUTE;
			} else { 
				$(cartones_destination).html(data);
				
				$('#NuevoCarton').click(function() { MostrarInputsNuevoCarton(); });			
				$('#btnGuardarCarton').click(function() { GuardarNuevoCarton(); });
				$('#btnEditarCarton').click(function() { EditarDescripcionCarton(); });				
				$('#btnCancelar').click(function() { EsconderInputsNuevoCarton(); });
				
				AgregarEventosBtnCartones();
			}
		},
		error: function(data) {
			alert("Error");
		}
	});
}

function AgregarEventosBtnCartones() {
	$('.btn-ver-carton').click(function() {
		var classes = $(this).attr('class').split(' ');
		var cls = classes[3];
		var ID = $("input." + cls).val();
		var NombreCarton_click = $(this).text();
		
		$(this).addClass('carton-active');
		
		$('.btn-ver-carton').each(function(idx, item) {
			var carton = $(item);
			if (carton.text() !== NombreCarton_click) { carton.removeClass('carton-active'); }
		});		
		
		$('#IDCartonVer').val(ID); 					 // Se guarda el ID del carton actual
		$('#DescCartonVer').val(NombreCarton_click); // Se guarda la Descripcion del carton actual		
		
		EsconderInputsNuevoCarton();
		
		MostrarInfoCarton(ID, NombreCarton_click);
		MostrarPillsRondas(ID);
	});
}

function MostrarInfoCarton(ID, NombreCarton) {
	console.log('# Cargando contenido: ' + carton_info_source);
	
	$.ajax({
		url: carton_info_source,
		dataType: 'html',
		type: 'GET',
		data: { id_carton: ID },
		beforeSend: function( xhr ) { 
			xhr.overrideMimeType( "text/plain; charset=UTF-8" );
			$(carton_info_destination).html(LoadingText);
		},
		success: function(data) {
			data = data.trim();
			if (data === 'LOGIN') {
				window.location = LOGIN_ROUTE;
			} else { 
				$(carton_info_destination).html(data);
				
				$('#btnEditar').tooltip();
				$('#btnEditar').click(function() {
					$('#NombreCarton').val('').val(NombreCarton);					
					MostrarInputsEditarCarton();
				});
				
				$('#btnGuardarCarton').click(function() { GuardarTablaDeApuesta(); });
			}
		},
		error: function(data) {
			alert("Error");
		}
	});
}
function MostrarPillsRondas(ID) {
	$('#divRondas').slideDown("slow");
	
	CargarCarton(ID);
	$('#apuestasInicio').addClass('hidden');
	$('#headerApuestas, #divtblApuestas').removeClass('hidden');
}

function MostrarInputsEditarCarton() {
	/* Se esconde el botón de Guardar Nuevo Cartón y se muestra el de Editar */
	$('#btnGuardarCarton').addClass('hidden');
	$('#btnEditarCarton').removeClass('hidden');
	
	$('#InputsNuevoCarton').removeClass('hidden').slideDown("1000");
	$('#NombreCarton').focus();
}
function MostrarInputsNuevoCarton() { 
	$('#InputsNuevoCarton').removeClass('hidden').slideDown("1000");
	$('#NombreCarton').focus();
}
function EsconderInputsNuevoCarton() { 
	$('#InputsNuevoCarton').slideUp("1000");
}

function CargarCarton(ID) {
	$.ajax({
		url: get_carton_user,
		dataType: 'html',
		data: { id_carton: ID },
		type: 'GET',
		beforeSend: function( xhr ) {
			xhr.overrideMimeType( "text/plain; charset=UTF-8" );
			$(apuestas_destination).html(LoadingText);
		},
		success: function(data) {
			data = data.trim();
			
			console.log("Cargando Carton ID : " + ID);
			
			if (data === 'LOGIN') {
				window.location = LOGIN_ROUTE;
			} else { 
				$(apuestas_destination).html('').append(data);
				$('#templ-Apuestas > tbody > tr:first-child').children("td:nth-child(5)").children("input:nth-child(1)").focus();
			}
		},
		error: function(data) {
			alert("Error");
		}
	});
}
function GuardarNuevoCarton() { 
	var InputNombreCarton = $('#NombreCarton');
	var NombreCarton = InputNombreCarton.val();
	
	console.log("Nombre Carton Nuevo: " + NombreCarton);
	
	if (NombreCarton !== '') {
		GuardarNuevoCartonDB(NombreCarton);
		EsconderInputsNuevoCarton();
		LoadBtnCartones();		
	} else {
		InputNombreCarton.addClass('has-error');		
	}
}
function GuardarNuevoCartonDB(NombreCarton) {
	// Esta función guarda el cartón en la Base de Datos, y crea un template con TODAS las apuestas vacías
	$.ajax({
		url: new_carton_source,
		async: false,
		dataType: 'html',
		data: { desc_carton: NombreCarton },
		type: 'POST',
		beforeSend: function( xhr ) {
			xhr.overrideMimeType( "text/plain; charset=UTF-8" );
		},
		success: function(data) {
			data = data.trim();
			if (data === 'LOGIN') {
				window.location = LOGIN_ROUTE;
			}
			console.log("###### ID Carton creado : " + data);
			// IDCarton = data;
		},
		error: function(data) {
			alert("Error");
		}
	});
}

function EditarDescripcionCarton() {
	var NEW_Descripcion = $('#NombreCarton').val();
	var OLD_Descripcion = $('#DescCartonVer').val();
	var id_carton = $('#IDCartonVer').val();
	
	if (NEW_Descripcion !== '') {
		ActualizaCartonDB(id_carton, OLD_Descripcion, NEW_Descripcion);
		EsconderInputsNuevoCarton();
		LoadBtnCartones();
	} else {
		$('#NombreCarton').addClass('has-error');
	}
}
function ActualizaCartonDB(id_carton, txtOriginal, txtNuevo) {
	// Esta función actualiza el cartón con su nueva descripción en la Base de Datos
	$.ajax({
		url: update_carton_source,
		dataType: 'html',
		data: { id: id_carton, new_desc: txtNuevo, old_desc: txtOriginal },
		type: 'POST',
		success: function(data) {
			data = data.trim();
			if (data === 'LOGIN') { window.location = LOGIN_ROUTE; }			
			console.log("### Carton Actualizado: " + data);
		},
		error: function(data) {
			alert("Error");
		}
	});
}

function GuardarTablaDeApuesta() {
	var NombreCarton = $('#DescCartonVer').val();
	var IDCartonGuardar = $('#IDCartonVer').val();
	console.log("Guardando apuesta: " + NombreCarton);
	
	/* AHORA */
	var d = new Date();
	var n = d.getTimezoneOffset() / 60;
	var Ahora = d;	
	Ahora.setHours(d.getHours() - 0*n);
	/* AHORA */
	
	$('#templ-Apuestas tr').each(function(i, row) {
		var $row = $(row);
		var HoraMatch		= $row.find("td.tdHora.hidden").text();
		var GolesLocal      = $row.find("td.GolesLocal > input").val(); 
		var GolesVisita     = $row.find("td.GolesVisita > input").val();
		var MinutoPrimerGol = $row.find("td.tdMinuto > input").val();
		var GolesLocalPT    = $row.find("td.LocalPT > input").val();
		var GolesVisitaPT   = $row.find("td.VisitaPT > input").val();
		var JugPrimerGol    = $row.children("td.tdJugPrimerGol").children("select").find("option:selected").val();
		
		
		console.log("Apuesta: " + NombreCarton + " - M: " + (i+1) + " - GL: " + GolesLocal + " - GV: " + GolesVisita + " - GLPT: " + 
			GolesLocalPT + " - GVPT: " + GolesVisitaPT + " - MPG: " + MinutoPrimerGol + " - JPG: " + JugPrimerGol);
		
		
		var YY = HoraMatch.substring( 0, 4);
		var MM = HoraMatch.substring( 5, 7) - 1;
		var DD = HoraMatch.substring( 8, 10);
		var hh = HoraMatch.substring(11, 13);
		var mm = HoraMatch.substring(14, 16);
		var ss = HoraMatch.substring(17, 19);
		
		var HoraPartido = new Date(YY, MM, DD, hh, mm, ss);
		
		if (Ahora < HoraPartido) {
			/*
			$.ajax({
				url: post_carton_source,
				dataType: 'html',
				data: { id: IDCartonGuardar, desc: NombreCarton, Match: (i+1), GL: GolesLocal, GV: GolesVisita, GLPT: GolesLocalPT, GVPT: GolesVisitaPT, MPG: MinutoPrimerGol, JPG: JugPrimerGol },
				type: 'POST',
				beforeSend: function( xhr ) {
					xhr.overrideMimeType( "text/plain; charset=UTF-8" );
					$(apuestas_destination).html(SavingText);
				},
				success: function(data) {
					data = data.trim();
					if (data === 'LOGIN') {
						window.location = LOGIN_ROUTE;
					}
					console.log("Apuesta guardada: " + data);
				},
				error: function(data) {
					alert("Error");
				}
			});
			*/
		}
	});
	
	$('#headerApuestas, #newCartonInputs').addClass('hidden');
	$('#apuestasInicio').removeClass('hidden');
	$(apuestas_destination).html('').addClass('hidden');
}


/* CARTONES - OLD */
var colIDCarton = 2;
var colDescripcionCarton = 4;
function LoadCartonesEventos() {
	$('.NuevoCarton').click(function() { CrearNuevoCarton(); });
	$('#btnGuardarCarton').click(function() { GuardarCarton(); });
	$('#btnEditarApuesta').click(function() { EditarDescripcionCarton(); });
	$('#btnCancelar').click(function() { $('#newCartonInputs').addClass('hidden'); $('#apuestasInicio').removeClass('hidden'); });
	$('#btnGuardarTablaApuesta').click(function() { GuardarTablaDeApuesta(); });
}
function CrearNuevoCarton() {
	$('#newCartonInputs').removeClass('hidden');
	$('#apuestasInicio, #headerApuestas, #divtblApuestas, #btnGuardarTablaApuesta').addClass('hidden');
	
	$('#NombreCarton').removeClass('hidden').val('').focus();
	$('#btnGuardarCarton, #btnCancelar').removeClass('hidden');
}
function AgregarEventosCartones() {	
	var btnVerCarton  = $('.tdVer > a');
	var btnEditCarton = $('.tdEditar > a');

	btnVerCarton.click(function() { VerCarton($(this)); });
	btnEditCarton.click(function() { EditarCarton($(this)); });
};
function VerCarton($this) {
	var tr = $this.parent().parent();
	var tdDescripcion = tr.children("td:nth-child(" + colDescripcionCarton + ")");
	var OriginalDescription = tdDescripcion.text();
	var tdID = tr.children("td:nth-child(" + colIDCarton + ")");
	var ID = tdID.text();
	
	console.log("### [VER] ID: " + ID);

	if (OriginalDescription === '') {
		tdDescripcion.children("input:nth-child(1)").addClass('has-error');
	} else {
		$('#newCartonInputs, #btnGuardarTablaApuesta').removeClass('hidden');
		$('#apuestasInicio, #NombreCarton, #btnEditarApuesta, #btnGuardarCarton, #btnCancelar').addClass('hidden');
		
		$('#NombreCarton').val(OriginalDescription);
		$('#IDCartonVer').val(ID);
		
		$('#headerApuestas, #divtblApuestas').removeClass('hidden');
		
		CargarCarton(ID);
	}
}
function EditarCarton($this) {
	var tr = $this.parent().parent();
	var td = tr.children("td:nth-child(" + colDescripcionCarton + ")");
	var OriginalDescription = td.text();
	
	filaEditando = tr;
	console.log("### Editando Cartón: " + OriginalDescription);
	
	if (OriginalDescription !== '') {
		$('#headerApuestas, #divtblApuestas').addClass('hidden');
		
		$('#newCartonInputs').children("input:nth-child(1)").val(OriginalDescription);
		$('#newCartonInputs').removeClass('hidden').children("input:nth-child(1)").focus();
		$('#NombreCarton, #btnCancelar').removeClass('hidden');
	
		$('#apuestasInicio, #btnGuardarCarton').addClass('hidden');
		$('#btnEditarApuesta').removeClass('hidden');
	}
}

function HTMLNuevoCarton(IDCarton, NumCarton, NombreCarton) {
	var html = "<tr>" + 
			"<td class='tdNumeroCarton'>" + NumCarton + "</td>" +
			"<td class='tdID hidden'>" + IDCarton + "</td>" + 
			"<td class='tdEditar tdAccion'><a href='#'><img src='../img/edit-icon.png' class='icon' /></a></td>" + 
			"<td>" + NombreCarton + "</td>" +			
			"<td class='tdPagado'><img src='../img/red-cross-icon.png' class='icon' /></td>" +
			"<td class='tdVer tdAccion'><a href='#'><img src='../img/lupa-icon.png' class='icon' /></a></td>" +
			"</tr>";
	return html;
}
function GuardarCarton() {
	var InputNombreCarton = $('#NombreCarton');
	var NombreCarton = InputNombreCarton.val();
	
	console.log("Nombre Apuesta: " + NombreCarton);
	
	if (NombreCarton !== '') {
		GuardarNuevoCartonDB(NombreCarton);
		
		var tbl_cartones = $('table.cartones-content > tbody');
		// Se elimina la fila que dice que no hay cartones creados, al principio
		var tdsEliminar = $('table.cartones-content > tbody > tr td.noCarton');
		var trs = tdsEliminar.parent();
		trs.remove();
		
		var tdValues = $('table.cartones-content > tbody tr > td:first-child');
		var NumCarton = GetMaxCarton(tdValues);
		
		if (NumCarton === Number.POSITIVE_INFINITY || NumCarton === Number.NEGATIVE_INFINITY) {
			NumCarton = 1;
		} else {
			NumCarton = NumCarton + 1;
		}

		var newRow = HTMLNuevoCarton(IDCarton, NumCarton, NombreCarton);
		tbl_cartones.append(newRow);
		
		AgregarEventosCartones();
		
		$('#newCartonInputs').addClass("hidden");
		LoadCartones();
		$('#apuestasInicio').removeClass('hidden');
	} else {
		InputNombreCarton.addClass('has-error');		
	}
}
function GetMaxCarton(tbl) {
	var tdValues = tbl;

	var values = tdValues.map(function() { 
		return ($.text([this]) === '- Infinity') ? 0 : parseInt( $.text( [this] ) ); 
	}).get();
	
	var n = Math.max.apply( null, values );
	return n;
}
/* CARTONES */
function SetMarginTableApuestas() {
	var w = $('#apuestas_wrpr').width();
	var t = $('.table-apuestas').width();
	var m = (w - t)/2;

	$('#divtblApuestas > table').css('margin-left', m + "px");
	$('.table-apuestas').css('margin-left', m + "px");
};
/* APUESTAS */

/* FIXTURE */
function LoadFixture() {
	console.log('# Cargando contenido: ' + fixture_source);
	
	$.ajax({
		url: fixture_source,
		dataType: 'html',
		type: 'GET',
		data: { type: 'tabs' },
		beforeSend: function( xhr ) { xhr.overrideMimeType( "text/plain; charset=UTF-8" ); },
		success: function(data) {
			data = data.trim();
			$(fixture_destination).append(data);
			SetMarginTableFixture();
			
			// FiltraTabla($('#searchEquipo.searchInput'), $('#divtblFixture div.active div.fixture-ronda > table tr'), 'rEquipo');
			// FiltraTabla($('#searchCiudad.searchInput'), $('#divtblFixture div.active div.fixture-ronda > table tr'), 'tdCiudad');
			
			$('#searchEquipo.searchInput').keyup(function() { FilterFixtureEquipo($(this)); });
			$('#searchCiudad.searchInput').keyup(function() { FilterFixtureCiudad($(this)); });
		},
		error: function(data) {
			alert("Error");
		}
	});
};
function FilterFixtureEquipo(search) {
	var rows = $('#divtblFixture div.active div.fixture-ronda > table tr');
	var clase = 'rEquipo';

	search.keyup(function() {
		var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

		rows.show().filter(function() {
			if (clase !== '') {			
				var text = $(this).find("td." + clase).text().replace(/\s+/g, ' ').toLowerCase();
			} else {
				var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
			}
			return !~text.indexOf(val);
		}).hide();
	});
}
function FilterFixtureCiudad(search) {
	var rows = $('#divtblFixture div.active div.fixture-ronda > table tr');
	var clase = 'tdCiudad';
	
	search.keyup(function() {
		var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

		rows.show().filter(function() {
			if (clase !== '') {			
				var text = $(this).find("td." + clase).text().replace(/\s+/g, ' ').toLowerCase();
			} else {
				var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
			}
			return !~text.indexOf(val);
		}).hide();
	});
}
function SetMarginTableFixture() {
	var w = $('#fixture_wrpr').width();
	var t = $('.table-fixture').width();
	var m = (w - t)/2;

	$('divtblFixture > table').css('margin-left', m + "px");
	$('.table-fixture, #tblFixture.table-fixture').css('margin-left', m + "px");
};
/* FIXTURE */

/* GRUPOS */
function LoadGrupos() {
	console.log('# Cargando contenido: ' + grupos_source);
	
	$.ajax({
		url: grupos_source,
		dataType: 'html',
		type: 'GET',
		beforeSend: function( xhr ) { xhr.overrideMimeType( "text/plain; charset=UTF-8" ); },
		success: function(data) {
			data = data.trim();
			$(grupos_destination).append(data);
			PintarPais(grupos_destination + " table");
		},
		error: function(data) {
			alert("Error");
		}
	});
};
/* GRUPOS */

/* RESULTADOS */
function LoadResultados() {
	console.log('# Cargando contenido: ' + resultados_source);
	
	$.ajax({
		url: resultados_source,
		dataType: 'html',
		type: 'GET',
		data: { type: 'tabs' },
		beforeSend: function( xhr ) { 
			xhr.overrideMimeType( "text/plain; charset=UTF-8" ); 
			$(resultados_destination).html(LoadingText);
		},
		success: function(data) {
			data = data.trim();
			$(resultados_destination).html('').append(data);
		},
		error: function(data) {
			alert("Error");
		}
	});
}
function PintarPais(table) {
	var tds = table + " td";

	$.ajax({
		url: '../php/session/get_session_country.php',
		dataType: 'html',
		type: 'GET',
		beforeSend: function( xhr ) { xhr.overrideMimeType( "text/plain; charset=UTF-8" ); },
		success: function(data) {
			data = data.trim();
			var tableRow = $(tds).filter(function() {
				return $(this).text() == data;
			}).closest("tr");
			
			$(tableRow).addClass('bg-success');
		},
		error: function(data) {
			alert("Error");
		}
	});
}
/* RESULTADOS */

function SetHeightTables() {
	var h = $(window).height();
	var hApuestas = 0.63*h;
	var hGrupos = 0.67*h;
	var hFixture = 0.6*h;		
	var maxHeightFixture = 400;

	var w = parseInt($('.col-md-9').css('width'));
	$('#divtblApuestas').css('height', hApuestas + "px").css('overflow-y', 'scroll').css('overflow-x', 'hidden').css('width', w + "px");
	
	$('#divtblGrupos').css('height', hGrupos + "px").css('overflow-y', 'scroll').css('width', '100%');
	
	$('div.fixture-ronda').css('height', hFixture + "px");
	// $('#divtblFixture').css('height', hFixture + "px").css('overflow-y', 'scroll').css('width', '100%');
};
