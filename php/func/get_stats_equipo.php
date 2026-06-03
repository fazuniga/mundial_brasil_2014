<?php
require '../data/database_data.php';
include 'functions.php';

$conn = mysqli_connect($host, $user, $pass, $database);
$CodigoPais = $_GET['pais']; // Codigo del Pais

// Check connection
if (!mysqli_connect_errno()) {
	$statsEquipo = StatsEquipo($conn, $CodigoPais);
	echo $statsEquipo;	
} else { 
	echo "Failed to connect to MySQL: " . mysqli_connect_error(); 
}

mysqli_close($conn);

?>