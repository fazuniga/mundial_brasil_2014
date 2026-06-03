<?php
header('Content-Type: text/html; charset=UTF-8');
require_once '../data/database_data.php';
include 'functions.php';

$conn = mysqli_connect($host, $user, $pass, $database);

$id_carton = $_POST['id'];
$old_desc = $_POST['old_desc'];
$new_desc = $_POST['new_desc'];

if(!isset($_SESSION)) { session_start(); }

if ($_SESSION['id_user'] != '') {
	$user = $_SESSION['id_user'];
	
	if (!mysqli_connect_errno()) { echo UpdateDescCartonUser($conn, $id_carton, $old_desc, $new_desc, $user); }
	else { echo "Failed to connect to MySQL: " . mysqli_connect_error(); }
	mysqli_close($conn);
} else {
	echo "LOGIN";
}
?>