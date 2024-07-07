SELECT
	population,
	LENGTH(CAST(population AS VARCHAR))
FROM
	countries
;

/*
SELECT
	population,
	LENGTH(population::VARCHAR)
FROM
	countries
;
*/