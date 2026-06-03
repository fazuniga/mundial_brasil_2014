<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es-ES">
<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<title>INDEX - <?php include_once('data/general_text.php'); echo $titulo_polla; ?></title>
	
	<!-- js -->
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
	<script type="text/javascript" src="../js/index.js"></script>
	
	<!-- css -->
	<link rel="stylesheet" href="../css/bootstrap.css" type="text/css">
	<link rel="stylesheet" href="../css/main.css" type="text/css">
	<link rel="stylesheet" href="../css/flags.css" type="text/css">
</head>
<body>
	<?php include('session/user_logged_in.php'); ?>
	
	<?php include ('navbar.php'); ?>
	<div id="grupos_wrpr" class="fondo-brasil fondo-brasil-fixture round-border container-fluid">
		<div class="panel panel-success show-logo">
			<?php include ('panel-heading.php'); ?>
			<div class="panel-body">Revisa todo sobre el Mundial 2014: Tus apuestas, los equipos, los jugadores... TODO!!</div>
		</div>
		<div id="divtblGrupos">
			<div class="row" style="overflow: auto;"></div>
		</div>
	</div>
</body>
</html>