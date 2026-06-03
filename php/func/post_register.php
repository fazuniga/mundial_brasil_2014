<?php
require_once '../data/database_data.php';
 
/* INICIO - POST */
$nombre_form    = utf8_decode($_POST['nombre']);
$apellido_form  = utf8_decode($_POST['apellido']);
$pais_form 		= $_POST['pais'];
$username_form 	= utf8_decode($_POST['username']);
$password_form 	= md5($_POST['password']);
$email_form 	= strtolower($_POST['email']);
/* FIN - POST */

$conn = mysqli_connect($host, $user, $pass, $database);

// Check connection
if (!mysqli_connect_errno()) {
	$query = "SELECT * FROM " . $tbl_users
		. " WHERE username = '" . $username_form . "'"
		. " AND password = '" . $password_form . "'"
		. " AND active = 1";

	$res = mysqli_query($conn, $query);
	$num_row = mysqli_num_rows($res);
	$row = mysqli_fetch_array($res);

	if( $num_row === 1 ) {
		echo 'false';
	} else {
		$qPais = "SELECT id_equipo FROM " . $tbl_equipos . " WHERE Code = '" . $pais_form . "'";
		$res = mysqli_query($conn, $qPais);
		$rr = mysqli_fetch_array($res);
		
		$id_pais = $rr['id_equipo'];
	
		$qInsert = "INSERT INTO " . $tbl_users . 
			"(username, password, Nombre, Apellido, id_pais, email, active, admin) VALUES (" .
			"'" . $username_form . "', " . "'" . $password_form . "', " .
			"'" . $nombre_form . "', " . "'" . $apellido_form . "', " .
			$id_pais . ", '" . $email_form . "', " . "1, 0)";
		
		$res = mysqli_query($conn, $qInsert);
		echo 'true';
	}
} 
else { echo "Error BD MySQL: " . mysqli_connect_error(); }

mysqli_close($conn);
?>