<?php
require_once '../data/database_data.php';
include 'functions.php';

$conn = mysqli_connect($host, $user, $pass, $database);
$modo = 'tabs';

// Check connection
if (!mysqli_connect_errno()) {
	echo BuildBases($modo);
}
else { echo "Failed to connect to MySQL: " . mysqli_connect_error(); }

mysqli_close($conn);

?>