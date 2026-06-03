<?php include ('data/general_text.php');
if (isset($_SESSION['Nombre']) && $_SESSION['Nombre'] != '') { ?>
<div class='navbar navbar-default navbar-fixed-top' role='navigation'>
	<div class='container' style='padding: 0px;'>
		<ul class='nav navbar-nav' style='min-width: 770px'>  
			<a class='navbar-brand' href='../php/main.php' style='font-size: 1.2em'><img src='../img/beta-icon.png' class='icon-med' /><strong> <?php echo $titulo_polla; ?></strong></a>
			<li><a href='../php/apuestas.php'>Mis Apuestas</a></li>
			<li class='not-hover'><a href='#'></a></li>
			<li><a href='../php/fixture.php'>Fixture</a></li>
			<li><a href='../php/resultados.php'>Resultados</a></li>
			<li><a href='../php/grupos.php'>Grupos</a></li>  
			<li class='not-hover'><a href='#'></a></li>
			<li><a href='../php/selecciones.php'>Selecciones</a></li>
			<li class='not-hover'><a href='#'></a></li>
			<li><a href='../php/bases.php'>Bases de la Polla</a></li>
		</ul>
		<ul class='nav navbar-nav navbar-right'>
			<?php if ($_SESSION['admin'] == 1) { ?>
				<li><a href='../php/admin.php'>Administración</a></li>
			<?php } ?>
			<li class='not-hover'>
				<p class='navbar-text'><a href='#' class='navbar-link'>¡Hola <?php echo $_SESSION['Nombre'] ?>!</a></p>
			</li>
			<li class='not-hover'>
				<button type='button' class='btn btn-default navbar-btn logout'>Salir</button>
			</li>
		</ul>
	</div>
</div>
<?php } else { ?>
<div class='navbar navbar-default navbar-fixed-top' role='navigation'>
	<div class='container'>
        <div>
			<ul class='nav navbar-nav'>
				<a class='navbar-brand' href='../php/main.php'><img src='../img/beta-icon.png' class='icon-med' /><strong> Polla CS&OR</strong></a>
			</ul>
			<ul class='nav navbar-nav navbar-right'>
				<li><a href='../php/bases-ol.php'>Bases de la Polla</a></li>
				<li class='not-hover'>
					<button type='button' class='btn btn-default navbar-btn login'>Entra a la Polla</button>
				</li>
			</ul>
		</div>
	</div>
</div>
<?php } ?>