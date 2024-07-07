CREATE OR REPLACE FUNCTION udf_accounts_photos_count(account_username VARCHAR(30))
RETURNS INT
AS
$$
    DECLARE
        result INT;
    BEGIN
        SELECT
            count(*) INTO result
        FROM
            accounts AS a
        JOIN
            accounts_photos as ap
        ON a.id = ap.account_id
        WHERE
            a.username = account_username
        ;

        RETURN result;
    END;
$$
LANGUAGE plpgsql;
