<?php
session_start(); 

if (!isset($_SESSION['Pais'])) {
	include('session_destroy.php');	
	header('Location: ../login.php'); exit(); 
} else {	
	$Pais = $_SESSION['Pais'];
	echo $Pais;
}
?>