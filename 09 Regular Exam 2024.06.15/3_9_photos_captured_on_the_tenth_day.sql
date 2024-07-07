SELECT
    concat(substring(description, 1, 10), '...') AS summary,
    to_char(capture_date, 'DD.MM HH24:MI') AS date
FROM
    photos
WHERE
    extract('day' FROM capture_date) = 10
ORDER BY
    capture_date DESC
;