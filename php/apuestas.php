<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es-ES">
<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<title>Apuestas - <?php include('data/general_text.php'); echo $titulo_polla; ?></title>
	
	<!-- js -->
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/brasil2014.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
	<script type="text/javascript" src="../js/apuestas.js"></script>
	
	<!-- css -->
	<link rel="stylesheet" href="../css/bootstrap.css" type="text/css">
	<link rel="stylesheet" href="../css/main.css" type="text/css">
	<link rel="stylesheet" href="../css/flags.css" type="text/css">
</head>
<body>
	<?php include 'session/user_logged_in.php'; include 'navbar.php'; ?>
	<div id="apuestas_wrpr" class="wrapper fondo-brasil fondo-brasil-fixture round-border container-fluid">
		<div class="panel panel-success show-logo">
			<?php include ('panel-heading.php'); ?>
			<div class="panel-body">
				<?php echo $texto_apuestas; ?>
				<button id="NuevoCarton" type="submit" class="btn btn-primary pull-right">Nuevo Cartón</button>
			</div>
		</div>
		
		<div id="InputsNuevoCarton">
			<button id="btnCancelar" type="submit" class="btn btn-info pull-right" style="margin-left: 10px;">Cancelar</button>
			<button id="btnGuardarCarton" type="submit" class="btn btn-success pull-right">Guardar</button>
			<button id="btnEditarCarton" type="submit" class="btn btn-success pull-right hidden">Guardar</button>
			<input id='NombreCarton' type='text' class='form-control pull-right' placeholder='Nombre del cartón (max. 15 caracteres)' maxlength='15' />			
			<input type='hidden' id='IDCartonVer' value='' />
			<input type='hidden' id='DescCartonVer' value='' />
		</div>
		
		<div class="panel panel-default panel-cartones">
			<div class="panel-body panel-lista-cartones bg-info">
				<div id="spanCartones" class="pull-left col-md-1"><span class='spanCartones'><strong>Tus Cartones</strong></span></div>
				<div id="ListaBtnCartones" class="col-md-7"></div>
				<div id="InfoCarton" class="col-md-4"></div>
			</div>
		</div>
		
		<div id='divApuestasUser' class='col-md-12' style="padding: 0; margin-bottom: 10px"></div>
	</div>
</body>
</html>