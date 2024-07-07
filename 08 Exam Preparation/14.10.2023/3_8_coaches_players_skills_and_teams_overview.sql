SELECT
    concat(c.first_name, ' ', c.last_name) AS coach_full_name,
    concat(p.first_name, ' ', p.last_name) AS player_full_name,
    t.name AS team_name,
    sd.passing,
    sd.shooting,
    sd.speed
FROM
    coaches AS c
JOIN
    players_coaches AS pc
ON c.id = pc.coach_id
JOIN
    players as p
ON pc.player_id = p.id
JOIN
    skills_data as sd
ON p.skills_data_id = sd.id
JOIN
    teams AS t
ON p.team_id = t.id
ORDER BY
    coach_full_name,
    player_full_name DESC;