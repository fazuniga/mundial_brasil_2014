<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es-ES">
<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<title>Oops - <?php include('data/general_text.php'); echo $titulo_polla; ?></title>
	
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
	<?php // include('navbar.php'); ?>
	<div id="selecciones_wrpr" class="wrapper fondo-brasil fondo-brasil-fixture round-border container-fluid">
		<div class="panel panel-success show-logo">
			<?php include ('panel-heading.php'); ?>
			<div class="panel-body"><?php echo $error; ?></div>
		</div>
		<div id="divtblChrome">
			<div class="jumbotron round-border" style="background-color: #dff0d8;">
				<h1>Lo sentimos...</h1>
				<h2>Esta página sólo funciona con Google Chrome</h2>
				<p><img src='../img/chrome-icon.png' style='height: 300px;' /></p>
			</div>
		</div>
	</div>
</body>
</html>