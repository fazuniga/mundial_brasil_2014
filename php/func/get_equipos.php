<?php
require_once '../data/database_data.php';

$selectName = $_GET['divDest'];

$conn = mysqli_connect($host, $user, $pass, $database);

// Check connection
if (!mysqli_connect_errno()) {
	$query = "SELECT Pais, Code FROM " . $tbl_equipos . " WHERE id_equipo <= 32 ORDER BY id_equipo";
	$ListaEquipos = mysqli_query($conn, $query);
	
	echo "<select id='" . $selectName . "'>";
	echo "<option value=''></option>"; // Select2 HEADER
	
	while($row = mysqli_fetch_array($ListaEquipos)) {
		echo '<option value="' . $row['Code'] . '">' . $row['Pais'] . "</option>";
	}
	echo '</select>';
}
else {
	echo "Error BD MySQL: " . mysqli_connect_error();  
}

mysqli_close($conn);

?>