<?php
session_start(); 

if (!isset($_SESSION['Nombre'])) {
	include('session_destroy.php');	
	header('Location: login.php'); exit(); 
} else {	
	$Nombre = $_SESSION['Nombre'];
}
?>