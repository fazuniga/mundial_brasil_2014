<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es-ES">
<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<title><?php include_once('data/general_text.php'); echo $titulo_polla; ?></title>
	
	<!-- js -->
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/brasil2014.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
	<!--<script type="text/javascript" src="../js/main.js"></script>-->
	
	<!-- css -->
	<link rel="stylesheet" href="../css/bootstrap.css" type="text/css">
	<link rel="stylesheet" href="../css/main.css" type="text/css">
	<link rel="stylesheet" href="../css/flags.css" type="text/css">
</head>
<body>
	<?php include('navbar-beta.php'); ?>
	<div id="main_wrpr" class="wrapper fondo-brasil fondo-brasil-fixture round-border container-fluid">
		<div class="panel panel-success show-logo">
			<?php include ('panel-heading.php'); ?>
			<div class="panel-body"><?php echo $texto_main; ?></div>
		</div>
		<div id="main_content" class='max-height jumbotron'>
			<h1>Polla CS&OR <small>Mundial Brasil 2014</small></h1>
			<h4>Estamos terminando de probar la página, para que la puedas usar...</h4>
		</div>
	</div>
</body>
</html>