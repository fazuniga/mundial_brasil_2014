<?php
require_once '../data/database_data.php';

if(!isset($_SESSION['user'])) { session_start(); }

/* ------- USER y PASSWORD ------- */
$form_username = $_POST['name'];
$form_password = md5($_POST['pass']);
/* ------- USER y PASSWORD ------- */

$conn = mysqli_connect($host, $user, $pass, $database);

// Check connection
if (!mysqli_connect_errno()) {
	$query = "SELECT u.*, e.Pais FROM " . $tbl_users . " u"
			. " JOIN " . $tbl_equipos . " e ON u.id_pais = e.id_equipo" 
			. " WHERE u.username = '" . $form_username . "'"
			. " AND u.password = '" . $form_password . "'"
			. " AND u.active = 1";

	$result = mysqli_query($conn, $query);
	$row = mysqli_fetch_array($result);
	$num_row = mysqli_num_rows($result);

	if( $num_row === 1 ) {
		$_SESSION['id_user'] = $row['id_user'];
		$_SESSION['user'] = $row['username'];
		$_SESSION['Nombre'] = $row['Nombre'];
		$_SESSION['Apellido'] = $row['Apellido'];
		$_SESSION['Pais'] = $row['Pais'];
		$_SESSION['admin'] = $row['admin'];
		
		echo 'true';
	} else {
		echo 'false: ' . $query;
	}
} 
else {
	echo "Error BD MySQL: " . mysqli_connect_error();  
}

mysqli_close($conn);

?>