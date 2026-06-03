<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es-ES">
<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<title><?php include_once('data/general_text.php'); echo $titulo_polla; ?></title>
	
	<!-- js -->
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/brasil2014.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>	
	<script type="text/javascript" src="../js/login.js"></script>
	
	<!-- css -->
	<link rel="stylesheet" href="../css/bootstrap.css" type="text/css">	
	<link rel="stylesheet" href="../css/main.css" type="text/css">
	
	<!--[if IE]>
	<script type="text/javascript"> window.location = "chrome.php"; </script>
	<![endif]-->
</head>
	<body>
		<?php include('navbar.php'); ?>
		<div id="login_wrpr" class="wrapper fondo-brasil fondo-brasil-login divLogin round-border container-fluid">
			<?php include ('login-form.php'); ?>
		</div>
	</body>
</html>