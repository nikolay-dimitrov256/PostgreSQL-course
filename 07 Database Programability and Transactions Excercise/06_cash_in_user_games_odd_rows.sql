CREATE OR REPLACE FUNCTION fn_cash_in_users_games(game_name VARCHAR(50))
RETURNS TABLE(total_cash NUMERIC)
AS
$$
    BEGIN
        RETURN QUERY
        WITH ranked_games AS (
            SELECT
                id,
                cash,
                row_number() OVER (ORDER BY cash DESC) AS row_num
            FROM
                users_games
            WHERE
                game_id = (SELECT id FROM games WHERE name = game_name)
        )
        SELECT
            round(sum(cash), 2)
        FROM
            ranked_games
        WHERE row_num % 2 = 1;
    END;
$$
LANGUAGE plpgsql;