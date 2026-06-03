<?php
require_once '../data/database_data.php';
include 'functions.php';

$conn = mysqli_connect($host, $user, $pass, $database);

// Check connection
if (!mysqli_connect_errno()) { 	echo GetListaPaisesLogin($conn);  }
else { 	echo "Error BD MySQL: " . mysqli_connect_error();  }

mysqli_close($conn);

?>