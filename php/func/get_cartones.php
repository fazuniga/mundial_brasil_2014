<?php
require_once '../data/database_data.php';
include 'functions.php';

$conn = mysqli_connect($host, $user, $pass, $database);

$modo = 'btn';

if(!isset($_SESSION)) { session_start(); }

if ($_SESSION['id_user'] != '') {
	$user = $_SESSION['id_user'];
	
	if (!mysqli_connect_errno()) { 
		if ($modo == 'btn') { echo GetBtnCartonesUser($conn, $user); }
		else { echo GetCartonesUser($conn, $user); }
	}
	else { echo "Failed to connect to MySQL: " . mysqli_connect_error(); }
	mysqli_close($conn);
} else {
	echo "LOGIN";
}
?>