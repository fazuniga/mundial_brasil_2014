<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es-ES">
<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<title>Selecciones - <?php include('data/general_text.php'); echo $titulo_polla; ?></title>
	
	<!-- js -->
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/brasil2014.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
	<script type="text/javascript" src="../js/selecciones.js"></script>
	
	<!-- css -->
	<link rel="stylesheet" href="../css/bootstrap.css" type="text/css">	
	<link rel="stylesheet" href="../css/main.css" type="text/css">
	<link rel="stylesheet" href="../css/flags.css" type="text/css">
</head>
<body>
	<?php include('session/user_logged_in.php'); ?>
	
	<?php include('navbar.php'); ?>
	<div id="selecciones_wrpr" class="wrapper fondo-brasil fondo-brasil-fixture round-border container-fluid">
		<div class="panel panel-success show-logo">
			<?php include ('panel-heading.php'); ?>
			<div class="panel-body"><?php echo $texto_selecciones; ?></div>
		</div>
		<div id="divtblSelecciones">
			<div class="col-md-2">
				<div id="CurrentTeam"><div class="bg-success round-border" style="padding-left: 15px; font-weight:bold;">GRUPOS</div></div>
				<div id="dropEquipos"></div>
			</div>
			<div class="col-md-9">
				<div id="statsEquipo" class="hidden"><?php include ('stats-equipos.php'); ?></div>
				<div id="detailsEquipo">
					<?php include ('selecciones-inicio.php'); ?></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>