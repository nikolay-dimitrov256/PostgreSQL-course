CREATE OR REPLACE FUNCTION fn_difficulty_level(level INT)
RETURNS VARCHAR(30)
AS
$$
    DECLARE
        difficulty VARCHAR(30);
    BEGIN
        IF level <= 40 THEN difficulty := 'Normal Difficulty';
        ELSIF level BETWEEN 41 AND 60 THEN difficulty := 'Nightmare Difficulty';
        ELSIF level > 60 THEN difficulty := 'Hell Difficulty';
        END IF;

        RETURN difficulty;
    END;
$$
LANGUAGE plpgsql;

SELECT
    user_id,
    level,
    cash,
    fn_difficulty_level(level) AS difficulty_level
FROM
    users_games
ORDER BY
    user_id
;
