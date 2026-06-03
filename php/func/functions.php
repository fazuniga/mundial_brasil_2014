<?php
/* AUXILIARES */
function GetCodePais($Pais) {
	include '../data/database_data.php';
	$conn = mysqli_connect($host, $user, $pass, $database);
	
	$query = "SELECT Code FROM " . $tbl_equipos . " e WHERE e.Pais = '" . $Pais . "'";
	$res = mysqli_query($conn, $query);
	$code = mysqli_fetch_array($res);
	
	return $query; // $code['Code'];
}
function GetPaisCode($Code) {
	include '../data/database_data.php';
	$conn = mysqli_connect($host, $user, $pass, $database);
	
	$query = "SELECT Pais FROM " . $tbl_equipos . " e WHERE e.Code = '" . $Code . "'";
	$res = mysqli_query($conn, $query);
	$pais = mysqli_fetch_array($res);
	
	return $pais['Pais'];
}

/* LOGIN */
function GetListaPaisesLogin($conn) {
	include '../data/database_data.php';
	
	$out = "";
	
	$query = "SELECT Pais, Code FROM " . $tbl_equipos . " e WHERE e.id_equipo <= 32";
	$ListaEquipos = mysqli_query($conn, $query);
	
	$out .= "<select id='selTeamForm' class='form-control form-polla'>";
	$out .= "<option value='-1'>Selecciona de la lista</option>";
	
	while($row = mysqli_fetch_array($ListaEquipos)) {
		$out .= "<option value='" . $row['Code'] . "'>" . utf8_encode($row['Pais']) . "</option>";
	}
	$out .= '</select>';

	return trim($out);
}

/* INICIO - MAIN */
function GetRanking($conn) {
	include '../data/database_data.php';
	
	// Nombre de las Columnas
	$NombreColNumero = '#';
	$NombreColNombre = 'Nombre';
	$NombreColCarton = 'Cartón';
	$NombreColPuntos = 'Puntos';
	
	$out = "";
	$query = "SELECT * FROM " . $vw_ranking . " r WHERE r.pagado = 1 ORDER BY r.Puntos DESC, r.Nombre ASC";
	$ranking = mysqli_query($conn, $query);
	
	$out .= "<div style='margin-bottom: 10px'>" . "\r\n";
	$out .= "<span style='font-size: 2em; font-weight: bold'>Ranking</span>" . "\r\n";
	$out .= "<input type='text' class='searchInput form-control pull-right' id='searchRank' placeholder='" . 'Búscate!' . "' >" . "\r\n";
	$out .= "</div>" . "\r\n";
	
	$out .= "<div class='divHeaderRanking'>" . "\r\n";
	$out .= "<table class='table table-condensed'>" . "\r\n";
	$out .= "\t" . "<tbody>" . "\r\n";
	$out .= "\t\t" . "<tr>" . "\r\n";	
	$out .= "\t\t\t" . "<td class='NumRank'>" . $NombreColNumero . "</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='NombreRank'>" . $NombreColNombre . "</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='CartonRank'>" . $NombreColCarton . "</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='PuntosRank'>" . $NombreColPuntos . "</td>" . "\r\n";
	$out .= "\t\t" . "</tr>" . "\r\n";	
	$out .= "\t" . "</tbody>" . "\r\n";
	$out .= "</table>" . "\r\n";
	$out .= "</div>" . "\r\n";
	
	$nColumnas = 4;
	$nRanking = mysqli_num_rows($ranking);
	
	if ($nRanking == 0) { 
		$MsjNoRanking = 'Aún no hay nadie en el ranking!!';
	
		$out .= "<div id='divRanking'>" . "\r\n";
		$out .= "<table class='table table-condensed cartones-content'>" . "\r\n";
		$out .= "\t" . "<tbody>" . "\r\n";
		$out .= "\t\t" . "<tr>" . "\r\n";
		$out .= "\t\t\t" . "<td class='noRanking' colspan='" . $nColumnas . "'>" . $MsjNoRanking . "</td>" . "\r\n";
		$out .= "\t\t" . "</tr>" . "\r\n";
		$out .= "\t" . "</tbody>" . "\r\n";
		$out .= "</table>" . "\r\n";
		$out .= "</div>" . "\r\n";
		
	} else {
		$out .= "<div class='divRanking'>" . "\r\n";
		$out .= "<table class='table table-condensed'>" . "\r\n";
		$out .= "\t" . "<tbody>" . "\r\n";

		$i = 0;
		while ($rank = mysqli_fetch_array($ranking)) {
			$Nombre = utf8_encode($rank['Nombre']);
			$Carton = utf8_encode($rank['Carton']);
		
			$i = $i + 1;
			$out .= "\t\t" . "<tr>" . "\r\n";
			$out .= "\t\t" . "<td class='NumRank'>" . $i . "</td>" . "\r\n";
			$out .= "\t\t" . "<td class='NombreRank'>" . $Nombre . "</td>" . "\r\n";
			$out .= "\t\t" . "<td class='CartonRank'>" . $Carton . "</td>" . "\r\n";
			$out .= "\t\t" . "<td class='PuntosRank'>" . $rank['Puntos'] . "</td>" . "\r\n";		
			$out .= "\t\t" . "</tr>" . "\r\n";
		}
		$out .= "\t" . "</tbody>" . "\r\n";
		$out .= "</table>" . "\r\n";
		$out .= "</div>" . "\r\n";
	}
	
	return trim($out);
}
function GetNextGames($conn) {
	include '../data/database_data.php';

	$NombreColNumero = '#';
	$NombreColGrupo = 'Grupo';
	$NombreColDOW = 'DOW';
	$NombreColFecha = 'Fecha';
	$NombreColHora = 'Hora';
	$NombreColLocal = 'Local';
	$NombreColVisita = 'Visita';
	
	$out = "";
	
	$out .= "<div style='margin-bottom: 10px'>" . "\r\n";
	$out .= "<span style='font-size: 2em; font-weight: bold'>Próximos Partidos</span>" . "\r\n";
	$out .= "</div>" . "\r\n";
	
	$out .= "<div class='divHeaderNextGames'>" . "\r\n";
	$out .= "<table class='table table-condensed next-games-header'>" . "\r\n";
	$out .= "\t" . "<tbody>" . "\r\n";
	$out .= "\t\t" . "<tr>" . "\r\n";	
	$out .= "\t\t\t" . "<td class='tdMatch'>" . $NombreColNumero . "</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdGrupo'>" . $NombreColGrupo . "</td>" . "\r\n";
//	$out .= "\t\t\t" . "<td class='tdDOW'>" . $NombreColDOW . "</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdFecha'>" . $NombreColFecha . "</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdHoraNG'>" . $NombreColHora . "</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdLocal'>" . $NombreColLocal . "</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdVisita'>" . $NombreColVisita . "</td>" . "\r\n";
	$out .= "\t\t" . "</tr>" . "\r\n";	
	$out .= "\t" . "</tbody>" . "\r\n";
	$out .= "</table>" . "\r\n";
	$out .= "</div>" . "\r\n";
	
	$NextGames = 7;
		
	$query = "SET lc_time_names = 'es_ES';";
	$results = mysqli_query($conn, $query);
	
	$MinutesOffset = 71;
	
	$query = "SELECT f.Partido, f.Grupo, CONCAT('[', f.DOW, '] ', CONCAT_WS(' ', DATE_FORMAT(f.Fecha, '%d /'),"
		.	" CONCAT(UCASE(SUBSTRING(MONTHNAME(f.Fecha), 1, 1)), LCASE(SUBSTRING(MONTHNAME(f.Fecha), 2))))) as Fecha, SUBSTR(f.Hora, 1, 5) as Hora,"
		.	" f.Local, f.Visita FROM " . $vw_fixture . " f"
		.	" WHERE STR_TO_DATE(CONCAT(f.Fecha, ' ', f.Hora), '%Y-%m-%d %H:%i:%s') >= DATE_ADD(NOW(), INTERVAL -" . $MinutesOffset . " MINUTE)"
		.	" ORDER BY f.Fecha, f.Hora"
		.	" LIMIT " . $NextGames;
	$results = mysqli_query($conn, $query);
	
	$out .= "<div class='divNextGames'>" . "\r\n";
	$out .= "<table class='table table-condensed next-games'>" . "\r\n";
	$out .= "\t" . "<tbody>" . "\r\n";
	while($nextGame = mysqli_fetch_array($results)) {

		$out .= "\t\t" . "<tr>" . "\r\n";
		$out .= "\t\t\t" . "<td class='tdMatch'>" . $nextGame['Partido'] . "</td>" . "\r\n";
		$out .= "\t\t\t" . "<td class='tdGrupo'>" . $nextGame['Grupo'] . "</td>" . "\r\n";
//		$out .= "\t\t\t" . "<td class='tdDOW'>" . $nextGame['DOW'] . "</td>" . "\r\n";
		$out .= "\t\t\t" . "<td class='tdFecha'>" . $nextGame['Fecha'] . "</td>" . "\r\n";
		$out .= "\t\t\t" . "<td class='tdHoraNG'>" . substr($nextGame['Hora'], 0, 5) . "</td>" . "\r\n";
		$out .= "\t\t\t" . "<td class='tdLocal'>" . utf8_encode($nextGame['Local']) . "</td>" . "\r\n";
		$out .= "\t\t\t" . "<td class='tdVisita'>" . utf8_encode($nextGame['Visita']) . "</td>" . "\r\n";
		$out .= "\t\t" . "</tr>" . "\r\n";
	}
	$out .= "\t" . "</tbody>" . "\r\n";
	$out .= "</table>" . "\r\n";
	$out .= "</div>" . "\r\n";

	return trim($out);
}
/* FIN - MAIN */

/* INICIO - ADMIN */
function GetAdmin($conn) {
	include '../data/database_data.php';
		
	$TituloAdminCartones = '¿Quiénes han pagado?';
	$TituloAdminResults = 'Resultados del Mundial';
	
	$out = "";
	$out .= "<ul class='nav nav-tabs nav-justified ul-admin'>" . "\r\n";
	$out .= "\t" . "<li class='active'>";
	$out .= "\t\t" . "<a class='pill-admin' data-toggle='tab' href='#AdminUsers'>" . $TituloAdminCartones . "</a>" . "\r\n";
	$out .= "\t" . "</li>" . "\r\n";
	$out .= "\t" . "<li class=''>";
	$out .= "\t\t" . "<a class='pill-admin' data-toggle='tab' href='#AdminResults'>" . $TituloAdminResults . "</a>" . "\r\n";
	$out .= "\t" . "</li>" . "\r\n";
	$out .= "</ul>" . "\r\n";
	
	// Contenido de cada ronda
	$out .= "<div class='tab-content'>" . "\r\n";
	$out .= "\t" . "<div id='AdminUsers' class='tab-pane active' >";
	$out .= GetAdminCartones($conn) . "\r\n";
	$out .= "\t" . "</div>" . "\r\n";
	$out .= "\t" . "<div id='AdminResults' class='tab-pane' >";
	$out .= GetAdminResults($conn) . "\r\n";
	$out .= "\t" . "</div>" . "\r\n";
	$out .= "</div>" . "\r\n";
	
	return trim($out);
}
function GetAdminCartones($conn) {
	include '../data/database_data.php';
	
	// Nombre de las Columnas
	$NombreColNumero = 'ID';
	$NombreColNombre = 'Nombre';
	$NombreColCarton = 'Cartón';
	$NombreColPagado = '¿Pagado?';
	
	$out = "";
	$query = "SELECT c.id_carton, u.Nombre, u.Apellido, c.descripcion, c.pagado FROM " . $tbl_cartones . " c JOIN " . $tbl_users . " u ON c.id_user = u.id_user";
	$ranking = mysqli_query($conn, $query);
	
	/*
	$out .= "<div style='margin-bottom: 10px'>" . "\r\n";
	$out .= "<span style='font-size: 2em; font-weight: bold'>¿Han pagado?</span>" . "\r\n";
	$out .= "</div>" . "\r\n";
	*/

	$out .= "<div style='margin-bottom: 10px; height: 30px; line-height: 30px'>" . "\r\n";
	$out .= "<button type='submit' class='btn btn-danger pull-right' id='btnUpdateCartonPagado'>" . 'Actualizar Datos' . "</button>" . "\r\n";
	$out .= "<input type='text' class='searchInput form-control pull-left' id='searchCarton' placeholder='" . 'Filtra por Nombre' . "' >" . "\r\n";
	$out .= "</div>" . "\r\n";
	
	$out .= "<div class='divHeaderAdminCartones'>" . "\r\n";
	$out .= "<table class='table table-condensed admin-cartones-header'>" . "\r\n";
	$out .= "\t" . "<tbody>" . "\r\n";
	$out .= "\t\t" . "<tr>" . "\r\n";	
	$out .= "\t\t\t" . "<td class='NumRank'>" . $NombreColNumero . "</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='NumRank hidden'></td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='NombreRank'>" . $NombreColNombre . "</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='CartonRank'>" . $NombreColCarton . "</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='CartonPagado'>" . $NombreColPagado . "</td>" . "\r\n";
	$out .= "\t\t" . "</tr>" . "\r\n";	
	$out .= "\t" . "</tbody>" . "\r\n";
	$out .= "</table>" . "\r\n";
	$out .= "</div>" . "\r\n";
	
	$nColumnas = 5;
	$nRanking = mysqli_num_rows($ranking);
	
	if ($nRanking == 0) { 
		$MsjNoCarton = 'Nadie ha creado ningún cartón!!';
	
		$out .= "<div id='divAdminCartones'>" . "\r\n";
		$out .= "<table class='table table-condensed admin-cartones'>" . "\r\n";
		$out .= "\t" . "<tbody>" . "\r\n";
		$out .= "\t\t" . "<tr>" . "\r\n";
		$out .= "\t\t\t" . "<td class='noRanking' colspan='" . $nColumnas . "'>" . $MsjNoCarton . "</td>" . "\r\n";
		$out .= "\t\t" . "</tr>" . "\r\n";
		$out .= "\t" . "</tbody>" . "\r\n";
		$out .= "</table>" . "\r\n";
		$out .= "</div>" . "\r\n";
		
	} else {
		$out .= "<div class='divAdminCartones'>" . "\r\n";
		$out .= "<table class='table table-condensed admin-cartones'>" . "\r\n";
		$out .= "\t" . "<tbody>" . "\r\n";

		$i = 0;
		while ($rank = mysqli_fetch_array($ranking)) {
			$Nombre = utf8_encode($rank['Nombre'] . " " . $rank['Apellido']);
			$Carton = utf8_encode($rank['descripcion']);
			
			$sel = "";
			$sel .= "<select>" . "\r\n";
			// $sel .= "\t" . "<option value='-1'>¿Pagado?</option>" . "\r\n";
			if ($rank['pagado'] == 0) {
				$sel .= "\t" . "<option value='0' selected='selected'>No</option>" . "\r\n";
				$sel .= "\t" . "<option value='1'>Sí</option>" . "\r\n";
			} else if ($rank['pagado'] == 1) {
				$sel .= "\t" . "<option value='0'>No</option>" . "\r\n";
				$sel .= "\t" . "<option value='1' selected='selected'>Sí</option>" . "\r\n";
			}
			$sel .= "</select>";
		
			$i = $i + 1;
			$out .= "\t\t" . "<tr>" . "\r\n";
			$out .= "\t\t" . "<td class='NumRank'>" . $i . "</td>" . "\r\n";
			$out .= "\t\t" . "<td class='NumRank hidden'>" . $rank['id_carton'] . "</td>" . "\r\n";
			$out .= "\t\t" . "<td class='NombreRank'>" . $Nombre . "</td>" . "\r\n";
			$out .= "\t\t" . "<td class='CartonRank'>" . $Carton . "</td>" . "\r\n";
			$out .= "\t\t" . "<td class='CartonPagado'>" . $sel . "</td>" . "\r\n";		
			$out .= "\t\t" . "</tr>" . "\r\n";
		}
		$out .= "\t" . "</tbody>" . "\r\n";
		$out .= "</table>" . "\r\n";
		$out .= "</div>" . "\r\n";
	}
	
	return trim($out);
}
function GetAdminResults($conn) {
	include '../data/database_data.php';

	$query = 	"SELECT f.* FROM " . $vw_results . " f";
	$resultados = mysqli_query($conn, $query);

	$out = "";
	/*
	$out .= "<div style='margin-bottom: 10px'>" . "\r\n";
	$out .= "<span style='font-size: 2em; font-weight: bold'>Resultados del Mundial</span>" . "\r\n";
	$out .= "</div>" . "\r\n";
	*/
	
	$out .= "<div style='margin-bottom: 10px; height: 30px; line-height: 30px'>" . "\r\n";
	$out .= "<button type='submit' class='btn btn-danger pull-right' id='btnUpdateResultados'>" . 'Actualizar Resultados' . "</button>" . "\r\n";
	$out .= "<input type='text' class='searchInput form-control pull-left' id='searchRonda' placeholder='" . 'Filtra por Ronda' . "' maxlength='1' >" . "\r\n";
	$out .= "</div>" . "\r\n";
	
	$out .= "<div class='padR-scroll'>";
	$out .= ResultadosHeader(0);
	$out .= "</div>";
	
	$out .= "<div class='max-height divAdminResults'>" . "\r\n";
	$out .= "<table id='table-results' class='table resultados'>" . "\r\n";

	while($row = mysqli_fetch_array($resultados)) {
		$codeL = strtolower(utf8_encode($row['CodeL']));
		$codeV = strtolower(utf8_encode($row['CodeV']));
		
		if ($codeL == 'en') { $codeL = 'england'; }
		if ($codeV == 'en') { $codeV = 'england'; }
		
		$Partido   = $row['Partido'];
		$Ronda	   = $row['id_ronda'];
		$Grupo     = $row['Grupo'];
		$Local     = utf8_encode($row['eLocal']);
		$Visita    = utf8_encode($row['eVisita']);
//		$FechaHora = $row['Fecha'] . " - " . $row['Hora'];
		$GL = $row['gLocal'];
		$GV = $row['gVisita'];
		$GLPT = $row['gLocal_PT'];
		$GVPT = $row['gVisita_PT'];
		$MinutoPG = $row['Minuto_PG'];
		$id_jpg = $row['id_jugador_pg'];
		$JugadorPG = JugadoresLocalVisita($conn, $Partido, 1, $id_jpg);
		
		$GLTE = $row['gLocal_OT'];
		$GVTE = $row['gVisita_OT'];
		$PenL = $row['penales_Local'];
		$PenV = $row['penales_Visita'];
	
		$out .= "\t" . "<tr>" . "\r\n";
		$out .= "\t\t" . "<td class='tdMatchR'>" . $Partido . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdGrupoR'>" . $Grupo . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdRondaR'>" . $Ronda . "</td>" . "\r\n";
//		$out .= "\t\t" . "<td>" . $FechaHora . "</td>" . "\r\n";

		$out .= "\t\t" . "<td class='arEquipoR rLocal'>" . $Local . "</td>" . "\r\n";
/* L */ $out .= "\t\t" . "<td class='med-flags'><img src='../img/blank.gif' class='flag flag-" . $codeL . "' alt='" . $Local . "' /></td>" . "\r\n";
		$out .= "\t\t" . "<td class='right tdScore GolesLocal'><input type='text' value='" . htmlspecialchars($GL) . "' class='input-goles-apuesta' /></td>" . "\r\n"; 

		$out .= "\t\t" . "<td class='eft tdScore GolesVisita'><input type='text' value='" . htmlspecialchars($GV) . "' class='input-goles-apuesta' /></td>" . "\r\n";
/* V */ $out .= "\t\t" . "<td class='med-flags'><img src='../img/blank.gif' class='flag flag-" . $codeV . "' alt='" . $Visita . "' /></td>" . "\r\n";
		$out .= "\t\t" . "<td class='arEquipoR rVisita'>" . $Visita . "</td>" . "\r\n";
				
		$out .= "\t\t" . "<td class='tdMinutoR'><input type='text' value='" . htmlspecialchars($MinutoPG) . "' class='input-minuto-apuesta'/></td>" . "\r\n";
		$out .= "\t\t" . "<td class='LocalPTR' style='padding-right: 3px'><input type='text' value='" . htmlspecialchars($GLPT) . "' class='input-goles-apuesta'/></td>" . "\r\n";
		$out .= "\t\t" . "<td class='VisitaPTR' style='padding-left: 3px'><input type='text' value='" . htmlspecialchars($GVPT) . "' class='input-goles-apuesta'/></td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdJugPrimerGolR'>" . $JugadorPG . "</td>" . "\r\n";

		if ($Ronda == 1) { // En Fase de Grupos, no hay penales
/* L */		$out .= "\t\t" . "<td class='LocalTER' style='padding-right: 3px'><input type='text' value='" . htmlspecialchars($GLTE) . "' class='input-goles-apuesta' disabled='disabled' /></td>" . "\r\n";
/* V */ 	$out .= "\t\t" . "<td class='VisitaTER' style='padding-left: 3px'><input type='text' value='" . htmlspecialchars($GVTE) . "' class='input-goles-apuesta' disabled='disabled' /></td>" . "\r\n";
/* L */ 	$out .= "\t\t" . "<td class='LocalPeR' style='padding-right: 3px'><input type='text' value='" . htmlspecialchars($PenL) . "' class='input-goles-apuesta' disabled='disabled' /></td>" . "\r\n";
/* V */ 	$out .= "\t\t" . "<td class='VisitaPeR' style='padding-left: 3px'><input type='text' value='" . htmlspecialchars($PenV) . "' class='input-goles-apuesta' disabled='disabled' /></td>" . "\r\n";
		} else {
/* L */		$out .= "\t\t" . "<td class='LocalTER' style='padding-right: 3px'><input type='text' value='" . htmlspecialchars($GLTE) . "' class='input-goles-apuesta'/></td>" . "\r\n";
/* V */ 	$out .= "\t\t" . "<td class='VisitaTER' style='padding-left: 3px'><input type='text' value='" . htmlspecialchars($GVTE) . "' class='input-goles-apuesta'/></td>" . "\r\n";
/* L */ 	$out .= "\t\t" . "<td class='LocalPeR' style='padding-right: 3px'><input type='text' value='" . htmlspecialchars($PenL) . "' class='input-goles-apuesta'/></td>" . "\r\n";
/* V */ 	$out .= "\t\t" . "<td class='VisitaPeR' style='padding-left: 3px'><input type='text' value='" . htmlspecialchars($PenV) . "' class='input-goles-apuesta'/></td>" . "\r\n";		
		}
		
		$out .= "\t" . "</tr>" . "\r\n";
	}
	$out .= "</table>" . "\r\n";
	$out .= "</div>" . "\r\n";
	
	return trim($out);
}
function UpdateCartonesPagados($conn, $id_carton, $pagado) {
	include '../data/database_data.php';

	$queryUpdate = "UPDATE " . $tbl_cartones . " SET pagado = " . $pagado . " WHERE id_carton = " . $id_carton;
	$UpdateCarton = mysqli_query($conn, $queryUpdate);
	
	return $UpdateCarton ? 'true: ' . $queryUpdate : 'false: ' . $queryUpdate;
}
function UpdateResults($conn, $Resultados) {
	include '../data/database_data.php';
	
	$Match 		     = $Resultados['Match'];
	$GolesLocal      = $Resultados['GolesLocal'];
	$GolesVisita     = $Resultados['GolesVisita'];
	$GolesLocalPT    = $Resultados['GolesLocalPT'];
	$GolesVisitaPT   = $Resultados['GolesVisitaPT'];
	$MinutoPrimerGol = $Resultados['MinutoPrimerGol'];
	$JugPrimerGol    = $Resultados['JugPrimerGol'];
	
	$GolesLocalTE	 = $Resultados['GolesLocalTE'];
	$GolesVisitaTE	 = $Resultados['GolesVisitaTE'];
	$PenalesLocal	 = $Resultados['PenalesLocal'];
	$PenalesVisita   = $Resultados['PenalesVisita'];

	$query = 	"UPDATE " . $tbl_results
			. 	" SET goles_local = " . $GolesLocal
			. 	", goles_visita = " . $GolesVisita
			. 	", goles_local_pt = " . $GolesLocalPT
			. 	", goles_visita_pt = " . $GolesVisitaPT
			. 	", minuto_primer_gol = " . $MinutoPrimerGol
			. 	", id_jugador_primer_gol = " . $JugPrimerGol
			. 	", goles_local_ot = " . $GolesLocalTE
			. 	", goles_visita_ot = " . $GolesVisitaTE
			. 	", penales_local = " . $PenalesLocal
			. 	", penales_visita = " . $PenalesVisita
			.	" WHERE id_match = " . $Match;
	$result = mysqli_query($conn, $query);
	
	if (!$result) { return 'false'; }
	else { return 'true'; }
}
/* FIN - ADMIN */

/* GRUPOS */
function GetResultsByGroup($conn) {
	include '../data/database_data.php';

	$out = "";
	
	$qGrupos = "SELECT Grupo FROM " . $tbl_grupos . " WHERE id_grupo <= 8";
	$rGrupos = mysqli_query($conn, $qGrupos);
	
	while($Grupo = mysqli_fetch_array($rGrupos)) {
		$out .= "<div class='col-xs-4'>" . "\r\n";
		$out .= "\t" . "<div class='panel panel-warning group-border'>" . "\r\n";
		$out .= "\t\t" . "<div class='panel-heading'>" . "\r\n";
		$out .= "\t\t\t" . "<h2 class='panel-title'>Grupo " . $Grupo['Grupo'] . "</h2>" . "\r\n";
		$out .= "\t\t" . "</div>" . "\r\n";
		$out .= "\t\t" . "<div class='panel-body'>" . "\r\n";

		$out .= "\t\t\t". "<table class='table table-condensed group-table'>" . "\r\n";
		$out .= "\t\t\t\t". "<thead>" . "\r\n";
		$out .= "\t\t\t\t\t". "<th class='tdNumeroGrupos'>#</th>" . "\r\n";
		$out .= "\t\t\t\t\t". "<th></th>" . "\r\n";
		$out .= "\t\t\t\t\t". "<th class='tdEquipoGrupos'>Equipo</th>" . "\r\n";		
		$out .= "\t\t\t\t\t". "<th class='tdPuntosGrupos'>J</th>" . "\r\n";
		$out .= "\t\t\t\t\t". "<th class='tdPuntosGrupos'>G</th>" . "\r\n";
		$out .= "\t\t\t\t\t". "<th class='tdPuntosGrupos'>E</th>" . "\r\n";
		$out .= "\t\t\t\t\t". "<th class='tdPuntosGrupos'>P</th>" . "\r\n";
		$out .= "\t\t\t\t\t". "<th class='tdPuntosGrupos'>GF</th>" . "\r\n";
		$out .= "\t\t\t\t\t". "<th class='tdPuntosGrupos'>GC</th>" . "\r\n";
		$out .= "\t\t\t\t\t". "<th class='tdPuntosGrupos'>DG</th>" . "\r\n";
		$out .= "\t\t\t\t\t". "<th>Pts.</th>" . "\r\n";
		$out .= "\t\t\t\t". "</thead>" . "\r\n";

		$out .= "\t\t\t\t". "<tbody>";
	
		$qResGrupo = "SELECT * FROM " . $vw_results_by_group . " WHERE Grupo = '" . $Grupo['Grupo'] . "'" .
		"ORDER BY Puntos DESC, `Diferencia de Goles` DESC, `Goles a Favor` DESC, ID ASC";
		
		$rResGrupo = mysqli_query($conn, $qResGrupo);
		
		while($row = mysqli_fetch_array($rResGrupo)) {
			$Codigo = strtolower($row['Codigo']);
			if ($Codigo == 'en') { $Codigo = 'england'; }
			
			$Equipo  = utf8_encode($row['Equipo']);
			$Jugados = $row['Jugados'];
			$Victorias = $row['Victorias'];
			$Empates = $row['Empates'];
			$Derrotas = $row['Derrotas'];
			$GF = $row['Goles a Favor'];
			$GC = $row['Goles en Contra'];
			$DG = $row['Diferencia de Goles'];
			$Puntos = $row['Puntos'];
				
			$out .= "\t\t\t\t\t" . "<tr>" . "\r\n";
			$out .= "\t\t\t\t\t\t" . "<td class='tdNumeroGrupos'>" . $row['ID'] . "</td>" . "\r\n";
			$out .= "\t\t\t\t\t\t" . "<td><img src='../img/blank.gif' class='flag flag-" . $Codigo . "' alt='" . $Equipo . "' /></td>" . "\r\n";
			$out .= "\t\t\t\t\t\t" . "<td class='tdEquipoGrupos'>" . $Equipo . "</td>" . "\r\n";
			$out .= "\t\t\t\t\t\t" . "<td class='tdPuntosGrupos'>" . $Jugados . "</td>" . "\r\n";
			$out .= "\t\t\t\t\t\t" . "<td class='tdPuntosGrupos'>" . $Victorias . "</td>" . "\r\n";
			$out .= "\t\t\t\t\t\t" . "<td class='tdPuntosGrupos'>" . $Empates . "</td>" . "\r\n";
			$out .= "\t\t\t\t\t\t" . "<td class='tdPuntosGrupos'>" . $Derrotas . "</td>" . "\r\n";
			$out .= "\t\t\t\t\t\t" . "<td class='tdPuntosGrupos'>" . $GF . "</td>" . "\r\n";
			$out .= "\t\t\t\t\t\t" . "<td class='tdPuntosGrupos'>" . $GC . "</td>" . "\r\n";
			$out .= "\t\t\t\t\t\t" . "<td class='tdPuntosGrupos'>" . $DG . "</td>" . "\r\n";
			$out .= "\t\t\t\t\t\t" . "<td>" . $Puntos . "</td>" . "\r\n";
			$out .= "\t\t\t\t\t" . "</tr>" . "\r\n";	
		}
		
		$out .= "\t\t\t\t". "</tbody>" . "\r\n";
		$out .= "\t\t\t". "</table>" . "\r\n";
		$out .= "\t\t" . "</div>" . "\r\n";
		$out .= "\t" . "</div>" . "\r\n";
		$out .= "</div>" . "\r\n";
	}
		
	return trim($out);
}
/**/

/* INICIO SELECCIONES */
function BuildTabsGrupos($conn) {
	include '../data/database_data.php';
	/* Opcion: Tabs o Pills */
	$activa_tabs = 0;
	if ($activa_tabs == 1) { $modo = 'tabs'; } else { $modo = 'pills'; }

	$out = "";

	$qGrupos = "SELECT Grupo FROM " . $tbl_grupos;
	$rGrupos = mysqli_query($conn, $qGrupos);

	$out .= "<ul class='nav nav-stacked pull-left'>";
	$c = 1;
	
	while($Grupo = mysqli_fetch_array($rGrupos)) {
		$out .= "\t" . "<li class='dropdown'>";
		$out .= "\t\t" . "<a id='dropGrupo" . $Grupo['Grupo'] . "' href='#Grupo" . $Grupo['Grupo'] . "' data-toggle='dropdown'>";
		$out .= "Grupo " . $Grupo['Grupo'] . " <b class='caret'></b></a>";
		$out .= "\t\t\t" . DropCountries($conn, $Grupo['Grupo']);
		$out .= "\t" . "</li>";
	}
	$out .= "</ul>";
	return trim($out);
}
function DropCountries($conn, $Grupo) {
	include '../data/database_data.php';
	
	$out = "";
	
	$query = 	"SELECT e.Pais, e.Code "
			. 	"FROM " . $tbl_grupos . " g JOIN " . $tbl_equipos . " e ON g.id_grupo = e.id_grupo "
			.	"WHERE grupo = '" . $Grupo . "' AND id_equipo <= 32";
	$result = mysqli_query($conn, $query);
			
	$out .= "<ul class='dropdown-menu' role='menu' aria-labelledby='dropGrupo" . $Grupo . "'>";
		
	while($Equipo = mysqli_fetch_array($result)) {
		$out .= "<li role='presentation'>";	
		
		$Pais = utf8_encode($Equipo['Pais']);
		$Code = strtolower($Equipo['Code']);
		if ($Code == 'en') { $Code = 'england'; }		
		
		$out .= 	"<a href='#' role='menuitem=' tabIndex='-1'>"
				.	"<img src='../img/blank.gif' class='flag flag-" . $Code . "' alt='" . $Pais . "' /> "
				.	$Pais . "</a><span class='hidden'>" . $Equipo['Code'] . "</span></li>";
	}
	$out .= "</ul>";
	
	$statsEquipo = "";
	$result = mysqli_query($conn, $query);
	while($Equipo = mysqli_fetch_array($result)) {
		$Pais = utf8_encode($Equipo['Pais']);
		$statsEquipo .= StatsEquipo($conn, $Pais);
	}

	return trim($out);
}
function StatsEquipo($conn, $CodigoPais) {
	include '../data/database_data.php';	
	$out = "";
	
	$Pais = GetPaisCode($CodigoPais);
	
	/* Lista de los seleccionados */
	$ListaJugadores = ListaJugadores($conn, $Pais);
	
	/* En qué equipos juegan los seleccionados */
	$EquiposJugadores = EquiposJugadores($conn, $Pais);
	
	/* En qué países juegan los seleccionados */
	$PaisesJugadores = PaisesJugadores($conn, $Pais);
	
	// Lista de los tabs - Jugadores / ¿En qué equipos juegan? / ¿En qué países juegan?
	$out .= "\r\n";
	$out .= "<div class='tab-content'>" . "\r\n";
	$out .= "\t" . "<div class='tab-pane active' id='Jugadores'>" . $ListaJugadores . "</div>" . "\r\n";
	$out .= "\t" . "<div class='tab-pane' id='EnQueEquiposJuegan'>" . $EquiposJugadores . "</div>" . "\r\n";
	$out .= "\t" . "<div class='tab-pane' id='EnQuePaisesJuegan'>" . $PaisesJugadores . "</div>" . "\r\n";
	$out .= "</div>" . "\r\n";

	return trim($out);
}
function ListaJugadores($conn, $Pais) {
	include '../data/database_data.php';
	
	$NombreColNumero = '#';
	$NombreColNombre = 'Nombre';
	$NombreColPosicion = 'Posición';
	$NombreColClub = 'Club';
	$NombreColPaisClub = 'País del Club';
	
	$query = "SELECT * FROM " . $vw_seleccionados . " WHERE Pais = '" . $Pais . "'";	
	$results = mysqli_query($conn, $query);
	$nr = mysqli_num_rows($results);

	$ListaJugadores = "";
	
//	$ListaJugadores .= $Pais;
	
	$ListaJugadores .= "\t" . "<table class='table table-condensed stats-equipos-header'>" . "\r\n";
	$ListaJugadores .= "\t\t" . "<tbody>" . "\r\n";
	$ListaJugadores .= "\t\t\t" . "<tr>" . "\r\n";
	$ListaJugadores .= "\t\t\t\t" . "<td class='thStatsNumero'>" . $NombreColNumero . "</td>" . "\r\n";
	$ListaJugadores .= "\t\t\t\t" . "<td class='thStatsNombre'>" . $NombreColNombre . "</td>" . "\r\n";
	$ListaJugadores .= "\t\t\t\t" . "<td class='thStatsPosicion'>" . $NombreColPosicion . "</td>" . "\r\n";
	$ListaJugadores .= "\t\t\t\t" . "<td class='thStatsClub'>" . $NombreColClub . "</td>" . "\r\n";
	$ListaJugadores .= "\t\t\t\t" . "<td>" . $NombreColPaisClub . "</td>" . "\r\n";
	$ListaJugadores .= "\t\t\t" . "</tr>" . "\r\n";
	$ListaJugadores .= "\t\t" . "</tbody>" . "\r\n";
	$ListaJugadores .= "\t" . "</table>" . "\r\n";

	$ListaJugadores .= "<div id='tblJugadores' style='overflow: auto; height: 355px;'>" . "\r\n";
	$ListaJugadores .= "<table class='table table-condensed table-hover stats-equipos'>" . "\r\n";
	$ListaJugadores .= "\t" . "<tbody>" . "\r\n";
	
	$j = 1;
	while($Jugador = mysqli_fetch_array($results)) {
		$Nombre = utf8_encode($Jugador['Nombre']);
		$Posicion = utf8_encode($Jugador['Posicion']);
		$Club = utf8_encode($Jugador['Club']);
		$PaisClub = utf8_encode($Jugador['Pais del Club']);
	
		$ListaJugadores .= "\t\t" . "<tr>" . "\r\n";
		$ListaJugadores .= "\t\t\t" . "<td class='thStatsNumero'>" . $j . "</td>" . "\r\n";
		$ListaJugadores .= "\t\t\t" . "<td class='thStatsNombre'>" . $Nombre . "</td>" . "\r\n";
		$ListaJugadores .= "\t\t\t" . "<td class='thStatsPosicion'>" . $Posicion . "</td>" . "\r\n";
		$ListaJugadores .= "\t\t\t" . "<td class='thStatsClub'>" . $Club . "</td>" . "\r\n";
		$ListaJugadores .= "\t\t\t" . "<td>" . $PaisClub . "</td>" . "\r\n";
		$ListaJugadores .= "\t\t" . "</tr>" . "\r\n";
		$j = $j + 1;
	}
	$ListaJugadores .= "\t" . "</tbody>" . "\r\n";
	$ListaJugadores .= "</table>" . "\r\n";
	$ListaJugadores .= "</div>" . "\r\n";
	
	return $ListaJugadores;
}
function EquiposJugadores($conn, $Pais) {
	include '../data/database_data.php';
	
	$NombreColNumero = '#';
	$NombreColClub = 'Club';
	$NombreColJugadores = 'Jugadores';
	
	$query = "SELECT Pais, Club, COUNT(*) AS Jugadores "
	.	"FROM " . $vw_seleccionados . " "
	.	"WHERE Pais = '" . $Pais . "' "
	.	"GROUP BY Pais, Club ORDER BY Pais, Jugadores DESC, Club";
	$results = mysqli_query($conn, $query);
	
	$EquiposJugadores = "";
	$EquiposJugadores .= "\t" . "<table class='table table-condensed stats-equipos-header'>" . "\r\n";
	$EquiposJugadores .= "\t\t" . "<tbody>" . "\r\n";
	$EquiposJugadores .= "\t\t\t" . "<tr>" . "\r\n";
	$EquiposJugadores .= "\t\t\t\t" . "<td class='thStatsNumero'>" . $NombreColNumero . "</td>" . "\r\n";
	$EquiposJugadores .= "\t\t\t\t" . "<td class='thStatsClub2'>" . $NombreColClub . "</td>" . "\r\n";
	$EquiposJugadores .= "\t\t\t\t" . "<td class='thStatsNumero-'>" . $NombreColJugadores . "</td>" . "\r\n";
	$EquiposJugadores .= "\t\t\t" . "</tr>" . "\r\n";
	$EquiposJugadores .= "\t\t" . "</tbody>" . "\r\n";
	$EquiposJugadores .= "\t" . "</table>" . "\r\n";

	$EquiposJugadores .= "<div id='tblEquiposJugadores' style='overflow: auto; height: 335px;'>" . "\r\n";
	$EquiposJugadores .= "<table class='table table-condensed table-hover stats-equipos'>" . "\r\n";
	$EquiposJugadores .= "\t" . "<tbody>" . "\r\n";
	
	$j = 1;
	while($Equipo = mysqli_fetch_array($results)) {
		$Club = utf8_encode($Equipo['Club']);
	
		$EquiposJugadores .= "\t\t" . "<tr>" . "\r\n";
		$EquiposJugadores .= "\t\t\t" . "<td class='thStatsNumero'>" . $j . "</td>" . "\r\n";
		$EquiposJugadores .= "\t\t\t" . "<td class='thStatsClub2'>" . $Club . "</td>" . "\r\n";
		$EquiposJugadores .= "\t\t\t" . "<td class='thStatsNumero-'>" . $Equipo['Jugadores'] . "</td>" . "\r\n";
		$EquiposJugadores .= "\t\t" . "</tr>" . "\r\n";
		$j = $j + 1;
	}
	$EquiposJugadores .= "\t" . "</tbody>" . "\r\n";
	$EquiposJugadores .= "</table>" . "\r\n";
	$EquiposJugadores .= "</div>" . "\r\n";	
	
	return $EquiposJugadores;
}
function PaisesJugadores($conn, $Pais) {
	include '../data/database_data.php';
	
	$query = "SELECT Pais, `Pais del Club`, COUNT(*) AS Jugadores "
	.	"FROM " . $vw_seleccionados . " "
	.	"WHERE Pais = '" . $Pais . "' "
	.	"GROUP BY Pais, `Pais del Club` ORDER BY Pais, Jugadores DESC, `Pais del Club`";
	$results = mysqli_query($conn, $query);
	
	$ColNumero = '#';
	$ColPaisClub = 'País del Club';
	$ColJugadores = 'Jugadores';
	
	$PaisesJuegan = "";
	$PaisesJuegan .= "\t" . "<table class='table table-condensed stats-equipos-header'>" . "\r\n";
	$PaisesJuegan .= "\t\t" . "<tbody>" . "\r\n";
	$PaisesJuegan .= "\t\t\t" . "<tr>" . "\r\n";
	$PaisesJuegan .= "\t\t\t\t" . "<td class='thStatsNumero'>" . $ColNumero . "</td>" . "\r\n";
	$PaisesJuegan .= "\t\t\t\t" . "<td class='thStatsPais'>" . $ColPaisClub . "</td>" . "\r\n";
	$PaisesJuegan .= "\t\t\t\t" . "<td class='thStatsNumero-'>". $ColJugadores . "</td>" . "\r\n";
	$PaisesJuegan .= "\t\t\t" . "</tr>" . "\r\n";
	$PaisesJuegan .= "\t\t" . "</tbody>" . "\r\n";
	$PaisesJuegan .= "\t" . "</table>" . "\r\n";

	$PaisesJuegan .= "<div id='tblPaisesJuegan' style='overflow: auto; height: 335px;'>" . "\r\n";
	$PaisesJuegan .= "<table class='table table-condensed table-hover stats-equipos'>" . "\r\n";
	$PaisesJuegan .= "\t" . "<tbody>" . "\r\n";
	
	$j = 1;
	while($Pais = mysqli_fetch_array($results)) {
		$PaisClub = utf8_encode($Pais['Pais del Club']);
		
		$PaisesJuegan .= "\t\t" . "<tr>" . "\r\n";
		$PaisesJuegan .= "\t\t\t" . "<td class='thStatsNumero'>" . $j . "</td>" . "\r\n";
		$PaisesJuegan .= "\t\t\t" . "<td class='thStatsPais'>" . $PaisClub . "</td>" . "\r\n";
		$PaisesJuegan .= "\t\t\t" . "<td class='thStatsNumero-'>" . $Pais['Jugadores'] . "</td>" . "\r\n";
		$PaisesJuegan .= "\t\t" . "</tr>" . "\r\n";
		$j = $j + 1;
	}
	$PaisesJuegan .= "\t" . "</tbody>" . "\r\n";
	$PaisesJuegan .= "</table>" . "\r\n";
	$PaisesJuegan .= "</div>" . "\r\n";	
	
	return $PaisesJuegan;
}
/* FIN SELECCIONES */

/* INICIO APUESTAS */
function GetPillsRondas($conn) {
	include '../data/database_data.php';
	
	$out = "";
	
	$query = " SELECT r.id_ronda, r.nombre_ronda, ar.Activa AS activa"
		.	" FROM " . $tbl_rondas . " r"
		.	" JOIN " . $vw_avance_rondas . " ar ON ar.id_ronda = r.id_ronda";
	
	$rondas = mysqli_query($conn, $query);
	
	$out .= "<ul class='nav nav-pills nav-justified ul-rondas'>" . "\r\n";
	
	$iRonda = 0;
	while($ronda = mysqli_fetch_array($rondas)) { if ($ronda['activa'] == 1) { $iRonda++; } }
	
	$rondas = mysqli_query($conn, $query);
	while ($ronda = mysqli_fetch_array($rondas)) {
		if ($ronda['activa'] == 0) { $out .= "\t" . "<li class='disabled'"; }
		else if ($ronda['activa'] == 1) { $out .= "\t" . "<li"; }
		
		if ($ronda['id_ronda'] == $iRonda) { $out .= " class='active'>"; }
		else { $out .= ">"; }
		
		$out .= "<a class='pill-ronda-" . $ronda['id_ronda'] . "' data-toggle='pill' href='#";
		if ($ronda['activa'] == 0) { $out .= "'>" . $ronda['nombre_ronda'] . "</a></li>" . "\r\n"; }
		else { $out .= "AR" . $ronda['id_ronda'] . "'>" . $ronda['nombre_ronda'] . "</a></li>" . "\r\n"; }
	}
	$out .= "</ul>" . "\r\n";
		
	return trim($out);
}
function ApuestasHeader() {
	$out = "";
	
	$out .= "<table class='table apuestas-header table-apuestas' style='width: auto;'>" . "\r\n";
	$out .= "\t" . "<tbody>" . "\r\n";
//	$out .= "\t\t" . "<tr>" . "\r\n";
//	$out .= "\t\t\t" . "<td class='tdMatch'></td>" . "\r\n";
//	$out .= "\t\t\t" . "<td class='tdGrupo'></td>" . "\r\n";
//	$out .= "\t\t\t" . "<td class='arEquipo' colspan='6'>Apuesta Básica</td>" . "\r\n";
//	$out .= "\t\t\t" . "<td class='tdMinuto' colspan='3'>¡Puntos de BONUS!</td>" . "\r\n";
//	$out .= "\t\t\t" . "<td class='tdMinuto' colspan='7'>Desglose de Puntos</td>" . "\r\n";
//	$out .= "\t\t" . "</tr>" . "\r\n";
	$out .= "\t\t" . "<tr class='bg-success'>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdMatch'>#</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdGrupo'>Grupo</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='arEquipo rLocal'>Local</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='med-flags'></td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='right tdScore'></td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='left tdScore'></td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='med-flags'></td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='arEquipo rVisita'>Visita</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdMinuto'>Minuto 1° Gol</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdMarcadorPT'>Marcador (1T)</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdJugPrimerGol'>Jugador 1° Gol</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdPuntos'>Marcador Exacto</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdPuntos'>Diferencia Goles</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdPuntos'>Result.</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdPuntos'>Minuto 1° Gol</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdPuntos'>Marcador (1T)</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdPuntos'>Jugador 1° Gol</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdPuntos'>Total</td>" . "\r\n";
	$out .= "\t\t" . "</tr>" . "\r\n";
	$out .= "\t" . "</tbody>" . "\r\n";
	$out .= "</table>" . "\r\n";
	
	return trim($out);
}
function BuildTableApuestas($conn) {
	include '../data/database_data.php';

	$query = "SELECT * FROM " . $vw_fixture . " f JOIN " . $vw_avance_rondas . " ar ON f.id_ronda = ar.id_ronda WHERE ar.Activa = 1";
	$result = mysqli_query($conn, $query);
	
	$out = "";
	
	$out .= "<table id='templ-Apuestas' class='table apuestas table-apuestas' style='width: auto;'>" . "\r\n";

	while($row = mysqli_fetch_array($result)) {
		$codeL = strtolower(utf8_encode($row['CodeL']));
		$codeV = strtolower(utf8_encode($row['CodeV']));
		
		if ($codeL == 'en') { $codeL = 'england'; }
		if ($codeV == 'en') { $codeV = 'england'; }
		
		$Partido = $row['Partido'];
		$Grupo  = utf8_encode(utf8_decode($row['Grupo']));
		$Local  = utf8_encode(utf8_decode($row['Local']));
		$Visita = utf8_encode(utf8_decode($row['Visita']));
		$FechaHora = utf8_encode($row['Fecha']) . "T" . utf8_encode($row['Hora']);
		$Enabled = $row['enabled'];
	
		$out .= "\t" . "<tr>" . "\r\n";
		$out .= "\t\t" . "<td class='tdMatch'>" . $Partido . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdGrupo'>" . $Grupo . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdHora hidden'>" . $FechaHora . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='arEquipo rLocal' style='text-align: right'>" . $Local . "</td>" . "\r\n";
/* L */ $out .= "\t\t" . "<td class='med-flags'><img src='../img/blank.gif' class='flag flag-" . $codeL . "' alt='" . $Local . "' /></td>" . "\r\n";

		if ($Enabled == 1) { 
			$out .= "\t\t" . "<td class='right tdScore GolesLocal'><input type='text' value='' class='input-goles-apuesta' /></td>" . "\r\n"; 
			$out .= "\t\t" . "<td class='left tdScore GolesVisita'><input type='text' value='' class='input-goles-apuesta' /></td>" . "\r\n";
		} else {
			$out .= "\t\t" . "<td class='right tdScore GolesLocal'><input type='text' value='' class='input-goles-apuesta' disabled /></td>" . "\r\n"; 
			$out .= "\t\t" . "<td class='left tdScore GolesVisita'><input type='text' value='' class='input-goles-apuesta' disabled /></td>" . "\r\n";
		}
		
/* V */ $out .= "\t\t" . "<td class='med-flags'><img src='../img/blank.gif' class='flag flag-" . $codeV . "' alt='" . $Visita . "' /></td>" . "\r\n";
		$out .= "\t\t" . "<td class='arEquipo rVisita'>" . $Visita . "</td>" . "\r\n";
		
		$JugadoresPrimerGol = JugadoresLocalVisita($conn, $Partido, $Enabled, -100);
		
		if ($Enabled == 1) {
			$out .= "\t\t" . "<td class='tdMinuto'><input type='text' value='' class='input-minuto-apuesta' /></td>" . "\r\n";
			$out .= "\t\t" . "<td class='LocalPT' style='padding-right: 3px;'><input type='text' value='' class='input-goles-apuesta' /></td>" . "\r\n";
			$out .= "\t\t" . "<td class='VisitaPT' style='padding-left: 3px;'><input type='text' value='' class='input-goles-apuesta' /></td>" . "\r\n";
			$out .= "\t\t" . "<td class='tdJugPrimerGol'>" . $JugadoresPrimerGol . "</td>" . "\r\n";
		} else {
			$out .= "\t\t" . "<td class='tdMinuto'><input type='text' value='' class='input-minuto-apuesta' disabled /></td>" . "\r\n";
			$out .= "\t\t" . "<td class='LocalPT' style='padding-right: 3px;'><input type='text' value='' class='input-goles-apuesta' disabled /></td>" . "\r\n";
			$out .= "\t\t" . "<td class='VisitaPT' style='padding-left: 3px;'><input type='text' value='' class='input-goles-apuesta' disabled /></td>" . "\r\n";
			$out .= "\t\t" . "<td class='tdJugPrimerGol'>" . $JugadoresPrimerGol . "</td>" . "\r\n";
		}
		$out .= "\t" . "</tr>" . "\r\n";
	}
	$out .= "</table>";
	
	return trim($out);
}
function BuildApuestasCartonRondas($conn, $id_carton) {
	include '../data/database_data.php';

	$query = $query = " SELECT r.id_ronda, r.nombre_ronda, ar.Activa AS activa"
		.	" FROM " . $tbl_rondas . " r"
		.	" JOIN " . $vw_avance_rondas . " ar ON ar.id_ronda = r.id_ronda";;
	$rondas = mysqli_query($conn, $query);
	
	$iRonda = 0;
	while($ronda = mysqli_fetch_array($rondas)) { if ($ronda['activa'] == 1) { $iRonda++; } }
	
	$out = "";
	
	// ul con las rondas -> pills de rondas
	$out .= GetPillsRondas($conn);
	
	// Contenido de cada ronda
	$out .= "<div class='tab-content'>" . "\r\n";
	
	$rondas = mysqli_query($conn, $query);
	while($ronda = mysqli_fetch_array($rondas)) { 
		if ($ronda['id_ronda'] == $iRonda) { 
			$out .= "<div id='AR" . $ronda['id_ronda'] . "' class='tab-pane active' >";
		} else {
			$out .= "<div id='AR" . $ronda['id_ronda'] . "' class='tab-pane' >";
		}
		if ($ronda['activa'] == 1) {
			$out .= "\r\n";
			$out .= ApuestasHeader();		
			$out .= BuildTableApuestasCartonRonda($conn, $id_carton, $ronda['id_ronda']);
		}
		$out .= "</div>" . "\r\n";
	}
	
	$out .= "</div>" . "\r\n";
	
	return trim($out);
}
function BuildTableApuestasCarton($conn, $id_carton) {
	include '../data/database_data.php';

	$query = 	" SELECT "
			.	" 	f.Partido, f.id_ronda, f.Grupo, f.Fecha, f.Hora, f.CodeL, f.Local, f.CodeV, f.Visita, f.enabled,"
			.	" 	a.*,"
			.	" 	(CASE WHEN ((r.goles_local = a.goles_local) AND (r.goles_visita = a.goles_visita)) THEN p.Marcador ELSE 0 END) AS pts_Marcador,"
			.	" 	(CASE WHEN ((r.goles_local - r.goles_visita) = (a.goles_local - a.goles_visita)) THEN p.Diferencia_Goles ELSE 0 END) AS pts_Diferencia,"
			.	" 	(CASE "
			.	" 		WHEN ((r.goles_local > r.goles_visita) AND (a.goles_local > a.goles_visita)) THEN p.Ganador "
			.	" 		WHEN ((r.goles_local < r.goles_visita) AND (a.goles_local < a.goles_visita)) THEN p.Ganador "
			.	" 		WHEN ((r.goles_local = r.goles_visita) AND (a.goles_local = a.goles_visita)) THEN p.Ganador "
			.	" 		ELSE 0 "
			.	" 	END) AS pts_Resultado,"
			.	" 	(CASE WHEN ((r.goles_local_pt = a.goles_local_pt) AND (r.goles_visita_pt = a.goles_visita_pt)) THEN p.Marcador_Primer_Tiempo ELSE 0 END) AS pts_PT,"
			.	" 	(CASE WHEN (r.minuto_primer_gol = a.minuto_primer_gol) THEN p.Minuto_Primer_Gol ELSE 0 END) AS pts_Minuto_PG,"
			.	" 	(CASE WHEN (r.id_jugador_primer_gol = a.id_jugador_primer_gol) THEN p.Jugador_Primer_Gol ELSE 0 END) AS pts_Jugador_PG, "			
			.	"	(CASE WHEN ((r.goles_local = a.goles_local) AND (r.goles_visita = a.goles_visita)) THEN p.Marcador ELSE 0 END) + "
			.	"	(CASE WHEN ((r.goles_local - r.goles_visita) = (a.goles_local - a.goles_visita)) THEN p.Diferencia_Goles ELSE 0 END) + " 
			.	"	(CASE WHEN ((r.goles_local > r.goles_visita) AND (a.goles_local > a.goles_visita)) THEN p.Ganador WHEN ((r.goles_local < r.goles_visita) AND (a.goles_local < a.goles_visita)) THEN p.Ganador WHEN ((r.goles_local = r.goles_visita) AND (a.goles_local = a.goles_visita)) THEN p.Ganador ELSE 0 END) + "
			.	"	(CASE WHEN ((r.goles_local_pt = a.goles_local_pt) AND (r.goles_visita_pt = a.goles_visita_pt)) THEN p.Marcador_Primer_Tiempo ELSE 0 END) + "
			.	"	(CASE WHEN (r.minuto_primer_gol = a.minuto_primer_gol) THEN p.Minuto_Primer_Gol ELSE 0 END) + "
			.	"	(CASE WHEN (r.id_jugador_primer_gol = a.id_jugador_primer_gol) THEN p.Jugador_Primer_Gol ELSE 0 END) AS pts_Total "
			.	" FROM " . $vw_fixture . " f"
			.	" JOIN " . $tbl_apuestas . " a ON f.Partido = a.id_match"
			.	" LEFT JOIN " . $tbl_results . " r ON r.id_match = a.id_match"
			.	" JOIN " . $tbl_puntos_apuestas . " p"
			.	" WHERE a.id_carton = " . $id_carton;
	
	$result = mysqli_query($conn, $query);
	
	$out = "";
	
	$out .= "<table id='templ-Apuestas' class='table apuestas table-apuestas' style='width: auto;'>" . "\r\n";

	while($row = mysqli_fetch_array($result)) {
		$codeL = strtolower(utf8_encode($row['CodeL']));
		$codeV = strtolower(utf8_encode($row['CodeV']));
		
		if ($codeL == 'en') { $codeL = 'england'; }
		if ($codeV == 'en') { $codeV = 'england'; }
		
		$Partido   = $row['Partido'];
		$Grupo     = $row['Grupo'];
		$Local     = utf8_encode($row['Local']);
		$Visita    = utf8_encode($row['Visita']);
		$FechaHora = $row['Fecha'] . "T" . $row['Hora'];
		$Enabled = $row['enabled'];
	
		$out .= "\t" . "<tr>" . "\r\n";
		$out .= "\t\t" . "<td class='tdMatch'>" . $Partido . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdGrupo'>" . $Grupo . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdHora hidden'>" . $FechaHora . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='arEquipo rLocal' style='text-align: right'>" . $Local . "</td>" . "\r\n";
/* L */ $out .= "\t\t" . "<td class='med-flags'><img src='../img/blank.gif' class='flag flag-" . $codeL . "' alt='" . $Local . "' /></td>" . "\r\n";

		if ($Enabled == 1) { 
			$out .= "\t\t" . "<td class='right tdScore GolesLocal'><input type='text' value='" . htmlspecialchars($row['goles_local']) . "' class='input-goles-apuesta' /></td>" . "\r\n"; 
			$out .= "\t\t" . "<td class='left tdScore GolesVisita'><input type='text' value='" . htmlspecialchars($row['goles_visita']) . "' class='input-goles-apuesta' /></td>" . "\r\n";
		} else {
			$out .= "\t\t" . "<td class='right tdScore GolesLocal'><input type='text' value='" . htmlspecialchars($row['goles_local']) . "' class='input-goles-apuesta' disabled /></td>" . "\r\n"; 
			$out .= "\t\t" . "<td class='left tdScore GolesVisita'><input type='text' value='" . htmlspecialchars($row['goles_visita']) . "' class='input-goles-apuesta' disabled /></td>" . "\r\n";
		}
		
/* V */ $out .= "\t\t" . "<td class='med-flags'><img src='../img/blank.gif' class='flag flag-" . $codeV . "' alt='" . $Visita . "' /></td>" . "\r\n";
		$out .= "\t\t" . "<td class='arEquipo rVisita'>" . $Visita . "</td>" . "\r\n";
		
		$id_jpg = $row['id_jugador_primer_gol'];
		if ($id_jpg == NULL) { $id_jpg = -100; }
		
		$JugadoresPrimerGol = JugadoresLocalVisita($conn, $Partido, $Enabled, $id_jpg);
		
		if ($Enabled == 1) {
			$out .= "\t\t" . "<td class='tdMinuto'><input type='text' value='" . htmlspecialchars($row['minuto_primer_gol']) . "' class='input-minuto-apuesta' /></td>" . "\r\n";
			$out .= "\t\t" . "<td class='LocalPT' style='padding-right: 3px;'><input type='text' value='" . htmlspecialchars($row['goles_local_pt']) . "' class='input-goles-apuesta' /></td>" . "\r\n";
			$out .= "\t\t" . "<td class='VisitaPT' style='padding-left: 3px;'><input type='text' value='" . htmlspecialchars($row['goles_visita_pt']) . "' class='input-goles-apuesta' /></td>" . "\r\n";
			$out .= "\t\t" . "<td class='tdJugPrimerGol'>" . $JugadoresPrimerGol . "</td>" . "\r\n";
		} else {
			$out .= "\t\t" . "<td class='tdMinuto'><input type='text' value='" . htmlspecialchars($row['minuto_primer_gol']) . "' class='input-minuto-apuesta' disabled /></td>" . "\r\n";
			$out .= "\t\t" . "<td class='LocalPT' style='padding-right: 3px;'><input type='text' value='" . htmlspecialchars($row['goles_local_pt']) . "' class='input-goles-apuesta' disabled /></td>" . "\r\n";
			$out .= "\t\t" . "<td class='VisitaPT' style='padding-left: 3px;'><input type='text' value='" . htmlspecialchars($row['goles_visita_pt']) . "' class='input-goles-apuesta' disabled /></td>" . "\r\n";
			$out .= "\t\t" . "<td class='tdJugPrimerGol'>" . $JugadoresPrimerGol . "</td>" . "\r\n";
		}
		
		$PtsMarcador = $row['pts_Marcador'];
		$PtsDifGoles = $row['pts_Diferencia'];
		$PtsResultado = $row['pts_Resultado'];
		$PtsMPG = $row['pts_Minuto_PG'];
		$PtsMPT = $row['pts_PT'];
		$PtsJPG = $row['pts_Jugador_PG'];
		$PtsTotal = $row['pts_Total'];
		
		$out .= "\t\t" . "<td class='tdPuntos'>" . $PtsMarcador . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdPuntos'>" . $PtsDifGoles . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdPuntos'>" . $PtsResultado . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdPuntos'>" . $PtsMPG . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdPuntos'>" . $PtsMPT . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdPuntos'>" . $PtsJPG . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdPuntos'>" . $PtsTotal . "</td>" . "\r\n";
		
		$out .= "\t" . "</tr>" . "\r\n";
	}
	$out .= "</table>";
	
	return trim($out);
}
function BuildTableApuestasCartonRonda($conn, $id_carton, $id_ronda) {
	include '../data/database_data.php';

	$query = 	" SELECT "
			.	" 	f.Partido, f.id_ronda, f.Grupo, f.Fecha, f.Hora, f.CodeL, f.Local, f.CodeV, f.Visita, f.enabled,"
			.	" 	a.*,"
			.	" 	(CASE WHEN ((r.goles_local = a.goles_local) AND (r.goles_visita = a.goles_visita)) THEN p.Marcador ELSE 0 END) AS pts_Marcador,"
			.	" 	(CASE WHEN ((r.goles_local - r.goles_visita) = (a.goles_local - a.goles_visita)) THEN p.Diferencia_Goles ELSE 0 END) AS pts_Diferencia,"
			.	" 	(CASE "
			.	" 		WHEN ((r.goles_local > r.goles_visita) AND (a.goles_local > a.goles_visita)) THEN p.Ganador "
			.	" 		WHEN ((r.goles_local < r.goles_visita) AND (a.goles_local < a.goles_visita)) THEN p.Ganador "
			.	" 		WHEN ((r.goles_local = r.goles_visita) AND (a.goles_local = a.goles_visita)) THEN p.Ganador "
			.	" 		ELSE 0 "
			.	" 	END) AS pts_Resultado,"
			.	" 	(CASE WHEN ((r.goles_local_pt = a.goles_local_pt) AND (r.goles_visita_pt = a.goles_visita_pt)) THEN p.Marcador_Primer_Tiempo ELSE 0 END) AS pts_PT,"
			.	" 	(CASE WHEN (r.minuto_primer_gol = a.minuto_primer_gol) THEN p.Minuto_Primer_Gol ELSE 0 END) AS pts_Minuto_PG,"
			.	" 	(CASE WHEN (r.id_jugador_primer_gol = a.id_jugador_primer_gol) THEN p.Jugador_Primer_Gol ELSE 0 END) AS pts_Jugador_PG, "			
			.	"	(CASE WHEN ((r.goles_local = a.goles_local) AND (r.goles_visita = a.goles_visita)) THEN p.Marcador ELSE 0 END) + "
			.	"	(CASE WHEN ((r.goles_local - r.goles_visita) = (a.goles_local - a.goles_visita)) THEN p.Diferencia_Goles ELSE 0 END) + " 
			.	"	(CASE WHEN ((r.goles_local > r.goles_visita) AND (a.goles_local > a.goles_visita)) THEN p.Ganador WHEN ((r.goles_local < r.goles_visita) AND (a.goles_local < a.goles_visita)) THEN p.Ganador WHEN ((r.goles_local = r.goles_visita) AND (a.goles_local = a.goles_visita)) THEN p.Ganador ELSE 0 END) + "
			.	"	(CASE WHEN ((r.goles_local_pt = a.goles_local_pt) AND (r.goles_visita_pt = a.goles_visita_pt)) THEN p.Marcador_Primer_Tiempo ELSE 0 END) + "
			.	"	(CASE WHEN (r.minuto_primer_gol = a.minuto_primer_gol) THEN p.Minuto_Primer_Gol ELSE 0 END) + "
			.	"	(CASE WHEN (r.id_jugador_primer_gol = a.id_jugador_primer_gol) THEN p.Jugador_Primer_Gol ELSE 0 END) AS pts_Total "
			.	" FROM " . $vw_fixture . " f"
			.	" JOIN " . $tbl_apuestas . " a ON f.Partido = a.id_match"
			.	" LEFT JOIN " . $tbl_results . " r ON r.id_match = a.id_match"
			.	" JOIN " . $tbl_puntos_apuestas . " p"
			.	" WHERE a.id_carton = " . $id_carton
			.	" AND f.id_ronda = " . $id_ronda
			.	" ORDER BY f.Fecha, f.Hora";
	
	$result = mysqli_query($conn, $query);
	
	$out = "";
	
	$out .= "<div class='max-height'>" . "\r\n";
	$out .= "<table id='templ-Apuestas' class='table apuestas table-apuestas' style='width: auto;'>" . "\r\n";

	while($row = mysqli_fetch_array($result)) {
		$codeL = strtolower(utf8_encode($row['CodeL']));
		$codeV = strtolower(utf8_encode($row['CodeV']));
		
		if ($codeL == 'en') { $codeL = 'england'; }
		if ($codeV == 'en') { $codeV = 'england'; }
		
		$Partido   = $row['Partido'];
		$Grupo     = $row['Grupo'];
		$Local     = utf8_encode($row['Local']);
		$Visita    = utf8_encode($row['Visita']);
		$FechaHora = $row['Fecha'] . "T" . $row['Hora'];
		$Enabled = $row['enabled'];
	
		$out .= "\t" . "<tr>" . "\r\n";
		$out .= "\t\t" . "<td class='tdMatch'>" . $Partido . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdGrupo'>" . $Grupo . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdHora hidden'>" . $FechaHora . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='arEquipo rLocal' style='text-align: right'>" . $Local . "</td>" . "\r\n";
/* L */ $out .= "\t\t" . "<td class='med-flags'><img src='../img/blank.gif' class='flag flag-" . $codeL . "' alt='" . $Local . "' /></td>" . "\r\n";

		if ($Enabled == 1) { 
			$out .= "\t\t" . "<td class='right tdScore GolesLocal'><input type='text' value='" . htmlspecialchars($row['goles_local']) . "' class='input-goles-apuesta' /></td>" . "\r\n"; 
			$out .= "\t\t" . "<td class='left tdScore GolesVisita'><input type='text' value='" . htmlspecialchars($row['goles_visita']) . "' class='input-goles-apuesta' /></td>" . "\r\n";
		} else {
			$out .= "\t\t" . "<td class='right tdScore GolesLocal'><input type='text' value='" . htmlspecialchars($row['goles_local']) . "' class='input-goles-apuesta' disabled /></td>" . "\r\n"; 
			$out .= "\t\t" . "<td class='left tdScore GolesVisita'><input type='text' value='" . htmlspecialchars($row['goles_visita']) . "' class='input-goles-apuesta' disabled /></td>" . "\r\n";
		}
		
/* V */ $out .= "\t\t" . "<td class='med-flags'><img src='../img/blank.gif' class='flag flag-" . $codeV . "' alt='" . $Visita . "' /></td>" . "\r\n";
		$out .= "\t\t" . "<td class='arEquipo rVisita'>" . $Visita . "</td>" . "\r\n";
		
		$id_jpg = $row['id_jugador_primer_gol'];
		if ($id_jpg == NULL) { $id_jpg = -100; }
		
		$JugadoresPrimerGol = JugadoresLocalVisita($conn, $Partido, $Enabled, $id_jpg);
		
		if ($Enabled == 1) {
			$out .= "\t\t" . "<td class='tdMinuto'><input type='text' value='" . htmlspecialchars($row['minuto_primer_gol']) . "' class='input-minuto-apuesta' /></td>" . "\r\n";
			$out .= "\t\t" . "<td class='LocalPT' style='padding-right: 3px;'><input type='text' value='" . htmlspecialchars($row['goles_local_pt']) . "' class='input-goles-apuesta' /></td>" . "\r\n";
			$out .= "\t\t" . "<td class='VisitaPT' style='padding-left: 3px;'><input type='text' value='" . htmlspecialchars($row['goles_visita_pt']) . "' class='input-goles-apuesta' /></td>" . "\r\n";
			$out .= "\t\t" . "<td class='tdJugPrimerGol'>" . $JugadoresPrimerGol . "</td>" . "\r\n";
		} else {
			$out .= "\t\t" . "<td class='tdMinuto'><input type='text' value='" . htmlspecialchars($row['minuto_primer_gol']) . "' class='input-minuto-apuesta' disabled /></td>" . "\r\n";
			$out .= "\t\t" . "<td class='LocalPT' style='padding-right: 3px;'><input type='text' value='" . htmlspecialchars($row['goles_local_pt']) . "' class='input-goles-apuesta' disabled /></td>" . "\r\n";
			$out .= "\t\t" . "<td class='VisitaPT' style='padding-left: 3px;'><input type='text' value='" . htmlspecialchars($row['goles_visita_pt']) . "' class='input-goles-apuesta' disabled /></td>" . "\r\n";
			$out .= "\t\t" . "<td class='tdJugPrimerGol'>" . $JugadoresPrimerGol . "</td>" . "\r\n";
		}
		
		$PtsMarcador = $row['pts_Marcador'];
		$PtsDifGoles = $row['pts_Diferencia'];
		$PtsResultado = $row['pts_Resultado'];
		$PtsMPG = $row['pts_Minuto_PG'];
		$PtsMPT = $row['pts_PT'];
		$PtsJPG = $row['pts_Jugador_PG'];
		$PtsTotal = $row['pts_Total'];
		
		$out .= "\t\t" . "<td class='tdPuntos'>" . $PtsMarcador . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdPuntos'>" . $PtsDifGoles . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdPuntos'>" . $PtsResultado . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdPuntos'>" . $PtsMPG . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdPuntos'>" . $PtsMPT . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdPuntos'>" . $PtsJPG . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdPuntos'><strong>" . $PtsTotal . "</strong></td>" . "\r\n";
		
		$out .= "\t" . "</tr>" . "\r\n";
	}

	$out .= "</table>" . "\r\n";
	$out .= "</div>";
	
	return trim($out);
}
function JugadoresLocalVisita($conn, $Partido, $Enabled, $JugadorSeleccionado) {
	include '../data/database_data.php';
	
	$query = 	" SELECT "
			.	" 	x.id_jugador, x.Code, x.Nombre "
			.	" FROM ( "
			.	" 	SELECT f.Partido, 1 AS LV, f.Visita AS Equipo, j.id_posicion, j.id_jugador, concat('[', e.Code, ']') as Code, j.Nombre "
			.	" 	FROM " . $vw_fixture . " f "
			.	" 	JOIN " . $tbl_jugadores . " j "
			.	" 	JOIN " . $tbl_equipos . " e ON e.id_equipo = j.id_equipo "
			.	" 	WHERE f.Partido = " . $Partido 
			.	" 	AND f.Local = e.Pais "
			.	" 	AND j.va_a_brasil = 1 AND j.reserva = 0 "
			.	" 	UNION ALL "
			.	" 	SELECT f.Partido, 2 AS LV, f.Visita AS Equipo, j.id_posicion, j.id_jugador, concat('[', e.Code, ']') as Code, j.Nombre "
			.	" 	FROM " . $vw_fixture . " f "
			.	" 	JOIN " . $tbl_jugadores . " j "
			.	" 	JOIN " . $tbl_equipos . " e ON e.id_equipo = j.id_equipo "
			.	" 	WHERE f.Partido = " . $Partido 
			.	" 	AND f.Visita = e.Pais "
			.	" 	AND j.va_a_brasil = 1 AND j.reserva = 0 "
			.	" ) AS x "
			.	" ORDER BY x.partido, x.LV, x.Equipo, x.id_posicion, x.id_jugador;";

	$results = mysqli_query($conn, $query);
			
	$out = "";
	
	$out .= "<select class='form-control select-apuestas'";
	if ($Enabled == 1) { $out .= ">" . "\r\n"; }
	if ($Enabled == 0) { $out .= " disabled='disabled'>" . "\r\n"; }
	
	$out .= "\t" . "<option value='-1'>Elige un jugador...</option>" . "\r\n";
	while($Jugador = mysqli_fetch_array($results)) {
		if ($JugadorSeleccionado == $Jugador['id_jugador']) {
			$out .= "\t" . "<option value='" . $Jugador['id_jugador'] . "' selected ='selected'>" . utf8_encode($Jugador['Nombre']) . " " . $Jugador['Code'] . "</option>" . "\r\n";	
		} else { // No se envió ningún jugador (template)
			$out .= "\t" . "<option value='" . $Jugador['id_jugador'] . "'>" . utf8_encode($Jugador['Nombre']) . " " . $Jugador['Code'] . "</option>" . "\r\n";
		}
	}
	$out .= "</select>" . "\r\n";

	return trim($out);
}
function CartonesHeader() {
	$out = "";
	
	$ColNumero = '#';
	$ColDescripcion = 'Descripción';
	$ColEditar = 'Editar';
	$ColPagado = '¿Pagado?';
	$ColVer = 'Ver';
	
	$out .= "<table class='table table-condensed table-cartones'>" . "\r\n";
	$out .= "\t" . "<tbody>" . "\r\n";
	$out .= "\t\t" . "<tr>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdNumeroCarton'>" . $ColNumero . "</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdID hidden'></td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdAccion'>" . $ColEditar . "</td>" . "\r\n";
	$out .= "\t\t\t" . "<td>" . $ColDescripcion . "</td>" . "\r\n";	
	$out .= "\t\t\t" . "<td class='tdPagado'>" . $ColPagado . "</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdAccion'>" . $ColVer . "</td>" . "\r\n";
	$out .= "\t\t" . "</tr>" . "\r\n";
	$out .= "\t" . "</tbody>" . "\r\n";
	$out .= "</table>";
	
	return trim($out);
}
function LoadCartonUser($conn, $id_carton, $id_user) {
	include '../data/database_data.php';
	
	$query = "SELECT * FROM " . $tbl_cartones . " c WHERE c.id_carton = " . $id_carton . " AND c.id_user = " . $id_user;
	$cartones = mysqli_query($conn, $query);	
	$nCarton = mysqli_num_rows($cartones);
	
	if ($nCarton == 0) {
		return BuildTableApuestas($conn);
	} else if ($nCarton == 1) {
		// Construir la tabla con los valores del carton particular
		return BuildApuestasCartonRondas($conn, $id_carton);
		// return BuildTableApuestasCarton($conn, $id_carton);
	} else {
		return "Error_Carton";
	}
}
function GetInfoCarton($conn, $id_carton) {
	include '../data/database_data.php';
	
	$query = 	"SELECT c.id_carton, c.pagado, r.Puntos FROM " . $tbl_cartones . " c JOIN " . $vw_ranking . " r ON r.id_carton = c.id_carton"
			.	" WHERE c.id_carton = " . $id_carton;
	$results = mysqli_query($conn, $query);
	
	$out = "";
	$out .= "<div class='btn-group btn-group-justified'>" . "\r\n";
	
	while($carton = mysqli_fetch_array($results)) { 
		// EDITAR
		$out .= "\t" . "<div class='btn-group'>" . "\r\n";
		$out .= "\t\t" . "<button id='btnEditar' type='button' class='btn btn-default btn-sm' data-toggle='tooltip' data-placement='top' title='Cambia el nombre de tu cartón' >" . "\r\n";
		$out .= "\t\t\t" . "<span class='pull-left strong'>Editar </span>" . "\r\n";
		$out .= "\t\t\t" . "<span class='pull-right'><img src='../img/edit-icon.png' class='icon' title='Editar Cartón' /></span>" . "\r\n";
		$out .= "\t\t" . "</button>" . "\r\n";
		$out .= "\t" . "</div>" . "\r\n";
		
		// PAGADO
		$out .= "\t" . "<div class='btn-group'>" . "\r\n";
		$out .= "\t\t" . "<button type='button' class='btn btn-default btn-sm'>" . "\r\n";
		$out .= "\t\t\t" . "<span class='pull-left strong'>¿Pagado? </span>" . "\r\n";
		$out .= "\t\t\t" . "<span class='pull-right'>"; 
		if ($carton['pagado'] == 0) { $out .= "<img src='../img/red-cross-icon.png' class='icon' />"; }
		else if ($carton['pagado'] == 1) { $out .= "<img src='../img/green-check-icon.png' class='icon' />"; }
		$out .= "</span>" . "\r\n";
		$out .= "\t\t" . "</button>" . "\r\n";
		$out .= "\t" . "</div>" . "\r\n";
		
		// PUNTOS
		$out .= "\t" . "<div class='btn-group'>" . "\r\n";
		$out .= "\t\t" . "<button type='button' class='btn btn-default btn-sm'>" . "\r\n";
		$out .= "\t\t\t" . "<span class='pull-left strong'>Puntos </span>" . "\r\n";
		$out .= "\t\t\t" . "<span class='pull-right badge' style='background-color: #3a87ad;'>" . $carton['Puntos'] . "</span>" . "\r\n";
		$out .= "\t\t" . "</button>" . "\r\n";
		$out .= "\t" . "</div>" . "\r\n";
		
		// GUARDAR
		$out .= "\t" . "<div class='btn-group'>" . "\r\n";
		$out .= "\t\t" . "<button id='btnGuardarCarton' type='button' class='btn btn-danger btn-sm'>" . "\r\n";
		$out .= "\t\t\t" . "<span class='strong'>Guardar</span>" . "\r\n";
		$out .= "\t\t" . "</button>" . "\r\n";
		$out .= "\t" . "</div>" . "\r\n";
	}
	$out .= "</div>" . "\r\n";
	
	return trim($out);
}
function GetIDCartonUser($conn, $desc, $id_user) {
	include '../data/database_data.php';
	
	$queryGet = "SELECT id_carton FROM " . $tbl_cartones . " c WHERE c.descripcion = '" . $desc . "' AND c.id_user = " . $id_user;
	$getCarton = mysqli_query($conn, $queryGet);
	$Carton = mysqli_fetch_array($getCarton);
	
	return $Carton['id_carton'];
}
function GetCartonesUser($conn, $id_user) {
	include '../data/database_data.php';
	$out = "";
	
	$query = "SELECT id_carton, descripcion, pagado FROM " . $tbl_cartones . " WHERE id_user = " . $id_user . " ORDER BY id_carton";
	$cartones = mysqli_query($conn, $query);
	$nCartones = 0;
	
	while ($carton = mysqli_fetch_array($cartones)) {
		$nCartones = $nCartones + 1;
	}
	
	$nColumnas = 7;
	$txtNoCarton = 'No has creado ningún cartón!';
	
	$out .= "<div id='cartonesUserHeader' class='panel-body body-cartones'>" . "\r\n";
	$out .= "\t" . CartonesHeader() . "\r\n";
	$out .= "</div>" . "\r\n";
	
	if ($nCartones == 0)
	{	
		$out .= "<div id='cartonesUserList'>" . "\r\n";
		$out .= "<table class='table table-condensed cartones-content'>" . "\r\n";
		$out .= "\t" . "<tbody>" . "\r\n";
		$out .= "\t\t" . "<tr>" . "\r\n";
		$out .= "\t\t\t" . "<td class='noCarton' colspan='" . $nColumnas . "'>" . $txtNoCarton . "</td>" . "\r\n";
		$out .= "\t\t" . "</tr>" . "\r\n";
		$out .= "\t" . "</tbody>" . "\r\n";
		$out .= "</table>" . "\r\n";
		$out .= "</div>" . "\r\n";
	}
	else {
		$out .= "<div id='cartonesUserList'>" . "\r\n";
		$out .= "<table class='table table-condensed cartones-content'>" . "\r\n";
		$out .= "\t" . "<tbody>" . "\r\n";
	
		$cartones = mysqli_query($conn, $query);
		$iCarton = 1;
		while ($carton = mysqli_fetch_array($cartones)) {
			$out .= "\t\t" . "<tr>" . "\r\n";
			$out .= "\t\t\t" . "<td class='tdNumeroCarton'>" . $iCarton . "</td>" . "\r\n";
			$out .= "\t\t\t" . "<td class='tdID hidden'>" . $carton['id_carton'] . "</td>" . "\r\n";
			$out .= "\t\t\t" . "<td class='tdEditar tdAccion'><a href='#'><img src='../img/edit-icon.png' class='icon' title='" . 'Editar Cartón' . "' /></a></td>" . "\r\n";
			$out .= "\t\t\t" . "<td>" . utf8_encode($carton['descripcion']) . "</td>" . "\r\n";			
			
			if ($carton['pagado'] == 1) { 
				$out .= "\t\t\t" . "<td class='tdPagado'><img src='../img/green-check-icon.png' class='icon' /></td>" . "\r\n";
			} else {
				$out .= "\t\t\t" . "<td class='tdPagado'><img src='../img/red-cross-icon.png' class='icon' /></td>" . "\r\n";
			}
			$out .= "\t\t\t" . "<td class='tdVer tdAccion'><a href='#'><img src='../img/lupa-icon.png' class='icon' title='" . 'Ver Cartón' . "' /></a></td>" . "\r\n";
			$out .= "\t\t" . "</tr>" . "\r\n";
			
			$iCarton = $iCarton + 1;
		}
		$out .= "\t" . "</tbody>" . "\r\n";
		$out .= "</table>" . "\r\n";
		$out .= "</div>" . "\r\n";
	}
	
	return trim($out);
}
function GetBtnCartonesUser($conn, $id_user) { 
	include '../data/database_data.php';
	$out = "";
	
	$query = "SELECT id_carton, descripcion, pagado FROM " . $tbl_cartones . " WHERE id_user = " . $id_user . " ORDER BY id_carton";
	$cartones = mysqli_query($conn, $query);
	$nCartones = 0;
	
	while ($carton = mysqli_fetch_array($cartones)) {
		$nCartones = $nCartones + 1;
	}
	
	$txtNoCarton = 'No has creado ningún cartón!';
	
	if ($nCartones == 0) {
		$out .= "<button type='submit' class='btn btn-danger btn-ver-carton'>" . $txtNoCarton . "</button>" . "\r\n";
	}
	else {
		$cartones = mysqli_query($conn, $query);
		$iCarton = 1;
		while ($carton = mysqli_fetch_array($cartones)) {
			$out .= "<button type='submit' class='btn btn-success btn-ver-carton btn-carton-" . $iCarton . "'>" . utf8_encode($carton['descripcion']) . "</button>" . "\r\n";
			$out .= "<input type='hidden' class='btn-carton-" . $iCarton . "' value='" . $carton['id_carton'] . "' />" . "\r\n";			
			$iCarton = $iCarton + 1;
		}		
	}
	
	return trim($out);
}
function SaveCartonUser($conn, $desc, $id_user) {
	include '../data/database_data.php';
	$desc = utf8_decode($desc);
	
	// Insertar el nuevo cartón
	$queryInsert = "INSERT INTO " . $tbl_cartones . " (descripcion, id_user, pagado) VALUES ('" . $desc . "', " . $id_user . ", 0);";
	$SaveCarton = mysqli_query($conn, $queryInsert);
	
	// Recuperar el nuevo cartón, para crear apuesta template en la tabla de apuestas
	$id_carton = GetIDCartonUser($conn, $desc, $id_user);
	
	$Partidos = "SELECT f.Partido FROM " . $vw_fixture . " f ORDER BY f.Partido";
	$resPartidos = mysqli_query($conn, $Partidos);
	
	while ($Partido = mysqli_fetch_array($resPartidos)) {
		$queryTemplate = "INSERT INTO " . $tbl_apuestas . " (id_carton, id_match) VALUES (" . $id_carton . ", " . $Partido['Partido'] . ");";
		$getCarton = mysqli_query($conn, $queryTemplate);
		
		if (!$getCarton) { break; }
	}
	
	return $SaveCarton ? $id_carton : 'false';
}
function UpdateDescCartonUser($conn, $id_carton, $old_desc, $new_desc, $id_user) {
	include '../data/database_data.php';
	
	// Actualizar la descripción del cartón
	$queryUpdate = "UPDATE " . $tbl_cartones . " SET descripcion = '" . $new_desc . "' WHERE id_carton = " . $id_carton . " AND id_user = " . $id_user;
	$UpdateCarton = mysqli_query($conn, $queryUpdate);
	
	return $UpdateCarton ? 'true' : 'false';
}
function UpdateCartonUser($conn, $id_carton, $desc, $id_user, $Apuesta) {
	include '../data/database_data.php';
	
	$Match 		     = $Apuesta['Match'];
	$GolesLocal      = $Apuesta['GolesLocal'];
	$GolesVisita     = $Apuesta['GolesVisita'];
	$GolesLocalPT    = $Apuesta['GolesLocalPT'];
	$GolesVisitaPT   = $Apuesta['GolesVisitaPT'];
	$MinutoPrimerGol = $Apuesta['MinutoPrimerGol'];
	$JugPrimerGol    = $Apuesta['JugPrimerGol'];

	$query = 	"UPDATE " . $tbl_apuestas
			. 	" SET goles_local = " . $GolesLocal
			. 	", goles_visita = " . $GolesVisita
			. 	", goles_local_pt = " . $GolesLocalPT
			. 	", goles_visita_pt = " . $GolesVisitaPT
			. 	", minuto_primer_gol = " . $MinutoPrimerGol
			. 	", id_jugador_primer_gol = " . $JugPrimerGol
			.	" WHERE id_carton = " . $id_carton
			.	" AND id_match = " . $Match . ";";
	$result = mysqli_query($conn, $query);
	
	if (!$result) { return 'false'; }
	else { return 'true'; }
}
/* FIN - APUESTAS */

/* INICIO - FIXTURE */
function BuildFixture($conn, $tipo) {
	if ($tipo == 'tabs')  { $out = BuildTabsFixture($conn); }
	if ($tipo == 'table') { $out = BuildTableFixture($conn); }

	return trim($out);
}
function BuildTabsFixture($conn) {
	include '../data/database_data.php';
	
	/* Query para las Rondas */
	$query = "SELECT * FROM " . $tbl_rondas;
	$rondas = mysqli_query($conn, $query);
	
	$out = "";
	
	$out .= "<ul class='nav nav-tabs nav-justified'>" . "\r\n";
	$c = 1;
	
	while($ronda = mysqli_fetch_array($rondas)) {
		$out .= "\t" . "<li";
	
		if ($c == 1) { $out .= " class='active'>"; $c = 0; }
		else { $out .= ">"; }
		
		$out .= "\t\t" . "<a href='#R" . $ronda['id_ronda'] . "' data-toggle='tab'>" . utf8_encode($ronda['nombre_ronda']) . "</a></li>" . "\r\n";
	}
	$out .= "</ul>" . "\r\n";

	// Detalle de cada Ronda
	$query = "SELECT * FROM " . $tbl_rondas;
	$rondas = mysqli_query($conn, $query);
	
	$out .= "\r\n";
	$out .= "<div class='tab-content'>" . "\r\n";	
	$c = 1;
	while($ronda = mysqli_fetch_array($rondas)) {
		/* Query para los Partidos por Ronda */
		$FixtureRonda = FixtureRonda($conn, $ronda['id_ronda']);
	
		$out .= "\t" . "<div id='R" . $ronda['id_ronda'] . "' class='tab-pane";
		if ($c == 1) { $out .= " active' >" . "\r\n"; $c = 0; }
		else { $out .= "'>" . "\r\n"; }
		$out .= "\t\t" . $FixtureRonda . "\r\n";
		$out .= "\t" . "</div>" . "\r\n";
	}
	$out .= "</div>" . "\r\n";	
	
	return trim($out);
}
function BuildTableFixture($conn) {
	include '../data/database_data.php';
	
	$query = "SELECT * FROM " . $vw_fixture . " ORDER BY Fecha, Hora";
	$result = mysqli_query($conn, $query);
	
	$out = "";
	
	$out .= "<table id='tblFixture' class='table fixture table-fixture'>" . "\r\n";

	while($row = mysqli_fetch_array($result)) {
		$codeL = strtolower($row['CodeL']);
		$codeV = strtolower($row['CodeV']);
		
		if ($codeL == 'en') { $codeL = 'england'; }
		if ($codeV == 'en') { $codeV = 'england'; }
		
		$Partido = $row['Partido'];
		$Fecha   = $row['Fecha'];
		$Hora    = substr($row['Hora'], 0, 5);
		$Grupo   = $row['Grupo'];
		$Local   = utf8_encode($row['Local']);
		$Visita  = utf8_encode($row['Visita']);
		$Ciudad  = utf8_encode($row['Ciudad']);
		$Estadio = utf8_encode($row['Estadio']);
	
		$out .= "\t" . "<tr>" . "\r\n";
		$out .= "\t\t" . "<td class='tdMatch'>" . $Partido . "</td>" . "\r\n";
//		$out .= "\t\t" . "<td>" . utf8_decode($row['Ronda']) . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdGrupoFixture'>" . $Grupo . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdFecha'>" . $Fecha . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdHora'>" . $Hora . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='rEquipo rLocal'>" . $Local . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='med-flags'><img src='../img/blank.gif' class='flag flag-" . $codeL . "' alt='" . $Local . "' /></td>" . "\r\n";
		$out .= "\t\t" . "<td class='med-flags'><img src='../img/blank.gif' class='flag flag-" . $codeV . "' alt='" . $Visita . "' /></td>" . "\r\n";
		$out .= "\t\t" . "<td class='rEquipo rVisita'>" . $Visita . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdCiudad'>" . $Ciudad . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class=''>" . $Estadio . "</td>" . "\r\n";
		$out .= "\t" . "</tr>" . "\r\n";
	}
	$out .= "</table>" . "\r\n";;

	return trim($out);
}
function FixtureHeader() {
	$out = "";
	$out .= "<table class='table fixture-header table-fixture'>" . "\r\n";
	$out .= "\t" . "<tbody>" . "\r\n";
	$out .= "\t\t" . "<tr>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdMatch'>Match</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdGrupoFixture'>Grupo</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdDOW'>Día</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdFecha'>Fecha</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdHora'>Hora</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='rEquipo rLocal' style='text-align: right;'>Local</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='med-flags'></td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='med-flags'></td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='rEquipo rVisita' style='text-align: left;'>Visita</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdCiudad'>Ciudad</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdEstadio'>Estadio</td>" . "\r\n";
	$out .= "\t\t" . "</tr>" . "\r\n";
	$out .= "\t" . "</tbody>" . "\r\n";
	$out .= "</table>" . "\r\n";
	
	return trim($out);
}
function FixtureRonda($conn, $ronda) {
	include '../data/database_data.php';

	$query = "SELECT * FROM " . $vw_fixture . " WHERE id_ronda = " . $ronda . " ORDER BY Fecha, Hora";
	$matches = mysqli_query($conn, $query);
	
	$out = "";
	$out .= "<div class='div-fixture-header'>" . FixtureHeader() . "</div>" . "\r\n";
	$out .= "<div class='fixture-ronda'>" . "\r\n";
	$out .= "<table class='table fixture table-fixture'>" . "\r\n";

	while($row = mysqli_fetch_array($matches)) {
		$codeL = strtolower($row['CodeL']);
		$codeV = strtolower($row['CodeV']);
		
		if ($codeL == 'en') { $codeL = 'england'; }
		if ($codeV == 'en') { $codeV = 'england'; }
		
		$Partido = $row['Partido'];
		$DOW	 = $row['DOW'];
		$Fecha   = $row['Fecha'];
		$Hora    = substr($row['Hora'], 0, 5);
		$Grupo   = $row['Grupo'];
		$Local   = utf8_encode($row['Local']);
		$Visita  = utf8_encode($row['Visita']);
		$Ciudad  = utf8_encode($row['Ciudad']);
		$Estadio = utf8_encode($row['Estadio']);
	
		$out .= "\t" . "<tr>" . "\r\n";
		$out .= "\t\t" . "<td class='tdMatch'>" . $Partido . "</td>" . "\r\n";
//		$out .= "\t\t" . "<td>" . utf8_decode($row['Ronda']) . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdGrupoFixture'>" . $Grupo . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdDOW'>" . $DOW . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdFecha'>" . $Fecha . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdHora'>" . $Hora . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='rEquipo rLocal'>" . $Local . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='med-flags'><img src='../img/blank.gif' class='flag flag-" . $codeL . "' alt='" . $Local . "' /></td>" . "\r\n";
		$out .= "\t\t" . "<td class='med-flags'><img src='../img/blank.gif' class='flag flag-" . $codeV . "' alt='" . $Visita . "' /></td>" . "\r\n";
		$out .= "\t\t" . "<td class='rEquipo rVisita'>" . $Visita . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdCiudad'>" . $Ciudad . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdEstadio'>" . $Estadio . "</td>" . "\r\n";
		$out .= "\t" . "</tr>" . "\r\n";
	}
	$out .= "</table>" . "\r\n";
	$out .= "</div>" . "\r\n";

	return trim($out);
}
/* FIN - FIXTURE */ 

/* INICIO - RESULTADOS */
function ResultadosHeader($results) {
	$out = "";
	
	if ($results == 1) { $out .= "<table class='table resultados-header table-resultados'>" . "\r\n"; }
	if ($results == 0) { $out .= "<table class='table resultados-header'>" . "\r\n"; }

	$out .= "\t" . "<tbody>" . "\r\n";
	$out .= "\t\t" . "<tr class='bg-info'>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdMatchR'>#</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdGrupoR'>Grupo</td>" . "\r\n";
	if ($results == 0) {
		$out .= "\t\t\t" . "<td class='tdRondaR'>Ronda</td>" . "\r\n";
	}	
	$out .= "\t\t\t" . "<td class='arEquipoR rLocal'>Local</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='med-flags'></td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='right tdScore'></td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='left tdScore'></td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='med-flags'></td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='arEquipoR rVisita'>Visita</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdMinutoR'>Minuto 1° Gol</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdMarcadorPTR'>Marcador (1T)</td>" . "\r\n";
	$out .= "\t\t\t" . "<td class='tdJugPrimerGolR'>Jugador 1° Gol</td>" . "\r\n";
	if ($results == 0) {
		$out .= "\t\t\t" . "<td class='tdMarcadorPTR'>Marcador (TE)</td>" . "\r\n";
		$out .= "\t\t\t" . "<td class='tdMarcadorPTR'>Penales</td>" . "\r\n";
	}
	$out .= "\t\t" . "</tr>" . "\r\n";
	$out .= "\t" . "</tbody>" . "\r\n";
	$out .= "</table>" . "\r\n";
	
	return $out;
}
function BuildResultados($conn) {
	include '../data/database_data.php';

	$query = 	"SELECT f.* FROM " . $vw_results . " f"
			.	" JOIN " . $vw_avance_rondas . " ar ON f.id_ronda = ar.id_ronda"
			. 	" WHERE ar.Activa IN (0, 1)"
			.	" ORDER BY f.Partido";
	$resultados = mysqli_query($conn, $query);
	
	$out = "";
	
	$out .= "<div id='ResultadosHeader'>" . "\r\n";
	$out .= ResultadosHeader(1) . "\r\n";
	$out .= "</div>" . "\r\n";
	
	$out .= "<div id='tblResultados'>" . "\r\n";
	$out .= "<table id='table-results' class='table resultados table-resultados'>" . "\r\n";

	while($row = mysqli_fetch_array($resultados)) {
		$codeL = strtolower(utf8_encode($row['CodeL']));
		$codeV = strtolower(utf8_encode($row['CodeV']));
		
		if ($codeL == 'en') { $codeL = 'england'; }
		if ($codeV == 'en') { $codeV = 'england'; }
		
		$Partido   = $row['Partido'];
		$Grupo     = $row['Grupo'];
		$Local     = utf8_encode($row['eLocal']);
		$Visita    = utf8_encode($row['eVisita']);
//		$FechaHora = $row['Fecha'] . " - " . $row['Hora'];
		$GL = $row['gLocal'];
		$GV = $row['gVisita'];
		$GLPT = $row['gLocal_PT'];
		$GVPT = $row['gVisita_PT'];
		$MinutoPG = $row['Minuto_PG'];
		$JugadorPG = $row['Jugador_PG'] == '' ? '-' : $row['Jugador_PG'];
	
		$out .= "\t" . "<tr>" . "\r\n";
		$out .= "\t\t" . "<td class='tdMatchR'>" . $Partido . "</td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdGrupoR'>" . $Grupo . "</td>" . "\r\n";
//		$out .= "\t\t" . "<td>" . $FechaHora . "</td>" . "\r\n";

		$out .= "\t\t" . "<td class='arEquipoR rLocal'>" . $Local . "</td>" . "\r\n";
/* L */ $out .= "\t\t" . "<td class='med-flags'><img src='../img/blank.gif' class='flag flag-" . $codeL . "' alt='" . $Local . "' /></td>" . "\r\n";
		$out .= "\t\t" . "<td class='right tdScore GolesLocal'><input type='text' value='" . htmlspecialchars($GL) . "' class='input-goles-apuesta' disabled /></td>" . "\r\n"; 

		$out .= "\t\t" . "<td class='tdScore GolesVisita'><input type='text' value='" . htmlspecialchars($GV) . "' class='input-goles-apuesta' disabled /></td>" . "\r\n";
/* V */ $out .= "\t\t" . "<td class='med-flags'><img src='../img/blank.gif' class='flag flag-" . $codeV . "' alt='" . $Visita . "' /></td>" . "\r\n";
		$out .= "\t\t" . "<td class='arEquipoR rVisita'>" . $Visita . "</td>" . "\r\n";
				
		$out .= "\t\t" . "<td class='tdMinutoR'><input type='text' value='" . htmlspecialchars($MinutoPG) . "' class='input-minuto-apuesta' disabled /></td>" . "\r\n";
		$out .= "\t\t" . "<td class='LocalPTR' style='padding-right: 3px'><input type='text' value='" . htmlspecialchars($GLPT) . "' class='input-goles-apuesta' disabled /></td>" . "\r\n";
		$out .= "\t\t" . "<td class='VisitaPTR' style='padding-left: 3px'><input type='text' value='" . htmlspecialchars($GVPT) . "' class='input-goles-apuesta' disabled /></td>" . "\r\n";
		$out .= "\t\t" . "<td class='tdJugPrimerGolR'>" . $JugadorPG . "</td>" . "\r\n";
		$out .= "\t" . "</tr>" . "\r\n";
	}
	$out .= "</table>" . "\r\n";
	$out .= "</div>" . "\r\n";
	
	return trim($out);
}
/* FIN - RESULTADOS */

/* INICIO - BASES DE LA POLLA */
function BuildBases($modo) {
	if ($modo == 'accordion') { $out = BuildBasesAccordion(); }
	if ($modo == 'tabs') { $out = BuildBasesTabs(); }		
	return trim($out);
}
function BuildBasesAccordion() {
	$out = "";
	
	$out .= "<div class='panel-group panel-bases'>" . "\r\n";
	$out .= BuildBasesComoParticipar();
	$out .= BuildBasesReglas();
	$out .= BuildBasesPuntos();
	$out .= BuildBasesGanadores();
	$out .= "</div>" . "\r\n";	
	
	return trim($out);
}
function BuildBasesTabs() {
	$out = "";
	
	$Title01 = '¿Cómo participar?';
	$Title02 = 'Reglas del Juego';
	$Title03 = '¿Cómo se acumulan los puntos?';
	$Title04 = '¿Quién gana?';

	$out .= "<ul class='nav nav-tabs nav-justified'>" . "\r\n";
	$out .= "\t" . "<li class='active'>" . "\r\n";
	$out .= "\t\t" . "<a href='#ComoParticipar' data-toggle='tab'>" . $Title01 . "</a>" . "\r\n";
	$out .= "\t" . "</li>" . "\r\n";
	$out .= "\t" . "<li>" . "\r\n";
	$out .= "\t\t" . "<a href='#ReglasDelJuego' data-toggle='tab'>" . $Title02 . "</a>" . "\r\n";
	$out .= "\t" . "</li>" . "\r\n";
	$out .= "\t" . "<li>" . "\r\n";
	$out .= "\t\t" . "<a href='#Puntos' data-toggle='tab'>" . $Title03 . "</a>" . "\r\n";
	$out .= "\t" . "</li>" . "\r\n";
	$out .= "\t" . "<li>" . "\r\n";
	$out .= "\t\t" . "<a href='#Ganadores' data-toggle='tab'>" . $Title04 . "</a>" . "\r\n";
	$out .= "\t" . "</li>" . "\r\n";
	$out .= "</ul>" . "\r\n";

	$out .= "<div class='tab-content'>" . "\r\n";	
	$out .= "\t" . "<div id='ComoParticipar' class='tab-pane active'>" . "\r\n";
	$out .= "\t\t" . ComoParticiparContent();
	$out .= "\t" . "</div>" . "\r\n";
	
	$out .= "\t" . "<div id='ReglasDelJuego' class='tab-pane'>" . "\r\n";
	$out .= "\t\t" . ReglasContent();
	$out .= "\t" . "</div>" . "\r\n";

	$out .= "\t" . "<div id='Puntos' class='tab-pane'>" . "\r\n";
	$out .= "\t\t" . PuntosContent();
	$out .= "\t" . "</div>" . "\r\n";

	$out .= "\t" . "<div id='Ganadores' class='tab-pane'>" . "\r\n";
	$out .= "\t\t" . GanadoresContent();
	$out .= "\t" . "</div>" . "\r\n";
	$out .= "</div>" . "\r\n";
	
	return trim($out);
}
function BuildBasesComoParticipar() {
	$out = "";

	$Title = '¿Cómo participar?';
	
	// COMO PARTICIPAR
	$out .=	"\t" . "<div class='panel panel-primary'>" . "\r\n";
	$out .=	"\t\t" . "<div class='panel-heading'>" . "\r\n";
	$out .=	"\t\t\t" . "<h4 class='panel-title'>" . "\r\n";
	$out .=	"\t\t\t\t" . "<a data-toggle='collapse' data-parent='#accordionBases' href='#ComoParticipar'>" . "\r\n";
	$out .=	"\t\t\t\t\t" . $Title . "\r\n";
	$out .=	"\t\t\t\t" . "</a>" . "\r\n";
	$out .=	"\t\t\t" . "</h4>" . "\r\n";
	$out .=	"\t\t" . "</div>" . "\r\n";
	$out .=	"\t\t" . "<div id='ComoParticipar' class='panel-collapse collapse'>" . "\r\n";
	$out .=	"\t\t\t" . "<div class='panel-body'>" . "\r\n";
	$out .= ComoParticiparContent();
	$out .=	"\t\t\t" . "</div>" . "\r\n";
	$out .=	"\t\t" . "</div>" . "\r\n";
	$out .=	"\t" . "</div>" . "\r\n";

	return trim($out);
}
function ComoParticiparContent() {
	include('../data/constantes.php');

	$Inicio = "Para participar, sólo debes <strong>inscribirte en esta página web</strong> y realizar tus apuestas";
	$Carton = "Cada inscrito podrá comprar todos los cartones que quiera, cada uno por un valor de <strong>$5.000 pesos chilenos</strong>";
	$OjoCarton = "<strong>Un 'Cartón'</strong> corresponderá a una apuesta <span class='underline'>por todos los partidos del Mundial</span>";
	$Puntos = "A partir de los resultados del Mundial y tus apuestas, <strong>irás ganando puntos</strong> en cada uno de tus cartones";
	$Final = "Finalmente, a partir de un <strong>ranking de puntos</strong>, se determinará quiénes son los ganadores de la Polla Mundialera CS&OR";
	
	$out = "";
	$out .= "<div class='bases-content max-height'>" . "\r\n";
	$out .=	"<p>" . $IconoWorldCup . $Inicio. "</p>" . "\r\n";
	$out .=	"<p>" . $IconoWorldCup . $Carton. "</p>" . "\r\n";
	$out .=	"<p style='margin-left: 35px'>" . $IconoWorldCup . $OjoCarton. "</p>" . "\r\n";
	$out .=	"<p>" . $IconoWorldCup . $Puntos . "</p>" . "\r\n";
	$out .=	"<p>" . $IconoWorldCup . $Final. "</p>" . "\r\n";
	$out .= "</div>" . "\r\n";
	return trim($out);
}
function BuildBasesReglas() {
	$out = "";
	
	$Title = 'Reglas del Juego';

	// REGLAS
	$out .=	"\t" . "<div class='panel panel-danger'>" . "\r\n";
	$out .=	"\t\t" . "<div class='panel-heading'>" . "\r\n";
	$out .=	"\t\t\t" . "<h4 class='panel-title'>" . "\r\n";
	$out .=	"\t\t\t\t" . "<a data-toggle='collapse' data-parent='#accordionBases' href='#Reglas'>" . "\r\n";
	$out .=	"\t\t\t\t\t" . $Title . "\r\n";
	$out .=	"\t\t\t\t" . "</a>" . "\r\n";
	$out .=	"\t\t\t" . "</h4>" . "\r\n";
	$out .=	"\t\t" . "</div>" . "\r\n";
	$out .=	"\t\t" . "<div id='Reglas' class='panel-collapse collapse'>" . "\r\n";
	$out .=	"\t\t\t" . "<div class='panel-body'>" . "\r\n";
	$out .= ReglasContent();
	$out .=	"\t\t\t" . "</div>" . "\r\n";
	$out .=	"\t\t" . "</div>" . "\r\n";
	$out .=	"\t" . "</div>" . "\r\n";
	
	return trim($out);
}
function ReglasContent() {
	include('../data/constantes.php');
	
	$MinutosAntes = 20;
	
	$out = "";
	$Inicio = "Sólo se podrá apostar hasta <span class='underline'>" . $MinutosAntes . " minutos antes</span> de cada partido." . "\r\n";
	$Inicio .= "En ese instante, el partido será <strong>desactivado</strong>";
	$Minutos = "Durante la Fase de Grupos, se considerará el resultado <strong>hasta los 90 minutos</strong>, y en el resto del Mundial <strong>hasta los 120 minutos</strong>";
	$Penales = "<span class='underline'>No se considerarán los penales</span>";
	
	$out .= "<div class='bases-content max-height'>" . "\r\n";
	$out .=	"<p>" . $IconoWorldCup . $Inicio . "</p>" . "\r\n";
	$out .=	"<p>" . $IconoWorldCup . $Minutos . "</p>" . "\r\n";
	$out .=	"<p>" . $IconoWorldCup . $Penales . "</p>" . "\r\n";
	$out .= "</div>" . "\r\n";
	
	return trim($out);
}
function BuildBasesPuntos() {
	$out = "";
	
	$Title = '¿Cómo se van acumulando los puntos?';
	
	// PUNTOS
	$out .=	"\t" . "<div class='panel panel-success'>" . "\r\n";
	$out .=	"\t\t" . "<div class='panel-heading'>" . "\r\n";
	$out .=	"\t\t\t" . "<h4 class='panel-title'>" . "\r\n";
	$out .=	"\t\t\t\t" . "<a data-toggle='collapse' data-parent='#accordionBases' href='#Puntos'>" . "\r\n";
	$out .=	"\t\t\t\t\t" . $Title . "\r\n";
	$out .=	"\t\t\t\t" . "</a>" . "\r\n";
	$out .=	"\t\t\t" . "</h4>" . "\r\n";
	$out .=	"\t\t" . "</div>" . "\r\n";
	$out .=	"\t\t" . "<div id='Puntos' class='panel-collapse collapse'>" . "\r\n";
	$out .=	"\t\t\t" . "<div class='panel-body'>" . "\r\n";
	$out .= PuntosContent();
	$out .=	"\t\t\t" . "</div>" . "\r\n";
	$out .=	"\t\t" . "</div>" . "\r\n";
	$out .=	"\t" . "</div>" . "\r\n";
	
	return trim($out);
}
function PuntosContent() {
	include('../data/constantes.php');
	
	$Inicio = "Habrán 2 modalidades para ganar puntos: la <strong>Apuesta Básica</strong>, y los <strong>Puntos de BONUS</strong>";
	
	$out = "";
	$out .= "<div class='bases-content max-height'>" . "\r\n";
	$out .=	"<p>" . $IconoWorldCup . $Inicio . "</p>" . "\r\n";
	$out .=	"\t" . "<table class='table table-condensed table-bases'>" . "\r\n"; // PRIMERA TABLA
	$out .=	"\t\t" . "<thead>" . "\r\n";
	$out .=	"\t\t\t" . "<th class='bases-puntos' style='width: 50%;'>" . '<strong>Apuesta Básica</strong>' . "</th>" . "\r\n";
	$out .=	"\t\t\t" . "<th class='bases-puntos'>" . '<strong>Puntos de BONUS</strong>' . "</th>" . "\r\n";
	$out .=	"\t\t" . "</thead>" . "\r\n";
	$out .=	"\t\t" . "<tbody>" . "\r\n";
	$out .=	"\t\t\t" . "<tr>" . "\r\n";
	$out .=	"\t\t\t\t" . "<td>" . "\r\n";
	$out .=	"\t\t\t\t\t" . "<table class='table table-condensed'>" . "\r\n"; // TABLA DE LOS PUNTOS
	$out .=	"\t\t\t\t\t\t" . "<thead>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t" . "<th>" . 'Categoría' . "</th>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t" . "<th class='bases-puntos'>" . 'Puntos' . "</th>" . "\r\n";
	$out .=	"\t\t\t\t\t\t" . "</thead>" . "\r\n";
	$out .=	"\t\t\t\t\t\t" . "<tbody>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t" . "<tr>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t\t" . "<td>" . 'Marcador Exacto' . "</td>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t\t" . "<td class='bases-puntos'>3</td>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t" . "</tr>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t" . "<tr>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t\t" . "<td>" . 'Diferencia de Goles' . "</td>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t\t" . "<td class='bases-puntos'>2</td>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t" . "</tr>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t" . "<tr>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t\t" . "<td>" . 'Resultado del Partido (Equipo Ganador o Empate)' . "</td>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t\t" . "<td class='bases-puntos'>1</td>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t" . "</tr>" . "\r\n";
	$out .=	"\t\t\t\t\t\t" . "</tbody>" . "\r\n";
	$out .=	"\t\t\t\t\t" . "</table>" . "\r\n";
	$out .=	"\t\t\t\t" . "</td>" . "\r\n";
	$out .=	"\t\t\t\t" . "<td>" . "\r\n";
	$out .=	"\t\t\t\t\t" . "<table class='table table-condensed'>" . "\r\n";
	$out .=	"\t\t\t\t\t\t" . "<thead>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t" . "<th>" . 'Categoría' . "</th>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t" . "<th class='bases-puntos'>Puntos</th>" . "\r\n";
	$out .=	"\t\t\t\t\t\t" . "</thead>" . "\r\n";
	$out .=	"\t\t\t\t\t\t" . "<tbody>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t" . "<tr>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t\t" . "<td>" . 'Marcador Primer Tiempo' . "</td>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t\t" . "<td class='bases-puntos'>2</td>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t" . "</tr>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t" . "<tr>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t\t" . "<td>" . 'Minuto Primer Gol' . "</td>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t\t" . "<td class='bases-puntos'>5</td>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t" . "</tr>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t" . "<tr>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t\t" . "<td>" . 'Jugador Primer Gol' . "</td>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t\t" . "<td class='bases-puntos'>2</td>" . "\r\n";
	$out .=	"\t\t\t\t\t\t\t" . "</tr>" . "\r\n";
	$out .=	"\t\t\t\t\t\t" . "</tbody>" . "\r\n";
	$out .=	"\t\t\t\t\t" . "</table>" . "\r\n";
	$out .=	"\t\t\t\t" . "</td>" . "\r\n";
	$out .=	"\t\t\t" . "</tr>" . "\r\n";
	$out .=	"\t\t" . "</tbody>" . "\r\n";					
	$out .=	"\t" . "</table>" . "\r\n";	
	
	$TituloEjemplo = "<strong>EJEMPLO</strong>";
	$ContextoEjemplo = "Supongamos que el resultado del partido Chile - Australia es 2 - 0.";
	$CuantosPuntos = "<strong>¿Cuántos puntos ganarías con las siguientes apuestas?</strong>";
	$SiAciertasBonus = 'Si además acertaras los BONUS, podrías ganar un total de <strong>15 puntos por partido</strong>';
	
	$out .=	"<p>" . $IconoWorldCup . $TituloEjemplo . ": " . $ContextoEjemplo . "</p>" . "\r\n";
	$out .= "<div style='margin-left: 30px;'>" . "\r\n";
	$out .=	"\t" . "<p>" . $CuantosPuntos . "</p>" . "\r\n";
	$out .=	"\t\t" . "<ul>" . "\r\n";
	$out .=	"\t\t\t" . "<li class='li-bases'>" . "\r\n";
	$out .=	"\t\t\t\t" . $IconOne . " " . "<strong>Chile</strong> 2 - <strong>Australia</strong> 0   =>   3 + 2 + 1 = 6 puntos" . "\r\n";
	$out .=	"\t\t\t" . "</li>" . "\r\n";
	$out .=	"\t\t\t" . "<li class='li-bases'>" . "\r\n";
	$out .=	"\t\t\t\t" . $IconTwo . " " . "<strong>Chile</strong> 3 - <strong>Australia</strong> 1   =>   0 + 2 + 1 = 3 puntos" . "\r\n";
	$out .=	"\t\t\t" . "</li>" . "\r\n";
	$out .=	"\t\t\t" . "<li class='li-bases'>" . "\r\n";
	$out .=	"\t\t\t\t" . $IconThree . " " . "<strong>Chile</strong> 1 - <strong>Australia</strong> 0   =>   0 + 0 + 1 = 1 punto" . "\r\n";
	$out .=	"\t\t\t" . "</li>" . "\r\n";
	$out .=	"\t\t" . "</ul>" . "\r\n";
	$out .=	"\t" . "<p>" . $IconoWorldCup . $SiAciertasBonus . "</p>" . "\r\n";
	$out .= "</div>" . "\r\n";

	$out .= "</div>" . "\r\n";
	
	return trim($out);
}
function BuildBasesGanadores() {
	$out = "";
	
	$Title = '¿Quién gana?';
	
	// GANADORES
	$out .=	"\t" . "<div class='panel panel-info'>" . "\r\n";
	$out .=	"\t\t" . "<div class='panel-heading'>" . "\r\n";
	$out .=	"\t\t\t" . "<h4 class='panel-title'>" . "\r\n";
	$out .=	"\t\t\t\t" . "<a data-toggle='collapse' data-parent='#accordionBases' href='#Ganadores'>" . "\r\n";
	$out .=	"\t\t\t\t\t" . $Title . "\r\n";
	$out .=	"\t\t\t\t" . "</a>" . "\r\n";
	$out .=	"\t\t\t" . "</h4>" . "\r\n";
	$out .=	"\t\t" . "</div>" . "\r\n";
	$out .=	"\t\t" . "<div id='Ganadores' class='panel-collapse collapse'>" . "\r\n";
	$out .=	"\t\t\t" . "<div class='panel-body'>" . "\r\n";
	$out .= GanadoresContent();
	$out .=	"\t\t\t" . "</div>" . "\r\n";
	$out .=	"\t\t" . "</div>" . "\r\n";
	$out .=	"\t" . "</div>" . "\r\n";
	
	return trim($out);
}
function GanadoresContent() {
	include('../data/constantes.php');
	$out = "";
	
	$Inicio = "La Polla Mundialera CS&OR tendrá <strong>2 ganadores</strong>: los 2 cartones con <span class='underline'>la mayor cantidad de puntos</span> al final del Campeonato Mundial.";
	$TituloPrimerLugar  = "<strong>PRIMER LUGAR</strong>   : ";
	$PremioPrimerLugar  = "Se llevará el 70% del dinero recaudado";
	$TituloSegundoLugar = "<strong>SEGUNDO LUGAR</strong>  : ";
	$PremioSegundoLugar = "Se llevará el 30% del dinero recaudado";
	$EmpatePrimerLugar = "En caso de <strong>empate en el primer lugar</strong>, cada uno de estos cartones se llevará el 50% del dinero recaudado";
	$EmpateSegundoLugar = "En caso de <strong>empate en el segundo lugar</strong>, el segundo y tecero se llevarán un 15% del dinero recaudado cada uno";
	
	$out .= "<div class='bases-content max-height'>" . "\r\n";
	$out .=	"\t" . "<div>" . "\r\n";
	$out .= "\t\t" . "<p>" . $IconoWorldCup . $Inicio . "</p>" . "\r\n";
	// PRIMER + SEGUNDO LUGAR
	$out .= "\t\t" . "<ul>" . "\r\n";
	$out .= "\t\t\t" . "<li class='li-bases'>" . $IconOne . " " . $TituloPrimerLugar . $PremioPrimerLugar . "</li>" . "\r\n";
	$out .= "\t\t\t" . "<li class='li-bases'>" . $IconTwo . " " . $TituloSegundoLugar . $PremioSegundoLugar . "</li>" . "\r\n";
	$out .= "\t\t" . "</ul>" . "\r\n";
	
	$out .= "\t\t" . "<p>" . "<strong>EXCEPCIONES</strong>" . "</p>" . "\r\n";
//	$out .= "\t\t\t" . "<ul>" . "\r\n";
	$out .= "\t\t\t\t" . "<p>" . "\r\n";
	$out .= "\t\t\t\t\t" . $IconoWorldCup . $EmpatePrimerLugar . "\r\n";
	$out .= "\t\t\t\t" . "</p>" . "\r\n";
	$out .= "\t\t\t\t" . "<p>" . "\r\n";
	$out .= "\t\t\t\t\t" . $IconoWorldCup . $EmpateSegundoLugar . "\r\n";
	$out .= "\t\t\t\t" . "</p>" . "\r\n";
//	$out .= "\t\t\t" . "</ul>" . "\r\n";
	$out .=	"\t" . "</div>" . "\r\n";
	$out .= "</div>" . "\r\n";
	
	return trim($out);
}
/* FIN - BASES DE LA POLLA */
?>