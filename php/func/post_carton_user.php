<?php
require_once '../data/database_data.php';
include 'functions.php';

$conn = mysqli_connect($host, $user, $pass, $database);

/* Valores Apostados */
$id    = $_POST['id'];
$desc  = $_POST['desc'];
$Match = $_POST['Match'];
$GL    = $_POST['GL']   == ''   ? 'NULL' : $_POST['GL'];
$GV    = $_POST['GV']   == ''   ? 'NULL' : $_POST['GV'];
$GLPT  = $_POST['GLPT'] == ''   ? 'NULL' : $_POST['GLPT'];
$GVPT  = $_POST['GVPT'] == ''   ? 'NULL' : $_POST['GVPT'];
$MPG   = $_POST['MPG']  == ''   ? 'NULL' : $_POST['MPG'];
$JPG   = $_POST['JPG']  == '-1' ? 'NULL' : $_POST['JPG'];

$ApuestaMatch = array(	'Match' => $Match, 
						'GolesLocal' => $GL, 		'GolesVisita' => $GV, 
						'GolesLocalPT' => $GLPT, 	'GolesVisitaPT' => $GVPT, 
						'MinutoPrimerGol' => $MPG, 	'JugPrimerGol' => $JPG);
						
if(!isset($_SESSION)) { session_start(); }

if ($_SESSION['id_user'] != '') {
	$user = $_SESSION['id_user'];
	
	if (!mysqli_connect_errno()) { echo UpdateCartonUser($conn, $id, $desc, $user, $ApuestaMatch); }
	else { echo "Failed to connect to MySQL: " . mysqli_connect_error(); }
	mysqli_close($conn);
} else {
	echo "LOGIN";
}
?>