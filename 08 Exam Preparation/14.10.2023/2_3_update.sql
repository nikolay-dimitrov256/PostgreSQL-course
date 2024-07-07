UPDATE coaches
SET salary = salary * coach_level
WHERE
    substring(first_name, 1, 1) = 'C'
    AND
    (
        SELECT
            count(player_id)
        FROM
            coaches AS c
        JOIN
            players_coaches AS pc
        ON c.id = pc.coach_id
        WHERE pc.coach_id = coaches.id
        GROUP BY
            c.id
        ) >= 0
;
