<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es-ES">
<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<title><?php include_once('data/general_text.php'); echo $titulo_polla; ?></title>
	
	<!-- js -->
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/brasil2014.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
	<script type="text/javascript" src="../js/main.js"></script>
	
	<!-- css -->
	<link rel="stylesheet" href="../css/bootstrap.css" type="text/css">
	<link rel="stylesheet" href="../css/main.css" type="text/css">
	<link rel="stylesheet" href="../css/flags.css" type="text/css">
</head>
<body><?php include 'session/user_logged_in.php'; include 'navbar.php'; ?>
	<div id="main_wrpr" class="wrapper fondo-brasil fondo-brasil-fixture round-border container-fluid">
		<div class="panel panel-success show-logo">
			<?php include ('panel-heading.php'); ?>
			<div class="panel-body"><?php echo $texto_main; ?></div>
		</div>
		<div id="main_content" class='-max-height'>
			<div id="divtblRanking" class="col-md-4"></div>
			<div id="divProxPartidos" class="col-md-4"></div>
			<div id="divRedesSociales" class="col-md-4">
				<span style="font-size: 2em; font-weight: bold">Redes Sociales</span>
				<div>					
					<a class="twitter-timeline" href="https://twitter.com/search?q=%23PollaCPBP" data-widget-id="472246627470557184">
						Loading <img src='../css/select2-spinner.gif' />
					</a>
					<script>
						!function(d,s,id){
							var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';
							if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";
							fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");
					</script>
				</div>
			</div>
		</div>
	</div>
</body>
</html>