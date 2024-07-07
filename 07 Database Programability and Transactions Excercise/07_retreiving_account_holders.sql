CREATE OR REPLACE PROCEDURE sp_retrieving_holders_with_balance_higher_than(IN searched_balance NUMERIC(20, 4))
AS
$$
    DECLARE
        holder RECORD;
    BEGIN
        FOR holder IN
            SELECT
                ah.first_name,
                ah.last_name,
                sum(a.balance) AS total_balance
            FROM
                account_holders AS ah
            JOIN
                accounts AS a
            ON ah.id = a.account_holder_id
            GROUP BY ah.first_name, ah.last_name
            HAVING sum(a.balance) > searched_balance
            ORDER BY
                ah.first_name,
                ah.last_name
        LOOP
            RAISE NOTICE '% % - %', holder.first_name, holder.last_name, holder.total_balance;
        END LOOP;
    END;
$$
LANGUAGE plpgsql;

CALL sp_retrieving_holders_with_balance_higher_than(20000)