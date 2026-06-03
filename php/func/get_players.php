<?php

require_once '../data/general_data.php';
require_once '../data/general_text.php';

$team_code = $_GET['code']; // Country Code como parámetro
$selectName = $_GET['dest'];

$conn = mysqli_connect($host, $user, $pass, $database);

// Check connection
if (!mysqli_connect_errno()) {
	$query = "SELECT * FROM " . $players_table . " WHERE Team_Code = '" . $team_code . "'";
	$list = mysqli_query($conn, $query);
	
	echo "<select id='" . $selectName . "'>";
	echo "<option value='-1'>" . $selectPlayer . "</option>";
	
	while($row = mysqli_fetch_array($list)) {
		echo '<option value="' . $row['Player_Code'] . '">' . str_pad($row['Number'], 2, '0', STR_PAD_LEFT) . " | " . 
			$row['FirstName'] . " " . $row['LastName'] . "</option>";
	}
	echo '</select>';
}
else {
	echo "Failed to connect to MySQL: " . mysqli_connect_error();  
}

mysqli_close($conn);

?>