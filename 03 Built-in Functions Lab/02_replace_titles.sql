SELECT
	REPLACE(title, 'The', '***') AS title
FROM
	books
WHERE
	LEFT(title, 3) = 'The'
;