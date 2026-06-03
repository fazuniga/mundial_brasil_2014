<?php
require '../data/database_data.php';
include 'functions.php';

$conn = mysqli_connect($host, $user, $pass, $database);

// Check connection
if (!mysqli_connect_errno()) {
	$tabsGrupos = BuildTabsGrupos($conn);
	echo $tabsGrupos;	
} else { 
	echo "Failed to connect to MySQL: " . mysqli_connect_error(); 
}

mysqli_close($conn);

?>