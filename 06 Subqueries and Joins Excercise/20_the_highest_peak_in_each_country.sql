WITH "row_number"
AS (
    SELECT
        c.country_name,
        coalesce(p.peak_name, '(no highest peak)') AS highest_peak_name,
        coalesce(p.elevation, 0) AS highest_peak_elevation,
        coalesce(m.mountain_range, '(no mountain)') AS mountain,
        row_number() OVER (PARTITION BY c.country_name ORDER BY p.elevation DESC) AS row_num
    FROM
        countries AS c
    LEFT JOIN
        mountains_countries AS mc
    USING
        (country_code)
    LEFT JOIN
        peaks AS p
    USING
        (mountain_id)
    LEFT JOIN
        mountains AS m
    ON p.mountain_id = m.id
    )
SELECT
    country_name,
    highest_peak_name,
    highest_peak_elevation,
    mountain
FROM
    "row_number"
WHERE
    row_num = 1
ORDER BY
    country_name,
    highest_peak_elevation DESC
;