<?php
require_once '../data/database_data.php';

$conn = mysqli_connect($host, $user, $pass, $database);

// Check connection
if (!mysqli_connect_errno()) {
	$query = "SELECT id_grupo, grupo FROM " . $tbl_grupos . " WHERE id_grupo <= 8";
	$ListaEquipos = mysqli_query($conn, $query);
	
	echo "<select class='form-control form-polla'>";
	echo "<option value='-1'>Elige de la lista</option>";
	
	while($row = mysqli_fetch_array($ListaEquipos)) {
		$query_2 = "SELECT Pais_SC as Pais, Code FROM " . $tbl_equipos . " e"
		. " WHERE e.id_grupo = " . $row['id_grupo'] 
		. " AND e.id_equipo <= 32 ORDER BY id_equipo";
		
		$PaisesGrupo = mysqli_query($conn, $query_2);
	
		while($pais = mysqli_fetch_array($PaisesGrupo)) {
			echo "<option value='" . $pais['Code'] . "'>" . $pais['Pais'] . "</option>";			
		}		
	}
	echo '</select>';
}
else {
	echo "Error BD MySQL: " . mysqli_connect_error();  
}

mysqli_close($conn);

?>