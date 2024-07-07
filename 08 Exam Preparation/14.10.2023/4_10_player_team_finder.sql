CREATE OR REPLACE PROCEDURE sp_players_team_name(IN player_name VARCHAR(50), OUT team_name VARCHAR(45))
AS
$$
    BEGIN
        SELECT
            (SELECT name FROM teams WHERE id = team_id) INTO team_name
        FROM
            players
        WHERE
            concat(first_name, ' ', last_name) = player_name;

        IF team_name IS NULL THEN team_name := 'The player currently has no team';
        END IF;
    END;
$$
LANGUAGE plpgsql;