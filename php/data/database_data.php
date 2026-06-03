<?php

$donde_estoy = 'pega';

if ($donde_estoy == 'casa') { 
	$host = 'localhost';
	$user = 'root';
	$pass = 'password';
} else if ($donde_estoy == 'pega') {
	$host = 'lnxdelorean';
	$user = 'root';
	$pass = 'hmoller';
}

$database = 'brasil2014';

$tbl_apuestas = 'apuestas';
$tbl_cartones = 'cartones';
$tbl_equipos = 'equipos';
$tbl_estadios = 'estadios';
$tbl_fixture = 'fixture';
$tbl_grupos = 'grupos';
$tbl_jugadores = 'jugadores';
$tbl_posiciones = 'posiciones';
$tbl_rondas = 'rondas';
$tbl_users = 'users';
$tbl_results = 'results';
$tbl_puntos_apuestas = 'puntos_apuestas';

$vw_fixture = 'vw_fixture';
$vw_results = 'vw_results';
$vw_results_by_group = 'vw_results_by_group';
$vw_seleccionados = 'vw_seleccionados';
$vw_ranking = 'vw_ranking';
$vw_avance_rondas = 'vw_avance_rondas';

?>