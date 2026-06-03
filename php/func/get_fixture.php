<?php
require_once '../data/database_data.php';
include 'functions.php';

$conn = mysqli_connect($host, $user, $pass, $database);

/* TIPO DE FIXTURE */
   $tipo =  $_GET['type']; // 'tabs' o 'table';
/* TIPO DE FIXTURE */

// Check connection
if (!mysqli_connect_errno()) {
	echo BuildFixture($conn, $tipo);
}
else { echo "Failed to connect to MySQL: " . mysqli_connect_error(); }

mysqli_close($conn);

?>