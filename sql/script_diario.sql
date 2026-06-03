/* CORRER AL FINAL DE CADA DÍA */

/* Construcción de Resultados */
/* 01. Resultados por Grupo */
DROP TABLE IF EXISTS grupos_results;
CREATE TABLE grupos_results AS
SELECT 
	Grupo, iLocal as ID, eLocal as Equipo, CodeL as Codigo,
	SUM(CASE WHEN gLocal IS NOT NULL THEN 1 ELSE 0 END) AS Jugados, 
	SUM(CASE WHEN gLocal IS NOT NULL AND gLocal > gVisita THEN 1 ELSE 0 END) AS Victorias,
	SUM(CASE WHEN gLocal IS NOT NULL AND gLocal = gVisita THEN 1 ELSE 0 END) AS Empates,
	SUM(CASE WHEN gLocal IS NOT NULL AND gLocal < gVisita THEN 1 ELSE 0 END) AS Derrotas,
	CASE WHEN SUM(gVisita) IS NULL THEN 0 ELSE SUM(gVisita) END AS gContra,
	CASE WHEN SUM(gLocal) IS NULL THEN 0 ELSE SUM(gLocal) END AS gFavor
FROM vw_results p
GROUP BY Grupo, eLocal

UNION ALL

SELECT 
	Grupo, iVisita as ID, eVisita AS Equipo, CodeV as Codigo,
	SUM(CASE WHEN gVisita IS NOT NULL THEN 1 ELSE 0 END) as Jugados, 
	SUM(CASE WHEN gVisita IS NOT NULL AND gVisita > gLocal THEN 1 ELSE 0 END) AS Victorias,
	SUM(CASE WHEN gVisita IS NOT NULL AND gLocal = gVisita THEN 1 ELSE 0 END) AS Empates,
	SUM(CASE WHEN gVisita IS NOT NULL AND gVisita < gLocal THEN 1 ELSE 0 END) AS Derrotas,
	CASE WHEN SUM(gLocal) IS NULL THEN 0 ELSE SUM(gLocal) END AS gContra,
	CASE WHEN SUM(gVisita) IS NULL THEN 0 ELSE SUM(gVisita) END AS gFavor
FROM vw_results
GROUP BY Grupo, eVisita
;

ALTER TABLE grupos_results ADD PRIMARY KEY (Grupo, ID, Equipo, Codigo, Jugados);

/* 02. Tabla por Grupo - Puntos */
DROP TABLE IF EXISTS grupos_stats;
CREATE TABLE grupos_stats AS 
SELECT 
	Grupo, ID, Equipo, Codigo,
	SUM(Jugados) AS Jugados,
	SUM(Victorias) AS Victorias,
	SUM(Empates) AS Empates, 
	SUM(Derrotas) AS Derrotas,
	SUM(gFavor) AS 'Goles a Favor', 
	SUM(gContra) as 'Goles en Contra',
	SUM(gFavor) - SUM(gContra) as 'Diferencia de Goles',
	3*SUM(Victorias) + 1*SUM(Empates) AS Puntos
FROM grupos_results
GROUP BY Grupo, ID, Equipo, Codigo
ORDER BY Grupo, Puntos DESC, 'Diferencia de Goles' DESC, 'Goles a Favor' DESC, ID ASC
;

ALTER TABLE grupos_stats ADD PRIMARY KEY (Grupo, ID, Equipo, Codigo);
