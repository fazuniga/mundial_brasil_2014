<?php
require_once '../data/database_data.php';
include 'functions.php';

$conn = mysqli_connect($host, $user, $pass, $database);

$id_carton = $_GET['id_carton'];

if(!isset($_SESSION)) { session_start(); }

if ($_SESSION['id_user'] != '') {
	if (!mysqli_connect_errno()) { echo GetInfoCarton($conn, $id_carton); }
	else { echo "Failed to connect to MySQL: " . mysqli_connect_error(); }
	mysqli_close($conn);
} else {
	echo "LOGIN";
}
?>