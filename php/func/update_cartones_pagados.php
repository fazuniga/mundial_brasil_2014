<?php
require_once '../data/database_data.php';
include 'functions.php';

$conn = mysqli_connect($host, $user, $pass, $database);

$id_carton = $_POST['idc'];
$pagado = $_POST['pagado'];

if(!isset($_SESSION)) { session_start(); }

if ($_SESSION['id_user'] != '') {
	$user = $_SESSION['id_user'];
	
	if (!mysqli_connect_errno()) { echo UpdateCartonesPagados($conn, $id_carton, $pagado); }
	else { echo "Failed to connect to MySQL: " . mysqli_connect_error(); }
	mysqli_close($conn);
} else {
	echo "LOGIN";
}
?>