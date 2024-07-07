CREATE OR REPLACE PROCEDURE sp_deposit_money(IN account_id INT, IN money_amount NUMERIC(19, 4))
AS
$$
    DECLARE
        account_balance NUMERIC(19, 4);
    BEGIN
        SELECT
            balance INTO account_balance
        FROM accounts
            WHERE id = account_id;

        UPDATE accounts
        SET balance = balance + money_amount
        WHERE id = account_id;

        IF account_balance + money_amount <> (
            SELECT
            balance
            FROM accounts
            WHERE id = account_id
            ) THEN
            ROLLBACK;
            RETURN;
        END IF;

        COMMIT;
    END;
$$
LANGUAGE plpgsql;