<?php
require_once '../data/database_data.php';
include 'functions.php';
include 'pdf_export.php';

$conn = mysqli_connect($host, $user, $pass, $database);

/* TIPO DE FIXTURE */
   $tipo =  'table';
/* TIPO DE FIXTURE */

// Check connection
if (!mysqli_connect_errno()) {
	$fixtureTable = BuildFixture($conn, $tipo);
	
	// echo $fixtureTable;
	
	PDFExport($fixtureTable);
}
else { echo "Failed to connect to MySQL: " . mysqli_connect_error(); }

mysqli_close($conn);

?>